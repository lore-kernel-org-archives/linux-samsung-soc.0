Return-Path: <SRS0=E6Gx=7O=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0492EC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Jun 2020 08:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF88820734
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Jun 2020 08:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oEjgJ6+a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgFAIEt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Jun 2020 04:04:49 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:60018 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgFAIEt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Jun 2020 04:04:49 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200601080446epoutp03ef7b2d9e7cff306e0b6adecc249e395f~UXOAzpi422962729627epoutp03O
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Jun 2020 08:04:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200601080446epoutp03ef7b2d9e7cff306e0b6adecc249e395f~UXOAzpi422962729627epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1590998686;
        bh=DkpgRqIf7pXJABFz/brWnnzOpjUBWmAGqnApiu+xjAs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=oEjgJ6+ahL3S5MxgBPSWIkYOStDA+X/LS5aj4Q7OvriEf2In2M0LnEzhMZcphS3nq
         bhofuhJ6LW18dAssJxXxYjrNonBE1VonSiZIXhp4GyI1FIeJIvzLd+MLFFNQ9qO9PP
         YgAMbNee8Fc9rzoPox9eZaEzauAtNPk02797blDw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200601080446epcas1p130af977c5b1d160aad84841bc6beaff4~UXOAgK11U0318003180epcas1p11;
        Mon,  1 Jun 2020 08:04:46 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.155]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 49b74T3B4zzMqYkb; Mon,  1 Jun
        2020 08:04:41 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        E2.F3.29173.996B4DE5; Mon,  1 Jun 2020 17:04:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200601080441epcas1p19a487695b46f51ebb3dc7ceb3f013de7~UXN73EiPS2864428644epcas1p1X;
        Mon,  1 Jun 2020 08:04:41 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200601080441epsmtrp1fd18a6653defa42a00594232c2adf77d~UXN72adpw1123211232epsmtrp1t;
        Mon,  1 Jun 2020 08:04:41 +0000 (GMT)
X-AuditID: b6c32a37-9cdff700000071f5-a5-5ed4b6997fc7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D0.B3.08303.896B4DE5; Mon,  1 Jun 2020 17:04:40 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200601080440epsmtip26d67ccbeb7a0a96d2963c711d1cc7e17~UXN7pszqf0158401584epsmtip2h;
        Mon,  1 Jun 2020 08:04:40 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Properly propagate return value in
 drm_iommu_attach_device()
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <87a6e490-e198-3ca4-a60a-6670b4b06e27@samsung.com>
Date:   Mon, 1 Jun 2020 17:10:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200522060356.25153-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdljTQHfmtitxBn1PRS1urTvHarFxxnpW
        iytf37NZzDi/j8li7ZG77BYzJr9kc2DzuN99nMmjb8sqRo/Pm+QCmKOybTJSE1NSixRS85Lz
        UzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA9ioplCXmlAKFAhKLi5X07WyK
        8ktLUhUy8otLbJVSC1JyCiwL9IoTc4tL89L1kvNzrQwNDIxMgQoTsjP6n7cwF3zkrNj/5gJz
        A2MPRxcjJ4eEgInEt5WnWEFsIYEdjBLLJgtA2J8YJV4d5Oli5AKyPzNKHFy2hhGm4c6X1YwQ
        iV2MEi9+vGCGcN4zSlx+fI8FpEpYIF7i+p5JYGNFBEol5v4/xg5iMwu0M0qsPR4PYrMJqEpM
        XHGfDcTmFbCT+N56mgnEZhFQkWj+/hionoNDVCBC4vTXRIgSQYmTM5+wgIQ5gcqvT+aHmCgu
        cevJfCYIW16ieetssHMkBH6yS/x/tpIZ4mgXif9XG5ggbGGJV8e3sEPYUhIv+9vYIRqaGSUm
        zgC5AcTpYJS4+/g6C0SVscT+pZOZQDYzC2hKrN+lDxFWlNj5ey4jxGY+iXdfe1hBSiQEeCU6
        2oQgSpQkjl28AQ04CYkLSyayQdgeEk+mNDNNYFScheS1WUj+mYXkn1kIixcwsqxiFEstKM5N
        Ty02LDBGjutNjOAUqWW+g3Ha2w96hxiZOBgPMUpwMCuJ8E5WvxQnxJuSWFmVWpQfX1Sak1p8
        iNEUGNYTmaVEk/OBSTqvJN7Q1MjY2NjCxNDM1NBQSZzX1+pCnJBAemJJanZqakFqEUwfEwen
        VAMTf3T7HKam6h0tZlKfPqx0XNWcGpv5zkl6T7TdhtO7/8/0cS3VieUxfZS1gPV/huGdnHmy
        RxLMvrJ9NWCdJndbq742tPHVjMsTBG6vnHmSKy9rV8tnrkTrplXnNDOlxdcw3zwxKWPToucN
        HPduKT/YyMDGmPjKhDlpatw3pVZn6RcNv69+fhuZetCzimvu/1fVQhfaGnbnOty2tb/vNOvR
        0vtPCnxeWea2VvVbyEk9fH0uIPzJuUqLldeTg0pvX5x5iSu4dXUtt87r9NQ7mX1bLTb37L4Y
        M6M07MCy+59eaQcKma65/cDiht6nQrE3qv9+WCqoH/06636GwP1FMgvW/93wp8BiR1oJR19B
        7b95SizFGYmGWsxFxYkAgTjrghoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSvO6MbVfiDGb+tbK4te4cq8XGGetZ
        La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
        yuh/3sJc8JGzYv+bC8wNjD0cXYycHBICJhJ3vqxm7GLk4hAS2MEocWLnOvYuRg6ghITElq0c
        EKawxOHDxRAlbxkl9s99ygLSKywQL3F9zyRWEFtEoFTiVf99sDnMAu2MEkf2dbBDdExklDg/
        7xo7SBWbgKrExBX32UBsXgE7ie+tp5lAbBYBFYnm74/BakQFIiSeb7/BCFEjKHFy5hMWkCs4
        geqvT+YHCTMLqEv8mXeJGcIWl7j1ZD4ThC0v0bx1NvMERqFZSLpnIWmZhaRlFpKWBYwsqxgl
        UwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxguNCS2sH455VH/QOMTJxMB5ilOBgVhLhnax+
        KU6INyWxsiq1KD++qDQntfgQozQHi5I479dZC+OEBNITS1KzU1MLUotgskwcnFINTPzuS3J+
        tSZe+XMzp33/34iKsPy2n7wpUjs7dNRPKz72Nn60pyzObNvsdEfNByZGoV/1ezrUnnwJMuVX
        V2+IeeRTNjGU57Xzwxj/2innLhTnfRff5L1HViOsvMKlU0HguoWmxYuzTFnn5ts1uUhPE2F9
        8GBN/tVZm1+JzfbbUNdmUN0eUTKfqb5Yiv9UGv+pt6s3FrFIut/XY7uvb72k+prLxHSR32st
        vy+MP37grcylZm3L55phm19NKm/w3G69N6iE/ebkjFn+p2cyGSxonFDaaC4Zfe/PYc4LvlPu
        sN/bdaDuZtP7iw4c4pNTwmTuziq272Trz7n8+Lf1PsGGBOk96zLOX1y3/HCc329HJZbijERD
        Leai4kQAqh29AfoCAAA=
X-CMS-MailID: 20200601080441epcas1p19a487695b46f51ebb3dc7ceb3f013de7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0
References: <CGME20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0@eucas1p1.samsung.com>
        <20200522060356.25153-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 5. 22. 오후 3:03에 Marek Szyprowski 이(가) 쓴 글:
> Propagate the proper error codes from the called functions instead of
> unconditionally returning 0.
> 

Picked it up.

Thanks,
Inki Dae

> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index d3fe6c1e6688..5887f7f52f96 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -44,7 +44,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>  				struct device *subdrv_dev, void **dma_priv)
>  {
>  	struct exynos_drm_private *priv = drm_dev->dev_private;
> -	int ret;
> +	int ret = 0;
>  
>  	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
>  		DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IOMMU\n",
> @@ -69,7 +69,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>  		ret = iommu_attach_device(priv->mapping, subdrv_dev);
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> 
