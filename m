From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 0/2] mmc: samsung-soc: support the second capability
Date: Mon, 31 Oct 2011 14:58:11 +0900
Message-ID: <4EAE38F3.4090400@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc <linux-mmc@vger.kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Kyungmin Park <kyungmin.park@samsung.com>, 'kgene kim' <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch-set is added the platdata for the second capability.
At latest, added the cap2 for capability in mmc-core.
Samsung-SoC should use this field.

Jaehoon Chung (2):
  sdhci: support the second capability for hsmmc.
  sdhci-s3c: add platform data for the second capability

 arch/arm/plat-samsung/dev-hsmmc.c          |    2 ++
 arch/arm/plat-samsung/dev-hsmmc1.c         |    2 ++
 arch/arm/plat-samsung/dev-hsmmc2.c         |    2 ++
 arch/arm/plat-samsung/dev-hsmmc3.c         |    2 ++
 arch/arm/plat-samsung/include/plat/sdhci.h |    1 +
 drivers/mmc/host/sdhci-s3c.c               |    2 ++
 6 files changed, 11 insertions(+), 0 deletions(-)
