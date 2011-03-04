From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 0/3] ARM: S5P: Add HRT support for s5p series
Date: Fri,  4 Mar 2011 14:21:36 +0900
Message-ID: <1299216099-7709-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:55021 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809Ab1CDFsb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Mar 2011 00:48:31 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

The Following  patches support high resolution timer for s5p series.
In this version, I had modified clk_get scheme and Added sched_clock_support 
and clockevents_calc_mult_shift function. 
For initialization functions,Added  __init MACRO.
Basically, I had reflected comments of Russell King, Linus Walleij,
and Kyungmin Park.
 
Changes since v1:
 - Add sched_clock support (Linus Walleij)
 - Add clockevents_calc_mult_shift
 - Modify clk_get scheme
 - Default clockevent is PWM timer3
 
The patch series contains:

[PATCH V2 1/3] ARM: S5P: Add s5p_timer support for HRT
[PATCH V2 2/3] ARM: S5P: Update machine initialization for HRT
[PATCH V2 3/3] ARM: S5P: Update defconfig for HRT support

For applying this patch, It is needed pwm timer patches.
http://article.gmane.org/gmane.linux.kernel.samsung-soc/4178

Thanks and regards,
S.B. Kim
