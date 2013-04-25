From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Late Samsung stuff (v3) for v3.10
Date: Fri, 26 Apr 2013 01:42:16 +0900
Message-ID: <51795CE8.2060105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f41.google.com ([209.85.210.41]:46535 "EHLO
	mail-da0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758981Ab3DYQmV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Apr 2013 12:42:21 -0400
Received: by mail-da0-f41.google.com with SMTP id p8so1516656dan.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2013 09:42:20 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>

The following changes since commit 59a7bbf75442ea439a4d3b7993ad87023e406063:

   ARM: dts: add PDMA0 changes for exynos5440 (2013-04-09 01:39:27 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/late-exynos-v3-for-v3.10

for you to fetch changes up to 096ee6adcfb79a13ae04150023725c8a67e00ae8:

   ARM: dts: Add chip-id controller node on Exynos4/5 SoC (2013-04-26 
01:21:44 +0900)

----------------------------------------------------------------
This allows that device tree enables platform to setup a runtime IO 
mapping for the chip id

----------------------------------------------------------------
Thomas Abraham (2):
       ARM: EXYNOS: Create virtual I/O mapping for Chip-ID controller 
using device tree
       ARM: dts: Add chip-id controller node on Exynos4/5 SoC

  arch/arm/boot/dts/exynos4.dtsi          |  5 ++++
  arch/arm/boot/dts/exynos5250.dtsi       |  5 ++++
  arch/arm/mach-exynos/common.c           | 53 
+++++++++++++++++++--------------
  arch/arm/mach-exynos/include/mach/map.h |  1 -
  4 files changed, 40 insertions(+), 24 deletions(-)
