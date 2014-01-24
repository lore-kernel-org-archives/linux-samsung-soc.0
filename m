From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 0/2] regulator: s5m8767: Use GPIO for controlling Buck9/eMMC
Date: Fri, 24 Jan 2014 14:37:56 +0100
Message-ID: <1390570678-30686-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41251 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752497AbaAXNiR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jan 2014 08:38:17 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi,


This is third version of patch adding GPIO control over Buck9 regulator
in s5m8767 regulator driver.

Previously the patch was part of larger patchset from which all other patches
were applied.


Changes since v2:
1. Use only one DT property ("s5m8767,pmic-ext-control-gpios");
   suggested by Mark Brown.

Changes since v1:
1. Use ena_gpio of regulator core, as suggested by Mark Brown.


This patchset is based on next tree: next-20140122.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  regulator: s5m8767: Use GPIO for controlling Buck9/eMMC
  regulator: s5m8767: Document new binding for Buck9 GPIO control

 .../bindings/regulator/s5m8767-regulator.txt       |   13 ++-
 drivers/regulator/s5m8767.c                        |   87 +++++++++++++++++++-
 include/linux/mfd/samsung/core.h                   |    3 +-
 include/linux/mfd/samsung/s5m8767.h                |    7 ++
 4 files changed, 105 insertions(+), 5 deletions(-)

-- 
1.7.9.5
