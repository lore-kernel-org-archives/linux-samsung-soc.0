From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/3] regulator: s2mps11: Add support for S2MPS14 regulators
Date: Wed, 05 Mar 2014 10:22:50 +0100
Message-ID: <1394011373-4057-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset adds support for the S2MPS14 device to the s2mps11 regulator
driver. It's a subset of previously sent patches for S2MPS14 device:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27194/focus=1649217
along with one new patch:
 - PATCH 2/3: regulator: s2mps11: Add set_suspend_disable for S2MPS14
which replaces previous "opmode" idea.


These patches are rebased against linux-next tree (next-20140305) because
they depend on changes in main MFD sec-core and s2mps11 regulator driver.


Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  regulator: s2mps11: Add support for S2MPS14 regulators
  regulator: s2mps11: Add set_suspend_disable for S2MPS14
  Documentation: mfd: s2mps11: Document support for S2MPS14

 Documentation/devicetree/bindings/mfd/s2mps11.txt |   12 +-
 drivers/regulator/Kconfig                         |    9 +-
 drivers/regulator/s2mps11.c                       |  278 ++++++++++++++++-----
 include/linux/mfd/samsung/s2mps14.h               |    2 +
 4 files changed, 232 insertions(+), 69 deletions(-)

-- 
1.7.9.5
