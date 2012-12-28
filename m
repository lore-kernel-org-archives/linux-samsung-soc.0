From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] Add missing fixed regulators on Origen board
Date: Fri, 28 Dec 2012 14:04:28 +0530
Message-ID: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f51.google.com ([209.85.210.51]:35019 "EHLO
	mail-da0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892Ab2L1ImT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Dec 2012 03:42:19 -0500
Received: by mail-da0-f51.google.com with SMTP id i30so4716746dad.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Dec 2012 00:42:19 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

This patchset adds vmmc and hdmi-en regulators for Origen board.

Tushar Behera (2):
  ARM: EXYNOS: Add vmmc regulator for Origen board
  ARM: EXYNOS: Add hdmi-en regulator for Origen board

 arch/arm/mach-exynos/mach-origen.c |   44 ++++++++++++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

-- 
1.7.4.1
