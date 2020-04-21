Return-Path: <SRS0=0l+h=6F=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C41C2BA19
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Apr 2020 06:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81CE6218AC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Apr 2020 06:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="I0VikbBL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgDUGmx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Apr 2020 02:42:53 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:60707 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgDUGmw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 02:42:52 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200421064249epoutp020c36ad3116abb00dcc67a78db62fd6d9~HwpwteD932430924309epoutp02a
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Apr 2020 06:42:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200421064249epoutp020c36ad3116abb00dcc67a78db62fd6d9~HwpwteD932430924309epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587451369;
        bh=ti6gy7+fppWdn9AAqbqwoO6SZ6gbjPALBm9P8FNcdSY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=I0VikbBLc6SQptRvTsW12jjM5zv3BJ+vYKlVm8SW9nmsjV2pl5x8D7Qq9svy6jJyP
         y7eD9BAwDEihjKoLsPedWhOUwdQEBZqUQ5LnWdlS1xCX5eFxwP7OglZr2WtC15huRr
         yh0CNJdKfjIuw5ei9FFKqYAyzQwUkNS/6z1xt4sI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20200421064249epcas1p4b28273e1834409f7c6e285daf35c2412~HwpwSr8-B1394813948epcas1p4_;
        Tue, 21 Apr 2020 06:42:49 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.158]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 495vBt3FRVzMqYlv; Tue, 21 Apr
        2020 06:42:46 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        B7.ED.04744.CD59E9E5; Tue, 21 Apr 2020 15:42:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20200421064236epcas1p4a1e03e246b97b8e01c7923d3dd82396d~HwpkMFoIz0594905949epcas1p4n;
        Tue, 21 Apr 2020 06:42:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200421064236epsmtrp12299f2592f44a20442326e0b292a7862~HwpkKznP41349313493epsmtrp1y;
        Tue, 21 Apr 2020 06:42:36 +0000 (GMT)
X-AuditID: b6c32a38-253ff70000001288-94-5e9e95dca6c2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C3.21.04024.CD59E9E5; Tue, 21 Apr 2020 15:42:36 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200421064235epsmtip25a8e4bf1d9357f0efad5d1b8996f0ffa~Hwpj6sA7I2936729367epsmtip2s;
        Tue, 21 Apr 2020 06:42:35 +0000 (GMT)
Subject: Re: [PATCH 1/3] drm/exynos: gem: Remove dead-code
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <1412c14b-02d3-5334-8916-887f69b431c7@samsung.com>
Date:   Tue, 21 Apr 2020 15:47:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200407134256.9129-2-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmru6dqfPiDN5MMre4te4cq8XGGetZ
        La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7KtslITUxJLVJIzUvO
        T8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB2qukUJaYUwoUCkgsLlbSt7Mp
        yi8tSVXIyC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM64d/sjU0GveMWlqdPY
        GxiXC3cxcnJICJhIfFv6kxnEFhLYwSgx5WgMhP2JUeLmAt4uRi4g+xujxKPeJUwwDUuX/GWC
        SOxllHhy+ScLhPOeUWLit1MsIFXCAlYS6++9YwWxRQRKJeb+P8YOYjMLtDNKrD0eD2KzCahK
        TFxxnw3E5hWwk7g9fS6YzQIU71x9DmgDB4eoQITE6a+JECWCEidnPgEbzylgK3H7zWFGiJHi
        EreezGeCsOUlmrfOZga5R0LgDJvEjFnP2SGudpGYdWA1C4QtLPHq+BaouJTEy/42doiGZqAH
        ZpxmgnA6GCXuPr4O1WEssX/pZLCLmAU0Jdbv0ocIK0rs/D0X6go+iXdfe1hBSiQEeCU62oQg
        SpQkjl28wQhhS0hcWDKRDcL2kNjV3cY+gVFxFpLfZiH5ZxaSf2YhLF7AyLKKUSy1oDg3PbXY
        sMAEObI3MYKTpJbFDsY953wOMQpwMCrx8G4QmxcnxJpYVlyZe4hRgoNZSYTXQgsoxJuSWFmV
        WpQfX1Sak1p8iNEUGPITmaVEk/OBCTyvJN7Q1MjY2NjCxNDM1NBQSZx36vWcOCGB9MSS1OzU
        1ILUIpg+Jg5OqQbGatHZie61p1Xzizpuaa1yu+SZ4mEk8qp+BoPSlTW/+Tn8wrJNFU5bPRCx
        rjEN4yjc+3nPvPBphxfNOrb3Rqnmmn0MRhn8Td8miiucYp3IGy7FVn5t9zVGqaW39mTx5x9R
        evbWS/Ds32e/D05wF7/2dQbvYduGmSd+Rnf9C96fubv45/X2D9MdlViKMxINtZiLihMBarJ5
        z6gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvO6dqfPiDLZ2cljcWneO1WLjjPWs
        Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdx2aSk5mSWpRbp2yVw
        Zdy7/ZGpoFe84tLUaewNjMuFuxg5OSQETCSWLvnL1MXIxSEksJtRYs/bV4xdjBxACQmJLVs5
        IExhicOHiyFK3jJKHJj0lQmkV1jASmL9vXesILaIQKnEq/77jCBFzALtjBJH9nWwQ3QcZpS4
        c2QdO0gVm4CqxMQV99lAbF4BO4nb0+eC2SxA8c7V58CmigpESDzffoMRokZQ4uTMJywgNqeA
        rcTtN4fB4swC6hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkbJ
        1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4MjQ0tzBeHlJ/CFGAQ5GJR7eDWLz4oRYE8uK
        K3MPMUpwMCuJ8FpoAYV4UxIrq1KL8uOLSnNSiw8xSnOwKInzPs07FikkkJ5YkpqdmlqQWgST
        ZeLglGpg5DhX5ZW1xbFt91Pvn36fdG8+j/1wKTrh6g/TxSs2hedM8Pywv7A97dA+qWeiac5W
        e3a9tXSI1jBamLP3sdg/3xSF84ZpX39pSTpU5Lr+NKy+9NJrW4ZaRZ3yNa60pI0uv/YbX05f
        fJ/lQPeF6sgHJd2tLSJ/rBbzLKi1CzptqL3fJrdU4nm7EktxRqKhFnNRcSIAQd6QIYgCAAA=
X-CMS-MailID: 20200421064236epcas1p4a1e03e246b97b8e01c7923d3dd82396d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
        <CGME20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335@eucas1p1.samsung.com>
        <20200407134256.9129-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 4. 7. 오후 10:42에 Marek Szyprowski 이(가) 쓴 글:
> The ExynosDRM page fault handler is never used, drm_gem_mmap()
> always calls exynos_drm_gem_mmap() function, which perform
> complete mapping for the given virtual address-space area.

Right, never used. Picked it up.

Thanks,
Inki Dae

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 20 --------------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h |  3 ---
>  3 files changed, 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 57defeb44522..dbd80f1e4c78 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -76,7 +76,6 @@ static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
>  }
>  
>  static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
> -	.fault = exynos_drm_gem_fault,
>  	.open = drm_gem_vm_open,
>  	.close = drm_gem_vm_close,
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index d734d9d51762..40514d3dcf60 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -381,26 +381,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>  	return 0;
>  }
>  
> -vm_fault_t exynos_drm_gem_fault(struct vm_fault *vmf)
> -{
> -	struct vm_area_struct *vma = vmf->vma;
> -	struct drm_gem_object *obj = vma->vm_private_data;
> -	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
> -	unsigned long pfn;
> -	pgoff_t page_offset;
> -
> -	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> -
> -	if (page_offset >= (exynos_gem->size >> PAGE_SHIFT)) {
> -		DRM_ERROR("invalid page offset\n");
> -		return VM_FAULT_SIGBUS;
> -	}
> -
> -	pfn = page_to_pfn(exynos_gem->pages[page_offset]);
> -	return vmf_insert_mixed(vma, vmf->address,
> -			__pfn_to_pfn_t(pfn, PFN_DEV));
> -}
> -
>  static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
>  				   struct vm_area_struct *vma)
>  {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index 42ec67bc262d..f00044c0b688 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -101,9 +101,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>  			       struct drm_device *dev,
>  			       struct drm_mode_create_dumb *args);
>  
> -/* page fault handler and mmap fault address(virtual) to physical memory. */
> -vm_fault_t exynos_drm_gem_fault(struct vm_fault *vmf);
> -
>  /* set vm_flags and we can change the vm attribute to other one at here. */
>  int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>  
> 
