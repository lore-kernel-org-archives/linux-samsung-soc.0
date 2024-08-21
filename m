Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A591A2840;
	Wed, 21 Aug 2024 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224231; cv=none; b=K/pVKMNb3q867CtFCMcUixmo77OzsCaUiVZ6ioFfXvOCqOGA4pBbOMBZQTErrtghDLhOJZUL4ugxUwoo82FdlBcqSJrDEVhm5NTXhSVArfb6lV7fw/boEbHhQ92QTdlPevG+NFjU1TQvaMSZF88G5TWWxcTWMgrCL41jsj/pXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224231; c=relaxed/simple;
	bh=cb2jBBQr+hQBucll/2Ogw0WC3vLVQWyTkSUrMv80Twg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YcbjC8vkt58Y82VHZbWK3WILZkEjk8WFdoL+ilgTrXu1/pTL/nEOxgVoTD3VLjL6D1Jsv6ohRkLO/GCd6TVDmV/cq4Ye3D5y54/0PbrVKdR8H5z84sD+k9DnsDDBiHJ9RjVxOs5wZAWROcq3qwXB8eXePp43MCeVGeiEQ00GsoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WpcpS45Q9z1HGvX;
	Wed, 21 Aug 2024 15:07:12 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 73CD71400C9;
	Wed, 21 Aug 2024 15:10:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 21 Aug
 2024 15:10:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<krzk@kernel.org>, <alim.akhtar@samsung.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2] usb: ohci-exynos: Simplify with scoped for each OF child loop
Date: Wed, 21 Aug 2024 15:17:52 +0800
Message-ID: <20240821071752.2335406-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2:
- Update the commit subject.
- Spilit into 2 patches.
- Add Reviewed-by.
---
 drivers/usb/host/ohci-exynos.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index bfa2eba4e3a7..1379e03644b2 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -37,7 +37,6 @@ struct exynos_ohci_hcd {
 static int exynos_ohci_get_phy(struct device *dev,
 				struct exynos_ohci_hcd *exynos_ohci)
 {
-	struct device_node *child;
 	struct phy *phy;
 	int phy_number, num_phys;
 	int ret;
@@ -55,26 +54,22 @@ static int exynos_ohci_get_phy(struct device *dev,
 		return 0;
 
 	/* Get PHYs using legacy bindings */
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &phy_number);
 		if (ret) {
 			dev_err(dev, "Failed to parse device tree\n");
-			of_node_put(child);
 			return ret;
 		}
 
 		if (phy_number >= PHY_NUMBER) {
 			dev_err(dev, "Invalid number of PHYs\n");
-			of_node_put(child);
 			return -EINVAL;
 		}
 
 		phy = devm_of_phy_optional_get(dev, child, NULL);
 		exynos_ohci->phy[phy_number] = phy;
-		if (IS_ERR(phy)) {
-			of_node_put(child);
+		if (IS_ERR(phy))
 			return PTR_ERR(phy);
-		}
 	}
 
 	exynos_ohci->legacy_phy = true;
-- 
2.34.1

