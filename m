From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 0/3] arm64: add new support Samsung GH7 SoC and SSDK board
Date: Tue, 11 Mar 2014 07:51:16 +0900
Message-ID: <1394491879-5320-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:34380 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbaCJWvw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 18:51:52 -0400
Received: by mail-pd0-f171.google.com with SMTP id r10so7690275pdi.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Mar 2014 15:51:51 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>

This adds support for Samsung ARMv8 core based GH7 SoC and its evaluation SSDK
board.

Changes since v1:
- remove model and compatible in dtsi
- remove inclusion /dts-v1/ in dtsi
- add aliase for serial0
- remove compatible cortex-a9-gic for gic
- remove clock-frequncy for timer
- change number of address-cells and size-cells to 2
- enable ARCH_GH7 in single defconfig for arm64

There were many comments for SoC vendor's Kconfig entry but now I have no
choice except adding ARCH_GH7 and enabling it in current single defconfig
for arm64 by default.

[PATCH v2 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and SSDK-GH7 board
[PATCH v2 2/3] arm64: defconfig: Enable ARCH_GH7 by default
[PATCH v2 3/3] Documentation: DT: add new entry for Samsung GH7 SoC and SSDK board
