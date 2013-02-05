From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v3 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Tue, 05 Feb 2013 18:33:52 +0530
Message-ID: <1360069434-20417-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65480 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751622Ab3BEM5s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 07:57:48 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, balbi@ti.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, tomasz.figa@gmail.com, dianders@chromium.org, p.paneri@samsung.com

Based on for-next of 'linux-samsung' tree.

Aligned with following patches for separate PHY drivers for USB 2.0 and
USB 3.0 for Samsung SoCs.
[PATCH v5 1/2] usb: phy: samsung: Common out the generic stuff
[PATCH v5 2/2] usb: phy: samsung: Add PHY support for USB 3.0 controller

Changes from v2:
 - Putting device nodes in order of device addresses.

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
  ARM: Exynos5250: Enabling samsung-usb2phy driver
  ARM: Exynos5250: Enabling samsung-usb3phy driver

 arch/arm/boot/dts/exynos5250.dtsi |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

-- 
1.7.6.5
