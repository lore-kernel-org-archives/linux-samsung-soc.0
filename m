From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V3 0/4] i2c: s3c2410: Add devm_* apis and cleanup
Date: Thu, 24 Jan 2013 15:41:05 +0530
Message-ID: <1359022269-12593-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset cleans up the probe function of i2c-s3c2410 driver.
These have been tested on Exynos4210 based Origen board.

Changes since V2:
  * Rebased to v3.8-rc4.
  * devm_request_and_ioremap() has already been implemented.

Changes since V1:
  * devm_request_mem_region and devm_ioremap calls were replaced by
devm_request_and_ioremap() call.
  * All devm_* related modifications (earlier patches 2-5) were merged
to a single patch.


Tushar Behera (4):
  i2c: s3c2410: Remove unnecessary label err_noclk
  i2c: s3c2410: Convert to use devm_* APIs
  i2c: s3c2410: Move location of clk_prepare_enable() call in probe
    function
  i2c: s3c2410: Remove err_cpufreq label

 drivers/i2c/busses/i2c-s3c2410.c |   59 +++++++++++++------------------------
 1 files changed, 21 insertions(+), 38 deletions(-)

-- 
1.7.4.1
