From: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH 0/2] EXYNOS4: Add device tree support for USB/EHCI
Date: Thu, 27 Dec 2012 03:42:19 +0900
Message-ID: <1356547341-23620-1-git-send-email-tobetter@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:57647 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830Ab2LZSn4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 13:43:56 -0500
Received: by mail-pa0-f43.google.com with SMTP id fb10so5062461pad.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Dec 2012 10:43:56 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Dongjin Kim <tobetter@gmail.com>

This patch set adds device tree upport for USB/EHCI device.

Dongjin Kim (2):
  ARM: dts: Add EHCI device tree node for Exynos4
  USB: ehci-s5p: Add to get interrupt from DT

 arch/arm/boot/dts/exynos4.dtsi         |    7 +++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c |    9 +++++++++
 drivers/usb/host/ehci-s5p.c            |    8 +++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
1.7.10.4
