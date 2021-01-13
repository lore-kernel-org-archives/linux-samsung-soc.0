Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7800C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Jan 2021 11:04:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EC0D229CA
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Jan 2021 11:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbhAMLEN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Jan 2021 06:04:13 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53352 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbhAMLEN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:04:13 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210113110330euoutp0217fb639ba71aa241e63a4de7097a9927~Zxcl38mgw2654626546euoutp02O
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jan 2021 11:03:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210113110330euoutp0217fb639ba71aa241e63a4de7097a9927~Zxcl38mgw2654626546euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610535810;
        bh=Uo6jrO8DBDSkS3Y0Ve8teV9q8aaM7a3EWBz7zktp2eY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=cpt/4B9wLSghNC19JSSdirFIdsKktDt3QvU/E1D81P/Z2JW7OFj0a2cyoLEjOiFXz
         ZAdUZGI0ynxZqLRN7B92AMdarJwwR1dsZDlWMqxxRGpRtTu1ue6RFIUYTno0KqqORr
         wJgdkcWekk/MdPbhYu0HZGCz0eivNU6D3yhF5D+A=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210113110330eucas1p2cf371210a27cf68b5ead04f9cac94fcb~Zxcld-fOL2206022060eucas1p25;
        Wed, 13 Jan 2021 11:03:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 66.B1.27958.283DEFF5; Wed, 13
        Jan 2021 11:03:30 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452~ZxclF4f_x2717427174eucas1p1Q;
        Wed, 13 Jan 2021 11:03:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210113110330eusmtrp14e815edc48ef62f1aa21f856e7d4c631~ZxclFKheU1279812798eusmtrp10;
        Wed, 13 Jan 2021 11:03:30 +0000 (GMT)
X-AuditID: cbfec7f2-efdff70000006d36-f2-5ffed382ad61
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AA.C5.16282.183DEFF5; Wed, 13
        Jan 2021 11:03:29 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210113110329eusmtip2d220e279a5de6b96d4b58a92bce2ab9a~Zxckp4Go22757327573eusmtip2Q;
        Wed, 13 Jan 2021 11:03:29 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org,
        "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH] soc: samsung: pm_domains: Convert to regular platform
 driver
Date:   Wed, 13 Jan 2021 12:03:20 +0100
Message-Id: <20210113110320.13149-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7djP87pNl//FG5w9JGKxccZ6Vovz5zew
        W1zeNYfNYsb5fUwWa4/cZbeY+2Uqs0XXob9sDuweCzaVemxa1cnm0bdlFaPH501yASxRXDYp
        qTmZZalF+nYJXBlzHh9hLDioV3FrQjt7A+M6tS5GTg4JAROJy0svsXQxcnEICaxglNi3YS8r
        hPOFUeLq8V1sEM5nRonWay8Yuxg5wFp27DEC6RYSWM4o8XGGAlzDyhnr2UESbAKGEl1vu9hA
        bBEBVYnPbQvYQYqYBZqYJC5eXgJWJCzgL7Hz8RmwIhagojOP17CC2LwCthKnb6xlhrhPXmL1
        hgPMIM0SAj/ZJVY/XsEEkXCRuPVhMRuELSzx6vgWdghbRuL05B4WiIZmRomH59ayQzg9jBKX
        m2YwQlRZS9w594sN5B9mAU2J9bv0IcKOEqevr2eCeJNP4sZbQZAwM5A5adt0Zogwr0RHmxBE
        tZrErOPr4NYevHAJ6mYPiYcdc9kgIRQrMfFjD9MERrlZCLsWMDKuYhRPLS3OTU8tNsxLLdcr
        TswtLs1L10vOz93ECEwAp/8d/7SDce6rj3qHGJk4GA8xSnAwK4nwFnX/jRfiTUmsrEotyo8v
        Ks1JLT7EKM3BoiTOu2r2mnghgfTEktTs1NSC1CKYLBMHp1QDU0JEzzK1VzmeN6/+XTP/SeaP
        7zMannDf/3tHJ/3IGrFd5vanrhW78gTJXvpU85PXvqlvksjJUs+AkxmKdspR4Z8Kdjd5Gkep
        Mh688XjSDf5rjXMf/zCuur38DHu15V8phbP3Jmh/FCzJ3MZRufDHkey8feKBCTITeTx+/5BT
        1/mTaTH9c32iRS+b/7w38guXac+fJlSSOlf9V6CNpN0MiU/Pz2rnlz1uWhXf8Nq87bHl+YXH
        reP4T9vG2D3a9ei25A7bFMuCmuRfsy5Wvv7v7LzlEc8dYbfrV7qOCrpkbTqcIppdOrP6xJ+C
        a40vqzWKZvLsUitNaptV/DNoonNh4KklkgLdj0qu7zCcoFgSosRSnJFoqMVcVJwIADi8p8Vv
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsVy+t/xe7qNl//FG1zZZ2axccZ6Vovz5zew
        W1zeNYfNYsb5fUwWa4/cZbeY+2Uqs0XXob9sDuweCzaVemxa1cnm0bdlFaPH501yASxRejZF
        +aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlzHh9hLDio
        V3FrQjt7A+M6tS5GDg4JAROJHXuMuhi5OIQEljJK/Fz7lL2LkRMoLiNxcloDK4QtLPHnWhcb
        RNEnRokHR4+AJdgEDCW63oIkODlEBFQlPrctYAcpYhZoY5JYdWs2WEJYwFfixu27YDYLUNGZ
        x2vAmnkFbCVO31jLDLFBXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAgM
        vG3Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeIu6/8YL8aYkVlalFuXHF5XmpBYfYjQF2jeRWUo0
        OR8Y+nkl8YZmBqaGJmaWBqaWZsZK4rwmR9bECwmkJ5akZqemFqQWwfQxcXBKNTB19Kj82XFl
        buzi5qBjVXN2zxG1idDIC9k2OahD4/1a46oHOoUrmSclO8z53n5/6YbWxnlSz7RWb4iwe1h8
        78BThfh7FuddahbJ59tP4JmUyN0zOXGu6M6NRsdnqdydmSaQOHvVxYufcz7tO7tl451tv6Nf
        eN5z8P+up//0x+vNJ67GHY7MDt/kf0/MW1SGSeKY7U8GDq8gTQvnuzl+9279aPZRC9T+16Du
        zP2rcbbl5eWr/E7xHuF7K7/39/YPV1S1Nl62+Xm6epfE/dL0hHM+G0M/fTM+uW/prPuMO9PC
        vXTvrLp0ca7Eu3QH1bSs2C2vF7PqvdzLcWuCu7fKuXfNxw7mHT91awb3m4B2Yd0ZoUosxRmJ
        hlrMRcWJANBbuNTFAgAA
X-CMS-MailID: 20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452
References: <CGME20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When Exynos power domain driver was introduced, the only way to ensure
that power domains will be instantiated before the devices which belongs
to them was to initialize them early enough, before the devices are
instantiated in the system. This in turn required not to use any platform
device infrastructure at all, as there have been no way to ensure proper
probe order between devices.

This has been finally changed and patch e590474768f1 ("driver core: Set
fw_devlink=on by default") ensures that each device will be probbed only
when its resource providers are ready. This allows to convert Exynos
power domain driver to regular platform driver.

This is also required by the mentioned commit to enable probing any
device which belongs to the Exynos power domains, as otherwise the core
won't notice that the power domains are in fact available.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Some more comments are in the following thread:
https://lore.kernel.org/lkml/2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com/
---
 drivers/soc/samsung/pm_domains.c | 97 ++++++++++++++++----------------
 1 file changed, 48 insertions(+), 49 deletions(-)

diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index ab8582971bfc..5ec0c13f0aaf 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -16,7 +16,7 @@
 #include <linux/delay.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-#include <linux/sched.h>
+#include <linux/pm_runtime.h>
 
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
@@ -73,15 +73,15 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
 	return exynos_pd_power(domain, false);
 }
 
-static const struct exynos_pm_domain_config exynos4210_cfg __initconst = {
+static const struct exynos_pm_domain_config exynos4210_cfg = {
 	.local_pwr_cfg		= 0x7,
 };
 
-static const struct exynos_pm_domain_config exynos5433_cfg __initconst = {
+static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.local_pwr_cfg		= 0xf,
 };
 
-static const struct of_device_id exynos_pm_domain_of_match[] __initconst = {
+static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{
 		.compatible = "samsung,exynos4210-pd",
 		.data = &exynos4210_cfg,
@@ -92,7 +92,7 @@ static const struct of_device_id exynos_pm_domain_of_match[] __initconst = {
 	{ },
 };
 
-static __init const char *exynos_get_domain_name(struct device_node *node)
+static const char *exynos_get_domain_name(struct device_node *node)
 {
 	const char *name;
 
@@ -101,60 +101,44 @@ static __init const char *exynos_get_domain_name(struct device_node *node)
 	return kstrdup_const(name, GFP_KERNEL);
 }
 
-static __init int exynos4_pm_init_power_domain(void)
+static int exynos_pd_probe(struct platform_device *pdev)
 {
-	struct device_node *np;
-	const struct of_device_id *match;
-
-	for_each_matching_node_and_match(np, exynos_pm_domain_of_match, &match) {
-		const struct exynos_pm_domain_config *pm_domain_cfg;
-		struct exynos_pm_domain *pd;
-		int on;
+	const struct exynos_pm_domain_config *pm_domain_cfg;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args child, parent;
+	struct exynos_pm_domain *pd;
+	int on, ret;
 
-		pm_domain_cfg = match->data;
+	pm_domain_cfg = of_device_get_match_data(dev);
+	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
 
-		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
-		if (!pd) {
-			of_node_put(np);
-			return -ENOMEM;
-		}
-		pd->pd.name = exynos_get_domain_name(np);
-		if (!pd->pd.name) {
-			kfree(pd);
-			of_node_put(np);
-			return -ENOMEM;
-		}
+	pd->pd.name = exynos_get_domain_name(np);
+	if (!pd->pd.name)
+		return -ENOMEM;
 
-		pd->base = of_iomap(np, 0);
-		if (!pd->base) {
-			pr_warn("%s: failed to map memory\n", __func__);
-			kfree_const(pd->pd.name);
-			kfree(pd);
-			continue;
-		}
-
-		pd->pd.power_off = exynos_pd_power_off;
-		pd->pd.power_on = exynos_pd_power_on;
-		pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->base = of_iomap(np, 0);
+	if (!pd->base) {
+		kfree_const(pd->pd.name);
+		return -ENODEV;
+	}
 
-		on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
+	pd->pd.power_off = exynos_pd_power_off;
+	pd->pd.power_on = exynos_pd_power_on;
+	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
 
-		pm_genpd_init(&pd->pd, NULL, !on);
-		of_genpd_add_provider_simple(np, &pd->pd);
-	}
+	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
 
-	/* Assign the child power domains to their parents */
-	for_each_matching_node(np, exynos_pm_domain_of_match) {
-		struct of_phandle_args child, parent;
+	pm_genpd_init(&pd->pd, NULL, !on);
+	ret = of_genpd_add_provider_simple(np, &pd->pd);
 
+	if (ret == 0 && of_parse_phandle_with_args(np, "power-domains",
+				      "#power-domain-cells", 0, &parent) == 0) {
 		child.np = np;
 		child.args_count = 0;
 
-		if (of_parse_phandle_with_args(np, "power-domains",
-					       "#power-domain-cells", 0,
-					       &parent) != 0)
-			continue;
-
 		if (of_genpd_add_subdomain(&parent, &child))
 			pr_warn("%pOF failed to add subdomain: %pOF\n",
 				parent.np, child.np);
@@ -163,6 +147,21 @@ static __init int exynos4_pm_init_power_domain(void)
 				parent.np, child.np);
 	}
 
-	return 0;
+	pm_runtime_enable(dev);
+	return ret;
+}
+
+static struct platform_driver exynos_pd_driver = {
+	.probe	= exynos_pd_probe,
+	.driver	= {
+		.name		= "exynos-pd",
+		.of_match_table	= exynos_pm_domain_of_match,
+		.suppress_bind_attrs = true,
+	}
+};
+
+static __init int exynos4_pm_init_power_domain(void)
+{
+	return platform_driver_register(&exynos_pd_driver);
 }
 core_initcall(exynos4_pm_init_power_domain);
-- 
2.17.1

