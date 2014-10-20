From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v11 0/6] cpufreq: use generic cpufreq drivers for exynos
 platforms
Date: Mon, 20 Oct 2014 17:11:15 +0530
Message-ID: <1413805281-6269-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59058 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbaJTL3f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 07:29:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, l.majewski@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com, heiko@sntech.de, cw00.choi@samsung.com

Changes since v10:
- Rebased on top of v3.18-rc1

This patch series removes the use of Exynos4210 and Exynos5250 specific cpufreq
drivers and enables the use of cpufreq-dt driver for these platforms. This
series also enables cpufreq support for Exynos5420 using arm_big_little cpufreq
driver.

This patch series is based and tested on v3.18-rc1 and depends on the patch
- "clk: exynos4: remove duplicate div_core2 divider clock instantiation"
  (http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34859.html)
  This patch has been merged in "arm-soc/samsung/dt3" branch of arm-soc tree.
