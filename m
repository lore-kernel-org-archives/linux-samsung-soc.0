From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 00/27] ARM: SAMSUNG: GPIO updates
Date: Fri,  1 Oct 2010 21:04:57 +0900
Message-ID: <1285934724-5007-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39220 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756722Ab0JAM1J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 08:27:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds some helpers to do common jobs in the kernel to
reduce image and code size. The basic patches of this have been
submitted by Ben Dooks several month ago.

Basically, used Ben's original GPIO update patches and added
some missed GPIO updates from the previous patch.

[PATCH 01/27] ARM: SAMSUNG: Add GPIO configuration for a range of pins
[PATCH 02/27] ARM: S3C64XX: Change dev-audio.c to use S3C_GPIO_SFN() for special functions
[PATCH 03/27] ARM: S3C64XX: Change to using s3c_gpio_cfgpin_range()
[PATCH 04/27] ARM: S5P6442: Change to using s3c_gpio_cfgpin_range()
[PATCH 05/27] ARM: S5P64X0: Change to using s3c_gpio_cfgpin_range()
[PATCH 06/27] ARM: S5P64X0: 2nd Change to using s3c_gpio_cfgpin_range()
[PATCH 07/27] ARM: S5PC100: Change to using s3c_gpio_cfgpin_range()
[PATCH 08/27] ARM: S5PV210: Change to using s3c_gpio_cfgpin_range()
[PATCH 09/27] ARM: S5PV310: Change to using s3c_gpio_cfgpin_range()
[PATCH 10/27] ARM: SAMSUNG: Add s3c_gpio_cfgall_range() function
[PATCH 11/27] ARM: S3C64XX: Change to using s3c_gpio_cfgall_range()
[PATCH 12/27] ARM: S5P6442: Change to using s3c_gpio_cfgall_range()
[PATCH 13/27] ARM: S5P64X0: Change to using s3c_gpio_cfgall_range()
[PATCH 14/27] ARM: S5PC100: Change to using s3c_gpio_cfgall_range()
[PATCH 15/27] ARM: S5PV210: Change to using s3c_gpio_cfgall_range()
[PATCH 16/27] ARM: S5PV310: Change to using s3c_gpio_cfgall_range()
[PATCH 17/27] ARM: S3C64XX: 2nd Change to using s3c_gpio_cfgall_range()
[PATCH 18/27] ARM: S5P64X0: 2nd Change to using s3c_gpio_cfgall_range()
[PATCH 19/27] ARM: S5PC100: 2nd Change to using s3c_gpio_cfgall_range()
[PATCH 20/27] ARM: S5PV210: 2nd Change to using s3c_gpio_cfgall_range()
[PATCH 21/27] ARM: SAMSUNG: Add s3c_gpio_cfgrange_nopull() helper
[PATCH 22/27] ARM: S3C64XX: Change to using s3c_gpio_cfgrange_nopull()
[PATCH 23/27] ARM: S5PC100: Change to using s3c_gpio_cfgrange_nopull()
[PATCH 24/27] ARM: S5PV210: Change to using s3c_gpio_cfgrange_nopull()
[PATCH 25/27] ARM: S3C64XX: 2nd Change to using s3c_gpio_cfgrange_nopull()
[PATCH 26/27] ARM: S5PC100: 2nd Change to using s3c_gpio_cfgrange_nopull()
[PATCH 27/27] ARM: S5PV210: 2nd Change to using s3c_gpio_cfgrange_nopull()
