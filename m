From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/3] pinctrl: exynos: add support for Samsung's Exynos5250
Date: Wed, 06 Mar 2013 16:48:29 +0530
Message-ID: <1362568712-13586-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35005 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756273Ab3CFK4o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 05:56:44 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org

Changes since v1:
- Change the compatible string from "samsung,pinctrl-exynos5250" to
  "samsung,exynos5250-pinctrl".
- Rebased to v3.9-rc1

This patch series add pinctrl driver support for Samsung's Exynos5250 SoC.
The first patch adds the required Exynos5250 SoC specific data which is
used by the Samsung pinctrl driver to setup the pinctrl/pinmux/eint
controllers. The second and third patches skips the wakeup interrupt and
gpiolib registration if the pinctrl support is enabled for Exynos5250.

Thomas Abraham (3):
  pinctrl: exynos: add exynos5250 SoC specific data
  gpio: samsung: skip gpiolib registration if pinctrl support is enabled for exynos5250
  arm: exynos: skip wakeup interrupt registration for exynos5250 if pinctrl is enabled

 arch/arm/mach-exynos/common.c     |    1 +
 drivers/gpio/gpio-samsung.c       |    1 +
 drivers/pinctrl/pinctrl-exynos.c  |  108 +++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-samsung.c |    2 +
 drivers/pinctrl/pinctrl-samsung.h |    1 +
 5 files changed, 113 insertions(+), 0 deletions(-)
