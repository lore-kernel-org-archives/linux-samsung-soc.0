From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/7] i2c: s3c2410: Add devm_* apis and cleanup
Date: Fri, 23 Nov 2012 11:29:06 +0530
Message-ID: <1353650353-17576-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48008 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752597Ab2KWGFc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 01:05:32 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so6301943pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Nov 2012 22:05:32 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, kgene.kim@samsung.com, patches@linaro.org

This patchset cleans up the probe function of i2c-s3c2410 driver.
These have been tested on Exynos4210 based Origen board.

Tushar Behera (7):
  i2c: s3c2410: Remove unnecessary label err_noclk
  i2c: s3c2410: Convert to use devm_clk_get()
  i2c: s3c2410: Convert to use devm_request_mem_region()
  i2c: s3c2410: Convert to use devm_ioremap()
  i2c: s3c2410: Convert to use devm_request_irq()
  i2c: s3c2410: Move location of clk_prepare_enable() call in probe
    function
  i2c: s3c2410: Remove err_cpufreq label

 drivers/i2c/busses/i2c-s3c2410.c |   74 ++++++++++++--------------------------
 1 files changed, 23 insertions(+), 51 deletions(-)

-- 
1.7.4.1
