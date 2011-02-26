From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 0/3] ARM: S5P: Add high resolution timer support
Date: Sat, 26 Feb 2011 11:45:54 +0900
Message-ID: <1298688357-20775-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41734 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751085Ab1BZDRL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Feb 2011 22:17:11 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patch-set adds support for HRT(High Resolution Timer).
In Samsung SoCs, there is many HRT timer sources.
PWM Timer, System Timer, MCT, RTC can be used for that.
In this patches, Only support PWM Timer.
But All kind of pwm timer can be used for clock source.
This patch is tested on SMDKC110, SMDK6450.
APM is only tested on SMDKC110.
Next version will support System Timer, RTC, MCT.

[PATCH 1/3] ARM: S5P: Add s5p_timer support for HRT
[PATCH 2/3] ARM: S5P: Update machine initialization for HRT
[PATCH 3/3] ARM: S5P: Update defconfig for HRT support
