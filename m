Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4109CC4363D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 04:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D24E223A6A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 04:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="seKWXUuA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgIVEq2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 00:46:28 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:29322 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728516AbgIVEq2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 00:46:28 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200922044623epoutp04451539bd15759bad5a2d5389a74984d4~3AaEKxx1N0521605216epoutp04O
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2020 04:46:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200922044623epoutp04451539bd15759bad5a2d5389a74984d4~3AaEKxx1N0521605216epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600749983;
        bh=0RSMhqnSj848xzXYx0pIxG/PFraxyfEQCNsvSVhzADU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=seKWXUuAPKpzrUFDDPADVkxNVZXBdH8PbC49eNSBh7H6ciligQPzQBWJ9Nz4RC8HG
         excEqDEwp7+htNWciNM0MokFOPHtPRFO2hnwP20X4vIRSnCW7PG2/FQ3wjpoJUAY5T
         sexFgZ/5H4AG9SxxLqhepJS/bT52742I9Wu0oeyI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20200922044623epcas1p4383c4c0e219c4cd8dce9fac2925904ef~3AaD3cMzL2756727567epcas1p4W;
        Tue, 22 Sep 2020 04:46:23 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.153]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4BwTKS6s3gzMqYmC; Tue, 22 Sep
        2020 04:46:20 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        CE.43.09577.791896F5; Tue, 22 Sep 2020 13:46:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200922044614epcas1p392707dcb757a6bcb03a1374d76ca1486~3AZ7xkJlp2607426074epcas1p3U;
        Tue, 22 Sep 2020 04:46:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200922044614epsmtrp22bb55d2401f2e8d0baca301e9139adba~3AZ7w55Bc1227812278epsmtrp2y;
        Tue, 22 Sep 2020 04:46:14 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-56-5f6981973f44
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C6.2F.08604.691896F5; Tue, 22 Sep 2020 13:46:14 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200922044614epsmtip1aba29b3b6e4ed34c58d94ae48283067f~3AZ7kGg8x1414614146epsmtip1L;
        Tue, 22 Sep 2020 04:46:14 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Drop local dma_parms
To:     Robin Murphy <robin.murphy@arm.com>, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <356c7033-d2dd-1d04-e4d5-adf01ea6e535@samsung.com>
Date:   Tue, 22 Sep 2020 13:52:55 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmru70xsx4g09P2C2ufH3PZvHi3kUW
        i7NNb9gtNj2+xmox4/w+JouDH54AWZNfsjmwe6yZt4bR4373cSaPzUvqPfq2rGL0+LxJLoA1
        KtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+gKJYWy
        xJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5yfq6VoYGBkSlQYUJ2
        xolvMQVzRSruPd3N0sB4XqCLkZNDQsBEomlLD3MXIxeHkMAORokFx35BOZ8YJZbfn8YC4Xxj
        lFgz7RE7TMu+1pmsILaQwF5GiedroyDs94wSu26Fg9jCAqYSF+7dBKsRESiVaNo4iQXEZhbI
        k7j46ylYnE1AVWLiivtsIDavgJ3E43VXmEBsFqD4yTmrweKiAhESx7sns0PUCEqcnPkEbA6n
        QLTEle7zzBAzxSVuPZnPBGHLSzRvnQ32gYRAJ4fEm4/tTBBHu0hMPryJGcIWlnh1fAvUM1IS
        n9/tZYNoaGaUmDjjNBOE08EocffxdRaIKmOJ/UsnAyU4gFZoSqzfpQ8RVpTY+XsuI8RmPol3
        X3tYQUokBHglOtqEIEqUJI5dvMEIYUtIXFgykQ3C9pBYsusI4wRGxVlIfpuF5J9ZSP6ZhbB4
        ASPLKkax1ILi3PTUYsMCU+TI3sQITqBaljsYp7/9oHeIkYmD8RCjBAezkgivmlF6vBBvSmJl
        VWpRfnxRaU5q8SFGU2BoT2SWEk3OB6bwvJJ4Q1MjY2NjCxNDM1NDQyVx3oe3FOKFBNITS1Kz
        U1MLUotg+pg4OKUamEoEjC1C2ru3X7Txqjfo/viZ7+nb6wJa/0Prji+Xm3p19v3p5nu/n5z2
        TPzoDm7PHUcV7W+J1H1OnfvOo+RRxM/DBzy4HF1KAx+2evlyJrr7HZOfaxbiOVGWcfkdm8xH
        jGX6viEf2iVOLDgjdG4n9++zd0+EnyzsPPTS6/R39hbDyG/HS2MmajJMW2N+Q7r5ffRDeZkn
        8TNXnv/95emNmoUzq0RF3j5yUn1j5PV8Vtku69olvTskb+u8ub2joO9alNWtTbIOGueZXmyy
        FNec5GKw+F/Sh36Z5eq975O3bloVeFjJ7eBRqYzj2hOO6e5d2OGz2quWZ/73353N9yY/WH3e
        tfVQXtsHlfuT7Ms3XfZVYinOSDTUYi4qTgQAW+axWCkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSnO60xsx4g9Xz1SyufH3PZvHi3kUW
        i7NNb9gtNj2+xmox4/w+JouDH54AWZNfsjmwe6yZt4bR4373cSaPzUvqPfq2rGL0+LxJLoA1
        issmJTUnsyy1SN8ugSvjxLeYgrkiFfee7mZpYDwv0MXIySEhYCKxr3UmaxcjF4eQwG5Gidu3
        FjJ3MXIAJSQktmzlgDCFJQ4fLgYpFxJ4yyjx4RgPiC0sYCpx4d5NVhBbRKBU4v6GtSwgNrNA
        nsTk7QuYIOrXMUpMmVMKYrMJqEpMXHGfDcTmFbCTeLzuClgNC1D85JzVYHFRgQiJlvt/2CFq
        BCVOznwCNpNTIFriSvd5Zoj56hJ/5l2CssUlbj2ZzwRhy0s0b53NPIFRaBaS9llIWmYhaZmF
        pGUBI8sqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgaNHS3MG4fdUHvUOMTByMhxgl
        OJiVRHjVjNLjhXhTEiurUovy44tKc1KLDzFKc7AoifPeKFwYJySQnliSmp2aWpBaBJNl4uCU
        amByKlZ5r/13GV/gZpWbshJSt+4JyE5cd9Lz+tZ1dWqvtj9a4Hw3y/PtQaGqy9w+M67WqhaU
        XTV0N/r8Oy2y9PWkH7xJjSHelhM33L1zXf0u97P0d+olrP+zs77de7ev5d/q6E6G7Ty9vR/6
        7kkuPXDn5bMDP1jXnetdcIvXcu/So7+eP3O9ZXFaZZNf6wzpxrPTI3e8lJPPP/LwfAX/1J2y
        ttlqwVaHqs5ffSR7fprM/9hTWuktz1dvW1LDKL9Y4uiRdz9rrPtPCBa+27gmTnGRf5Vt7f9/
        D5UK3+wtZgiadUw97I/klc7/yoUC0vEvPl1f9ujK7OfcWYUrZws6PeXefDrgdKi30N/pYgvu
        iU+NM1BiKc5INNRiLipOBADcTIThBQMAAA==
X-CMS-MailID: 20200922044614epcas1p392707dcb757a6bcb03a1374d76ca1486
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200903205219epcas1p23edcf79bd4959a5307ceecf0607c3d23
References: <CGME20200903205219epcas1p23edcf79bd4959a5307ceecf0607c3d23@epcas1p2.samsung.com>
        <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Robin,

As Marek said, he posted same patch[1] before so I merged it instead of you.
I totally forgot to merge it. :( Sorry for confusing.

[1] https://lore.kernel.org/dri-devel/20200707110827.3760-1-m.szyprowski@samsung.com/

Thanks,
Inki Dae

20. 9. 4. 오전 5:51에 Robin Murphy 이(가) 쓴 글:
> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> for platform devices"), struct platform_device already provides a
> dma_parms structure, so we can save allocating another one.
> 
> Also the DMA segment size is simply a size, not a bitmask.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 26 +------------------------
>  1 file changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 58b89ec11b0e..9f25a5ebbf7d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -31,23 +31,6 @@
>  #define EXYNOS_DEV_ADDR_START	0x20000000
>  #define EXYNOS_DEV_ADDR_SIZE	0x40000000
>  
> -static inline int configure_dma_max_seg_size(struct device *dev)
> -{
> -	if (!dev->dma_parms)
> -		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> -	if (!dev->dma_parms)
> -		return -ENOMEM;
> -
> -	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> -	return 0;
> -}
> -
> -static inline void clear_dma_max_seg_size(struct device *dev)
> -{
> -	kfree(dev->dma_parms);
> -	dev->dma_parms = NULL;
> -}
> -
>  /*
>   * drm_iommu_attach_device- attach device to iommu mapping
>   *
> @@ -69,9 +52,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>  		return -EINVAL;
>  	}
>  
> -	ret = configure_dma_max_seg_size(subdrv_dev);
> -	if (ret)
> -		return ret;
> +	dma_set_max_seg_size(subdrv_dev, UINT_MAX);
>  
>  	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>  		/*
> @@ -89,9 +70,6 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>  		ret = iommu_attach_device(priv->mapping, subdrv_dev);
>  	}
>  
> -	if (ret)
> -		clear_dma_max_seg_size(subdrv_dev);
> -
>  	return ret;
>  }
>  
> @@ -114,8 +92,6 @@ static void drm_iommu_detach_device(struct drm_device *drm_dev,
>  		arm_iommu_attach_device(subdrv_dev, *dma_priv);
>  	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
>  		iommu_detach_device(priv->mapping, subdrv_dev);
> -
> -	clear_dma_max_seg_size(subdrv_dev);
>  }
>  
>  int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
> 
