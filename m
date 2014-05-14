From: Tomasz Figa <t.figa@samsung.com>
Subject: [GIT PULL 4/4] Samsung clock support for Exynos3250 for v3.16
Date: Wed, 14 May 2014 20:03:11 +0200
Message-ID: <1400090591-5064-4-git-send-email-t.figa@samsung.com>
References: <1400090591-5064-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:23088 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbaENSDg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 14:03:36 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5K00A7ASTV2Q50@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 May 2014 19:03:31 +0100 (BST)
In-reply-to: <1400090591-5064-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Tomasz Figa <t.figa@samsung.com>

The following changes since commit 3bc0c5a16d65ef2a2edb7326f5b77d6a5bcf08a5:

  drivers: clk: use COMMON_CLK_SAMSUNG for Samsung clock support (2014-05-14 19:41:15 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git for_3.16/exynos3250

for you to fetch changes up to 2ce16c53422a17c0afea8203dd96ac1e7a142cf9:

  clk: samsung: exynos3250: Add clocks using common clock framework (2014-05-14 19:41:32 +0200)

----------------------------------------------------------------

Samsung clock support for Exynos3250 for v3.16.

This small pull request contains a patch adding clock driver for Exynos3250,
which depends on previous pull requests in this series.

----------------------------------------------------------------
Tomasz Figa (1):
      clk: samsung: exynos3250: Add clocks using common clock framework

 drivers/clk/samsung/Makefile           |   1 +
 drivers/clk/samsung/clk-exynos3250.c   | 780 +++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/exynos3250.h | 258 +++++++++++
 3 files changed, 1039 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynos3250.c
 create mode 100644 include/dt-bindings/clock/exynos3250.h
