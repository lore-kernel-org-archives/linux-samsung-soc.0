From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH-RESEND 0/4] ARM: S5PV210: Enable FIMC & MFC on SMDKC110 & V210 boards
Date: Mon, 13 Feb 2012 10:48:47 +0530
Message-ID: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35438 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755Ab2BMFYa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 00:24:30 -0500
Received: by daed14 with SMTP id d14so4163054dae.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Feb 2012 21:24:30 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Re-sending the patch series rebased onto next/board-samsung branch of 
Kukjin Kim's tree: 
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Sachin Kamat (4):
  ARM: S5PV210: Enable MFC on SMDKV210
  ARM: S5PV210: Enable MFC on SMDKC110
  ARM: S5PV210: Enable FIMC on SMDKV210
  ARM: S5PV210: Enable FIMC on SMDKC110

 arch/arm/mach-s5pv210/Kconfig         |    8 ++++++++
 arch/arm/mach-s5pv210/mach-smdkc110.c |   14 ++++++++++++++
 arch/arm/mach-s5pv210/mach-smdkv210.c |   14 ++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

-- 
1.7.4.1
