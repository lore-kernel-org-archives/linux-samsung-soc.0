Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B03C9426
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236557; cv=none; b=UXeZXZ/0Kk8+y15GnXlT3L7Wg/e+CHIU5SxSrILgQITE8TPbVDiItX3Vp5vc95NV0luCcnxA3DxXWy2SXceH2kKloRvGKmBR9kECfmYgwzoUiS9fGqorsMAH45C+pUIrDYN+ZnQlo4AlAaQAfhkqVfISZmSG10p6Qk+uYW9kC5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236557; c=relaxed/simple;
	bh=ykShdcSdw3pSLW+Cdb1R7J4InfpOohrBj5R4WSdASRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=LsjD/SpRx4WHSphHGGR3po3KFaIaD5I3QM6GUTBhwifJwi5ylSO82wbNPN5/5IsL7ZTVeF7zT9InW6bsb6FzTbBvyq7v4B5sBlhaNoSOfr6UWASbaJRUKIu9kjfq3Z9i0TYxo0WcwYaelPRbxoAUNpyOOxM5Cu0cWJsyJyD8EYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VO/xYliv; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VO/xYliv"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260508103553euoutp01c2bcfe4b2d6afc6d339944564d00a78b~tkLlMifr80771907719euoutp01A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 10:35:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260508103553euoutp01c2bcfe4b2d6afc6d339944564d00a78b~tkLlMifr80771907719euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1778236553;
	bh=OthmlCJqVOrXiTd9GppK5AZE866ugCyan5Tjw8Qfhv4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=VO/xYliv1mrEqF/ECggepNLkK4yf1tyoaXU/5n7UrEN6z/sW4ICl/cm2BVBMn509u
	 GegnHX0yksh1fzvKvICtYHXGXb8qC+dFVs+q6wFarAWQKdlgSL6aEQ3s9qbVAUWSgi
	 Q+op4csq+5peLVGPBdEzw/ZPqIMS7Zh/bv5uRBOw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260508103552eucas1p1bad592e514d538e3d40c7d1d9a55a795~tkLkNw1qA1602316023eucas1p10;
	Fri,  8 May 2026 10:35:52 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260508103551eusmtip2bbdccee79eae6df2ad6f7bd3c02bfd65~tkLjkg8x_1733917339eusmtip2Y;
	Fri,  8 May 2026 10:35:51 +0000 (GMT)
Message-ID: <dbacd56b-2914-40ce-9139-78b819a81c13@samsung.com>
Date: Fri, 8 May 2026 12:35:51 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [BUG] exynos5_i2c_xfer_atomic() can sleep.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Waiman
	Long <longman@redhat.com>, linux-rt-devel@lists.linux.dev, Andi Shyti
	<andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260508100910.nxRkt3mA@linutronix.de>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260508103552eucas1p1bad592e514d538e3d40c7d1d9a55a795
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0
X-EPHeader: CA
X-CMS-RootMailID: 20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0
References: <CGME20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0@eucas1p2.samsung.com>
	<20260506065110.sY3jKS7G@linutronix.de>
	<03c06142-12eb-45b7-8d22-ce12fab6e132@samsung.com>
	<20260508100910.nxRkt3mA@linutronix.de>

On 08.05.2026 12:09, Sebastian Andrzej Siewior wrote:
> On 2026-05-08 11:45:15 [+0200], Marek Szyprowski wrote:
>> On 06.05.2026 08:51, Sebastian Andrzej Siewior wrote:
>>> While looking into the xfer_atomic i2c thingy, I've been looking at the
>>> exynos5_i2c_xfer_atomic() function and noticed that it has a
>>> disable_irq() invocation. Given that i2c_algorithm::xfer_atomic is
>>> called from atomic context (with either preemption or interrupts
>>> disabled) the might_sleep() in disable_irq() must lead to splat here.
>> Its me, who added that code, commit 445094c8a9fb1. I've tested that in
>> the reboot/shutdown path and I'm quite sure that I've copied that
>> irq_disable/enable from some other driver. I also cannot locate that
>> might_sleep() in disable_irq(), where exactly it is?
> kernel/irq/manage.c:
> | void disable_irq(unsigned int irq)
> | {
> |         might_sleep();
> |         if (!__disable_irq_nosync(irq))
> ^^
> |                 synchronize_irq(irq);
> | }
> | EXPORT_SYMBOL(disable_irq);

Ah, it looks that I've checked irq_disable() code, so that's why I didn't find might_sleep() call. In the case of exynos5_i2c driver, probably switching to disable_irq_nosync() will be enough. I assume that all previous transfers have to be finished to start this atomic one, so waiting for interrupts to finish is not needed.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

