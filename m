Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054045BE3
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 06:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049383; cv=none; b=jXQRZOr6v3Apn6pQKfCQh5a/n3wd/Ejrv5e1+x0Mf9ZPTA+w3QnKoDyMzmNcFvRdielufkx/2SurmcWG/kUNrm3KEc8W9kvP62rayWrl4x4g9mzv0o2DWDbsEF2+m+XXA84Dd+yJsNFoo6wXdSm/noPYRV08dr8sQVx5657sfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049383; c=relaxed/simple;
	bh=t3jzYTjKOIf5rf/+jFpFaFxhgvZdBdcVaGmqBtnYVP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=hswi4mGTKViggYhTW3nlDs09PBQ7mdbf6RWkbx7H47HnIxjHSDpGl5VLwFVf6Vsfk/ASXjZNj7lgsxOUqVwNEaPJk6ic6wgB5aYBJu54/09VOu3UJubN8cCW8yC/xzFFZb3VT9vrr9gac0UNFgmRSIWVIo/VIxvt/ZHZkCXGFAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tBkFY0Kn; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tBkFY0Kn"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260506063613euoutp0194188d6f55d1c4962427541327a5d7b8~s5nwxN2Sc3038530385euoutp01W
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 06:36:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260506063613euoutp0194188d6f55d1c4962427541327a5d7b8~s5nwxN2Sc3038530385euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1778049374;
	bh=UAOX7g+36grI83zuNghQw07p7liRfgICgVlYKc3Nluo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tBkFY0KnbNbL7mqrZZLt4TmLURhgSco8cBjnYwUNKXSJRjsDoYHn4VKvY5cyIQ/kj
	 +RTc7unxuyTPktcbg4qCNKvS8EaO0MSNy1vaenPrBI6nYZh0bouh4l6bdaNJpeYxe2
	 Xt7o54cnUqRoGkMxha75sPFuNX746qzb4QHENLYw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260506063613eucas1p22e2010cea14e69222bfde5d3504571a1~s5nwfFy_d1876018760eucas1p2X;
	Wed,  6 May 2026 06:36:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260506063612eusmtip2ba00c35a881fca512a095dc19595a723~s5nvKmbT_2580225802eusmtip2w;
	Wed,  6 May 2026 06:36:12 +0000 (GMT)
Message-ID: <19fbdfbd-71f5-4e92-8525-aaeddcbf4467@samsung.com>
Date: Wed, 6 May 2026 08:36:11 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] drm/exynos/gem: Fix printk specifier for
 gem_object.size and dma_addr
To: Chen-Yu Tsai <wenst@chromium.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
	test robot <lkp@intel.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260408064936.1342321-1-wenst@chromium.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260506063613eucas1p22e2010cea14e69222bfde5d3504571a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260408064951eucas1p14200e8d85d270f16435e38af36dbcae0
X-EPHeader: CA
X-CMS-RootMailID: 20260408064951eucas1p14200e8d85d270f16435e38af36dbcae0
References: <CGME20260408064951eucas1p14200e8d85d270f16435e38af36dbcae0@eucas1p1.samsung.com>
	<20260408064936.1342321-1-wenst@chromium.org>

On 08.04.2026 08:49, Chen-Yu Tsai wrote:
> In the recent change to use the GEM base object's size field instead of
> the exynos_gem object's additional field, the printk format was not
> adjusted for the change to size_t type. This causes a new warning on
> platforms on which size_t is not unsigned long.
>
> Fix this by using the correct "%zx" type.
>
> While at it, fix the specifier for dma_addr so that the cast to unsigned
> long is not longer needed.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604081331.jSJQSVmg-lkp@intel.com/
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
> This is only compile tested. Build for ARM 32-bit confirms the warning
> is fixed. Sorry for the noise.
>
> The commit hash used in the Fixes tag is the current one seen in
> exynos-drm-next.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index d9d42809a1a9..f264e170bc26 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>  	if (kvmap)
>  		exynos_gem->kvaddr = exynos_gem->cookie;
>  
> -	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
> -			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> +	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);
>  	return 0;
>  }
>  
> @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
>  		return;
>  	}
>  
> -	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> -			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> +	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);
>  
>  	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
>  			(dma_addr_t)exynos_gem->dma_addr,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

