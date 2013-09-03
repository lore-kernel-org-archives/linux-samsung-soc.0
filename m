From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [RFC Patch v2 0/3] add temporary parent migration support
Date: Tue,  3 Sep 2013 17:04:28 +0530
Message-ID: <1378208072-10173-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:34401 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932595Ab3ICLes (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 07:34:48 -0400
Received: by mail-pd0-f176.google.com with SMTP id q10so5876851pdj.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 04:34:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, thomas.abraham@linaro.org, Chander Kashyap <chander.kashyap@linaro.org>

Some platform has provision to change cpu parent clock during
cpu frequency scaling. This patch series provides a mechanism to
implement the same using CCF.

Patch1 provides mechanism to migrate to new parent temporarily.

Patch2 updates the user of clk_register_mux and DEFINE_CLK_MUX which are
modified to add support for clk migration.

Patch3 adds support to Exynos5250 to use the clock parent migration feature
implemented in CCF.

Changes in v2:
	- Renamed flag name from CLK_SET_RATE_ALTERNATE to CLK_SET_RATE_TEMP_PARENT
	- Renamed "alternate_parent_name" to "temp_parent_name" and
	  "alternate_parent" to "temp_parent"

Chander Kashyap (3):
  clk: add support for temporary parent clock migration
  clk: update users of "clk_register_mux" and "DEFINE_CLK_MUX"
  clk: samsung: Exynos5250: Add alternate parent name for mout_cpu

 arch/arm/mach-imx/clk.h                |    6 +--
 arch/arm/mach-omap2/cclock2420_data.c  |    2 +-
 arch/arm/mach-omap2/cclock2430_data.c  |    4 +-
 arch/arm/mach-omap2/cclock33xx_data.c  |    7 +--
 arch/arm/mach-omap2/cclock3xxx_data.c  |    8 ++--
 arch/arm/mach-omap2/cclock44xx_data.c  |   61 +++++++++++++------------
 drivers/clk/clk-mux.c                  |   13 +++---
 drivers/clk/clk.c                      |   43 +++++++++++++++++-
 drivers/clk/mmp/clk-mmp2.c             |   39 ++++++++++------
 drivers/clk/mmp/clk-pxa910.c           |   30 ++++++++----
 drivers/clk/mxs/clk.h                  |    2 +-
 drivers/clk/samsung/clk-exynos-audss.c |    4 +-
 drivers/clk/samsung/clk-exynos4.c      |   10 ++--
 drivers/clk/samsung/clk-exynos5250.c   |    4 +-
 drivers/clk/samsung/clk.c              |    3 +-
 drivers/clk/samsung/clk.h              |   17 ++++---
 drivers/clk/spear/spear1310_clock.c    |   78 ++++++++++++++++++--------------
 drivers/clk/spear/spear1340_clock.c    |   47 ++++++++++---------
 drivers/clk/spear/spear3xx_clock.c     |   36 +++++++--------
 drivers/clk/spear/spear6xx_clock.c     |   20 ++++----
 drivers/clk/sunxi/clk-sunxi.c          |    2 +-
 drivers/clk/tegra/clk-tegra114.c       |   24 +++++-----
 drivers/clk/tegra/clk-tegra20.c        |    4 +-
 drivers/clk/tegra/clk-tegra30.c        |   22 ++++-----
 drivers/clk/versatile/clk-vexpress.c   |    2 +-
 drivers/clk/zynq/clkc.c                |   65 +++++++++++++-------------
 include/linux/clk-private.h            |   19 ++++----
 include/linux/clk-provider.h           |   10 ++--
 28 files changed, 338 insertions(+), 244 deletions(-)

-- 
1.7.9.5
