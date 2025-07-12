Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC5721883C;
	Sat, 12 Jul 2025 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752321003; cv=none; b=SKN8a9HvxfzrdKMVhuW3FKgWggRBnqc/kC6V7VRM/4t4432/WZwJBKuaRV5SI3scktA21L8K+HM9kNxkoLD3EkDjVp1pMefqgU+zHqkXQSZ87U5XZJ5HZXSXwT/TJp5h2PQ4xsSiDTgxEiSADGnKPhRIUohaPd6m4lfdhokpph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752321003; c=relaxed/simple;
	bh=S+tYkmbasYOAVw0o6YkfoWz4FtmHaFsF4csZGWOvnmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZrDiDm25LqY8v0V2fLhQ41qy6OK/ondyUyUfgMKCIvU5levNCfVhkXZtUkWJ3xQxQYVY4lDw23ABdUY3nT6cyX1sgEyC3lobypz6OlWru/QZ24YxuVcgfyWJce1k4waVi/txV3zO/URHgJuupv8YAs+5mWrsynQNsqSGynOzRXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IAslfoZL; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IAslfoZL"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3C1D825D28;
	Sat, 12 Jul 2025 13:49:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdEQUmxa2Ljx; Sat, 12 Jul 2025 13:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752320997; bh=S+tYkmbasYOAVw0o6YkfoWz4FtmHaFsF4csZGWOvnmk=;
	h=From:Date:Subject:To:Cc;
	b=IAslfoZLT3WCtll3Oqe0CeZ14PDMLkGO+Mkzk+z9CLeJ9LNnX9w8mT+z/85MxOvya
	 F0fBcPK6ZCCyHEZHD+skxRk0J3rrJyWj3NuBbHYp7s7OnT4IGbdq6BC3huxAGyD+Mq
	 piYjNY+QfL6zgFBqY5zMvTBrfLXFMfWLRiSBjmhvzRM+mou1OhgdJ+8zLlDoCspGt3
	 ZRWCSNaQUAOJuJvR7L8vmPAOJMUFuD4NJVzDamzwMLVHJV/7VINa624PryIQoq2djV
	 6BVztx3RX2wPI5X/RJjmxaOkjNUMRCg3AEYo+viyXjckO5MMf9VZ18m2e4Nsn653i+
	 bARP1Jm/ZwsBA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 12 Jul 2025 17:19:30 +0530
Subject: [PATCH] iommu/exynos: add support for reserved regions
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org>
X-B4-Tracking: v=1; b=H4sIAMlLcmgC/x2MMQqAMAwAvyKZDWjAUv2KOIiNNYNVGhRF/LvB5
 eCGuweUs7BCVzyQ+RSVLZnUZQHTMqbIKMEcqKKmctQiX3faFPXWdT0ws56GaJWic/VM3reBQgM
 22DPPcv3zfnjfDywU1kRsAAAA
X-Change-ID: 20250629-exynos-sysmmu-resv-regions-661f2889d2d5
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752320988; l=1824;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=S+tYkmbasYOAVw0o6YkfoWz4FtmHaFsF4csZGWOvnmk=;
 b=XrB80dr8a+JpILdcBo5C8ky8eoGj9SFiZjVCtse37Zu1p3PeiZQKE+VHre362XvQFhPjcTFZo
 rQBP0wI1zv3AWTuPsfcXTXWutuy7l58dImvg6ZriUEHbco9XIsfAiW1
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

The bootloader configures a reserved memory region for framebuffer,
which is protected by the IOMMU. The kernel-side driver is oblivious as
of which memory region is set up by the bootloader. In such case, the
IOMMU tries to reference the reserved region - which is not reserved in
the kernel anymore - and it results in an unrecoverable page fault. More
information about it is provided in [1].

Add support for reserved regions using iommu_dma_get_resv_regions().
For OF supported boards, this requires defining the region in the
iommu-addresses property of the IOMMU owner's node.

Link: https://lore.kernel.org/r/544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org [1]
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/iommu/exynos-iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index b62a8f35c3e8516ead6a41f92dc7c8dc057986a8..b6edd178fe25e7c258cc82c47e9170fb4db74064 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -22,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include "dma-iommu.h"
 #include "iommu-pages.h"
 
 typedef u32 sysmmu_iova_t;
@@ -1479,6 +1480,7 @@ static const struct iommu_ops exynos_iommu_ops = {
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
+	.get_resv_regions = iommu_dma_get_resv_regions,
 	.of_xlate = exynos_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= exynos_iommu_attach_device,

---
base-commit: a62b7a37e6fcf4a675b1548e7c168b96ec836442
change-id: 20250629-exynos-sysmmu-resv-regions-661f2889d2d5

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

