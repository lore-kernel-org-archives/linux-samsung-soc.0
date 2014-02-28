From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/3] regulator: s2mps11: Minor fixes and prepare for S2MPS14
Date: Fri, 28 Feb 2014 11:01:47 +0100
Message-ID: <1393581710-17754-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Few days ago I sent patches adding support for S2MPS14 device to the
sec-core/s2mps11 drivers. These patches were rather large as they covered
multiple subsystems so I decided to split everything into smaller, separate
patches.

The original patchset (version 3) can be found here:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27194/focus=1649217

This patchset is a small subset of the patchset related to the s2mps11
regulator driver. The third patch here prepares for supporting the S2MPS14
device. I would be glad if it comes in however I understand that without
further patches it is a little premature.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  regulator: s2mps11: Don't store registered regulators in state
    container
  regulator: s2mps11: Constify regulator_desc array
  regulator: s2mps11: Copy supported regulators from initconst

 drivers/regulator/s2mps11.c |   85 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 18 deletions(-)

-- 
1.7.9.5
