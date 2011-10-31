From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 2/2] mmc: sdhci-s3c: add platform data for the second capability
Date: Mon, 31 Oct 2011 14:58:14 +0900
Message-ID: <4EAE38F6.7070103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47826 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753140Ab1JaF6R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Oct 2011 01:58:17 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc <linux-mmc@vger.kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Kyungmin Park <kyungmin.park@samsung.com>, 'kgene kim' <kgene.kim@samsung.com>

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mmc/host/sdhci-s3c.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 3d00e72..95e3a2a 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -543,6 +543,8 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	/* It supports additional host capabilities if needed */
 	if (pdata->host_caps)
 		host->mmc->caps |= pdata->host_caps;
+	if (pdata->host_caps2)
+		host->mmc->caps2 |= pdata->host_caps2;
 
 	ret = sdhci_add_host(host);
 	if (ret) {
