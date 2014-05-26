From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/3] regulator: merge s2mps11 and s2mpa01 drivers
Date: Mon, 26 May 2014 15:20:20 +0200
Message-ID: <1401110423-5647-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Lee Jones <lee.jones@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


The patchset merges s2mpa01 regulator driver into s2mps11. As a result
the s2mps11 supports:
 - S2MPA01
 - S2MPS11
 - S2MPS14

These PMIC-s are very similar to each other and they are often used
along with Samsung's Exynos SoCs. Merging this into one driver has
two benefits:
 - less code duplication,
 - one PMIC driver can be used in common Exynos default config.


The patchset was tested on Arndale Octa board with S2MPS11 PMIC. I am
kindly asking for testing on some board with S2MPA01.

Patches are rebased against current Mark Brown's regulator tree:
v3.15-rc5-41-g7c603c1c9e33


Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  regulator: s2mps11: Refactor setting ramp delay
  regulator: s2mps11: Merge S2MPA01 driver
  regulator: s2mpa01: Remove driver because it was merged into s2mps11

 Documentation/devicetree/bindings/mfd/s2mpa01.txt |  90 ----
 Documentation/devicetree/bindings/mfd/s2mps11.txt | 106 +++--
 drivers/regulator/Kconfig                         |  11 +-
 drivers/regulator/Makefile                        |   1 -
 drivers/regulator/s2mpa01.c                       | 482 ---------------------
 drivers/regulator/s2mps11.c                       | 483 +++++++++++++++++-----
 6 files changed, 454 insertions(+), 719 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/s2mpa01.txt
 delete mode 100644 drivers/regulator/s2mpa01.c

-- 
1.9.1
