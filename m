From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v4 0/4] mfd: sec: add S2MPS15 PMIC support
Date: Thu, 29 Oct 2015 10:28:37 +0530
Message-ID: <1446094723-6212-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Samsung's S2MPS15 PMIC is targetted to be used with Samsung's Exynos7 SoC.
The S2MPS15 PMIC is similar in functionality to S2MPS11/14 PMIC. It contains
27 LDO and 10 Buck regulators, RTC, three 32.768 KHz clock outputs and allows
programming these blocks via a I2C interface. This patch series adds initial
support for LDO/Buck regulators of S2MPS15 PMIC.

Changes since v3:
* Changes regulator driver name from s2mps15-pmic -> s2mps15-regulator as disscussed here [2]
* Re-use the exsisting compatible/names for s2mps15 clock block.

Changes since v2:
* Addressed Lee Jones review comments.

Changes since v1:
* Added suggestion from Krzysztof [1].
* Added s2mps15's 32.768 clocks support.
* Added s2mps15's rtc support.

V1 of these patches (with a lesser features) were posted a year back,
since then there is not much progress on this, this is my attempt to
move things forward.

[1]-> https://lkml.org/lkml/2014/10/14/67
[2]-> https://lkml.org/lkml/2015/10/28/417

This series is based on linux-next-20151022.
This is tested on exynos7-espresso board.


Alim Akhtar (1):
  drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC

Thomas Abraham (3):
  dt-bindings: mfd: s2mps11: add documentation for s2mps15 PMIC
  mfd: sec: Add support for S2MPS15 PMIC
  regulator: s2mps11: add support for S2MPS15 regulators

 Documentation/devicetree/bindings/mfd/s2mps11.txt |   23 +--
 drivers/mfd/sec-core.c                            |   31 ++++
 drivers/mfd/sec-irq.c                             |    8 ++
 drivers/regulator/Kconfig                         |    4 +-
 drivers/regulator/s2mps11.c                       |  135 +++++++++++++++++-
 drivers/rtc/rtc-s5m.c                             |   20 ++-
 include/linux/mfd/samsung/core.h                  |    1 +
 include/linux/mfd/samsung/rtc.h                   |    4 +
 include/linux/mfd/samsung/s2mps15.h               |  158 +++++++++++++++++++++
 9 files changed, 371 insertions(+), 13 deletions(-)
 create mode 100644 include/linux/mfd/samsung/s2mps15.h

-- 
1.7.10.4
