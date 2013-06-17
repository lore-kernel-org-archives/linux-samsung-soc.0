From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] Enable config options to enable S2R wakeup
Date: Mon, 17 Jun 2013 09:48:04 +0530
Message-ID: <1371442686-24999-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:36331 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863Ab3FQEde (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 00:33:34 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so2344430pdi.41
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jun 2013 21:33:34 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, olof@lixom.net, patches@linaro.org

RTC source is very useful in testing S2R wakeup. Also enable
gpio-keys driver in case someone wants wakeup the board using
the buttons.

S2R wakeup feature on Arndale depends on following two additional
patches.

1. [PATCH 1/8] ARM: EXYNOS: use generic cpu idle function for wfi
 http://permalink.gmane.org/gmane.linux.linaro.devel/15871

2. [PATCH V2] ARM: dts: Enable RTC node for Arndale
(Posted a couple of minutes back, link not available yet)

S2R wakeup tested on Arndale board with an initramfs through
both RTC wakeup alarm and GPIO button interrupt.

Tushar Behera (2):
  ARM: exynos_defconfig: Enable GPIO buttons driver
  ARM: exynos_defconfig: Enable RTC driver

 arch/arm/configs/exynos_defconfig |    3 +++
 1 file changed, 3 insertions(+)

-- 
1.7.9.5
