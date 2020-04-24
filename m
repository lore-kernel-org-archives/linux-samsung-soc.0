Return-Path: <SRS0=edqe=6I=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16F6C55186
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Apr 2020 08:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B303E20774
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Apr 2020 08:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qFgwSYSP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgDXIKU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Apr 2020 04:10:20 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:42189 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgDXIKU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Apr 2020 04:10:20 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200424081013epoutp0318cd1b43e6681a683710af639a9e8d44~Isx65vfec1654116541epoutp03b
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Apr 2020 08:10:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200424081013epoutp0318cd1b43e6681a683710af639a9e8d44~Isx65vfec1654116541epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587715813;
        bh=5Ng/1VW1yRyT5A/c2cIXa36LGrnoU4U90U/nSaZLs6E=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qFgwSYSPCBThXBbK3mj3uQE6GUK0Y1ej3YvGMlHoa3I0iWW1y0BUuVHQkEAhwZckp
         QlZyddY+JxMkMpKDmcul1fAL3fnUesmj+u/qY1+cBbPwj9wcoB3XYLSGr6L28DsKJD
         WaZ+98tGtPbdVC+B6kmdaBVseGoH6t/TlKDYFVbE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200424081012epcas1p2272218fb749ee40ce1ce90b1d29e8ad8~Isx6LxI2S3172031720epcas1p2Z;
        Fri, 24 Apr 2020 08:10:12 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 497n0L0M2LzMqYkZ; Fri, 24 Apr
        2020 08:10:10 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        8D.E7.04648.1EE92AE5; Fri, 24 Apr 2020 17:10:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200424081009epcas1p3df0b090309c76db0206951e8a6ce9ae1~Isx3Fic1h2434624346epcas1p3J;
        Fri, 24 Apr 2020 08:10:09 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200424081009epsmtrp2fa9febad8cd6c67ca5999dd8e84027a9~Isx3EwBJx1853618536epsmtrp21;
        Fri, 24 Apr 2020 08:10:09 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff70000001228-a3-5ea29ee13662
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        85.7A.25866.0EE92AE5; Fri, 24 Apr 2020 17:10:09 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200424081008epsmtip28cb561614f176a880eb5f18236c63932~Isx25CNpT2402224022epsmtip2D;
        Fri, 24 Apr 2020 08:10:08 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/exynos: gem: Get rid of the internal 'pages'
 array
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <2dba3dbf-7399-c2bf-267e-0cce4e407617@samsung.com>
Date:   Fri, 24 Apr 2020 17:15:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200407134256.9129-4-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmru7DeYviDJo+WlrcWneO1WLjjPWs
        Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdl22SkJqakFimk5iXn
        p2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA7VVSKEvMKQUKBSQWFyvp29kU
        5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGfM+LeAveByesWUBdYN
        jAuDuxg5OCQETCS2LGTsYuTiEBLYwShxrfE7C4TziVHi3Y69bF2MnEDOZ0aJnvtaIDZIw7oX
        36A6djFKfDt9gBnCec8o0XB+BQtIlbBAoMSV1sVMILaIQKnE3P/H2EFsZoF2Rom1x+NBbDYB
        VYmJK+6zgZzBK2AnMX29OkiYBSjctKeTGSQsKhAhcfprIkiYV0BQ4uTMJ2DTOQVsJRpuPGOF
        mCgucevJfCYIW16ieetssHMkBH6yS8yaMZMN4mgXiYtfTkHZwhKvjm9hh7ClJD6/A3kSpKGZ
        UWLijNNMEE4Ho8Tdx9dZIKqMJfYvncwEchGzgKbE+l36EGFFiZ2/5zJCbOaTePe1hxUSpLwS
        HW1CECVKEscu3mCEsCUkLiyZCHWDh8TRZ/tYJzAqzkLy2ywk/8xC8s8shMULGFlWMYqlFhTn
        pqcWGxYYI0f1JkZwgtQy38G44ZzPIUYBDkYlHt4bRQvjhFgTy4orcw8xSnAwK4nwxpQsihPi
        TUmsrEotyo8vKs1JLT7EaAoM+YnMUqLJ+cDknVcSb2hqZGxsbGFiaGZqaKgkzjv1ek6ckEB6
        YklqdmpqQWoRTB8TB6dUA6PxTb4q+QrtCzt3bT3n9CXswNm+tQf8+j9t+zRzhgkrj9GLNu5/
        /aEyYTf7bY6IB/0uzPjYvUny7BmGpLOS70WWlcvUhnGptG7Nnni82k/mptjk+OR3yxe+fFH1
        c8rDmc2RfhtOvJW/cuX2cpnZpS9a3lzbfE3Aq+Zfb4qR8NxNWlz1C/o+zPRSYinOSDTUYi4q
        TgQAuKrgPKYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSvO7DeYviDK6dZbS4te4cq8XGGetZ
        La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
        ypjxbwF7weX0iikLrBsYFwZ3MXJySAiYSKx78Y2xi5GLQ0hgB6PEs6NfgRwOoISExJatHBCm
        sMThw8UQJW8ZJc7vXc8I0issEChxpXUxE4gtIlAq8ar/PtgcZoF2Rokj+zrYIToOM0qca7oO
        VsUmoCoxccV9NpCpvAJ2EtPXq4OEWYDCTXs6mUFsUYEIiefbb4At4BUQlDg58wkLiM0pYCvR
        cOMZK4jNLKAu8WfeJWYIW1zi1pP5TBC2vETz1tnMExiFZiFpn4WkZRaSlllIWhYwsqxilEwt
        KM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAiOCi2tHYx7Vn3QO8TIxMF4iFGCg1lJhDemZFGc
        EG9KYmVValF+fFFpTmrxIUZpDhYlcd6vsxbGCQmkJ5akZqemFqQWwWSZODilGphOyC9d0HmJ
        /8Ar2YJJ/ArxX17OdZzzydnjAUcB57I9Jl8PRehIZrt4K/sft681kTnWNeXpMp9/WmZPdz2w
        uvw9/fmutSFXnG3WdzG1NjTw6c6SeWXy82rwH2bDS1tiXP99bVmZatct9un8Hue8OxfkP0Xo
        5m0yKZ4482mwpuKst53xG7xXbO/4bZqxfLF02T9P3y3eEcF3p8Q+el+2I7Du84YjkqdWTiuX
        C9OtEdCz38DxKFLbKXEV968fcwtY936pnxltu6+00zVeuYh12SeH0mUzbT+8uyK2PvyVhOHs
        T6Exp0t8BDwsbRtZ3v4WuRx4UMyY7fN/vqNn6l153tZ9arA4zrhPxLus6eq67WuVWIozEg21
        mIuKEwE7nhxf+QIAAA==
X-CMS-MailID: 20200424081009epcas1p3df0b090309c76db0206951e8a6ce9ae1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407134314eucas1p1895d868d9dbf5eee08c675dd10266d81
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
        <CGME20200407134314eucas1p1895d868d9dbf5eee08c675dd10266d81@eucas1p1.samsung.com>
        <20200407134256.9129-4-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 4. 7. 오후 10:42에 Marek Szyprowski 이(가) 쓴 글:
> Internal pages array and scatter-list for them is not really needed for
> anything. FBDev emulation can simply rely on the DMA-mapping framework
> to create a proper kernel mapping for the buffer, while all other buffer
> use cases don't really need that array at all.

Picked it up.

Thanks,
Inki Dae

> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  28 +----
>  drivers/gpu/drm/exynos/exynos_drm_gem.c   | 124 +++++++---------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h   |  13 +--
>  3 files changed, 42 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index e6ceaf36fb04..56a2b47e1af7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -76,7 +76,6 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
>  	struct fb_info *fbi;
>  	struct drm_framebuffer *fb = helper->fb;
>  	unsigned int size = fb->width * fb->height * fb->format->cpp[0];
> -	unsigned int nr_pages;
>  	unsigned long offset;
>  
>  	fbi = drm_fb_helper_alloc_fbi(helper);
> @@ -90,16 +89,6 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
>  
>  	drm_fb_helper_fill_info(fbi, helper, sizes);
>  
> -	nr_pages = exynos_gem->size >> PAGE_SHIFT;
> -
> -	exynos_gem->kvaddr = (void __iomem *) vmap(exynos_gem->pages, nr_pages,
> -				VM_MAP, pgprot_writecombine(PAGE_KERNEL));
> -	if (!exynos_gem->kvaddr) {
> -		DRM_DEV_ERROR(to_dma_dev(helper->dev),
> -			      "failed to map pages to kernel space.\n");
> -		return -EIO;
> -	}
> -
>  	offset = fbi->var.xoffset * fb->format->cpp[0];
>  	offset += fbi->var.yoffset * fb->pitches[0];
>  
> @@ -133,18 +122,7 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
>  
>  	size = mode_cmd.pitches[0] * mode_cmd.height;
>  
> -	exynos_gem = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG, size);
> -	/*
> -	 * If physically contiguous memory allocation fails and if IOMMU is
> -	 * supported then try to get buffer from non physically contiguous
> -	 * memory area.
> -	 */
> -	if (IS_ERR(exynos_gem) && is_drm_iommu_supported(dev)) {
> -		dev_warn(dev->dev, "contiguous FB allocation failed, falling back to non-contiguous\n");
> -		exynos_gem = exynos_drm_gem_create(dev, EXYNOS_BO_NONCONTIG,
> -						   size);
> -	}
> -
> +	exynos_gem = exynos_drm_gem_create(dev, EXYNOS_BO_WC, size, true);
>  	if (IS_ERR(exynos_gem))
>  		return PTR_ERR(exynos_gem);
>  
> @@ -229,12 +207,8 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
>  static void exynos_drm_fbdev_destroy(struct drm_device *dev,
>  				      struct drm_fb_helper *fb_helper)
>  {
> -	struct exynos_drm_fbdev *exynos_fbd = to_exynos_fbdev(fb_helper);
> -	struct exynos_drm_gem *exynos_gem = exynos_fbd->exynos_gem;
>  	struct drm_framebuffer *fb;
>  
> -	vunmap(exynos_gem->kvaddr);
> -
>  	/* release drm framebuffer and real buffer */
>  	if (fb_helper->fb && fb_helper->fb->funcs) {
>  		fb = fb_helper->fb;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 9d4e4d321bda..3c2732380517 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -17,28 +17,23 @@
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_gem.h"
>  
> -static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
> +static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>  {
>  	struct drm_device *dev = exynos_gem->base.dev;
> -	unsigned long attr;
> -	unsigned int nr_pages;
> -	struct sg_table sgt;
> -	int ret = -ENOMEM;
> +	unsigned long attr = 0;
>  
>  	if (exynos_gem->dma_addr) {
>  		DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "already allocated.\n");
>  		return 0;
>  	}
>  
> -	exynos_gem->dma_attrs = 0;
> -
>  	/*
>  	 * if EXYNOS_BO_CONTIG, fully physically contiguous memory
>  	 * region will be allocated else physically contiguous
>  	 * as possible.
>  	 */
>  	if (!(exynos_gem->flags & EXYNOS_BO_NONCONTIG))
> -		exynos_gem->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
> +		attr |= DMA_ATTR_FORCE_CONTIGUOUS;
>  
>  	/*
>  	 * if EXYNOS_BO_WC or EXYNOS_BO_NONCACHABLE, writecombine mapping
> @@ -46,61 +41,29 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
>  	 */
>  	if (exynos_gem->flags & EXYNOS_BO_WC ||
>  			!(exynos_gem->flags & EXYNOS_BO_CACHABLE))
> -		attr = DMA_ATTR_WRITE_COMBINE;
> +		attr |= DMA_ATTR_WRITE_COMBINE;
>  	else
> -		attr = DMA_ATTR_NON_CONSISTENT;
> -
> -	exynos_gem->dma_attrs |= attr;
> -	exynos_gem->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
> -
> -	nr_pages = exynos_gem->size >> PAGE_SHIFT;
> +		attr |= DMA_ATTR_NON_CONSISTENT;
>  
> -	exynos_gem->pages = kvmalloc_array(nr_pages, sizeof(struct page *),
> -			GFP_KERNEL | __GFP_ZERO);
> -	if (!exynos_gem->pages) {
> -		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate pages.\n");
> -		return -ENOMEM;
> -	}
> +	/* FBDev emulation requires kernel mapping */
> +	if (!kvmap)
> +		attr |= DMA_ATTR_NO_KERNEL_MAPPING;
>  
> +	exynos_gem->dma_attrs = attr;
>  	exynos_gem->cookie = dma_alloc_attrs(to_dma_dev(dev), exynos_gem->size,
>  					     &exynos_gem->dma_addr, GFP_KERNEL,
>  					     exynos_gem->dma_attrs);
>  	if (!exynos_gem->cookie) {
>  		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate buffer.\n");
> -		goto err_free;
> -	}
> -
> -	ret = dma_get_sgtable_attrs(to_dma_dev(dev), &sgt, exynos_gem->cookie,
> -				    exynos_gem->dma_addr, exynos_gem->size,
> -				    exynos_gem->dma_attrs);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(to_dma_dev(dev), "failed to get sgtable.\n");
> -		goto err_dma_free;
> -	}
> -
> -	if (drm_prime_sg_to_page_addr_arrays(&sgt, exynos_gem->pages, NULL,
> -					     nr_pages)) {
> -		DRM_DEV_ERROR(to_dma_dev(dev), "invalid sgtable.\n");
> -		ret = -EINVAL;
> -		goto err_sgt_free;
> +		return -ENOMEM;
>  	}
>  
> -	sg_free_table(&sgt);
> +	if (kvmap)
> +		exynos_gem->kvaddr = exynos_gem->cookie;
>  
>  	DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
>  			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
> -
>  	return 0;
> -
> -err_sgt_free:
> -	sg_free_table(&sgt);
> -err_dma_free:
> -	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
> -		       exynos_gem->dma_addr, exynos_gem->dma_attrs);
> -err_free:
> -	kvfree(exynos_gem->pages);
> -
> -	return ret;
>  }
>  
>  static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
> @@ -118,8 +81,6 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
>  	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
>  			(dma_addr_t)exynos_gem->dma_addr,
>  			exynos_gem->dma_attrs);
> -
> -	kvfree(exynos_gem->pages);
>  }
>  
>  static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
> @@ -203,7 +164,8 @@ static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
>  
>  struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
>  					     unsigned int flags,
> -					     unsigned long size)
> +					     unsigned long size,
> +					     bool kvmap)
>  {
>  	struct exynos_drm_gem *exynos_gem;
>  	int ret;
> @@ -237,7 +199,7 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
>  	/* set memory type and cache attribute from user side. */
>  	exynos_gem->flags = flags;
>  
> -	ret = exynos_drm_alloc_buf(exynos_gem);
> +	ret = exynos_drm_alloc_buf(exynos_gem, kvmap);
>  	if (ret < 0) {
>  		drm_gem_object_release(&exynos_gem->base);
>  		kfree(exynos_gem);
> @@ -254,7 +216,7 @@ int exynos_drm_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct exynos_drm_gem *exynos_gem;
>  	int ret;
>  
> -	exynos_gem = exynos_drm_gem_create(dev, args->flags, args->size);
> +	exynos_gem = exynos_drm_gem_create(dev, args->flags, args->size, false);
>  	if (IS_ERR(exynos_gem))
>  		return PTR_ERR(exynos_gem);
>  
> @@ -365,7 +327,7 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>  	else
>  		flags = EXYNOS_BO_CONTIG | EXYNOS_BO_WC;
>  
> -	exynos_gem = exynos_drm_gem_create(dev, flags, args->size);
> +	exynos_gem = exynos_drm_gem_create(dev, flags, args->size, false);
>  	if (IS_ERR(exynos_gem)) {
>  		dev_warn(dev->dev, "FB allocation failed.\n");
>  		return PTR_ERR(exynos_gem);
> @@ -442,11 +404,24 @@ struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
>  struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  {
>  	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
> -	int npages;
> +	struct drm_device *drm_dev = obj->dev;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
>  
> -	npages = exynos_gem->size >> PAGE_SHIFT;
> +	ret = dma_get_sgtable_attrs(to_dma_dev(drm_dev), sgt, exynos_gem->cookie,
> +				    exynos_gem->dma_addr, exynos_gem->size,
> +				    exynos_gem->dma_attrs);
> +	if (ret) {
> +		DRM_ERROR("failed to get sgtable, %d\n", ret);
> +		kfree(sgt);
> +		return ERR_PTR(ret);
> +	}
>  
> -	return drm_prime_pages_to_sg(exynos_gem->pages, npages);
> +	return sgt;
>  }
>  
>  struct drm_gem_object *
> @@ -455,8 +430,6 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  				     struct sg_table *sgt)
>  {
>  	struct exynos_drm_gem *exynos_gem;
> -	int npages;
> -	int ret;
>  
>  	if (sgt->nents != 1) {
>  		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
> @@ -476,26 +449,8 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  	}
>  
>  	exynos_gem = exynos_drm_gem_init(dev, attach->dmabuf->size);
> -	if (IS_ERR(exynos_gem)) {
> -		ret = PTR_ERR(exynos_gem);
> -		return ERR_PTR(ret);
> -	}
> -
> -	exynos_gem->dma_addr = sg_dma_address(sgt->sgl);
> -
> -	npages = exynos_gem->size >> PAGE_SHIFT;
> -	exynos_gem->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
> -	if (!exynos_gem->pages) {
> -		ret = -ENOMEM;
> -		goto err;
> -	}
> -
> -	ret = drm_prime_sg_to_page_addr_arrays(sgt, exynos_gem->pages, NULL,
> -					       npages);
> -	if (ret < 0)
> -		goto err_free_large;
> -
> -	exynos_gem->sgt = sgt;
> +	if (IS_ERR(exynos_gem))
> +		return ERR_CAST(exynos_gem);
>  
>  	/*
>  	 * Buffer has been mapped as contiguous into DMA address space,
> @@ -507,14 +462,9 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  	else
>  		exynos_gem->flags |= EXYNOS_BO_CONTIG;
>  
> +	exynos_gem->dma_addr = sg_dma_address(sgt->sgl);
> +	exynos_gem->sgt = sgt;
>  	return &exynos_gem->base;
> -
> -err_free_large:
> -	kvfree(exynos_gem->pages);
> -err:
> -	drm_gem_object_release(&exynos_gem->base);
> -	kfree(exynos_gem);
> -	return ERR_PTR(ret);
>  }
>  
>  void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index f00044c0b688..6ef001f890aa 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -21,20 +21,15 @@
>   * @base: a gem object.
>   *	- a new handle to this gem object would be created
>   *	by drm_gem_handle_create().
> - * @buffer: a pointer to exynos_drm_gem_buffer object.
> - *	- contain the information to memory region allocated
> - *	by user request or at framebuffer creation.
> - *	continuous memory region allocated by user request
> - *	or at framebuffer creation.
>   * @flags: indicate memory type to allocated buffer and cache attruibute.
>   * @size: size requested from user, in bytes and this size is aligned
>   *	in page unit.
>   * @cookie: cookie returned by dma_alloc_attrs
> - * @kvaddr: kernel virtual address to allocated memory region.
> + * @kvaddr: kernel virtual address to allocated memory region (for fbdev)
>   * @dma_addr: bus address(accessed by dma) to allocated memory region.
>   *	- this address could be physical address without IOMMU and
>   *	device address with IOMMU.
> - * @pages: Array of backing pages.
> + * @dma_attrs: attrs passed dma mapping framework
>   * @sgt: Imported sg_table.
>   *
>   * P.S. this object would be transferred to user as kms_bo.handle so
> @@ -48,7 +43,6 @@ struct exynos_drm_gem {
>  	void __iomem		*kvaddr;
>  	dma_addr_t		dma_addr;
>  	unsigned long		dma_attrs;
> -	struct page		**pages;
>  	struct sg_table		*sgt;
>  };
>  
> @@ -58,7 +52,8 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem);
>  /* create a new buffer with gem object */
>  struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
>  					     unsigned int flags,
> -					     unsigned long size);
> +					     unsigned long size,
> +					     bool kvmap);
>  
>  /*
>   * request gem object creation and buffer allocation as the size
> 
