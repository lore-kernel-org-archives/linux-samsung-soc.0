Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652F352066
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Aug 2025 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216313; cv=none; b=rTw44Zu5LokyPxjR9FYC/cr5iCphwiHsUcSeK2vIq7EptVeu58/NRmNB+jXylTd+T3cY+5GVbVsCwJ/OHKSnfVtdbh7G39inVUiAyDepRcb2IHLB8O1kIq0m6tM/ynmLGEYCmTFS8T7PW6suSkCBUCGeGhSYFHLXj3N/0lDb27A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216313; c=relaxed/simple;
	bh=8kJ15fRNtT9ecFYkHwLv1bZhA0gGUBoIk61tT6gFSVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=RMxIDxO7epr9Vt9l0XT30TzNbW5rSurxaT80AfmK1BClmc6yFvg7wx74oN5CBj8x1Cf/DK7WKP4O5mfkxSbItpbK+PBQakSFxV9GM8Uc/QZup/1O0FHB1socIu26arZtXwiwNSlL++Fu7CX36tHCKZvd3TMMRyx3UtodfoDUVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bHjR9T+B; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bHjR9T+B"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250826135149euoutp024ee0a0bc829df9d68e4e75c041ce9c6b~fVW3L0ltQ1480614806euoutp028
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Aug 2025 13:51:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250826135149euoutp024ee0a0bc829df9d68e4e75c041ce9c6b~fVW3L0ltQ1480614806euoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756216309;
	bh=ZULyMtTc2idS17UiaomIDWxS5E26GTUAPz4WEPqaGL4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bHjR9T+BR5tUnH4liPvral9SsKd+bJlZDHZ7KHtU61th59XkHPlp8XlAv5V5/Apz0
	 I1ntxc+wChLrrwb6cgx0ukA7lcBwo7AFtdeJR0JnCa79mGp/z4lkQ1Zze7SSSv5tl1
	 WSd83YJ7XtzSf7rYivTV8SqRgODkz8xMtITL0/8k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250826135149eucas1p2ef79b300c589d967c1533100e84b4049~fVW2pkj3s2476024760eucas1p2-;
	Tue, 26 Aug 2025 13:51:49 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250826135146eusmtip2cb1cdc8b30562e52ddb197a8da8a70a9~fVWzxQpNd2140921409eusmtip2c;
	Tue, 26 Aug 2025 13:51:46 +0000 (GMT)
Message-ID: <8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com>
Date: Tue, 26 Aug 2025 15:51:45 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
To: Will McVicker <willmcvicker@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob
	Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, John
	Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, Peter
	Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250620181719.1399856-4-willmcvicker@google.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250826135149eucas1p2ef79b300c589d967c1533100e84b4049
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250620181827eucas1p297671b9a3783026020bb357d494c2e70
X-EPHeader: CA
X-CMS-RootMailID: 20250620181827eucas1p297671b9a3783026020bb357d494c2e70
References: <20250620181719.1399856-1-willmcvicker@google.com>
	<CGME20250620181827eucas1p297671b9a3783026020bb357d494c2e70@eucas1p2.samsung.com>
	<20250620181719.1399856-4-willmcvicker@google.com>

On 20.06.2025 20:17, Will McVicker wrote:
> From: Hosung Kim <hosung0.kim@samsung.com>
>
> To allow the CPU to handle it's own clock events, we need to set the
> IRQF_PERCPU flag. This prevents the local timer interrupts from
> migrating to other CPUs.
>
> Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>

This patch has been merged some time ago to v6.17-rc1 as commit 
f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer 
interrupts as percpu"). Recently I found that it breaks CPU hotplug 
support for some 'little' cores on Exynos5422 based boards, like 
OdroidXU3/XU4:

# for i in /sys/devices/system/cpu/cpu[1-9]; do echo 0 >$i/online; done
# for i in /sys/devices/system/cpu/cpu[1-9]; do echo 1 >$i/online; done
[  117.100195] CPU2: failed to come online
-bash: echo: write error: Input/output error
[  118.140426] CPU3: failed to come online
-bash: echo: write error: Input/output error
[  118.148428] CPU4: detected I-Cache line size mismatch, workaround 
enabled
[  118.169613] CPU5: detected I-Cache line size mismatch, workaround 
enabled
[  118.216802] CPU6: detected I-Cache line size mismatch, workaround 
enabled
[  118.283725] CPU7: detected I-Cache line size mismatch, workaround 
enabled
#

Frankly speaking I have no idea why this happens. CPU hotplug was always 
broken for the CPU0, but this is not relevant for this case. Maybe this 
PERCPU flag should be applied only on ARM64-based boards to avoid 
affecting legacy ARM 32bit cases?

> ---
>   drivers/clocksource/exynos_mct.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 96361d5dc57d..a5ef7d64b1c2 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -596,7 +596,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>   			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
>   			if (request_irq(mct_irq,
>   					exynos4_mct_tick_isr,
> -					IRQF_TIMER | IRQF_NOBALANCING,
> +					IRQF_TIMER | IRQF_NOBALANCING |
> +					IRQF_PERCPU,
>   					pcpu_mevt->name, pcpu_mevt)) {
>   				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
>   									cpu);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

