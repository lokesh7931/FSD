-- Query 1

SELECT
u.user_id,
u.full_name,
u.city,
e.event_id,
e.title,
e.start_date
FROM users u
JOIN registrations r ON u.user_id = r.user_id
JOIN events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
AND u.city = e.city
ORDER BY e.start_date;


-- Query 2

SELECT
e.event_id,
e.title,
AVG(f.rating) AS avg_rating,
COUNT(f.feedback_id) AS feedback_count
FROM events e
JOIN feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(f.feedback_id) >= 10
ORDER BY avg_rating DESC;

-- Query 3

SELECT *
FROM users u
WHERE u.user_id NOT IN (
SELECT DISTINCT user_id
FROM registrations
WHERE registration_date >= CURDATE() - INTERVAL 90 DAY
);

-- Query 4

SELECT
e.event_id,
e.title,
COUNT(s.session_id) AS session_count
FROM events e
JOIN sessions s ON e.event_id = s.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.event_id, e.title;

-- Query 5

SELECT
u.city,
COUNT(DISTINCT r.user_id) AS total_users
FROM users u
JOIN registrations r ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY total_users DESC
LIMIT 5;


-- Query 6

SELECT
e.title,
SUM(CASE WHEN r.resource_type='pdf' THEN 1 ELSE 0 END) AS pdf_count,
SUM(CASE WHEN r.resource_type='image' THEN 1 ELSE 0 END) AS image_count,
SUM(CASE WHEN r.resource_type='link' THEN 1 ELSE 0 END) AS link_count
FROM events e
LEFT JOIN resources r ON e.event_id = r.event_id
GROUP BY e.title;


-- Query 7:

SELECT
u.full_name,
e.title,
f.rating,
f.comments
FROM Feedback f
JOIN users u ON f.user_id = u.user_id
JOIN events e ON f.event_id = e.event_id
WHERE f.rating < 3;

-- Query 8:

SELECT
e.event_id,
e.title,
COUNT(s.session_id) AS total_sessions
FROM events e
LEFT JOIN sessions s ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id, e.title;


-- Query 9:

SELECT
u.full_name,
e.status,
COUNT(e.event_id) AS total_events
FROM users u
JOIN events e ON u.user_id = e.organizer_id
GROUP BY u.full_name, e.status
ORDER BY u.full_name;


-- Query 10:

SELECT
e.event_id,
e.title
FROM events e
JOIN registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE f.feedback_id IS NULL
GROUP BY e.event_id, e.title;

-- Query 11:

SELECT
registration_date,
COUNT(*) AS total_users
FROM users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date
ORDER BY registration_date;


-- Query 12:

SELECT
e.event_id,
e.title,
COUNT(s.session_id) AS total_sessions
FROM events e
JOIN sessions s ON e.event_id = s.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(s.session_id) = (
SELECT MAX(session_count)
FROM (
SELECT COUNT(*) AS session_count
FROM sessions
GROUP BY event_id
) t
);


-- Query 13:

SELECT
e.city,
ROUND(AVG(f.rating),2) AS avg_rating
FROM events e
JOIN feedback f ON e.event_id = f.event_id
GROUP BY e.city;


-- Query 14:

SELECT
e.event_id,
e.title,
COUNT(r.registration_id) AS total_registrations
FROM events e
JOIN registrations r ON e.event_id = r.event_id
GROUP BY e.event_id, e.title
ORDER BY total_registrations DESC
LIMIT 3;


-- Query 15:

SELECT
s1.event_id,
s1.title AS session1,
s2.title AS session2
FROM sessions s1
JOIN sessions s2
ON s1.event_id = s2.event_id
AND s1.session_id < s2.session_id
AND s1.start_time < s2.end_time
AND s1.end_time > s2.start_time;

-- Query 16:

SELECT *
FROM users u
WHERE registration_date >= CURDATE() - INTERVAL 30 DAY
AND user_id NOT IN (
SELECT user_id
FROM registrations
);


-- Query 17:

SELECT
speaker_name,
COUNT(*) AS total_sessions
FROM sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

-- Query 18:

SELECT
e.event_id,
e.title
FROM events e
LEFT JOIN resources r ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;


-- Query 19: 

SELECT
e.event_id,
e.title,
COUNT(DISTINCT r.registration_id) AS total_registrations,
ROUND(AVG(f.rating),2) AS avg_rating
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id
LEFT JOIN feedback f ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id, e.title;

-- Query 20:

SELECT
u.user_id,
u.full_name,
COUNT(DISTINCT r.event_id) AS events_attended,
COUNT(DISTINCT f.feedback_id) AS feedbacks_submitted
FROM users u
LEFT JOIN registrations r ON u.user_id = r.user_id
LEFT JOIN feedback f ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name;


-- Query 21:
-
SELECT
u.user_id,
u.full_name,
COUNT(f.feedback_id) AS feedback_count
FROM users u
JOIN feedback f ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name
ORDER BY feedback_count DESC
LIMIT 5;

-- Query 22:

SELECT
user_id,
event_id,
COUNT(*) AS registration_count
FROM registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;

-- Query 23:

SELECT
DATE_FORMAT(registration_date,'%Y-%m') AS month,
COUNT(*) AS registration_count
FROM registrations
GROUP BY DATE_FORMAT(registration_date,'%Y-%m')
ORDER BY month;

-- Query 24:

SELECT
e.event_id,
e.title,
ROUND(
AVG(
TIMESTAMPDIFF(
MINUTE,
s.start_time,
s.end_time
)
),2
) AS avg_duration_minutes
FROM events e
JOIN sessions s ON e.event_id = s.event_id
GROUP BY e.event_id, e.title;

-- Query 25:

SELECT
e.event_id,
e.title
FROM events e
LEFT JOIN sessions s ON e.event_id = s.event_id
WHERE s.session_id IS NULL;
