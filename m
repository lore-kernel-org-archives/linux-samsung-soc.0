From: Vasanth Ananthan <vasanthananthan@gmail.com>
Subject: [PATCH v2] ARM: dts: map SATA controller port to SATA PHY controller
Date: Tue,  5 Feb 2013 19:14:23 +0530
Message-ID: <1360071864-25758-1-git-send-email-vasanthananthan@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:64590 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753743Ab3BENof (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 08:44:35 -0500
Received: by mail-pa0-f44.google.com with SMTP id kp1so152744pab.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 05:44:35 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, Vasanth Ananthan <vasanthananthan@gmail.com>

Changes since v1:

	Added a child node to sata-phy node for passing the sata phy
	PMU control registers base address and range. 

Vasanth Ananthan (1):
  ARM: dts: map SATA controller port to SATA PHY controller

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   11 -----------
 arch/arm/boot/dts/exynos5250.dtsi         |   22 +++++++++++++++++++---
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    4 ++--
 3 files changed, 21 insertions(+), 16 deletions(-)

-- 
1.7.9.5
