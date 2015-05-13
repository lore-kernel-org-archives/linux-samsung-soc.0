From: Anand Moon <linux.amoon@gmail.com>
Subject: v3 exynos_defconfig: Enable SENSORS_PWM_FAN, SENSORS_INA2XX, LEDS for Odroid-XU3
Date: Wed, 13 May 2015 14:32:04 +0930
Message-ID: <1431493327-5387-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:36344 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750849AbbEMFCR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 01:02:17 -0400
Received: by pdea3 with SMTP id a3so39053922pde.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 22:02:17 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Enable SENSORS_PWM_FAN, SENSORS_INA2XX, LEDS for Odroid-XU3 on exynos_defconfig
to support DTS changes.

-Anand Moon
