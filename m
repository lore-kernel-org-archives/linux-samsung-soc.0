Return-Path: <SRS0=edqe=6I=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F232CC2BA1A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Apr 2020 08:10:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B30C720774
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Apr 2020 08:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ICCdAY1u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgDXIKI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Apr 2020 04:10:08 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:35103 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgDXIKH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Apr 2020 04:10:07 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200424081005epoutp04eb30ea1c4b90eb44a6e1b8b48ea7c881~IsxzppnW_0629106291epoutp04v
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Apr 2020 08:10:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200424081005epoutp04eb30ea1c4b90eb44a6e1b8b48ea7c881~IsxzppnW_0629106291epoutp04v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587715805;
        bh=A6VUgBxzrbnh+uERvwiTRs8jEFtlcgl/xVYDofAJoD4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ICCdAY1uO98/o7iUA+ZqYeiGeHquQ+QdC8AFfapvj2j52oDte2GWlUl6ZyqmNRbJG
         DVmWv0IPq1tWpETTjH5k03GgC0o8/NNXLKbBirFAS7mqJI+HiUbYlxWoOt7MazQUxW
         Sia5/zYLHtCcOBH3s4L3WOONiXLS6IrkcYrgQMGE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200424081004epcas1p17de230ee0c0474e2a393983559fcab36~IsxyekpgO3124431244epcas1p1E;
        Fri, 24 Apr 2020 08:10:04 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.155]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 497n0C0ZwWzMqYly; Fri, 24 Apr
        2020 08:10:03 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        82.4F.04544.6DE92AE5; Fri, 24 Apr 2020 17:09:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200424080957epcas1p1cd91d0b2bdf474ff4308669f6fd677eb~Isxsu3pTM2580025800epcas1p1h;
        Fri, 24 Apr 2020 08:09:57 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200424080957epsmtrp160904a5e33f2743d8a96e33b5b27ed98~IsxsuLVlO1787117871epsmtrp1n;
        Fri, 24 Apr 2020 08:09:57 +0000 (GMT)
X-AuditID: b6c32a36-7ffff700000011c0-ec-5ea29ed6d9f6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        97.6A.25866.5DE92AE5; Fri, 24 Apr 2020 17:09:57 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200424080957epsmtip15a981c8ed33cd406f1abe61db5210885~Isxsh9hxm2307823078epsmtip1U;
        Fri, 24 Apr 2020 08:09:57 +0000 (GMT)
Subject: Re: [PATCH v2 2/3] drm/exynos: gem: rework scatter-list contiguity
 check on prime import
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <5688f66c-e83c-4741-34ee-2f02113f022a@samsung.com>
Date:   Fri, 24 Apr 2020 17:15:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200422114059.29477-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmnu61eYviDJrOiVncWneO1WLjjPWs
        Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdl22SkJqakFimk5iXn
        p2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA7VVSKEvMKQUKBSQWFyvp29kU
        5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGfM29bFWPBZpGLT/FUs
        DYyLBLoYOTkkBEwk9l1ez9TFyMUhJLCDUeLP3rPMEM4nRolZq++xQjifGSUa5+1lhWl5OeEl
        VMsuRolT376zgSSEBN4zSrx7Zw5iCwskS3SsugHWICJQKjH3/zF2EJtZoJ1RYu3xeBCbTUBV
        YuKK+2C9vAJ2ElMu9jCD2CxA8ZZ9e1m6GDk4RAUiJE5/TYQoEZQ4OfMJC4jNCVS+7cB8JoiR
        4hK3nsDY8hLNW2eDfSAh8JVd4uOLm1BHu0jMPnEByhaWeHV8CzuELSXxsr+NHaKhmVFi4ozT
        TBBOB6PE3cfXWSCqjCX2L53MBHIRs4CmxPpd+hBhRYmdv+cyQmzmk3j3tYcVpERCgFeio00I
        okRJ4tjFG4wQtoTEhSUT2SBsD4mjF3pYJjAqzkLy2ywk/8xC8s8shMULGFlWMYqlFhTnpqcW
        GxYYIcf2JkZwmtQy28G46JzPIUYBDkYlHt4bRQvjhFgTy4orcw8xSnAwK4nwxpQsihPiTUms
        rEotyo8vKs1JLT7EaAoM+YnMUqLJ+cAUnlcSb2hqZGxsbGFiaGZqaKgkzjv1ek6ckEB6Yklq
        dmpqQWoRTB8TB6dUA+Oezfo/bqyN9dRrfHGBzW9rnFr6I7aqRW8vbHN9L6gbuZFnxVT91NDZ
        qzY+F7FdPYn5tvbOyTZfQ+rLFZOzGma7HFQoUBXvjtignibgqDO51+rchno935Jz5v1pZbz/
        Cy965u2tkZ2WeMVObU2YdNrFXXIm/GYu/7v5X71fudMjPkKUOTxzlxJLcUaioRZzUXEiAKTv
        urupAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnO7VeYviDP4uMbW4te4cq8XGGetZ
        La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
        ypi3rYux4LNIxab5q1gaGBcJdDFyckgImEi8nPCSqYuRi0NIYAejxNLdk4AcDqCEhMSWrRwQ
        prDE4cPFIOVCAm8ZJc595QSxhQWSJTpW3WAFsUUESiVe9d9nBBnDLNDOKHFkXwc7xMxjjBLP
        D95iAqliE1CVmLjiPhuIzStgJzHlYg8ziM0CFG/Zt5cFxBYViJB4vv0GI0SNoMTJmU/A4pxA
        9dsOzAebwyygLvFn3iVmCFtc4tYTmLi8RPPW2cwTGIVmIWmfhaRlFpKWWUhaFjCyrGKUTC0o
        zk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4LLa0djHtWfdA7xMjEwXiIUYKDWUmEN6ZkUZwQ
        b0piZVVqUX58UWlOavEhRmkOFiVx3q+zFsYJCaQnlqRmp6YWpBbBZJk4OKUamDJ+qJ194xDA
        Psn+5NNFvxsfXd65t1Pqzc58vdcC1qcLepr73rwL8P+TcXZn8MKMWddvyb68vLQi6OU24XUP
        /i+ffzPXhknSdOeZUJ97Qtq9fLX/ZR6wmvNsPFXLypd6KUa9Qn2X/rQ7HyPZtC1EGXv6E4x2
        eMk9P7VdZX3yLm2PtZPW/HvW+81lq2uNNVd201X37KNKVzP52z4aZdiJVZ/s7z+V/m9Jf87a
        0L1fNHmXFXZ/9eed7iD+/k1ltcCOxEqV67MvB798m9FmKNlxSv7wYrvJi1QKA9kNuhgfceV+
        YtzxTn9+tNAnMab2iOCjFxXdr24ovuHYsPl/hYLGIfe3gZ5RrKZ3Ki7ZLsm8rMRSnJFoqMVc
        VJwIALHzLOL6AgAA
X-CMS-MailID: 20200424080957epcas1p1cd91d0b2bdf474ff4308669f6fd677eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96
References: <4cfed490-e45c-e559-bfa3-c616e3c00029@samsung.com>
        <CGME20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96@eucas1p2.samsung.com>
        <20200422114059.29477-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 4. 22. 오후 8:40에 Marek Szyprowski 이(가) 쓴 글:
> Explicitly check if the imported buffer has been mapped as contiguous in
> the DMA address space, what is required by all Exynos DRM CRTC drivers.
> While touching this, set buffer flags depending on the availability of
> the IOMMU.

Picked it up.

Thanks,
Inki Dae

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - reworked a check for sgt->nents
> - added a comment about a scatter-list contiguity check
> - removed additional 'return ERR_PTR(-EINVAL)' accidentaly left after debugging
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 42 ++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 40514d3..f136efb 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -458,6 +458,29 @@ struct drm_gem_object *
>  	int npages;
>  	int ret;
>  
> +	if (sgt->nents < 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	/*
> +	 * Check if the provided buffer has been mapped as contiguous
> +	 * into DMA address space.
> +	 */
> +	if (sgt->nents > 1) {
> +		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
> +		struct scatterlist *s;
> +		unsigned int i;
> +
> +		for_each_sg(sgt->sgl, s, sgt->nents, i) {
> +			if (!sg_dma_len(s))
> +				break;
> +			if (sg_dma_address(s) != next_addr) {
> +				DRM_ERROR("buffer chunks must be mapped contiguously");
> +				return ERR_PTR(-EINVAL);
> +			}
> +			next_addr = sg_dma_address(s) + sg_dma_len(s);
> +		}
> +	}
> +
>  	exynos_gem = exynos_drm_gem_init(dev, attach->dmabuf->size);
>  	if (IS_ERR(exynos_gem)) {
>  		ret = PTR_ERR(exynos_gem);
> @@ -480,18 +503,15 @@ struct drm_gem_object *
>  
>  	exynos_gem->sgt = sgt;
>  
> -	if (sgt->nents == 1) {
> -		/* always physically continuous memory if sgt->nents is 1. */
> -		exynos_gem->flags |= EXYNOS_BO_CONTIG;
> -	} else {
> -		/*
> -		 * this case could be CONTIG or NONCONTIG type but for now
> -		 * sets NONCONTIG.
> -		 * TODO. we have to find a way that exporter can notify
> -		 * the type of its own buffer to importer.
> -		 */
> +	/*
> +	 * Buffer has been mapped as contiguous into DMA address space,
> +	 * but if there is IOMMU, it can be either CONTIG or NONCONTIG.
> +	 * We assume a simplified logic below:
> +	 */
> +	if (is_drm_iommu_supported(dev))
>  		exynos_gem->flags |= EXYNOS_BO_NONCONTIG;
> -	}
> +	else
> +		exynos_gem->flags |= EXYNOS_BO_CONTIG;
>  
>  	return &exynos_gem->base;
>  
> 
