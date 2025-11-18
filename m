Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9B634FF66
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466662; cv=none; b=DTFmbw85Cz21CeasP+IVTQ2rdC+d/7NRqFqbFin5l0ZcwpqD4ejJwfHsGpYVq/qEF72c2bH5QSd1WrlIJzoE1NTNJaeCvsC/EvYdid4mZMdJwd0MM7F8LjjPy5THy4HhUsLW0rSqnvTYUUa3jfRs8py1MjCu0pOCs518oL/alVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466662; c=relaxed/simple;
	bh=P9PIc1vrUoMXsQTCQ9kbCladgFlFZuhqZxGVyZ8Yb6A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=W11aMibFjOAjOd82GSNMX2SGTl0gmJKUcVKelmeckFp80SC9pn7VPstd4sHtn3tGotj3Nkizhb7iZkmpsUS+Hh0Ct3bDgLa0k/+cp6ELPl52ER1X+OLZmKSOMmNbo+VPh54KzOx1YhrnrQvOA0yL+kY38v6GsuQB522wa169a7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XRLApuag; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XRLApuag"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251118115052euoutp015452218937c2788efda687bf35b587ce~5F5PAaqq61105611056euoutp01v
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 11:50:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251118115052euoutp015452218937c2788efda687bf35b587ce~5F5PAaqq61105611056euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763466652;
	bh=LM+4xzvGkofdU8UCUqnDiSvfc6MxCBehihsQGcilaR0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XRLApuagX0KWhkUOlqPTUfVHBiqHUrBYkvGxRN1QzseZg2iJlCOMazdHnysRBc/aZ
	 4IwGBqHt70TraL4WmTIY+e8S5V7wSpo7IS17rMdLQdObNHStZ7a/xQWbHJvupQuFXE
	 YMMJWRsRmvJMDGV3YPaINiavao+MAHnLZAcrQDz8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251118115051eucas1p15f688883a4466dd7cabf3550a798c060~5F5OkYnUD1574115741eucas1p1L;
	Tue, 18 Nov 2025 11:50:51 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251118115051eusmtip26ddcaa86ac3b9de24aee86f339f9ae6e~5F5OOiUgk0502105021eusmtip2D;
	Tue, 18 Nov 2025 11:50:51 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Marc Zyngier
	<maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: exynos: Rework system wakeup interrupts initialization
Date: Tue, 18 Nov 2025 12:50:37 +0100
Message-Id: <20251118115037.1866871-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251118115051eucas1p15f688883a4466dd7cabf3550a798c060
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251118115051eucas1p15f688883a4466dd7cabf3550a798c060
X-EPHeader: CA
X-CMS-RootMailID: 20251118115051eucas1p15f688883a4466dd7cabf3550a798c060
References: <CGME20251118115051eucas1p15f688883a4466dd7cabf3550a798c060@eucas1p1.samsung.com>

Since commit 1b1f04d8271e ("of/irq: Ignore interrupt parent for nodes
without interrupts") it is not possible to get parent interrupt device
node when no 'interrupts' property is specified. Rework the hack used for
initializing the Exynos system wakeup interrupts (PMU controller is a
proxy for SoC RTC interrupts) to get the parent interrupt node by
manually parsing 'interrupt-parent' property.

Fixes: 8b283c025443 ("ARM: exynos4/5: convert pmu wakeup to stacked domains")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This fixes the following boot failure of allmost all ARM 32bit Exynos
boards observed since next-20251118:

/soc/system-controller@10020000: no parent, giving up
OF: of_irq_init: Failed to init /soc/system-controller@10020000 ((ptrval)), parent 00000000
...
8<--- cut here ---
Unable to handle kernel paging request at virtual address 00002008 when read
[00002008] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00026-g1b1f04d8271e #16162 PREEMPT
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at exynos_set_delayed_reset_assertion+0x5c/0xb0
LR is at exynos_set_delayed_reset_assertion+0x80/0xb0
pc : [<c012b9a4>]    lr : [<c012b9c8>]    psr: 80000053
...
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xf0825f30 to 0xf0826000)
...
Call trace:
 exynos_set_delayed_reset_assertion from exynos_smp_prepare_cpus+0x10/0x34
 exynos_smp_prepare_cpus from kernel_init_freeable+0x94/0x234
 kernel_init_freeable from kernel_init+0x1c/0x12c
 kernel_init from ret_from_fork+0x14/0x28
Exception stack(0xf0825fb0 to 0xf0825ff8)
...
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 arch/arm/mach-exynos/suspend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 44811faaa4b4..02785342e0c7 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -192,6 +192,7 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
 {
 	struct irq_domain *parent_domain, *domain;
 
+	parent = of_parse_phandle(node, "interrupt-parent", 0);
 	if (!parent) {
 		pr_err("%pOF: no parent, giving up\n", node);
 		return -ENODEV;
-- 
2.34.1

