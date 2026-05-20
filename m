Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D353B2FDF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2026 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314682; cv=none; b=mV4u3U/BM5V7NKbRdB8YW9vFaQ2nC6AsPZJAa//vjza701bM5J6DKp4cw+UDXob2TMdACZc2lWzFnRryVcZD2KsBjet6nBJ9675gPWgsswkOtQLnZ3CwmltZmCKSonurVZ58C3rpXV7m0meUsxKSr1YnZj55sdZkjzv+RFR7gJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314682; c=relaxed/simple;
	bh=KK2JExmu6tvrGfxv6GTairVWyfxQKOPAX8MW7cFhPyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=ENZ0rzfTTUtWhk1MmufNQoX9KdVnpIbkwfR5agc8kl440ceyg8cNY0rAt6eqZ5rNcQFlQveRAZu6nRu+Jc6Vv5k7P/rC36HzqqWj2eD3Bk9rpFagjnxqKIpTCZvK8xYg3Sj7d3m0cfuwelLB1bUJ2Vtp1rgQzfmwwd/3K9iXToo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=c3ic/NJI; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="c3ic/NJI"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260520220432euoutp01acb6c50d662521fdf43af5888085cc18~xZUSGCW7v0197201972euoutp01z
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2026 22:04:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260520220432euoutp01acb6c50d662521fdf43af5888085cc18~xZUSGCW7v0197201972euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779314672;
	bh=0tWG3WSaKp6CbPJPdYU6zI+q09ff0s53l/UZLpIo8fU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=c3ic/NJI3ICoCdK+pEbTPt6glLl928gJr7GioGwaOh9Cjp0l2gY6KdnpADozDxGV9
	 Ms/GCubk8oUv/CH+k6yA3UFVIIFwbq/1zDXmcePkz+bkDTv09f5bj2e8BVwOcrvL7a
	 RuLN0s99GEpsz1wDtaypiTf+5djE1pYbOWITa9No=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109~xZURYfiNp2592825928eucas1p1H;
	Wed, 20 May 2026 22:04:32 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260520220431eusmtip23c9cbf8151959b8b8ac63d14aabb10b1~xZUQ2jU3V2076420764eusmtip2Y;
	Wed, 20 May 2026 22:04:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Gleixner
	<tglx@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Subject: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
Date: Thu, 21 May 2026 00:04:22 +0200
Message-Id: <20260520220422.3522908-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
X-EPHeader: CA
X-CMS-RootMailID: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>

The exynos-combiner driver uses a regular spinlock to protect access to
the combiner interrupt status register in combiner_handle_cascade_irq(),
which is invoked in hard IRQ context as a chained interrupt handler.

When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
sleeping lock (mutex-based), which must not be used in atomic context
such as hard interrupt handlers. Switch the irq_controller_lock to
raw_spinlock, which remains a true non-sleeping spinlock even under
PREEMPT_RT.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: a900e5d99718 ("ARM: exynos: move exynos4210-combiner to drivers/irqchip")
---
 drivers/irqchip/exynos-combiner.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index 11d105457798..03cafcc5c835 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -24,7 +24,7 @@
 
 #define IRQ_IN_COMBINER		8
 
-static DEFINE_SPINLOCK(irq_controller_lock);
+static DEFINE_RAW_SPINLOCK(irq_controller_lock);
 
 struct combiner_chip_data {
 	unsigned int hwirq_offset;
@@ -72,9 +72,9 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	spin_lock(&irq_controller_lock);
+	raw_spin_lock(&irq_controller_lock);
 	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
-	spin_unlock(&irq_controller_lock);
+	raw_spin_unlock(&irq_controller_lock);
 	status &= chip_data->irq_mask;
 
 	if (status == 0)
-- 
2.34.1

