From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 0/3] Add pinctrl support to Exynos5420
Date: Wed, 12 Jun 2013 20:21:25 +0530
Message-ID: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9980 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753106Ab3FLO2Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 10:28:24 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOA006R9AV81760@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Jun 2013 23:28:22 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com

This patchset adds the pinctrl support to Exynos5420.
This series is rebased and tested on master branch of 
linux-next tree over Chander Kashyap patchset.
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg18623.html

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
1.7.10.4
