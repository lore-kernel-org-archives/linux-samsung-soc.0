Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CE3A7F71
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 07:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857112; cv=none; b=aIWWyvHMYhbkrzbhbwSg3imjOAydaOXF8UGPC6BW1agi3fE7t08fXcBG6OsSbu8sk3K4Cg9O5H8G67Jjc2sF80CfIoYGONHsTiqRgcvqEMpf8cMtECQsNR/wzYLPpDFnbyB+fKW42RnPPQemufVUX1qsBDZ0Ah4ZinUmXeqzBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857112; c=relaxed/simple;
	bh=oL9QMZXWzFWavGZg81Mt/2mE0KdGaT0F69AV6Xh9OlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=NEAGvsB5Fxf8mtNOU6h9Q8B1QUG2hudrwHUKoZCHPS54osfX8JdH39QSuxt3N05eGQxv5695RxfgFHLxE4Sx7DkZkD7yk6O4oOLBz8hjfnLPUzPMbsnpOy2Dfnn4awje5IkGdRhSZV4P/AWIUcLcD/5q6RWZWAKyWM1ubVwarZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ALjpHACi; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ALjpHACi"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260330075150euoutp013ac72cd0d5a6da0ef9cb72fdb33a3b0e~hjyNecMkK0045600456euoutp019
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 07:51:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260330075150euoutp013ac72cd0d5a6da0ef9cb72fdb33a3b0e~hjyNecMkK0045600456euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774857110;
	bh=UQECHjZYDeo+w0oCxyQjWJgtMtpqK8B8IJ/66Ffxmsw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ALjpHACiV7sTvBQIdeYUxGEXlKt+hA0rN0o7wK20EJSsD+2iFob03KZGKB7/3rEHB
	 2SgtRRtMB+ewKbRXE4iBta05E+/eKKk3rnURg6OiDW5U87YLNo4qljqgXIJwrwfys3
	 GvgNoKPKsZLVDM9hYbBYWywQDSUWI5Ysv0NV7dGU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260330075149eucas1p24e986266fcbfc884498f3d8564c82df7~hjyM-3__V2163321633eucas1p2c;
	Mon, 30 Mar 2026 07:51:49 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260330075148eusmtip2b83cad2e8b7d79f67c0dd97f94f0cfab~hjyMOQal-0750207502eusmtip2s;
	Mon, 30 Mar 2026 07:51:48 +0000 (GMT)
Message-ID: <1de09a99-bf8b-41c2-9dfa-c280877b99ff@samsung.com>
Date: Mon, 30 Mar 2026 09:51:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] drm/exynos/dma: Drop iommu_dma_init_domain() stub
To: Chen-Yu Tsai <wenst@chromium.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260326093039.1152770-1-wenst@chromium.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260330075149eucas1p24e986266fcbfc884498f3d8564c82df7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260326093817eucas1p24174d4b0d25c7966172c08e305fa8882
X-EPHeader: CA
X-CMS-RootMailID: 20260326093817eucas1p24174d4b0d25c7966172c08e305fa8882
References: <CGME20260326093817eucas1p24174d4b0d25c7966172c08e305fa8882@eucas1p2.samsung.com>
	<20260326093039.1152770-1-wenst@chromium.org>

On 26.03.2026 10:30, Chen-Yu Tsai wrote:
> Commit 1feda5eb77fc ("drm/exynos: Use selected dma_dev default iommu
> domain instead of a fake one") removed the code around creating a
> custom IOMMU domain, but forgot to remove the stub.
>
> Remove the iommu_dma_init_domain() stub as the function is no longer
> referenced, and was also made private to the IOMMU DMA code.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 6a6761935224..ccc6b852ee7d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -23,10 +23,6 @@
>  #define to_dma_iommu_mapping(dev) NULL
>  #endif
>  
> -#if !defined(CONFIG_IOMMU_DMA)
> -#define iommu_dma_init_domain(...) ({ -EINVAL; })
> -#endif
> -
>  #define EXYNOS_DEV_ADDR_START	0x20000000
>  #define EXYNOS_DEV_ADDR_SIZE	0x40000000
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

