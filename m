From: Anand Moon <linux.amoon@gmail.com>
Subject: v2 Exynos5422 odroidxu3 pwm-fan control using thermal sensors
Date: Fri, 10 Apr 2015 01:14:14 +0930
Message-ID: <1428594259-3915-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f195.google.com ([209.85.192.195]:33302 "EHLO
	mail-pd0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753563AbbDIPog (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Apr 2015 11:44:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This work depeds upon work done by Lukasz Majewski <l.majewski@samsung.com>
and Sjoerd Simons <sjoerd.simons@collabora.co.uk> regarding the pwm-fan.

Changes from v1
        fixed the registration of thermal sensor to tmu_cpu0
Dropped patches.
        0005-pwm-samsung-Fix-output-race-on-disabling.patch
        0006-hwmon-pwm-fan-Update-the-duty-cycle-inorder-to-contr.patch

-Anand Moon
