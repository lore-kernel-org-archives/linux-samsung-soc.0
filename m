Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909B157E98
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 17:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623601; cv=none; b=SCYmaO3MzoOznHCLSfAdkM9kjC9r3v7H/Sy/bEC7N/EmK5j5ALhqPGQKN9kKwfVAUk0ojQjkOtKCWRMZLZ1d3UoCgfw7EqIVhW4EfMTGfDIDyziY8PobwuIAq71tT+1LV+VwWrFjgXe0K5UWlbt/g7oiMBqCCwZWscJr4Ygm0l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623601; c=relaxed/simple;
	bh=E19FlXPLCClmGxfE1jT8maBicxS4I8yL0jj4j6R5o34=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKLOwlBmTGF1QujKl87Y9PO7qEpBj7lOSzksVQJmAe/onpv4wvZHyIQZSEQMQEZzZ7F+iJMz2wrtpumhhks7tGAxVT+hYO4K8FT4LW8w8VyMgQv+6Dwf0fNLlJd4rXJsBXljHYOp6zLL+MG8rVVKbUXHyxze9bKCwWS97ddd0fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=YxIKI/u/; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="YxIKI/u/"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-42e28e0e879so10647851cf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708623592; x=1709228392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VAat8TBDVTapf/cNKrpWJJOpQ7pgkQwxbfklHwcriQ=;
        b=YxIKI/u/FnNY2yGsO7x8rd7KzMAAB7rzLOGhhUWKY2sgrtuMfakKrbP3Kz+sAxSYyM
         WTBXOsf39VIyMTbtyXpEjPBR+DhY+gNDYRHK/T4K3UEyp3gYneoZEhUDKuW5hH4a6/Wn
         NeIAR00QT2+9rQZ5AXPhdHZW2TvK+zS7sK385Of4+oVLnjFO6my8L2cOLZZgco+UHcTS
         1e2EijFry3OAIpizHEJSvvYG3hEyd/QxJlgChonQJfvNS9356fs7H+D2HvxWRtIRp1lh
         tGgGaHPceE60ya4ueEzDTTfxHKCdZ0cbYiPtPtk22tRxzv/o84Qc2OCUiyklEUmqaLc/
         mpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708623592; x=1709228392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VAat8TBDVTapf/cNKrpWJJOpQ7pgkQwxbfklHwcriQ=;
        b=HjrNvWotZUCbokVrgnBW7ajFUkJzQHvURnidkN2+yy30ssC6h6US7lb4WEyjHDmnow
         2LkwMeBCVCew0uT8Sz+nl9s7QGIPJmPJT4wcvPvXjEBwARCeMQ60mY3dvTeqouqEKZNk
         1PhrdX9tCNBGpuwU/Osttnt9/BVIubUMxe2e1YYpLbNA52qoTiZNW6bIK0Ix1EzMlysX
         +s92+WNLScKGZkPIEeyeVh12DXi+b/HNQJL4QsbAo+z7mzPU6jgJNP02ktq6Kgn7m88d
         TPk0U7tBMD1sJjp8biLaKNN+avrFhCTZJAfP6KLg7/Y2/sifBjcdfOXxnn1h/iKRZSCa
         NM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPuVKz27afuypjG0N99Rzfy1kRoMyxtTLGtFJcmrM3BWgClju1bus/jhZpGBFPjVfFUg/OQIKKRhHSs8a1Dit3IWfpJmmjsCRldhxTopq5QL0=
X-Gm-Message-State: AOJu0Yzmb7lTDjbOo1zYomaezu9pd1ksjzNnJ5aGhRvLc7byeni/9p/T
	ko5xq8dCljnqXlQtUCWXm/FlooelsBuAcrMDW+CfVDCRz7DBaPMyDBt2ZT3stUw=
X-Google-Smtp-Source: AGHT+IHz4D/tAkiJUKSEKYTo9KdtwALGRXWZMTTOk9WSdUZLPjcPPGovrQbnMAx6QcYLnGz/9iyYUQ==
X-Received: by 2002:ac8:5f4c:0:b0:42c:7b12:70eb with SMTP id y12-20020ac85f4c000000b0042c7b1270ebmr25812453qta.3.1708623592225;
        Thu, 22 Feb 2024 09:39:52 -0800 (PST)
Received: from soleen.c.googlers.com.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id f17-20020ac86ed1000000b0042e5ab6f24fsm259682qtv.7.2024.02.22.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:39:51 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com,
	rientjes@google.com,
	bagasdotme@gmail.com,
	mkoutny@suse.com
Subject: [PATCH v5 07/11] iommu/rockchip: use page allocation function provided by iommu-pages.h
Date: Thu, 22 Feb 2024 17:39:33 +0000
Message-ID: <20240222173942.1481394-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/rockchip-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/rockchip-iommu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 2685861c0a12..e04f22d481d0 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -26,6 +26,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#include "iommu-pages.h"
+
 /** MMU register offsets */
 #define RK_MMU_DTE_ADDR		0x00	/* Directory table address */
 #define RK_MMU_STATUS		0x04
@@ -727,14 +729,14 @@ static u32 *rk_dte_get_page_table(struct rk_iommu_domain *rk_domain,
 	if (rk_dte_is_pt_valid(dte))
 		goto done;
 
-	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | rk_ops->gfp_flags);
+	page_table = iommu_alloc_page(GFP_ATOMIC | rk_ops->gfp_flags);
 	if (!page_table)
 		return ERR_PTR(-ENOMEM);
 
 	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
 	if (dma_mapping_error(dma_dev, pt_dma)) {
 		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
-		free_page((unsigned long)page_table);
+		iommu_free_page(page_table);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -1061,7 +1063,7 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
 	 * Allocate one 4 KiB page for each table.
 	 */
-	rk_domain->dt = (u32 *)get_zeroed_page(GFP_KERNEL | rk_ops->gfp_flags);
+	rk_domain->dt = iommu_alloc_page(GFP_KERNEL | rk_ops->gfp_flags);
 	if (!rk_domain->dt)
 		goto err_free_domain;
 
@@ -1083,7 +1085,7 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	return &rk_domain->domain;
 
 err_free_dt:
-	free_page((unsigned long)rk_domain->dt);
+	iommu_free_page(rk_domain->dt);
 err_free_domain:
 	kfree(rk_domain);
 
@@ -1104,13 +1106,13 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 			u32 *page_table = phys_to_virt(pt_phys);
 			dma_unmap_single(dma_dev, pt_phys,
 					 SPAGE_SIZE, DMA_TO_DEVICE);
-			free_page((unsigned long)page_table);
+			iommu_free_page(page_table);
 		}
 	}
 
 	dma_unmap_single(dma_dev, rk_domain->dt_dma,
 			 SPAGE_SIZE, DMA_TO_DEVICE);
-	free_page((unsigned long)rk_domain->dt);
+	iommu_free_page(rk_domain->dt);
 
 	kfree(rk_domain);
 }
-- 
2.44.0.rc0.258.g7320e95886-goog

