Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15A1849;
	Tue, 20 Aug 2024 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724136370; cv=none; b=IhZNY2HRtIrplztU11phZdWnLpfZaoCZsJuUsPGP5uXVoNcMk14SZ0fD987l7Go5L2RSmxnZRLIuUGSxKNtsunmMzdHpz0Z8Le4GCXgq8sU1EENlW9VFId63C1hvZr36mRUKqkR6YG7jDFY2yESV/qzR7PKwR6IR74RcArDsxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724136370; c=relaxed/simple;
	bh=hlhdFi5V1f0wXOwX08iasKeQHCJ0GHrGJirf5kJpTfM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c1+Mc02qRqWOi1jFLTUv8PLQuMOpr/eqdr+7z3TICAu4DNLFV1jyhn5ul5M8hqPlaTsIR48J07Pa8gtH7JlpsrBULacmB3mhF1e2D3OhzFrr9EtJ0u9+tSU6vWPUzwqmqd78PS2dyxg75K0V/uVPPandWl5LmZssonA9aJcQbao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wp0LD0b31zfbdL;
	Tue, 20 Aug 2024 14:44:04 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 1084F180105;
	Tue, 20 Aug 2024 14:46:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 14:46:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<krzk@kernel.org>, <alim.akhtar@samsung.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH -next] usb: xhci: Simplify with scoped for each OF child loop
Date: Tue, 20 Aug 2024 14:53:03 +0800
Message-ID: <20240820065303.560125-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/usb/host/ehci-exynos.c | 9 ++-------
 drivers/usb/host/ohci-exynos.c | 9 ++-------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index f40bc2a7a124..e3a961d3f5fc 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -48,7 +48,6 @@ struct exynos_ehci_hcd {
 static int exynos_ehci_get_phy(struct device *dev,
 				struct exynos_ehci_hcd *exynos_ehci)
 {
-	struct device_node *child;
 	struct phy *phy;
 	int phy_number, num_phys;
 	int ret;
@@ -66,26 +65,22 @@ static int exynos_ehci_get_phy(struct device *dev,
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
 		exynos_ehci->phy[phy_number] = phy;
-		if (IS_ERR(phy)) {
-			of_node_put(child);
+		if (IS_ERR(phy))
 			return PTR_ERR(phy);
-		}
 	}
 
 	exynos_ehci->legacy_phy = true;
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

