From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3 0/2] Add peach-pit board support
Date: Wed, 30 Apr 2014 16:38:56 +0530
Message-ID: <1398856138-18837-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:63348 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbaD3LJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 07:09:31 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, olofj@google.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, arunkk.samsung@gmail.com

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
  ARM: dts: Add node references to 5420
  ARM: dts: Add peach-pit board support

 arch/arm/boot/dts/Makefile                 |    1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts |  156 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi          |   26 ++---
 3 files changed, 170 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5420-peach-pit.dts

-- 
1.7.9.5
