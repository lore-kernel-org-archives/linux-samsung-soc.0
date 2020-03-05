Return-Path: <SRS0=g11O=4W=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8436C3F2D1
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 07:56:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39126208C3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 07:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="k1o34oCt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgCEH4z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Mar 2020 02:56:55 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:51040 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgCEH4z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 02:56:55 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200305075652epoutp0143c02d2b13edf870cbe9b0f68fb02afd~5WWAG3rFx2662626626epoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2020 07:56:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200305075652epoutp0143c02d2b13edf870cbe9b0f68fb02afd~5WWAG3rFx2662626626epoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583395013;
        bh=ArpVCAdKy8Hgkz5KqbxSnrIGxHtVOFIMJSDU61w7xNU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=k1o34oCtxjdnFRwQ43Uw5JVoANLsTYL27ytODagQjr7CGmc9ncp5tqjRWEzvtkXNi
         e5jzU4cU/LBTZoPQT3tfjosBET6CaLHmIR+Afg++z9g9yJPuivzsVrB438LTquogsY
         HFy9tCgbHHPG+FggXkkovqsPhEFJNXJqnlSxHF0Y=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200305075652epcas1p19aa4f6ae0e8d3d3364f719626854025f~5WV-wgI5D0491704917epcas1p1i;
        Thu,  5 Mar 2020 07:56:52 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.157]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 48Y3433msKzMqYlr; Thu,  5 Mar
        2020 07:56:51 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        33.BF.57028.BB0B06E5; Thu,  5 Mar 2020 16:56:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20200305075643epcas1p4b44ea9e7c3e599c2bfc0c980f1dfcdc0~5WV3UxLNw2201622016epcas1p4R;
        Thu,  5 Mar 2020 07:56:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200305075643epsmtrp2bcd37b214c86eb37d7967ae6b63c10ac~5WV3UKLqM0621306213epsmtrp2X;
        Thu,  5 Mar 2020 07:56:43 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-ef-5e60b0bb8f9b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        9F.F3.06569.BB0B06E5; Thu,  5 Mar 2020 16:56:43 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200305075643epsmtip23d84fca7255836e8839a9de7b67cde73~5WV3Ho_Y-1610716107epsmtip2e;
        Thu,  5 Mar 2020 07:56:43 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Fix cleanup of IOMMU related objects
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <d392e79f-7209-d7f6-0f1a-3d3d6e4c4473@samsung.com>
Date:   Thu, 5 Mar 2020 17:01:06 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200302142709.15007-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e1u16u0uG1mB4vSW/4xycdNl/NJoZWQgRBEFrhu7jLFvbh3
        i4qwyCjxUS01l+UjMwzNtKFhoZUrfGCZglZqKyvL8o+EmRHZa9s18r/vOb/P93fO+f0Ogckq
        8EAix2BmOQOjo3A/8Z1HioiwztYDmZHDX5Fq/NagRHXb1iJRjczP4irbs/siVfNjp4/KVvoZ
        34KnvinqFaWebWtEqXP2tenYvtyEbJbRsFwQa8gyanIM2kRq5251slq5OZIOo2NVMVSQgdGz
        iVRKWnrY9hyduy4VdIjRWdypdIbnqYikBM5oMbNB2UbenEixJo3OFGsK5xk9bzFow7OM+jg6
        MnKT0g0eyM1+OvZHbHJsPNz624GfQD83FCJfAshoqJ0ZEhciP0JGdiAYGr2CCYELwWBB++LJ
        NwTPnaU+/ywlDROLVBeC4rpyiRDMIvhe58I9lJzcBk+LpjGP9ictUPWnx+vGyDMImnvVHo2T
        IWC98cbLS8kksFcXiD1aTG6AlxWlbi9BrCT3wsA8IyAroP/SlBfxdePW7i6JcOUqGJ+qEQl6
        HeS3X/Y2B+QTHJpdE4tdp0DP5JxE0HKY6W1bzAfC3JcuXDDkI7DaBkRCUIDA+f6FWKCi4MH1
        UpGnI4xUQMu9CCEdDHcXqpBQeTl8mS+WeBAgpVBwWiYgFPQMv0SCBhiqt+KCToVrH4sk51Fw
        5ZLZKpfMU7lknsr/hWuRuBEFsCZer2V52kQv/W478i5lqLIDlQ2mORBJIGqZ9FO5OlMmYQ7x
        R/QOBARG+UvlSndKqmGOHGU5o5qz6FjegZTul7digSuzjO4VN5jVtHJTVFSUKprerKRpapX0
        bYYiU0ZqGTOby7ImlvvnExG+gSdQWae2490xzj42XeMXe3Uy7111mOKm887IcSc2M7qre708
        Jn7HuE9ip6Wbs184NTH5qS4u7sypq1+baLlmqOTi/h+POxLq1yaHtFXVH24YF7nWNPUrPuTt
        mYvHo+tGXy087NWtrkn/bevbupB1LlbqDCj89b1emnEwpC/U5/VYykkXJeazGToU43jmL16T
        ijWqAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvO7uDQlxBr9WSFrcWneO1WLjjPWs
        Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdx2aSk5mSWpRbp2yVw
        ZZy9+Z+l4JBOxYZ/h9gaGP+odDFyckgImEj0Lr/N3MXIxSEksJtRovflQdYuRg6ghITElq0c
        EKawxOHDxRAlbxkluo8+ZQXpFRZwlTjb/ZwZxBYRKJV41X+fEaSIWaCdUeLIvg52iI6JjBKb
        P/ewgFSxCahKTFxxnw3E5hWwk9g0rwMsziKgInFj+mSwSaICERLPt99ghKgRlDg58wlYDSdQ
        /cSDe8E2MwuoS/yZd4kZwhaXuPVkPhOELS/RvHU28wRGoVlI2mchaZmFpGUWkpYFjCyrGCVT
        C4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCI0NLawfjiRPxhxgFOBiVeHgdZsTHCbEmlhVX
        5h5ilOBgVhLhFTYFCvGmJFZWpRblxxeV5qQWH2KU5mBREueVzz8WKSSQnliSmp2aWpBaBJNl
        4uCUamAUV3aNiQu/tbRd/8rTI2rTJwrk3Cz5oyF3PLxR98SP0uDZchUfP6cyH1lRJlt74Lln
        j8nPGKvLwdr2uhtdvJb/eP5csnf92Z8JfufYn76/OfeE2tMre99P/rJpQo6mgIjalaICPlXl
        nu+PzeQKvXOZLn+avvzG5Y6ff5h3zJBU6X8e+Virie2hEktxRqKhFnNRcSIAAqOH0IgCAAA=
X-CMS-MailID: 20200305075643epcas1p4b44ea9e7c3e599c2bfc0c980f1dfcdc0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200302142822eucas1p1749e7cd54ad0b8657b753a8b720ccba2
References: <CGME20200302142822eucas1p1749e7cd54ad0b8657b753a8b720ccba2@eucas1p1.samsung.com>
        <20200302142709.15007-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

20. 3. 2. 오후 11:27에 Marek Szyprowski 이(가) 쓴 글:
> Store the IOMMU mapping created by device core of each Exynos DRM
> sub-device and restore it when Exynos DRM driver is unbound. This fixes
> IOMMU initialization failure for the second time when deferred probe is
> triggered from the bind() callback of master's compound DRM driver.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +++--
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_dma.c       | 22 +++++++++++--------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 +++--
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 +++--
>  drivers/gpu/drm/exynos/exynos_mixer.c         |  7 ++++--
>  11 files changed, 47 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 8428ae12dfa5..1f79bc2a881e 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -55,6 +55,7 @@ static const char * const decon_clks_name[] = {
>  struct decon_context {
>  	struct device			*dev;
>  	struct drm_device		*drm_dev;
> +	void				*dma_priv;
>  	struct exynos_drm_crtc		*crtc;
>  	struct exynos_drm_plane		planes[WINDOWS_NR];
>  	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -644,7 +645,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>  
>  	decon_clear_channels(ctx->crtc);
>  
> -	return exynos_drm_register_dma(drm_dev, dev);
> +	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>  }
>  
>  static void decon_unbind(struct device *dev, struct device *master, void *data)
> @@ -654,7 +655,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
>  	decon_atomic_disable(ctx->crtc);
>  
>  	/* detach this sub driver from iommu mapping if supported. */
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>  }
>  
>  static const struct component_ops decon_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index ff59c641fa80..1eed3327999f 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -40,6 +40,7 @@
>  struct decon_context {
>  	struct device			*dev;
>  	struct drm_device		*drm_dev;
> +	void				*dma_priv;
>  	struct exynos_drm_crtc		*crtc;
>  	struct exynos_drm_plane		planes[WINDOWS_NR];
>  	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -127,13 +128,13 @@ static int decon_ctx_initialize(struct decon_context *ctx,
>  
>  	decon_clear_channels(ctx->crtc);
>  
> -	return exynos_drm_register_dma(drm_dev, ctx->dev);
> +	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
>  }
>  
>  static void decon_ctx_remove(struct decon_context *ctx)
>  {
>  	/* detach this sub driver from iommu mapping if supported. */
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>  }
>  
>  static u32 decon_calc_clkdiv(struct decon_context *ctx,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 9ebc02768847..482bec7756fa 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -58,7 +58,7 @@ static inline void clear_dma_max_seg_size(struct device *dev)
>   * mapping.
>   */
>  static int drm_iommu_attach_device(struct drm_device *drm_dev,
> -				struct device *subdrv_dev)
> +				struct device *subdrv_dev, void **dma_priv)
>  {
>  	struct exynos_drm_private *priv = drm_dev->dev_private;
>  	int ret;
> @@ -74,7 +74,8 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>  		return ret;
>  
>  	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> -		if (to_dma_iommu_mapping(subdrv_dev))
> +		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
> +		if (*dma_priv)
>  			arm_iommu_detach_device(subdrv_dev);
>  
>  		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
> @@ -98,19 +99,21 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>   * mapping
>   */
>  static void drm_iommu_detach_device(struct drm_device *drm_dev,
> -				struct device *subdrv_dev)
> +				    struct device *subdrv_dev, void **dma_priv)
>  {
>  	struct exynos_drm_private *priv = drm_dev->dev_private;
>  
> -	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
> +	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>  		arm_iommu_detach_device(subdrv_dev);
> -	else if (IS_ENABLED(CONFIG_IOMMU_DMA))
> +		arm_iommu_attach_device(subdrv_dev, *dma_priv);

I don't see why arm_iommu_attach_device function should be called again at drm_iommu_detach_device function.
I think it should be no problem without arm_iommu_attach_device call.
If there is any problem without arm_iommu_attach_device function call then maybe getting wrong somewhere but not here.

Thanks,
Inki Dae

> +	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
>  		iommu_detach_device(priv->mapping, subdrv_dev);
>  
>  	clear_dma_max_seg_size(subdrv_dev);
>  }
