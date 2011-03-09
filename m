From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH v4 0/3] ARM: S5P: Add HRT support for s5p series
Date: Wed,  9 Mar 2011 11:13:30 +0900
Message-ID: <1299636813-4869-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34580 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932086Ab1CICog (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 21:44:36 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

The Following  patches support high resolution timer for s5p series.
In this version, I had modified smdkv210 clockevent source.
Because, PWM timer3 is used as  pwm backlight driver in the smdkv210.
and In previous version(v3), I had made a mistake for making patches.

Changes since v3:
 - Change smdkv210 clockevent source by PWM timer2

Changes since v2:
 - Add S5P_HRT configuration for s5p_timer
 
Changes since v1:
 - Add sched_clock support (Linus Walleij)
 - Add clockevents_calc_mult_shift
 - Modify clk_get scheme
 - Default clockevent is PWM timer3
 
The patch series contains:

[PATCH v4 1/3] ARM: S5P: Add s5p_timer support for HRT
[PATCH v4 2/3] ARM: S5P: Update machine initialization for HRT
[PATCH v4 3/3] ARM: S5P: Update defconfig for HRT support
