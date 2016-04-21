From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/7] mfd: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
Date: Thu, 21 Apr 2016 17:55:51 +0530
Message-ID: <1461241558-26983-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5529 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751619AbcDUMh4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2016 08:37:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lee.jones@linaro.org, milo.kim@ti.com, cw00.choi@samsung.com, k.kozlowski@samsung.com
Cc: sbkim73@samsung.com, tony@atomide.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>

This series is an effort to reduce the code in error path and need of
remove callback by using the devm_mfd_add_devices() and 
devm_regmap_add_irq_chip() or devm_request_threaded_irq APIs for interrupt
support.

This is tested with build and comiplation only with arm64 defconfig and enabling
the required MFD CONFIGs.

Laxman Dewangan (7):
  mfd: as3722: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
  mfd: lp8788: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
  mfd: max77686: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
  mfd: rc5t583: Use devm_mfd_add_devices and devm_request_threaded_irq
  mfd: sec: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
  mfd: tps65910: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
  mfd: wl1273-core: Use devm_mfd_add_devices() for mfd_device
    registration

 drivers/mfd/as3722.c      | 31 +++++++++----------------------
 drivers/mfd/lp8788-irq.c  | 12 +++---------
 drivers/mfd/lp8788.c      | 10 ----------
 drivers/mfd/max77686.c    | 31 ++++++++-----------------------
 drivers/mfd/rc5t583-irq.c | 11 ++---------
 drivers/mfd/rc5t583.c     | 24 +++---------------------
 drivers/mfd/sec-core.c    | 20 +++-----------------
 drivers/mfd/sec-irq.c     | 14 +++++---------
 drivers/mfd/tps65910.c    | 25 ++++---------------------
 drivers/mfd/wl1273-core.c | 14 ++------------
 10 files changed, 39 insertions(+), 153 deletions(-)

-- 
2.1.4
