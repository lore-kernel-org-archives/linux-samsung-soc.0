From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/3] dt-bindings: regulator/clock/mfd: Reorganize S2M/S5M
 bindings
Date: Fri, 04 Dec 2015 10:10:02 +0900
Message-ID: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


The patchset tries to bring some order to the chaotic bindings for family
of Samsung PMIC devices: S2MPS/S2MPA/S5M.

Beside of renaming and removal of common parts I also tried to make
a consistent style used in the files. The bindings itself were not
modified.

The patchset should be probably pulled at once (later patches depend on
previous). With respective acks maybe through MFD tree?


Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  dt-bindings: regulator/clock/mfd: Reorganize S2MPS-family bindings
  dt-bindings: regulator/mfd: Reorganize S5M8767 bindings
  dt-bindings: regulator/mfd: Reorganize S2MPA01 bindings

 .../devicetree/bindings/clock/samsung,s2mps11.txt  |  49 +++++++
 Documentation/devicetree/bindings/mfd/s2mpa01.txt  |  90 ------------
 Documentation/devicetree/bindings/mfd/s2mps11.txt  | 153 -------------------
 .../devicetree/bindings/mfd/samsung,sec-core.txt   |  88 +++++++++++
 .../bindings/regulator/s5m8767-regulator.txt       | 163 ---------------------
 .../bindings/regulator/samsung,s2mpa01.txt         |  79 ++++++++++
 .../bindings/regulator/samsung,s2mps11.txt         | 102 +++++++++++++
 .../bindings/regulator/samsung,s5m8767.txt         | 145 ++++++++++++++++++
 MAINTAINERS                                        |   6 +-
 9 files changed, 467 insertions(+), 408 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/s2mpa01.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt

-- 
1.9.1
