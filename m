Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07803A5E81
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2026 06:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430235; cv=none; b=L3/Znu1NQBuzAfwvA/7aFVoD9oJABryIsq3fb8ivrv+1vs/fwOhUWsA2QHYi9Lv0yMlgA8YbHghWP2SXkfK/Eq5V5jhlmlNemm+cDK7knw50qXuvCBYceNynn3s7g3hwPj7PbFsa0+bvDVGwEjvMbYZBNNxJ1EZ6OXC3btVlLVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430235; c=relaxed/simple;
	bh=oeInFgBtJiHc35/jLm2dFiuVW6U6jTp3BWAtsKmxQDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=Gl+fAfXmZbaVoNrupS7UFdoD5D8uHiKpqgjQvuux60vxr0ticfjKpbCYD5UnvjZv4KY/n4pllxys+Nx8WaJnfuKc4y77q0wTLatqPuhlWEPpm5vipCAt7NRgeFLoyldf/jCuB7z5mqZKYGY3AiajEjp7FKtgZz0LXhSsuyagXJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=g87zDeyk; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="g87zDeyk"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260522061032euoutp01d65e540b16d49c42a5034be2c4dd59bc~xzl5IB4Di2009620096euoutp01a
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2026 06:10:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260522061032euoutp01d65e540b16d49c42a5034be2c4dd59bc~xzl5IB4Di2009620096euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779430232;
	bh=mgMRcmeIRwFSqj4uXq1QIcOzpHdQbgGdUSQRhqwyrqc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=g87zDeykvYGDyTRMSqGrpZTtNG1CHEV/XA3BHojGCDSJrpArYbIXmr/f0n5CorO5D
	 FnvXTQonKrfD+NMd0bPRN/Vi+B9IxCcncDBAsDuvjBYKlHshAtkZC8Ik3kqp5ijM1V
	 AprBvn3xZ6LynBJMFtgkQRDIvzNu/HjP6Ui/Jm9Y=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662~xzl36eYGT0967209672eucas1p1m;
	Fri, 22 May 2026 06:10:30 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260522061030eusmtip2f8e15fe821297adff05efc074b9a5601~xzl3ZonYs1866518665eusmtip22;
	Fri, 22 May 2026 06:10:30 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Gleixner
	<tglx@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Subject: [PATCH] irqchip/exynos-combiner: remove useless spinlock
Date: Fri, 22 May 2026 08:10:12 +0200
Message-Id: <20260522061012.2687122-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662
X-EPHeader: CA
X-CMS-RootMailID: 20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662
References: <CGME20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662@eucas1p1.samsung.com>

irq_controller_lock doesn't protect anything, it must be some leftover
from early development or copy/paste. Remove it completely.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/all/20260520220422.3522908-1-m.szyprowski@samsung.com/
Fixes: 96031b31a4b3 ("irqchip/exynos-combiner: Switch to raw_spinlock")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/irqchip/exynos-combiner.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index 03cafcc5c835..d9d408cb4711 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -24,8 +24,6 @@
 
 #define IRQ_IN_COMBINER		8
 
-static DEFINE_RAW_SPINLOCK(irq_controller_lock);
-
 struct combiner_chip_data {
 	unsigned int hwirq_offset;
 	unsigned int irq_mask;
@@ -72,9 +70,7 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	raw_spin_lock(&irq_controller_lock);
 	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
-	raw_spin_unlock(&irq_controller_lock);
 	status &= chip_data->irq_mask;
 
 	if (status == 0)
-- 
2.34.1

