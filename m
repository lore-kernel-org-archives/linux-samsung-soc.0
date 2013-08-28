From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 0/2] Add GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and exynos5250
Date: Wed, 28 Aug 2013 19:09:56 +0530
Message-ID: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:45015 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270Ab3H1NkK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 09:40:10 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so6307821pdi.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 06:40:10 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, mturquette@linaro.org, patches@linaro.org, linaro-kernel@lists.linaro.org, joshi@samsung.com

Adds GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and exynos5250.

changes since v1:
	- addressed comments from Tomasz Figa <tomasz.figa@gmail.com>

is rebased on Mike's 
https://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=shortlog;h=refs/heads/clk-next
and on top of Tomasz Figa's clk clean-up patch series
http://www.spinics.net/lists/arm-kernel/msg269848.html


Vikas Sajjan (2):
  clk: samsung: Add GPLL freq table for exynos5250 SoC
  clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420
    SoC

 drivers/clk/samsung/clk-exynos5250.c |   19 ++++++++-
 drivers/clk/samsung/clk-exynos5420.c |   78 ++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)

-- 
1.7.9.5
