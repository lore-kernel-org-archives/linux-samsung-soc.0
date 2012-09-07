From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH 0/2] DMA: PL330: Clock and runtime cleanup
Date: Fri,  7 Sep 2012 12:14:46 +0530
Message-ID: <1347000288-20441-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:60206 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754397Ab2IGGou (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 02:44:50 -0400
Received: by pbbrr13 with SMTP id rr13so3590536pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Sep 2012 23:44:49 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, boojin.kim@samsung.com, jassisinghbrar@gmail.com, Inderpal Singh <inderpal.singh@linaro.org>

The controller clock is being managed at AMBA bus level probe/remove and
pm_runtime/suspend functions. The existing driver does the clock enable/disable
again in the same code paths, which unneccessarily increments the usage count of
the clock for the same device. 

The following patches remove the redundant clock enable/disable from the driver.

Inderpal Singh (2):
  DMA: PL330: Remove controller clock enable/disable
  DMA: PL330: Remove redundant runtime_suspend/resume functions

 drivers/dma/pl330.c |   73 ++++-----------------------------------------------
 1 file changed, 5 insertions(+), 68 deletions(-)

-- 
1.7.9.5
