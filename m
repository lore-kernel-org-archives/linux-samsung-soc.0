From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/4] ARM: S5PV210: Enable FIMC and MFC on SMDK C110 and V210 boards
Date: Mon, 26 Dec 2011 15:30:09 +0530
Message-ID: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44766 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753955Ab1LZKDd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 05:03:33 -0500
Received: by iaeh11 with SMTP id h11so18667483iae.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 02:03:32 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

This patch series adds support for MFC and FIMC on SMDK C110 and V210 boards.
It is based on Kukjin Kim's latest for-next branch.

Sachin Kamat (4):
  ARM: S5PV210: Enable MFC on SMDKV210
  ARM: S5PV210: Enable MFC on SMDKC110
  ARM: S5PV210: Enable FIMC on SMDKV210
  ARM: S5PV210: Enable FIMC on SMDKC110

 arch/arm/mach-s5pv210/Kconfig         |    8 ++++++++
 arch/arm/mach-s5pv210/mach-smdkc110.c |   14 ++++++++++++++
 arch/arm/mach-s5pv210/mach-smdkv210.c |   13 +++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

-- 
1.7.4.1
