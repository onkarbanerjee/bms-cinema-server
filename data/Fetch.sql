SELECT 
`cinemas`.`name` AS cinema, 
`screens`.`screenNumber` AS screenNumber, 
`movies`.`name` AS movie,
`seats`.`row`,
`seats`.`column`,
`seats`.`price`
FROM `cinemas`,`screens`,`shows`, `movies`, `seats` where (
    `cinemas`.`id` = 2 AND 
    `cinemas`.`id` = `screens`.`cinemaID` AND 
    `screens`.`id` = `shows`.`screenID` AND 
    `shows`.`id`= 1 AND
    `shows`.`movieID`= `movies`.`id` AND
    `seats`.`screenID` = `screens`.`id` AND
    `seats`.`status` = "available"
    );