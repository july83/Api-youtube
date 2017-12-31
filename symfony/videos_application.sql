-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-12-2017 a las 12:21:11
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videos_application`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `video_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `surname`, `email`, `password`, `image`, `created_at`) VALUES
(1, 'admin', 'Julián', 'Calle', 'admin@admin.com', 'pruebas', NULL, '2017-12-02 00:00:00'),
(2, 'user', 'julian', 'calle', 'julian@julian.com', 'pruebas', NULL, '2017-12-03 11:57:02'),
(3, 'user', 'julian', 'calle', 'julian1@julian.com', 'pruebas', NULL, '2017-12-03 11:59:38'),
(4, 'user', 'julian', 'calle', 'julian2@julian.com', 'pruebas', NULL, '2017-12-03 12:02:30'),
(5, 'user', 'manuel', 'calle', 'julian3@julian.com', '718e3978516d387924d91980a7e21af2f434de445731951a6585bda2eacef046', NULL, '2017-12-06 10:02:49'),
(6, 'user', 'julian', 'calle', 'julian4@julian.com', '718e3978516d387924d91980a7e21af2f434de445731951a6585bda2eacef046', NULL, '2017-12-03 17:31:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`id`, `user_id`, `title`, `description`, `status`, `image`, `video_path`, `created_at`, `updated_at`) VALUES
(1, 5, 'titulo del video 1', NULL, NULL, NULL, NULL, '2017-12-08 10:57:18', '2017-12-08 10:57:18'),
(3, 5, 'titulo44', NULL, NULL, '1512733866.jpeg', '1512734627.mp4', '2017-12-08 11:46:34', '2017-12-08 11:51:38'),
(4, 5, 'titulo del video 2', 'descripcion del video', NULL, NULL, NULL, '2017-12-09 12:15:00', '2017-12-09 12:15:00'),
(5, 5, 'titulo del video 3', 'descripcion del video', NULL, NULL, NULL, '2017-12-09 12:15:08', '2017-12-09 12:15:08'),
(6, 5, 'titulo del video 4', 'descripcion del video', NULL, NULL, NULL, '2017-12-09 12:15:17', '2017-12-09 12:15:17'),
(7, 5, 'titulo del video 5', 'descripcion del video', NULL, NULL, NULL, '2017-12-09 12:15:21', '2017-12-09 12:15:21'),
(8, 5, 'titulo del video 6', 'descripcion del video', NULL, NULL, NULL, '2017-12-09 12:15:25', '2017-12-09 12:15:25'),
(9, 5, 'titulo del video 7', 'descripcion del video', NULL, NULL, NULL, '2017-12-09 12:15:29', '2017-12-09 12:15:29'),
(10, 5, 'titulo del video 8', 'descripcion del video', NULL, NULL, NULL, '2017-12-09 12:15:34', '2017-12-09 12:15:34'),
(11, 5, 'titulo del video 9', 'descripcion del video', NULL, NULL, NULL, '2017-12-09 12:15:39', '2017-12-09 12:15:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_video` (`video_id`),
  ADD KEY `fk_comment_user` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_videos_users` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_comment_video` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`);

--
-- Filtros para la tabla `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `fk_videos_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
