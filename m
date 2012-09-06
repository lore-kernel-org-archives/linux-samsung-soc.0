From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] i2c: s3c2410: allow pin pin configuration using pinctrl
Date: Thu, 06 Sep 2012 14:52:59 +0530
Message-ID: <1346923381-14144-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51625 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752554Ab2IFJEh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 05:04:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, dong.aisheng@linaro.org, swarren@wwwdotorg.org, kgene.kim@samsung.com, patches@linaro.org, w.sang@pengutronix.de, ben-linux@fluff.org

This patch series adds support for pinctrl interface based i2c-bus
configuration for the s3c2410 i2c controller driver.

The second patch would have conflict with Exynos4 DTS reorganization
patches posted by Tomasz Figa. If those patches are applied prior to this
patch, I will rebase this patch and resubmit.

Thomas Abraham (2):
  i2c: s3c2410: add optional pin configuration using pinctrl interface
  ARM: dts: exynos4: allow i2c0 bus to be configured using pinctrl interface

 arch/arm/boot/dts/exynos4210-smdkv310.dts |    2 --
 arch/arm/boot/dts/exynos4210.dtsi         |    2 ++
 drivers/i2c/busses/i2c-s3c2410.c          |   19 ++++++++++++++++---
 3 files changed, 18 insertions(+), 5 deletions(-)
