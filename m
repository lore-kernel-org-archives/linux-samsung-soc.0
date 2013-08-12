From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 0/2] Add GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and exynos5250
Date: Mon, 12 Aug 2013 15:32:12 +0530
Message-ID: <1376301734-21847-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:36276 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755963Ab3HLKC1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 06:02:27 -0400
Received: by mail-pb0-f52.google.com with SMTP id wz12so6600020pbc.25
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2013 03:02:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: mturquette@linaro.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, dianders@chromium.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and exynos5250.

is rebased on Mike's 
https://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=shortlog;h=refs/heads/clk-next 


Vikas Sajjan (2):
  clk: samsung: Add GPLL freq table for exynos5250 SoC
  clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420
    SoC

 drivers/clk/samsung/clk-exynos5250.c |   19 +++++++-
 drivers/clk/samsung/clk-exynos5420.c |   81 ++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 1 deletion(-)

-- 
1.7.9.5
