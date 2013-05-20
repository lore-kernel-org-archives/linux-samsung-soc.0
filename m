From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 0/2] clk: samsung: add composite clocks
Date: Mon, 20 May 2013 19:47:06 +0530
Message-ID: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60617 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756270Ab3ETNxK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 09:53:10 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN3008RCNWKENI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 May 2013 22:53:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

This patch adds support for composite clocks for samsung SoCs.
Many drivers need access to a common clock which support gating
and/or muxing and/or rate control operations. For example hdmi
which needs to switch between parents and call enable/disable for
"sclk_hdmi".

This patch set also adds composite clock for exyno5250 hdmi. Based
on the review comment, I will extended this to other exynos SoCs
clocks files.

This patch series is based on for-next branch of tree:
git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git

Rahul Sharma (2):
  clk: samsung: add support for composite clocks
  clk: samsung: add exynos5250 composite clock for hdmi

 drivers/clk/samsung/clk-exynos5250.c |   20 ++++-
 drivers/clk/samsung/clk.c            |  149 ++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk.h            |   49 +++++++++++
 3 files changed, 215 insertions(+), 3 deletions(-)

-- 
1.7.10.4
