Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13EE2192F9
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 22:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286346; cv=none; b=OfVKgJiayJYcD/4EJ0VUYYsRM7Crb+ZA05H/ULjFCvJ/+HmL2BNiF9XrdqzI8T1DENgTeFi+i6RiCSLUwTZhSuucAC5EU5XrTCVBF5fsTK/e7bzIBqMyo0G5zQwysk6+V8WJPiBN/pv/oCMxyBWBoil4QbXEDpe9JnElSXYwXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286346; c=relaxed/simple;
	bh=iTyoI4IdI/5zO0QyVSONeTIonqqBZUA+GGWpV0idgnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ehg82qPpM78KWwm9YpXyUFb20EAcQ8SlDb5MIGKoJ0RIGoB2hTGgvcykQN3EvDQdnzwaGl8N/Q3WfaX7H6pqEiP7qIj4jX/PAXjEeD14bM/XYLjPeYWFjNJ6Ri5dMPiWRKQNAJN2D6teElU8JC6sY8ToxCKBa7MNdZWWyZ3v8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AHAE4maQ; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AHAE4maQ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250618223902euoutp0280089bd7e8fe0c42a3674f862af3a2dc~KRCeWjCYw2799027990euoutp02F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 22:39:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250618223902euoutp0280089bd7e8fe0c42a3674f862af3a2dc~KRCeWjCYw2799027990euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750286342;
	bh=l5qg81NSDR/Hok1RYgRscCAxqtO2fW9GcPjDWWGGkxw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AHAE4maQfqMxL1keARu6ZXexglcLo6ujECpmrxQzCTLxHC48M309InjWiD/gBJDeD
	 Va4iUbHancGODDxVpF0KpfioqVLKgWv98DT2jItUIBThblY4qF3Fn4eZ//Xw+CsDsT
	 76s0jJCqr5COvA1XHX/s/GzmeVUKEhhy25xROi60=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618223900eucas1p29d01fa0266e4c66e58029c4373e9d9d3~KRCdS8GFz2299722997eucas1p2K;
	Wed, 18 Jun 2025 22:39:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618223900eusmtip1882d2eee1b90cdc0f5148af81cab9720~KRCckHJ110058200582eusmtip1J;
	Wed, 18 Jun 2025 22:39:00 +0000 (GMT)
Message-ID: <a89ebc1f-82a0-4bb8-87a8-71a6b373ab24@samsung.com>
Date: Thu, 19 Jun 2025 00:38:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exynos: fimd: Guard display clock control with
 runtime PM calls
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Aradhya Bhatia
	<a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, Inki Dae
	<inki.dae@samsung.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <96b92a56-028f-452d-b2dd-8362491f5a84@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250618223900eucas1p29d01fa0266e4c66e58029c4373e9d9d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
X-EPHeader: CA
X-CMS-RootMailID: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
References: <CGME20250618120644eucas1p2b084977540772f3623f3f9e834604668@eucas1p2.samsung.com>
	<20250618120626.217023-1-m.szyprowski@samsung.com>
	<96b92a56-028f-452d-b2dd-8362491f5a84@ideasonboard.com>

On 18.06.2025 14:25, Tomi Valkeinen wrote:
> On 18/06/2025 15:06, Marek Szyprowski wrote:
>> Commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
>> and post-disable") changed the call sequence to the CRTC enable/disable
>> and bridge pre_enable/post_disable methods, so those bridge methods are
>> now called when CRTC is not yet enabled.
>>
>> This causes a lockup observed on Samsung Peach-Pit/Pi Chromebooks. The
>> source of this lockup is a call to fimd_dp_clock_enable() function, when
>> FIMD device is not yet runtime resumed. It worked before the mentioned
>> commit only because the CRTC implemented by the FIMD driver was always
>> enabled what guaranteed the FIMD device to be runtime resumed.
>>
>> This patch adds runtime PM guards to the fimd_dp_clock_enable() function
>> to enable its proper operation also when the CRTC implemented by FIMD is
>> not yet enabled.
>>
>> Fixes: 196e059a8a6a ("drm/exynos: convert clock_enable crtc callback to pipeline clock")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index c394cc702d7d..205c238cc73a 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -187,6 +187,7 @@ struct fimd_context {
>>   	u32				i80ifcon;
>>   	bool				i80_if;
>>   	bool				suspended;
>> +	bool				dp_clk_enabled;
>>   	wait_queue_head_t		wait_vsync_queue;
>>   	atomic_t			wait_vsync_event;
>>   	atomic_t			win_updated;
>> @@ -1047,7 +1048,18 @@ static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
>>   	struct fimd_context *ctx = container_of(clk, struct fimd_context,
>>   						dp_clk);
>>   	u32 val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
>> +
>> +	if (enable == ctx->dp_clk_enabled)
>> +		return;
> Does this happen, i.e. is this function called multiple times with
> enable set? If so, do you rather need ref counting here? Otherwise the
> first fimd_dp_clock_enable(enable=false) call with disable the clock,
> instead of the last (assuming the enable/disable calls are matched on
> the caller side).

No reference counting is needed here, as the clock enable/disable is 
called from runtime resume/suspend of the exynos_dp (analogix_dp_core) 
and there are only single calls to enable or disable. The only problem 
is that the first call is fimd_dp_clock_enable(enable=false), which 
should be skipped from the fimd runtime PM perspective, that is why I 
added the (enable == ctx->dp_clk_enabled) check.

>> +
>> +	if (enable)
>> +		pm_runtime_resume_and_get(ctx->dev);
>> +
>> +	ctx->dp_clk_enabled = enable;
>>   	writel(val, ctx->regs + DP_MIE_CLKCON);
>> +
>> +	if (!enable)
>> +		pm_runtime_put(ctx->dev);
>>   }
>>   
>>   static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
>   Tomi
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

