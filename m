Return-Path: <SRS0=KEKd=X4=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A77EC4CED1
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Oct 2019 23:03:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4D8B21D71
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Oct 2019 23:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LsSYjxut"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730137AbfJCXDD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Oct 2019 19:03:03 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:46581 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730057AbfJCXDD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 19:03:03 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20191003230259epoutp03c913744bd0f88329486b29b97a48f389~KRXLaNk941875018750epoutp03T
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Oct 2019 23:02:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20191003230259epoutp03c913744bd0f88329486b29b97a48f389~KRXLaNk941875018750epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570143779;
        bh=mpPBGvUU2oQk0DQC97kA+Lxwx+y1b35Qq9RwzvPssF8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=LsSYjxut9p0Gi0BPqCTqT3GmoqwAplHm6IeQUPSxRgwIjDUQ0BJWFqDWRljaFLWWF
         lT/rjiGUgVttAeRKP8sukuqXF02X8gJfmyvdHFIrVECl7pab8KlF0f5pf/Hge6asze
         Mfh/y/lVEX8qGBHoZ5qIJJbtBYpL65xTgUDwY/6Q=
Received: from epsnrtp6.localdomain (unknown [182.195.42.167]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20191003230259epcas1p4d0faffd93352fba2171c7051fd0dba7b~KRXLNHS-h0300903009epcas1p4l;
        Thu,  3 Oct 2019 23:02:59 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
        epsnrtp6.localdomain (Postfix) with ESMTP id 46kpSf18MbzMqYkX; Thu,  3 Oct
        2019 23:02:58 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        13.8A.04085.22E769D5; Fri,  4 Oct 2019 08:02:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191003230257epcas1p1afde3f72895617d1c9be2a0f958ffa1c~KRXJjb16_0552005520epcas1p1z;
        Thu,  3 Oct 2019 23:02:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191003230257epsmtrp2b979458e471255db1feeb37551b9cf95~KRXJiqtDX0177701777epsmtrp2A;
        Thu,  3 Oct 2019 23:02:57 +0000 (GMT)
X-AuditID: b6c32a37-e31ff70000000ff5-60-5d967e22393a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        45.0C.04081.12E769D5; Fri,  4 Oct 2019 08:02:57 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191003230257epsmtip256d8066648535eda4d27722fdad93ac8~KRXJXAGsj1019410194epsmtip2v;
        Thu,  3 Oct 2019 23:02:57 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix error paths
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <cad198bf-5516-0217-c3e9-480d44860e48@samsung.com>
Date:   Fri, 4 Oct 2019 08:07:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002085309.9473-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmnq5S3bRYgzkr2S02zljPanH+/AZ2
        i48991gtZpzfx2Sx9shddov2py+ZHdg8Nq3qZPPo27KK0ePzJrkA5qhsm4zUxJTUIoXUvOT8
        lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygvUoKZYk5pUChgMTiYiV9O5ui
        /NKSVIWM/OISW6XUgpScAssCveLE3OLSvHS95PxcK0MDAyNToMKE7Iy7i9pYC27zVsz7+oOp
        gfEXVxcjJ4eEgInEpG9/WLsYuTiEBHYwShzf28cM4XxilJi2fAELhPONUeLJpSZGmJbbH7ex
        QyT2MkosevqUCSQhJPCeUeL7/BQQW1jATuLJ3wtADRwcIgL5ErPehoCEmQV6GCU2rHEBsdkE
        tCT2v7jBBmLzCyhKXP3xGKycF6h19x5hkDCLgIrElPlfWEBsUYEIiU8PDrOC2LwCghInZz4B
        i3MK2Eo86zzOBDFeXOLWk/lQtrxE89bZYM9ICNxnk3i7pY0J4n4XiRtN51kgbGGJV8e3sEPY
        UhKf3+1lg7CrJVaePMIG0dzBKLFl/wVWiISxxP6lk5lADmUW0JRYv0sfIqwosfP3XEaIxXwS
        7772sIKUSAjwSnS0CUGUKEtcfnAX6gRJicXtnWwTGJVmIXlnFpIXZiF5YRbCsgWMLKsYxVIL
        inPTU4sNC4yR43oTIzhFapnvYNxwzucQowAHoxIPr8KbqbFCrIllxZW5hxglOJiVRHgvrZ8S
        K8SbklhZlVqUH19UmpNafIjRFBjaE5mlRJPzgek7ryTe0NTI2NjYwsTQzNTQUEmc1yO9IVZI
        ID2xJDU7NbUgtQimj4mDU6qBcWq71f/U85//nnja6F8461/Lt9BZf95KajEkvnpu6f9u3Y1L
        5sLsG1eq/fiwl/fbl9JL/sfDvqUe7ErSi/7zy/J9lk5ARvnnU9crFQ/VbtpwsX+Cx7f2Ni61
        DxIhluYlhRtuvmjd1eQk5uZ80Udpsf25XzL3q1YxN5cmsK6o3LMwdP/5DxOvz1RiKc5INNRi
        LipOBAB3OoE/pwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJXlexblqswdq/yhYbZ6xntTh/fgO7
        xceee6wWM87vY7JYe+Quu0X705fMDmwem1Z1snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJX
        xt1FbawFt3kr5n39wdTA+Iuri5GTQ0LAROL2x23sXYxcHEICuxkltj0/ygSRkJSYdvEocxcj
        B5AtLHH4cDFEzVtGiYZvb1hAaoQF7CSe/L3ACGKLCORLzLjTywhSxCzQxyhxoGcV1NQJjBIn
        nx4Bq2IT0JLY/+IGG4jNL6AocfXHY0aQDbxAk3bvEQYJswioSEyZ/wVsgahAhMThHbPAWnkF
        BCVOznwCFucUsJV41nkc7FBmAXWJP/MuMUPY4hK3nsyHistLNG+dzTyBUXgWkvZZSFpmIWmZ
        haRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4IjR0tzBeHlJ/CFGAQ5GJR5e
        hTdTY4VYE8uKK3MPMUpwMCuJ8F5aPyVWiDclsbIqtSg/vqg0J7X4EKM0B4uSOO/TvGORQgLp
        iSWp2ampBalFMFkmDk6pBkbRN8+/vjlzOvLQDbPXchUm6W7dsf9aK7f/WrFbbC6vTmoN5zRm
        4QQ7roZTwmezpWZPWP/dS+2KQl9x9ve/qg8l79j4NVRF37FiUJi+nNHBeMvX5tBJ3g4/eeYF
        V6476Kwy5dkjG/F1qzevSX+/9XnshA1bOlQdlW+Kld6PObXrTPiUKu9PFrJKLMUZiYZazEXF
        iQChRafjlAIAAA==
X-CMS-MailID: 20191003230257epcas1p1afde3f72895617d1c9be2a0f958ffa1c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
References: <CGME20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234@eucas1p2.samsung.com>
        <20191002085309.9473-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19. 10. 2. 오후 5:53, Marek Szyprowski wrote:
> Add checking the value returned by samsung_clk_alloc_reg_dump() and
> devm_kcalloc(). While fixing this, also release all gathered clocks.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 7824c2ba3d8e..0b60316331a0 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -5584,6 +5584,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>  
>  	data->clk_save = samsung_clk_alloc_reg_dump(info->clk_regs,
>  						    info->nr_clk_regs);
> +	if (!data->clk_save)
> +		return -ENOMEM;
>  	data->nr_clk_save = info->nr_clk_regs;
>  	data->clk_suspend = info->suspend_regs;
>  	data->nr_clk_suspend = info->nr_suspend_regs;
> @@ -5592,12 +5594,19 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>  	if (data->nr_pclks > 0) {
>  		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
>  					   data->nr_pclks, GFP_KERNEL);
> -
> +		if (!data->pclks) {
> +			kfree(data->clk_save);
> +			return -ENOMEM;
> +		}
>  		for (i = 0; i < data->nr_pclks; i++) {
>  			struct clk *clk = of_clk_get(dev->of_node, i);
>  
> -			if (IS_ERR(clk))
> +			if (IS_ERR(clk)) {
> +				kfree(data->clk_save);
> +				while (--i >= 0)
> +					clk_put(data->pclks[i]);
>  				return PTR_ERR(clk);
> +			}
>  			data->pclks[i] = clk;
>  		}
>  	}
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
