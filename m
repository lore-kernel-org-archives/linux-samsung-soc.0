From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Tue, 22 Jan 2013 21:01:18 +0530
Message-ID: <1358868680-5757-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63504 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753227Ab3AVPZI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jan 2013 10:25:08 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, grant.likely@secretlab.ca, dianders@chromium.org, balbi@ti.com, thomas.abraham@linaro.org, sylvester.nawrocki@gmail.com, tomasz.figa@gmail.com, p.paneri@samsung.com

Changes from v1:
 - Putting separate device nodes for usb 2.0 phy and usb 3.0 phy
   based on separate driver for samsung usb 3.0 phy and
   samsung usb 2.0 phy:
   [PATCH v3 0/2] Adding USB 3.0 DRD-phy support for exynos5250
   [PATCH v8 0/4] Adding usb2.0 host-phy support for exynos5250
 - Aligning as per the patch:
   usb: phy: samsung: Add support to set pmu isolation
 - Replaced phy-handle approach for PHY CONTROL registers
   to child nodes.
 - Removing AUX data entry from exynos5250 dt file.

Vivek Gautam (2):
  ARM: Exynos5250: Enabling samsung-usbphy driver
  ARM: Exynos5250: Enabling samsung-usb3-phy driver

 arch/arm/boot/dts/exynos5250.dtsi |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

-- 
1.7.6.5
