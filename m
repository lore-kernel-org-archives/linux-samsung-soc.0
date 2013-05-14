From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 0/2] Add LCD backlight and LCD enable gpios pins to dp-controller DT node
Date: Tue, 14 May 2013 18:25:50 +0530
Message-ID: <1368536152-13370-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:37736 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756701Ab3ENM4Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 08:56:24 -0400
Received: by mail-pa0-f45.google.com with SMTP id lj1so494829pab.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 May 2013 05:56:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

This patch series adds LCD backlight and LCD enable gpios pins to dp-controller
DT node of exynos5250-smdk5250 and parsing of these gpio pins in exynos-dp driver

tested on exynos5250-smdk5250 Board.

rebased on kgene-next branch of 
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/

Vikas Sajjan (2):
  video: exynos_dp: Add parsing of gpios pins to exynos-dp driver
  ARM: dts: Add LCD backlight and LCD enable gpios pins to
    dp-controller DT node

 arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 ++
 drivers/video/exynos/exynos_dp_core.c     |   45 +++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

-- 
1.7.9.5
