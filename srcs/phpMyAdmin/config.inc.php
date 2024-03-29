<?php
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   config.inc.php                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aberry&lmittie <aberry>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/12 01:38:15 by aberry            #+#    #+#             */
/*   Updated: 2021/03/12 01:38:16 by aberry           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
/**
 * @package PhpMyAdmin
 */
declare(strict_types=1);

/**
 * This is needed for cookie based authentication to encrypt password in
 * cookie. Needs to be 32 chars long.
 */
$cfg['blowfish_secret'] = 'abcdefghijklmnopqrstuvwxyz0123456789';

/**
 * Servers configuration
 */
$i = 0;

/**
 * First server
 */
$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/****************************************************************************/
/**************************Указываем хост нашей бд***************************/
/****************************************************************************/
$cfg['Servers'][$i]['host'] = 'mysql-service';
$cfg['Servers'][$i]['port'] = '3306';
/****************************************************************************/
$cfg['Servers'][$i]['user'] = 'aberry';
$cfg['Servers'][$i]['password'] = 'root';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
