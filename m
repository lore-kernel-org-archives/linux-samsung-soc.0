From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v4 0/2] Add peach-pit board support
Date: Mon,  5 May 2014 14:55:30 +0530
Message-ID: <1399281933-31064-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:52439 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755735AbaEEJZn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 05:25:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, dianders@chromium.org, arunkk.samsung@gmail.com

Dependencies
------------
Adding pwm nodes for backlight
https://patchwork.kernel.org/patch/4101881/

Changes from v3
--------------
- Addressed comments from Tomasz and Doug.

Changes from v2
--------------
- Use reference based node addressing in board dts file
  as suggested by Tomasz.
- Included patch to update 5420.dtsi with node references
  for all existing nodes.

Changes from v1
--------------
- Addressed review comments from Doug, Sachin & Tushar
- Removed adc and lid-switch nodes

Arun Kumar K (2):
  ARM: dts: Add node labels to 5420
  ARM: dts: Add peach-pit board support

 arch/arm/boot/dts/Makefile                 |    1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts |  147 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi          |   26 ++---
 3 files changed, 161 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5420-peach-pit.dts

-- 
1.7.9.5
