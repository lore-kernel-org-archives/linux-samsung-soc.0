Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A345C6FD1D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Mar 2023 16:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjCUQnD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Mar 2023 12:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjCUQm5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 12:42:57 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485A351CBA
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Mar 2023 09:42:41 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id c19so18594991qtn.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Mar 2023 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1679416960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb42vCh7RpIAPrMfKGolIi8asoewLYT0tnuNjcsvrzg=;
        b=g3RnPwpbIZKVEn2/ilr3S+1yKBuJWUoIWO3dgCVMG0ODqFGiK9otW2HxIXizx2U+Sx
         F804yICSfPs7TXlf1FnORwMjHI+mj0Rq8bHM/FqzhSZ6VsQb/GpHStaDtMoli+HQOVN9
         v/VPO1mFF2P5SgYrmgdIV2hYXN/WVxMeFBnxc52/UR0wdhBayKFsT67WaZ/cGFnmFjg7
         VT6OtJGYjl6RFVHVqDc9vxX3XdPhcFiB8QBTjV5TebBNv214GTgYBdXb/n1K9+YhkQ8l
         w332m7cs7Za3nFHDbDBJbTBkXJ0N7Ofgz+Kehpu0xD/vpNYEwNmU1l3iWtaIV4UjsKIx
         FgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679416960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rb42vCh7RpIAPrMfKGolIi8asoewLYT0tnuNjcsvrzg=;
        b=vc+ecYx/BirMu86nVC+qElvwMKMqD2T4df3UrGaED7PcBQNHRmipnqt2LoHQ02GvDf
         YKsE6Z5DUueqccgVssE1F+qctaSMivToA7SwndkjsxhI955Ja42CnvpAeLlvMe7AvMhE
         +ppYjWyR1ppVt+qWpq2TsGB0iVr/DEBLvfBge4I5oT25D948GTyKcWejWfEXTRArxcaQ
         FfWv+QTgxQQVPBkSPkCiyJmSu1WkdcBmwsNKy8YPrtU3y1Ajiauaf4XQPZvO9U+/Dyhl
         uYUilq4UVNhWYRCBLz0uAr+zhfdJVi7TV1t1PScwGPDGDmMCqJZRgEiHMSWGCW4yh4aU
         uPnQ==
X-Gm-Message-State: AO0yUKUexrXw7zTrC5YubydrP46BaVNJ0CEDqsgFPAtst6FVIJdSAZMZ
        bL4HR5KqrYkwnjUQZ3vFRoK4AQ==
X-Google-Smtp-Source: AK7set8crOJa5IWGeCPL3+bnh8XKxjSxESKf5g4hwK4Y2fX+O5FJMxMjux8dju0EAE6auovMbajQog==
X-Received: by 2002:ac8:5e07:0:b0:3bf:be4b:808c with SMTP id h7-20020ac85e07000000b003bfbe4b808cmr603255qtx.55.1679416960376;
        Tue, 21 Mar 2023 09:42:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id s127-20020a37a985000000b007469b5bc2c4sm1795267qke.13.2023.03.21.09.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 09:42:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1pef4J-000YCG-Ao;
        Tue, 21 Mar 2023 13:42:39 -0300
Date:   Tue, 21 Mar 2023 13:42:39 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2] iommu/exynos: Fix set_platform_dma_ops() callback
Message-ID: <ZBnef7g7GCxogPNz@ziepe.ca>
References: <CGME20230315232523eucas1p2565ef5954e3b5b451803c6200c8bce32@eucas1p2.samsung.com>
 <20230315232514.1046589-1-m.szyprowski@samsung.com>
 <ZBnCD7Xc9WCM55ub@ziepe.ca>
 <da174ce4-b922-21d0-62da-b69798a51371@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da174ce4-b922-21d0-62da-b69798a51371@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Mar 21, 2023 at 04:43:42PM +0100, Marek Szyprowski wrote:
> 
> On 21.03.2023 15:41, Jason Gunthorpe wrote:
> > On Thu, Mar 16, 2023 at 12:25:14AM +0100, Marek Szyprowski wrote:
> >> There are some subtle differences between release_device() and
> >> set_platform_dma_ops() callbacks, so separate those two callbacks. Device
> >> links should be removed only in release_device(), because they were
> >> created in probe_device() on purpose and they are needed for proper
> >> Exynos IOMMU driver operation. While fixing this, remove the conditional
> >> code as it is not really needed.
> >>
> >> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
> >> Fixes: 189d496b48b1 ("iommu/exynos: Add missing set_platform_dma_ops callback")
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >> v2:
> >> - keep set_platform_dma_ops only on ARM 32bit
> >>
> >> Some more background why set_platform_dma_ops is needed on ARM 32bit is
> >> available here:
> >> https://lore.kernel.org/all/9a12fcac-c347-5d81-acef-1124c50d0c37@arm.com/
> >> ---
> >>   drivers/iommu/exynos-iommu.c | 17 ++++++++++-------
> >>   1 file changed, 10 insertions(+), 7 deletions(-)
> > It seems OK, but do you know what state the device is left in after
> > exynos_iommu_detach_device ? Ie is it blocking or identity?
> 
> identity

Can you do this cleanup like this instead?

Jason

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 483aaaeb6daeac..2c2b5cba191459 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -24,6 +24,7 @@
 
 typedef u32 sysmmu_iova_t;
 typedef u32 sysmmu_pte_t;
+static struct iommu_domain exynos_identity_domain;
 
 /* We do not consider super section mapping (16MB) */
 #define SECT_ORDER 20
@@ -900,6 +901,9 @@ static struct iommu_domain *exynos_iommu_domain_alloc(unsigned type)
 	dma_addr_t handle;
 	int i;
 
+	if (type == IOMMU_DOMAIN_IDENTITY)
+		return &exynos_identity_domain;
+
 	/* Check if correct PTE offsets are initialized */
 	BUG_ON(PG_ENT_SHIFT < 0 || !dma_dev);
 
@@ -988,17 +992,22 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
 	kfree(domain);
 }
 
-static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
-				    struct device *dev)
+static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
-	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
-	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
+	struct exynos_iommu_domain *domain;
+	phys_addr_t pagetable;
 	struct sysmmu_drvdata *data, *next;
 	unsigned long flags;
 
-	if (!has_sysmmu(dev) || owner->domain != iommu_domain)
-		return;
+	if (!owner)
+		return -ENODEV;
+	if (owner->domain == identity_domain)
+		return 0;
+
+	domain = to_exynos_domain(owner->domain);
+	pagetable = virt_to_phys(domain->pgtable);
 
 	mutex_lock(&owner->rpm_lock);
 
@@ -1017,15 +1026,32 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
 		list_del_init(&data->domain_node);
 		spin_unlock(&data->lock);
 	}
-	owner->domain = NULL;
+	owner->domain = identity_domain;
 	spin_unlock_irqrestore(&domain->lock, flags);
 
 	mutex_unlock(&owner->rpm_lock);
 
 	dev_dbg(dev, "%s: Detached IOMMU with pgtable %pa\n", __func__,
 		&pagetable);
+	return 0;
 }
 
+static struct iommu_domain_ops exynos_identity_ops = {
+	.attach_dev = exynos_iommu_identity_attach,
+};
+
+static struct iommu_domain exynos_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &exynos_identity_ops,
+};
+
+#ifdef CONFIG_ARM
+static void exynos_iommu_set_platform_dma(struct device *dev)
+{
+	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
+}
+#endif
+
 static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 				   struct device *dev)
 {
@@ -1034,12 +1060,11 @@ static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 	struct sysmmu_drvdata *data;
 	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
 	unsigned long flags;
+	int err;
 
-	if (!has_sysmmu(dev))
-		return -ENODEV;
-
-	if (owner->domain)
-		exynos_iommu_detach_device(owner->domain, dev);
+	err = exynos_iommu_identity_attach(&exynos_identity_domain, dev);
+	if (err)
+		return err;
 
 	mutex_lock(&owner->rpm_lock);
 
@@ -1420,18 +1445,7 @@ static void exynos_iommu_release_device(struct device *dev)
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
-	if (owner->domain) {
-		struct iommu_group *group = iommu_group_get(dev);
-
-		if (group) {
-#ifndef CONFIG_ARM
-			WARN_ON(owner->domain !=
-				iommu_group_default_domain(group));
-#endif
-			exynos_iommu_detach_device(owner->domain, dev);
-			iommu_group_put(group);
-		}
-	}
+	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
 
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
@@ -1462,6 +1476,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 		INIT_LIST_HEAD(&owner->controllers);
 		mutex_init(&owner->rpm_lock);
+		owner->domain = &exynos_identity_domain;
 		dev_iommu_priv_set(dev, owner);
 	}
 
@@ -1479,7 +1494,7 @@ static const struct iommu_ops exynos_iommu_ops = {
 	.domain_alloc = exynos_iommu_domain_alloc,
 	.device_group = generic_device_group,
 #ifdef CONFIG_ARM
-	.set_platform_dma_ops = exynos_iommu_release_device,
+	.set_platform_dma_ops = exynos_iommu_set_platform_dma,
 #endif
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
