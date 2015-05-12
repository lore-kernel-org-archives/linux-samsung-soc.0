From: Anand Moon <linux.amoon@gmail.com>
Subject: exynos_defconfig: Enable SENSORS_PWM_FAN, SENSORS_INA2XX, LEDS for OdroidXU3
Date: Wed, 13 May 2015 00:54:19 +0930
Message-ID: <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
References: <Anand Moon <linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:36491 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932914AbbELPY6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 11:24:58 -0400
Received: by pdea3 with SMTP id a3so16461708pde.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 08:24:58 -0700 (PDT)
In-Reply-To: <Anand Moon <linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Enable SENSORS_PWM_FAN, SENSORS_INA2XX, LEDS for OdroidXU3.
