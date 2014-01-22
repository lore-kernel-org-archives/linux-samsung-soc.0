From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 0/2] regulator: s5m8767: Use GPIO for controlling Buck9/eMMC
Date: Wed, 22 Jan 2014 17:07:26 +0100
Message-ID: <1390406848-20964-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This is second version of patch adding GPIO control over Buck9 regulator
in s5m8767 regulator driver.

Previously the patch was part of larger patchset from which all other patches
were applied. Changes since previous revision:
1. Use ena_gpio of regulator core, as suggested by Mark Brown.

This patchset is based on next tree: next-20140122.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  regulator: s5m8767: Use GPIO for controlling Buck9/eMMC
  regulator: s5m8767: Document new bindings for Buck9 GPIO control

 .../bindings/regulator/s5m8767-regulator.txt       |   16 +++-
 drivers/regulator/s5m8767.c                        |   97 +++++++++++++++++++-
 include/linux/mfd/samsung/core.h                   |    4 +-
 include/linux/mfd/samsung/s5m8767.h                |    7 ++
 4 files changed, 119 insertions(+), 5 deletions(-)

-- 
1.7.9.5

