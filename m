Return-Path: <SRS0=0l+h=6F=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D2AC2BA19
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Apr 2020 07:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67A1E2084D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Apr 2020 07:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="owgn6QwX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDUHdO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Apr 2020 03:33:14 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:44116 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbgDUHdN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 03:33:13 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200421073309epoutp04c1228b41e54fa6daf18eee01cc6795c9~HxVtZv9hZ1806818068epoutp04p
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Apr 2020 07:33:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200421073309epoutp04c1228b41e54fa6daf18eee01cc6795c9~HxVtZv9hZ1806818068epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587454389;
        bh=w3SuRjmp4aPVFd3nozM+GUtICtrjtgJnASmke3odM+0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=owgn6QwXSTq8eZYtYUdgqsLDv5RxaBKvlzc3sOsC//Vdd5IaRpCph0VuXF5Gjuixj
         hZ3mteLcdeY6vUxJNnt9OrXnK5sbJttlNUV/tNrZkI+37/KX9/zGfmW8tNjNnn7ZiO
         mID0Syj+if8GfuWgnI3TLNbJVs8wuFYX8CbZB8w4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200421073309epcas1p37b3d70a955937438bb6b88125a48d36d~HxVtH58GH2619926199epcas1p3R;
        Tue, 21 Apr 2020 07:33:09 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.156]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 495wJy2lDfzMqYkX; Tue, 21 Apr
        2020 07:33:06 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        1C.1D.04658.1B1AE9E5; Tue, 21 Apr 2020 16:33:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200421073304epcas1p10ac96bd66cc4c51c858e6801c7f3cfed~HxVonecv-2152721527epcas1p1c;
        Tue, 21 Apr 2020 07:33:04 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200421073304epsmtrp10de5cac3ce9a3395f963bcc1970e45c1~HxVompD2c0817708177epsmtrp1-;
        Tue, 21 Apr 2020 07:33:04 +0000 (GMT)
X-AuditID: b6c32a39-a81ff70000001232-64-5e9ea1b15b35
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        11.92.04158.0B1AE9E5; Tue, 21 Apr 2020 16:33:04 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200421073304epsmtip27c72ebfc4878b4da10262529a875c41f~HxVocplS22282922829epsmtip2f;
        Tue, 21 Apr 2020 07:33:04 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity
 check on Prime import
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <92cffe01-7a14-8fbd-90a3-dc171884c26d@samsung.com>
Date:   Tue, 21 Apr 2020 16:38:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200407134256.9129-3-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmru7GhfPiDDY/5rO4te4cq8XGGetZ
        La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7KtslITUxJLVJIzUvO
        T8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB2qukUJaYUwoUCkgsLlbSt7Mp
        yi8tSVXIyC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM449fkLe8Fd0Yr7DQIN
        jH2CXYycHBICJhLXDjxg72Lk4hAS2MEocf9ZNzOE84lR4vbnTqjMN0aJnQePs8G0XNkHU7WX
        UaJ5yiyoqveMEuvav7N0MXJwCAskSJzYrQPSICJQKjH3/zF2EJtZoJ1RYu3xeBCbTUBVYuKK
        +2BDeQXsJF4sucsCYrMAxR82X2MFGSMqECFx+msiRImgxMmZT8BKOAVsJfqObWKBGCkucevJ
        fCYIW16ieetssNskBM6wSXS+uccIcbSLxJLrb5ghbGGJV8e3sEPYUhIv+9vYIRqaGSUmzjjN
        BOF0MErcfXydBaLKWGL/0slMIBcxC2hKrN+lDxFWlNj5ey4jxGY+iXdfe8COlhDglehoE4Io
        UZI4dvEG1A0SEheWTIQGoofEwal9LBMYFWch+W0Wkn9mIflnFsLiBYwsqxjFUguKc9NTiw0L
        TJEjexMjOElqWe5gPHbO5xCjAAejEg/vBrF5cUKsiWXFlbmHGCU4mJVEeC20gEK8KYmVValF
        +fFFpTmpxYcYTYEhP5FZSjQ5H5jA80riDU2NjI2NLUwMzUwNDZXEeadez4kTEkhPLEnNTk0t
        SC2C6WPi4JRqYKyccr7GPfHN5aeznRKPva0Ucs6SyBRPkjZav/5Va+QJsfNv3mb+PFmwYfvi
        BC2tV4cr7TYF7ZppnVPSon187ZFAo9q/M04F6eeZx67LzM1TnLntiPRyS0HjiNiFz84Zvymu
        V7NfYlbsv1M761vpC+VHYQ7Pjf/Wzjm9PPO67TybN9/sWiVdCpVYijMSDbWYi4oTAbvCEImo
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSvO6GhfPiDHo3q1jcWneO1WLjjPWs
        Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdx2aSk5mSWpRbp2yVw
        ZZz6/IW94K5oxf0GgQbGPsEuRk4OCQETiSv7upm7GLk4hAR2M0o8v3KdpYuRAyghIbFlKweE
        KSxx+HAxSLmQwFtGiesn3EFsYYEEicmnbjGC2CICpRKv+u8zgoxhFmhnlDiyr4MdYuZhRolt
        fRPYQarYBFQlJq64zwZi8wrYSbxYcpcFxGYBij9svsYKYosKREg8336DEaJGUOLkzCdgNZwC
        thJ9xzaB2cwC6hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkbJ
        1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4KjQ0trBeOJE/CFGAQ5GJR7eDWLz4oRYE8uK
        K3MPMUpwMCuJ8FpoAYV4UxIrq1KL8uOLSnNSiw8xSnOwKInzyucfixQSSE8sSc1OTS1ILYLJ
        MnFwSjUwiricXhAUfL4mceJ8lpeLZA/4me/56KJw6YLSHfsks6sJi1rfqfr4Ba63ncG1kGNV
        meQqs6iW0O1/3aPnyz0X6r3K9O5slGf0n9bmurm5rl8eXjvVZak9Y9Vf1U9sZWevMG7b9Sbq
        zLUPmsylxZapS+qaFkbG+MmvL9rx6VEQh1XIxaPR+2JPKbEUZyQaajEXFScCAPE40mWGAgAA
X-CMS-MailID: 20200421073304epcas1p10ac96bd66cc4c51c858e6801c7f3cfed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
        <CGME20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada@eucas1p1.samsung.com>
        <20200407134256.9129-3-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 4. 7. 오후 10:42에 Marek Szyprowski 이(가) 쓴 글:
> Explicitly check if the imported buffer has been mapped as contiguous in
> the DMA address space, what is required by all Exynos DRM CRTC drivers.
> While touching this, set buffer flags depending on the availability of
> the IOMMU.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 36 +++++++++++++++++--------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 40514d3dcf60..9d4e4d321bda 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -458,6 +458,23 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  	int npages;
>  	int ret;
>  

(Optional) could you leave one comment here?
i.e., /* Check if DMA memory region from a exporter are mapped contiguously or not. */ 

> +	if (sgt->nents != 1) {

How about using below condition instead?
if (sgt->nents > 0) {

> +		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
> +		struct scatterlist *s;
> +		unsigned int i;
> +
> +		for_each_sg(sgt->sgl, s, sgt->nents, i) {
> +			if (!sg_dma_len(s))
> +				continue;

Isn't it an error case if sg_dma_len(s) is 0? I think length of s is 0 then it would be invalid because all entries of sgt should be mapped before sg_dma_len() is called.

Thanks,
Inki Dae

> +			if (sg_dma_address(s) != next_addr) {
> +				DRM_ERROR("buffer chunks must be mapped contiguously");
> +				return ERR_PTR(-EINVAL);
> +			}
> +			next_addr = sg_dma_address(s) + sg_dma_len(s);
> +		}
> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	exynos_gem = exynos_drm_gem_init(dev, attach->dmabuf->size);
>  	if (IS_ERR(exynos_gem)) {
>  		ret = PTR_ERR(exynos_gem);
> @@ -480,18 +497,15 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
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
