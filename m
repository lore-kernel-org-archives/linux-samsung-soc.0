From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v1 0/2] Fix display on second resume on 5250-snow
Date: Wed, 14 Oct 2015 12:44:15 +0200
Message-ID: <1444819457-27519-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

as discussed in [0], currently on the second resume from memory the
display is broken on Snow boards (ARM Samsung Series 3 Chromebook).

The reason is that on resume the contents of register SRC_TOP3 aren't
what the kernel thinks they are because the HW (or FW) is doing some
clock reparenting beneath our feet.

This series tasks the kernel to do the reparenting itself so that the HW
state always matches the kernel's internal state.

Thanks,

Tomeu

[0] http://lkml.kernel.org/g/561CDC33.7050103@collabora.com


Tomeu Vizoso (2):
  clk: samsung: exynos5250: Add DISP1 clocks
  ARM: dts: exynos5250: Add clocks to DISP1 domain

 arch/arm/boot/dts/exynos5250.dtsi      |  4 ++++
 drivers/clk/samsung/clk-exynos5250.c   | 16 +++++++++++++++-
 include/dt-bindings/clock/exynos5250.h |  4 +++-
 3 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.5.0

