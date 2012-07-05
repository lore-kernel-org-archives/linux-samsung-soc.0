From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/3] Add audio platform device to S5PV210 and Exynos4 boards
Date: Thu,  5 Jul 2012 14:31:55 +0530
Message-ID: <1341478918-6602-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:41180 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335Ab2GEJOf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jul 2012 05:14:35 -0400
Received: by gglu4 with SMTP id u4so7139865ggl.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jul 2012 02:14:35 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

The following patch added snd_soc_register_card() functionality
instead of creating a "soc-audio" platform device in smdk_wm8994.c file.

http://www.spinics.net/lists/linux-samsung-soc/msg11232.html

After using snd_soc_register_card(), the sound card is registered as a
platform driver and it needs related platform device entry in machine file.

Thus this patch series is dependent on the above patch.
This series is based on Kukjin Kim's for-next branch.

Sachin Kamat (3):
  ARM: EXYNOS: Add audio platform device in SMDKV310 board
  ARM: S5PV210: Add audio platform device in Aquila board
  ARM: S5PV210: Add audio platform device in Goni board

 arch/arm/mach-exynos/mach-smdkv310.c |    7 +++++++
 arch/arm/mach-s5pv210/mach-aquila.c  |    7 +++++++
 arch/arm/mach-s5pv210/mach-goni.c    |    7 +++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

-- 
1.7.4.1
