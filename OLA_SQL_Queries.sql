# OLA Booking_ Analysis executing SQL Querries------------

# 1. Total Success bokings
select Booking_ID from bookings where Booking_Status = "Success";

create view successful_booking as 
select * from bookings where Booking_Status = "Success";
select * from successful_booking;
select * from bookings;

# 2. Find the average ride distance of each vehicle type.

create view average_ride_distance_vehicle_type as
select Vehicle_Type, avg(Ride_Distance) as
Average_distance
from bookings group by Vehicle_Type;

select * from average_ride_distance_vehicle_type;

# 3. Get the total Number of cancelled rides by the customer
create view No_Of_Ride_cancel_by_customer as
select count(*)  from bookings where Booking_Status = "Canceled by Customer";

select * from No_Of_Ride_cancel_by_customer;

# 4. List the Top 5 Customers who booked Highest Number Of Rides

create view Top_5_Customers_Rides as 
select Customer_ID, count(Booking_ID) as Total_Rides
from bookings 
group by Customer_ID
order by Total_Rides desc limit 5;

select * from Top_5_Customers_Rides;

# 5. Get the number Of rides canceled By drivers due to personal and car relayted issues.

select count(*) as Rides_Cancel_By_driver_issue from bookings where Canceled_Rides_by_Driver = "Personal & Car related issue";

# 6. Find the maximum and minimum drivers ratings for Prime Sedan Bookings.
create view Ratings_for_PrimeSedan as 
select max(Driver_Ratings) as Max_Ratings,
min(Driver_Ratings) as Min_Ratings from
bookings where vehicle_Type = "Prime Sedan";

select * from Ratings_for_PrimeSedan;

# 7. Retrive all Rides where Payment was made using UPI.
create view upi_payment_ride as 
select * from bookings where Payment_Method = "UPI";

select * from upi_payment_ride ;

# 8. Find average customer Ratings for each vechile Type.
create view avg_customer_ratings_each_ve_type as 
select Vehicle_Type,round(avg(Customer_Rating),1) as avg_customer_ratings
from bookings group by Vehicle_Type;

select * from avg_customer_ratings_each_ve_type;

# 9. calculate total booking value of rides completed successfully.
create view Total_successful_rides as
select sum(Booking_Value) as Total_success_Rides
from bookings where Booking_Status = "Success";

select * from Total_successful_rides ;

# 10. List all Incomplete Rides along with the reason.
create view Total_Incomplete_Rides as 
select Booking_Id, Incomplete_Rides_Reason
from bookings where Incomplete_Rides = "Yes";

select * from Total_Incomplete_Rides;