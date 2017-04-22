From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] dmaengine: s3c24xx: Fine-tuning for s3c24xx_dma_probe()
Date: Sat, 22 Apr 2017 23:23:03 +0200
Message-ID: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 23:14:32 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use devm_kcalloc() in s3c24xx_dma_probe()
  Fix a typo in a comment line

 drivers/dma/s3c24xx-dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.12.2

