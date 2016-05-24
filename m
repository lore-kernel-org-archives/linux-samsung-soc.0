From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/2] ARM: dts: Fix imprecise external abort error when accessing Exynos MFC
Date: Tue, 24 May 2016 13:41:00 -0400
Message-ID: <1464111662-15336-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This series fixes an imprecise external abort error when accessing the
Exynos MFC registers due the power domain configuration requiring the
aclk333 clock to be enabled during a domain switch.

There isn't a dependency between the clock and Linux Samsung SoC trees
because the CLK_ACLK333 clock ID is already defined so the patches can
be picked indepedently by the relevant subsystem maintainers.

Best regards,
Javier


Javier Martinez Canillas (2):
  clk: exynos5420: Set ID for aclk333 gate clock
  ARM: dts: Add async-bridge clock to MFC power domain for Exynos5420

 arch/arm/boot/dts/exynos5420.dtsi    | 5 +++--
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.5.5

