From: Tomasz Figa <t.figa@samsung.com>
Subject: [GIT PULL 3/4] Samsung clock clean-up for v3.16
Date: Wed, 14 May 2014 20:03:10 +0200
Message-ID: <1400090591-5064-3-git-send-email-t.figa@samsung.com>
References: <1400090591-5064-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12787 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750705AbaENSDg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 14:03:36 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5K0068MSTM3E50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 May 2014 19:03:22 +0100 (BST)
In-reply-to: <1400090591-5064-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Tomasz Figa <t.figa@samsung.com>

The following changes since commit 773424326b51cc851b6e28ff22447ba5fcc5f429:

  clk: samsung: exynos5420: add more registers to restore list (2014-05-14 19:40:24 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git for_3.16/clk_cleanup

for you to fetch changes up to 3bc0c5a16d65ef2a2edb7326f5b77d6a5bcf08a5:

  drivers: clk: use COMMON_CLK_SAMSUNG for Samsung clock support (2014-05-14 19:41:15 +0200)

----------------------------------------------------------------

Samsung clock clean-up for v3.16.

This pull requests contains minor clean-up related to Samsung clock support,
including:

1) move Kconfig entries of Samsung clock drivers to drivers/clk,

2) compile drivers/clk/samsung conditionally when COMMON_CLK_SAMSUNG is
selected,

3) remove obsolete Kconfig lines after moving s3c24xx to CCF.

----------------------------------------------------------------
Pankaj Dubey (4):
      clk: samsung: add new Kconfig for Samsung common clock option
      ARM: select COMMON_CLK_SAMSUNG for ARCH_EXYNOS and ARCH_S3C64XX
      ARM: S3C24XX: move S3C24XX clock Kconfig options to Samsung clock Kconfig file
      drivers: clk: use COMMON_CLK_SAMSUNG for Samsung clock support

Tomasz Figa (1):
      ARM: S3C24XX: Remove omitted Kconfig selects and conditionals

 .../bindings/clock/samsung,s3c2410-clock.txt       |  2 +-
 arch/arm/Kconfig                                   |  4 +--
 arch/arm/mach-s3c24xx/Kconfig                      | 39 +++-------------------
 drivers/clk/Kconfig                                |  2 ++
 drivers/clk/Makefile                               |  2 +-
 drivers/clk/samsung/Kconfig                        | 26 +++++++++++++++
 6 files changed, 37 insertions(+), 38 deletions(-)
 create mode 100644 drivers/clk/samsung/Kconfig
