From: Anand Moon <linux.amoon@gmail.com>
Subject: v5 Exynos5422 odroidxu3 pwm-fan control using thermal sensors
Date: Wed, 13 May 2015 16:06:55 +0930
Message-ID: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:35629 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752124AbbEMGi6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 02:38:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Markus Reichl <m.reichl@fivetechno.de>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Rebase on  https://github.com/krzk/linux.git v4.2-next/dt-samsung

Changes from previous version.
Updated the the "cpu-crit-0" trip point in arch/arm/boot/dts/exynos5-cpu-thermal.dtsi

Changes From 
				cpu_crit0: cpu-crit-0 {
					temperature = <100000>; /* millicelsius */
					hysteresis = <0>; /* millicelsius */
					type = "critical";
				};
Changes To 
				cpu_crit0: cpu-crit-0 {
					temperature = <120000>; /* millicelsius */
					hysteresis = <0>; /* millicelsius */
					type = "critical";
				};

Changes were made to match exynos5420-trip-points.dtsi

-Anand Moon
