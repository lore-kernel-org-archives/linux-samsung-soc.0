Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B5372B41
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362767; cv=none; b=NF3/tCMoqVVnmqhZPp7lO87DzbywKGbO6nMTQ2O3d8/zzXNIbWwuPoFIyv61Ik8Xsvfcmt3nHT15uIYNbCwPrjsJKWutE4DW3GhbQy4mXIqs7k/hGEIZ3DoBXnQQi4shENtr0QNFMEt8sfnADcalM3cg4kHOojIAe9OiFs7iEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362767; c=relaxed/simple;
	bh=+XpvXMZNLwaWXLrwI8QU0wpO9WhgG91kHw4oJ13QJxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=jdN61rWUulHGW+aByr6zi+P/ftRVsHAa2zFD4otI/B5R4UNm4f6cyjpkFky0JAcY+YwLPEHE9eJno7tUZUef2nn+joP9gu1JDLdlvmgmm5U6nPHPiL8PnKnu5OB1pXqwswxZNeTcfl/C+B4w6IDyhg/RFSFdp4BA2LYJHZ0Zf4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rGkfJLYu; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rGkfJLYu"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260521112603euoutp02e43e4db682ee7bf50e5af82cd1f68e6d~xkQFzJkMm1027810278euoutp02Q
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 11:26:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260521112603euoutp02e43e4db682ee7bf50e5af82cd1f68e6d~xkQFzJkMm1027810278euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779362763;
	bh=ip9QVPCCouGenbqfjJ/NrcAKbR/S6x3OuiBOrCOdt+8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rGkfJLYuajlTFpSd2JtaWBrNzsH1OdXbyQCSKIe2CqY8dbxhr+LmkLCIT2pRroGUu
	 312GPXnso0MJLRwhp3hPosxSD4eL1G3X4FtjTIAYZGZzIAsM8TitZkNzwsHcL2WfMQ
	 bD7yMOS2FBPScfpG8sZE0tTYx60pSRsbFA8wseF8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260521112602eucas1p22a4c1f32694ae09a4b568d20adb49ff1~xkQFcREV20311103111eucas1p2u;
	Thu, 21 May 2026 11:26:02 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260521112602eusmtip206dc41f961a36bb19b47f729d48a5644~xkQEvQqli0263802638eusmtip2e;
	Thu, 21 May 2026 11:26:02 +0000 (GMT)
Message-ID: <97f33a9d-5fdd-4766-aaff-d10d5f5fdf28@samsung.com>
Date: Thu, 21 May 2026 13:26:01 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
To: Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <87ecj5w2qf.ffs@tglx>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260521112602eucas1p22a4c1f32694ae09a4b568d20adb49ff1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
X-EPHeader: CA
X-CMS-RootMailID: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
	<20260520220422.3522908-1-m.szyprowski@samsung.com> <87ecj5w2qf.ffs@tglx>

On 21.05.2026 11:06, Thomas Gleixner wrote:
> On Thu, May 21 2026 at 00:04, Marek Szyprowski wrote:
>> The exynos-combiner driver uses a regular spinlock to protect access to
>> the combiner interrupt status register in combiner_handle_cascade_irq(),
>> which is invoked in hard IRQ context as a chained interrupt handler.
>>
>> When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
>> sleeping lock (mutex-based), which must not be used in atomic context
>> such as hard interrupt handlers. Switch the irq_controller_lock to
>> raw_spinlock, which remains a true non-sleeping spinlock even under
>> PREEMPT_RT.
> Mechanically this makes sense, but out of curiosity I have to ask:
>
>> -static DEFINE_SPINLOCK(irq_controller_lock);
>> +static DEFINE_RAW_SPINLOCK(irq_controller_lock);
>>  
>>  struct combiner_chip_data {
>>  	unsigned int hwirq_offset;
>> @@ -72,9 +72,9 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
>>  
>>  	chained_irq_enter(chip, desc);
>>  
>> -	spin_lock(&irq_controller_lock);
>> +	raw_spin_lock(&irq_controller_lock);
>>  	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
>> -	spin_unlock(&irq_controller_lock);
>> +	raw_spin_unlock(&irq_controller_lock);
> What is this lock actually protecting?
>
> Each combiner has it's own @base address, so there is no concurrency
> problem between two cascade interrupts being handled at the same time.
>
> That means the only possible problem would be that the same cascade
> interrupt is handled on two CPUs concurrently. Is that even possible?
Frankly speaking I did this conversion mechanically, late in the evening to fix
the bug warning I've spotted. Indeed this spinlock looks like a copy&paste or
development leftover. The only side-effect of it I see is a memory barrier,
which might affect how the register access happens, but this should not affect
cascade operation imho. Do You want me to send a patch removing it completely?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

