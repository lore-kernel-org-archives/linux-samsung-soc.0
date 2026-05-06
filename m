Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C630C618
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 06:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049359; cv=none; b=DS0puHWXBBHYF2zGF/Qk6XondIMlBLn1mPAjnD+96QTTDs879kirnVMtTD+ggR0HRtdgkaqq4T6e3F3Z65Xyzg0nQHNUL8dUvt+wlRVIq3fe44M2lT9IxL0zNNcNxZjhFjfdsJakR0izl243Xnvcldq9StiddgAR9UZlcBHN9Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049359; c=relaxed/simple;
	bh=XHauu4bdj/t0K4qEUoP+047paPxyPewo7Z02k93au1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Q42hYF2qHsF8hnFm8T26yj+osIOSP7LNzQtMkVhRU2qnDn+YPxLq+Qx3pv9aLkSuR+xLfZ/QjL202S5xPxRn7Ei8o2As1jrXwkYCQvLCCBc6ZXSMxrK4tvoBiibsLjicaUjzNjtSjDp9mKxYCmClHbdR77wCysLgo577cLBe0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XXMG3Rae; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XXMG3Rae"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260506063555euoutp02f226ac9101c7e9ac509ad0ee6d46a92c~s5nf5nqw31134911349euoutp02O
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 06:35:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260506063555euoutp02f226ac9101c7e9ac509ad0ee6d46a92c~s5nf5nqw31134911349euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1778049355;
	bh=D4ONrkbTuXpFZZg3C3l160J+0NtSHqnB8pAXnoDZkIE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XXMG3RaeRt2J0AsvocM+oNG3vC1MGgitSsYwbi3Kj4QNGOPfeQOljVDXVJH9MT8li
	 YAAmNgKiGfeBeS9TShsD+gY50i1EKH8MxNSOnvdF7dlUuHLniCtUABtmZIQu6MNw/D
	 icH0d9xXijL+3OzJk5Hr3Q7Kcfp0K5A3bQXqnvNU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260506063555eucas1p2affe879f010f6be0edc41475690fd05a~s5nfpkOcu1874318743eucas1p2I;
	Wed,  6 May 2026 06:35:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260506063554eusmtip1082de50ca431abd1e9064abd69212ba0~s5ne4CFKl2212022120eusmtip1M;
	Wed,  6 May 2026 06:35:54 +0000 (GMT)
Message-ID: <d568fde6-8033-45c1-a2e1-13f8112f1193@samsung.com>
Date: Wed, 6 May 2026 08:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] drm/exynos/fimd: fix register offset type in
 fimd_trigger()
To: Chen-Yu Tsai <wenst@chromium.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260408065055.1353444-1-wenst@chromium.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260506063555eucas1p2affe879f010f6be0edc41475690fd05a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260408065112eucas1p129f600747c27e999ec3d42504bc0fd2b
X-EPHeader: CA
X-CMS-RootMailID: 20260408065112eucas1p129f600747c27e999ec3d42504bc0fd2b
References: <CGME20260408065112eucas1p129f600747c27e999ec3d42504bc0fd2b@eucas1p1.samsung.com>
	<20260408065055.1353444-1-wenst@chromium.org>

On 08.04.2026 08:50, Chen-Yu Tsai wrote:
> Sparse reports:
>
>     exynos_drm_fimd.c:992:39: warning: incorrect type in initializer (different address spaces)
>     exynos_drm_fimd.c:992:39:    expected void *timing_base
>     exynos_drm_fimd.c:992:39:    got void [noderef] __iomem *
>     exynos_drm_fimd.c:1005:33: warning: incorrect type in argument 1 (different address spaces)
>     exynos_drm_fimd.c:1005:33:    expected void const volatile [noderef] __iomem *addr
>     exynos_drm_fimd.c:1005:33:    got void *
>     exynos_drm_fimd.c:1007:33: warning: incorrect type in argument 2 (different address spaces)
>     exynos_drm_fimd.c:1007:33:    expected void volatile [noderef] __iomem *addr
>     exynos_drm_fimd.c:1007:33:    got void *
>
> Add "__iomem" to *timing_base to fix its type.
>
> Fixes: 3854fab24e89 ("drm/exynos: fimd: support LCD I80 interface")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
> random warning I found while checking for the size_t warning.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index b6abdc4f2b0a..695d3515d421 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -989,7 +989,7 @@ static void fimd_trigger(struct device *dev)
>  {
>  	struct fimd_context *ctx = dev_get_drvdata(dev);
>  	const struct fimd_driver_data *driver_data = ctx->driver_data;
> -	void *timing_base = ctx->regs + driver_data->timing_base;
> +	void __iomem *timing_base = ctx->regs + driver_data->timing_base;
>  	u32 reg;
>  
>  	 /*

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

