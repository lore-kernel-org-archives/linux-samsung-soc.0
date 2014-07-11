From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH 0/2] clk: exynos-audss: Adapt to exising clock framework
Date: Fri, 11 Jul 2014 15:07:53 +0530
Message-ID: <1405071475-31946-1-git-send-email-tushar.b@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: robh+dt@kernel.org, grant.likely@linaro.org, kgene.kim@samsung.com, mturquette@linaro.org, t.figa@samsung.com, trblinux@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

The patchset is targetted as moving exising exynos-audss clock driver from being
a module driver. The driver is now registered through CLK_OF_DECLARE and is
inline with other Samsung clock drivers.

The patches are tested on Exynos5800 based Peach-Pi board. More tests are
welcome.

Tushar Behera (2):
  clk: exynos-audss: Simplify code to get clock names
  clk: exynos-audss: Update as per existing framework

 drivers/clk/samsung/clk-exynos-audss.c |  268 ++++++++++++--------------------
 1 file changed, 102 insertions(+), 166 deletions(-)

-- 
1.7.9.5
