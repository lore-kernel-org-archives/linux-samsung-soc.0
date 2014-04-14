From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/4] regulator: s2mps11: Add external GPIO control for S2MPS14
Date: Mon, 14 Apr 2014 10:09:05 +0200
Message-ID: <1397462949-22379-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset adds external GPIO control to s2mps11 regulator driver
for some of the S2MPS14 regulators.

Additionally (patch 4/4) it changes the bindings in s5m8767 regulator driver
for external control to match these used here:
	"samsung,ext-control-gpios"

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  regulator: s2mps11: Move DTS parsing code to separate function
  regulator: s2mps11: Add external GPIO control for S2MPS14
  Documentation: regulator: s2mps11: Document external GPIO control
  regulator: s5m8767: Use same binding for external control as in
    s2mps11

 Documentation/devicetree/bindings/mfd/s2mps11.txt  | 14 ++++
 .../bindings/regulator/s5m8767-regulator.txt       |  4 +-
 drivers/regulator/s2mps11.c                        | 98 +++++++++++++++++++---
 drivers/regulator/s5m8767.c                        |  2 +-
 include/linux/mfd/samsung/s2mps14.h                |  2 +
 5 files changed, 105 insertions(+), 15 deletions(-)

-- 
1.8.3.2
