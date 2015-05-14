From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 6/9] ARM: multi_v7_defconfig: Enable Samsung S3C SoC RTC
Date: Thu, 14 May 2015 17:40:13 +0200
Message-ID: <1431618016-2087-7-git-send-email-javier.martinez@collabora.co.uk>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:47170 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964913AbbENPko (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 11:40:44 -0400
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The rtc-s3c driver supports a range of S3C series Real-Time-Clocks found
on many Samsung SoCs. Build the driver as a module to support these RTC.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bc7da5659e5d..f587f2214202 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -520,6 +520,7 @@ CONFIG_RTC_DRV_TPS65910=y
 CONFIG_RTC_DRV_S35390A=m
 CONFIG_RTC_DRV_EM3027=y
 CONFIG_RTC_DRV_DIGICOLOR=m
+CONFIG_RTC_DRV_S3C=m
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_VT8500=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.1.4
