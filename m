From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 0/4] i2c: s3c2410: Add devm_* apis and cleanup
Date: Fri, 23 Nov 2012 14:11:51 +0530
Message-ID: <1353660115-9710-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:46845 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755471Ab2KWIsP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 03:48:15 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so3399912pad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Nov 2012 00:48:15 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, kgene.kim@samsung.com, patches@linaro.org

This patchset cleans up the probe function of i2c-s3c2410 driver.
These have been tested on Exynos4210 based Origen board.

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

 drivers/i2c/busses/i2c-s3c2410.c |   83 ++++++++++---------------------------
 1 files changed, 23 insertions(+), 60 deletions(-)

-- 
1.7.4.1
