From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 0/2] Add of match tables for the ChromeOs EC subdevices
Date: Sat, 23 Aug 2014 01:03:00 +0200
Message-ID: <1408748582-29029-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:45488 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752257AbaHVXDO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 19:03:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

The ChromeOS EC MFD driver registers its sub-devices with both a (platform)
name and an of compatibility string. As a result of this the modalias passed on
to user-space will be based on the of compatibility string. Thus to be able to
rely on autoloading in case the subdevices are build as modules they need to
export the necessary module aliases based to match the of information.

The two patches in these series add the requird of match information to the EC
subdevices

Sjoerd Simons (2):
  i2c: cros-ec-tunnel: Add of match table
  input: cros_ec_keyb: Add of match table

 drivers/i2c/busses/i2c-cros-ec-tunnel.c |  9 +++++++++
 drivers/input/keyboard/cros_ec_keyb.c   | 10 ++++++++++
 2 files changed, 19 insertions(+)

-- 
2.1.0
