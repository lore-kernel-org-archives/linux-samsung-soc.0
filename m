Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8B92F1FE6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290417; cv=none; b=K8P75q8Aohk5O+D/uD9uiJ/FYujFuH7owo65JmU2dq9eAmEBvSKMis9Xr0ySKOjR8WOOpXf+SST50dKsVe2ybDhaVUh4hBgGcXqIFEOMqml/g/9vU0yC1gWFxa/4X8pnnIUbz9HKw6EBp/3zePVe74d0JFdOq4Y0xOI7hDmcv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290417; c=relaxed/simple;
	bh=1NystgpuK7a1sKS/x+6MIhD4wwVEQY1aHTdlEPnQScs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=UGB7p+/Gww87MdqE88Ux/p0IC5ocl8Ornof7fd21kE2iUfKdSvzJW7OIKSKT1wAAAlNHRHp7S847nl3bNmOzbKZfXP6CMu+FIjaQMPjsRHDTXFUerhdFRldNKzJNFMnFxzB/EnwNzVIAZgtqUZmd4lvgpJ7AUBVu5+PrT4VgUvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PytEsFU3; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PytEsFU3"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250827102651euoutp022ae748d2ed9db149145dfff8d88f2298~fmNL2qeL51456614566euoutp02q
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 10:26:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250827102651euoutp022ae748d2ed9db149145dfff8d88f2298~fmNL2qeL51456614566euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756290411;
	bh=kIMYOv6s//qZZkoCLbDvARcCpDfB5MBd/nSeBfKH2VM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=PytEsFU3at0qV0EB6I+GAJATmXCia9OKKOuVBHHI932PmIYEdrYMSeLWIwNglHdWG
	 Tovx/Qqz0AnJphhIDHI0pOLbzmlie4Ea56J9Uq6geW1VlxPibJluZF1MZVuePp5CCA
	 Cs6O3X0SvG4YRPrxaXaVssh76+F65NybQhILI8Ig=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3~fmNK0PAmT2376023760eucas1p1Z;
	Wed, 27 Aug 2025 10:26:50 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250827102649eusmtip14a7c3f2eb31bf6b008892068161c8f1c~fmNJnvdY52203622036eusmtip1W;
	Wed, 27 Aug 2025 10:26:49 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ingo
	Molnar <mingo@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts only
 on ARM64
Date: Wed, 27 Aug 2025 12:26:45 +0200
Message-Id: <20250827102645.1964659-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
X-EPHeader: CA
X-CMS-RootMailID: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>

For some unknown reasons forcing percpu interrupts for local timers
breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
flag only when driver is compiled for newer ARM64 architecture.

Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 62febeb4e1de..fece6bbc190e 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -603,7 +603,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
 					IRQF_TIMER | IRQF_NOBALANCING |
-					IRQF_PERCPU,
+					(IS_ENABLED(CONFIG_ARM64) ?
+					 IRQF_PERCPU : 0),
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.34.1

