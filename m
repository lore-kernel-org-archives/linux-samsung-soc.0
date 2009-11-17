From: arnaud.patard@rtp-net.org
Subject: [patch 0/4] [RFC] h1940 updates
Date: Tue, 17 Nov 2009 14:54:55 +0100
Message-ID: <20091117135455.913565760@rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sat78-1-82-232-42-61.fbx.proxad.net ([82.232.42.61]:57541 "EHLO
	jules.rtp-net.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752203AbZKQOM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 09:12:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-samsung-soc@vger.kernel.org

Hi,

This patchset gives an update to h1940 support. It contains:

- add mmc host device
- add rtc device
- add a lcd and backlight devices using platform-lcd and pwm-backlight
- converts the bluetooth support to use the rfkill framework

This has been tested on a 2.6.31 and build tested on your next-s3c24xx-dev-updates branch.

Please, also note that I'm not really good at giving patch descriptions so feel
free to correct them if needed.

Thanks,
Arnaud
