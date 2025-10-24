Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAC63161B5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761304751; cv=none; b=WYbwEd5VoGiASpluY8YQfEjPqgD0h/9AGOEyOTEEK7XMGEb16qy6W+10rxjRIIbEzxFsvQkgRJd3iTaTm8+rN8yYNkRgNfDcGTeudXvu9qwYs/pPsYFXIdYjTQh/dONNvF8NAy9TCxjo9fiMhCTBFjeC10LtkZ+gq+L+K+1XuQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761304751; c=relaxed/simple;
	bh=ZDcuj4nvsrlLmgmMXrgeXB6W4PToAWWP7D5MNCjklnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=sNh2VklTB2w85nT3iXrzw+afxtuhDRPSTB4i7YCWcyLjQ1RlN8mPZ1PAR9IbEGZoKf7iK+bwmV/y2NDkJmjhjcFmQ3cQggEGt44kj9TEt3HVs7mkewGjdHehZJl5I3itoTgCBV6FI0DayGPkV9i0p+I1RmDdzp+1zQniqNxIcFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rrC+L+V3; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rrC+L+V3"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251024111907euoutp02b82740155a34cc7aa1a3c64305549f03~xaVX8kvHE1911819118euoutp02P
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:19:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251024111907euoutp02b82740155a34cc7aa1a3c64305549f03~xaVX8kvHE1911819118euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761304747;
	bh=kYzbQaZe2By8egkc4y3i3SJq/zpodmWP3KwwN0dNah4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rrC+L+V3IoMA0ikgzSPgqXf00OP3ED2t8skXC4763eSm4erOWIVLZu42HIVJYN5Ba
	 bNk23cHfFowFDn3HxfDigeK/ifWvD0zZsfdYwd1oTxe9UcQhDq8P6zaTtJ6AlaBmPC
	 rTXla8dU5El0UPOtv3MxKTakKESkHobhfrNX9UMA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251024111906eucas1p20bb3f61c830ac6e5f776a9f5a2dd6afd~xaVXe-8wp3220332203eucas1p2l;
	Fri, 24 Oct 2025 11:19:06 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024111904eusmtip131ad4a4bc1d1ab7f03a42110bd0da68d~xaVVgmqcF0896108961eusmtip1g;
	Fri, 24 Oct 2025 11:19:04 +0000 (GMT)
Message-ID: <c09387b9-3fcc-4d0e-8e29-21dee196014a@samsung.com>
Date: Fri, 24 Oct 2025 13:19:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 4/7] clocksource/drivers/exynos_mct: Use percpu
 interrupts only on ARM64
To: Will McVicker <willmcvicker@google.com>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
	Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
	Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>, Peter
	Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251023205257.2029526-5-willmcvicker@google.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024111906eucas1p20bb3f61c830ac6e5f776a9f5a2dd6afd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251023205313eucas1p2164ef0c1db80bccd2bbd6a79e809a1cb
X-EPHeader: CA
X-CMS-RootMailID: 20251023205313eucas1p2164ef0c1db80bccd2bbd6a79e809a1cb
References: <20251023205257.2029526-1-willmcvicker@google.com>
	<CGME20251023205313eucas1p2164ef0c1db80bccd2bbd6a79e809a1cb@eucas1p2.samsung.com>
	<20251023205257.2029526-5-willmcvicker@google.com>

On 23.10.2025 22:52, Will McVicker wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
>
> For some unknown reasons forcing percpu interrupts for local timers
> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
> flag only when driver is compiled for newer ARM64 architecture.
>
> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")

This tag doesn't make sense in this patchset. Simply squash this change 
with the previous one, adding the following tags:

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: 
https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/ 

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/clocksource/exynos_mct.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index a5ef7d64b1c2..1429b9d03a58 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -597,7 +597,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>   			if (request_irq(mct_irq,
>   					exynos4_mct_tick_isr,
>   					IRQF_TIMER | IRQF_NOBALANCING |
> -					IRQF_PERCPU,
> +					(IS_ENABLED(CONFIG_ARM64) ?
> +					 IRQF_PERCPU : 0),
>   					pcpu_mevt->name, pcpu_mevt)) {
>   				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
>   									cpu);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

