from sqlalchemy import Column, String, Integer, Float, ForeignKey, Boolean, DateTime
from sqlalchemy.dialects.postgresql import UUID
from geoalchemy2 import Geography, Geometry
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
import uuid
from app.core.database import Base

class User(Base):
    __tablename__ = "users"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    email = Column(String, unique=True, index=True, nullable=False)
    phone = Column(String, unique=True, index=True)
    name = Column(String)
    role = Column(String, default="user") # user, driver, admin
    created_at = Column(DateTime(timezone=True), server_default=func.now())

    driver_profile = relationship("Driver", back_populates="user", uselist=False)
    rides = relationship("Ride", back_populates="passenger")

class Driver(Base):
    __tablename__ = "drivers"

    id = Column(UUID(as_uuid=True), ForeignKey("users.id"), primary_key=True)
    vehicle_type = Column(String) # auto, bike, car, bus
    capacity = Column(Integer, default=4)
    verified = Column(Boolean, default=False)
    rating = Column(Float, default=5.0)

    user = relationship("User", back_populates="driver_profile")
    vehicles = relationship("Vehicle", back_populates="driver")

class Vehicle(Base):
    __tablename__ = "vehicles"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    driver_id = Column(UUID(as_uuid=True), ForeignKey("drivers.id"))
    status = Column(String, default="offline") # offline, available, busy
    
    # Store location as Geography (WGS84) for accurate distance calc
    current_location = Column(Geography(geometry_type='POINT', srid=4326))
    
    # Route could be a LineString of the planned path
    route = Column(Geometry(geometry_type='LINESTRING', srid=4326), nullable=True)
    
    available_seats = Column(Integer)

    driver = relationship("Driver", back_populates="vehicles")
    assigned_rides = relationship("Ride", back_populates="vehicle")

class Ride(Base):
    __tablename__ = "rides"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    vehicle_id = Column(UUID(as_uuid=True), ForeignKey("vehicles.id"), nullable=True)
    
    pickup_point = Column(Geography(geometry_type='POINT', srid=4326))
    drop_point = Column(Geography(geometry_type='POINT', srid=4326))
    
    seats = Column(Integer, default=1)
    status = Column(String, default="requested") # requested, matching, assigned, ongoing, completed, cancelled
    fare = Column(Float)
    
    created_at = Column(DateTime(timezone=True), server_default=func.now())

    passenger = relationship("User", back_populates="rides")
    vehicle = relationship("Vehicle", back_populates="assigned_rides")
