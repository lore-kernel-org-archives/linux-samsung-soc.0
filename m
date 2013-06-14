From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 0/3] Add pinctrl support to Exynos5420
Date: Fri, 14 Jun 2013 18:32:31 +0530
Message-ID: <1371214954-29358-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14807 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752471Ab3FNMjp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 08:39:45 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOD00NWUV641CZ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 21:39:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org

This patchset adds the pinctrl support to Exynos5420.
This series is rebased and tested on master branch of 
linux-next tree over Chander Kashyap patchset.
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18623.html

Changes since V1:
	- As gpy7 bank supports interrupts, it is defined using EINTG macro

Leela Krishna Amudala (3):
  ARM: dts: add pinctrl support to Exynos5420
  pinctrl: exynos: add exynos5420 SoC specific data
  gpio: samsung: skip gpiolib registration if pinctrl support is
    enabled for exynos5420

 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |  680 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   45 ++
 drivers/gpio/gpio-samsung.c                        |    1 +
 drivers/pinctrl/pinctrl-exynos.c                   |  115 ++++
 drivers/pinctrl/pinctrl-samsung.c                  |    2 +
 drivers/pinctrl/pinctrl-samsung.h                  |    1 +
 7 files changed, 845 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5420-pinctrl.dtsi

-- 
1.7.9.5
