Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780FCC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 May 2022 03:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345139AbiETDON (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 May 2022 23:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345088AbiETDOK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 May 2022 23:14:10 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB2A14A251
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 May 2022 20:14:00 -0700 (PDT)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220520031357epoutp04c2fb7219374d8a78571315b9caa4091b~wsbEQgjAY2424224242epoutp04B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 03:13:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220520031357epoutp04c2fb7219374d8a78571315b9caa4091b~wsbEQgjAY2424224242epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653016437;
        bh=qYM0UTxJNeaJrHpm5Xdc9Da5RIb/dbJklFYHKmNgef4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=bDkBP3/ZdLBgVwo+hNsbviz9Ld+fDJocMVzCsBsjAku6nbdlP5iTG7KMbTpXLZ8sr
         J1gdztpO1D05wKnapDRoTAhsNjfBsebwcHNeuvq1Z5UBM1OH0M/dezcduzfsBMJ/wy
         XD7o9SFLcVw0kMhjLI4qtj9W1ZDTk2aGCtE/Af/Q=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220520031356epcas1p209464a65c809a581511fa06e096f115c~wsbDv0m8_1395213952epcas1p2I;
        Fri, 20 May 2022 03:13:56 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.236]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4L4Bdb1lCJz4x9Px; Fri, 20 May
        2022 03:13:55 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        56.06.10063.37707826; Fri, 20 May 2022 12:13:55 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20220520031354epcas1p4553a0a66ee74ccf9fdd9551fc682896c~wsbBpjoEW2056020560epcas1p4h;
        Fri, 20 May 2022 03:13:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220520031354epsmtrp139e8fd4b517e66fa77d1874bd913a77f~wsbBotNle0505205052epsmtrp1k;
        Fri, 20 May 2022 03:13:54 +0000 (GMT)
X-AuditID: b6c32a35-1dbff7000000274f-1b-62870773d98f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A1.5C.11276.27707826; Fri, 20 May 2022 12:13:54 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220520031354epsmtip106cc04f23d2587ce0f8d6fea984d1bb9~wsbBaVVwg3033330333epsmtip1V;
        Fri, 20 May 2022 03:13:54 +0000 (GMT)
Subject: Re: [PATCH] dt-bindings: clock: exynosautov9: correct count of
 NR_CLK
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <a114746d-9f7a-acce-c9eb-7af6dd8eae89@samsung.com>
Date:   Fri, 20 May 2022 12:40:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20220520030625.145324-1-chanho61.park@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmnm4xe3uSwbSz3BYP5m1js7i8X9ti
        /pFzrBZ9Lx4yW3zsucdqMeP8PiaLi6dcLVr3HmG3OPymndXi37WNLBardv1hdOD2eH+jld1j
        56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiism0yUhNTUosUUvOS81My89JtlbyD453jTc0M
        DHUNLS3MlRTyEnNTbZVcfAJ03TJzgK5TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak
        5BSYFugVJ+YWl+al6+WlllgZGhgYmQIVJmRnXNp2jangoHDFoTf8DYwn+bsYOTkkBEwkdv06
        z9jFyMUhJLCDUeL6rmNMEM4nRokF65ewQTjfGCXWPG9hgWm5u2EuC0RiL6PE2SOfoKreM0rM
        ePaTFaRKWCBA4uf/2+wgCRGBdUwS+3fPYAVxmAXaGSXufp/CDlLFJqAlsf/FDTYQm19AUeLq
        j8eMIDavgJ1Ey4XNzCA2i4CqxNwDT8DiogJhEie3tUDVCEqcnPkE7CZOAQeJJV3TweLMAuIS
        t57MZ4Kw5SW2v53DDLJYQuAIh8TvSZ2sEE+4SJy/3sEMYQtLvDq+hR3ClpJ42d/GDtHQzCjR
        8OI2I4TTwyhx9FkfNAiMJfYvnQy0ggNohabE+l36EGFFiZ2/50JdwSfx7msPK0iJhACvREeb
        EESJssTlB3eZIGxJicXtnWwTGJVmIflnFpIfZiH5YRbCsgWMLKsYxVILinPTU4sNCwzhEZ6c
        n7uJEZx4tUx3ME58+0HvECMTB+MhRgkOZiURXsbcliQh3pTEyqrUovz4otKc1OJDjKbAEJ7I
        LCWanA9M/Xkl8YYmlgYmZkbGJhaGZoZK4ryrpp1OFBJITyxJzU5NLUgtgulj4uCUamA6lfDU
        +Nv6W8f57V9tZlHd0rl31a+AyfxTdgVfUbIJszv9+9DngL6oG75Kk+cdWBO9mv9C1I+ZB5lZ
        t5yVrpjZGpbjY6/Cqvq+2M/qm9mydW1/LArOtnd0pD+8Uye1pntjVEPpXllzue3HglUWdgpP
        zlDkj+686F/Yen5y5s36Eo6lbo8Wfr2xJY9rS3iPWgDD2oyl60/qrd3Gz7Fxzbs/norf/2w4
        EN0rXey5IEvm0PNdVSzfkp0OPI47b3gin6FY+J/bt7kF1pPfCK+8d3hu9Ly4Nof4wKw/m99x
        /S3Tuj4pVKr2keqd7kyBABn3g2s2n1v7f6Fk4Y953o+XiJgeTtb7veD+sYJ9MgYNjXM4lFiK
        MxINtZiLihMBPO2EikUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsWy7bCSnG4Re3uSwdJ+CYsH87axWVzer20x
        /8g5Vou+Fw+ZLT723GO1mHF+H5PFxVOuFq17j7BbHH7Tzmrx79pGFotVu/4wOnB7vL/Ryu6x
        c9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBmXtl1jKjgoXHHoDX8D
        40n+LkZODgkBE4m7G+aydDFycQgJ7GaUOLV2DhtEQlJi2sWjzF2MHEC2sMThw8UQNW8ZJdYd
        aWYEqREW8JO4/OYCE4gtIrCBSWLLviSQImaBVkaJOys+sEN0TGaU2DWnjRmkik1AS2L/ixtg
        G/gFFCWu/ngMNolXwE6i5cJmsBoWAVWJuQeegMVFBcIkdi55zARRIyhxcuYTFhCbU8BBYknX
        dLAaZgF1iT/zLjFD2OISt57MZ4Kw5SW2v53DPIFReBaS9llIWmYhaZmFpGUBI8sqRsnUguLc
        9NxiwwLDvNRyveLE3OLSvHS95PzcTYzg6NPS3MG4fdUHvUOMTByMhxglOJiVRHgZc1uShHhT
        EiurUovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamDa+3176H5JTjn7
        E+f8ih4lb0/uURUq5T4Qs/YDo82nIOmA4sWL3u1fxpzCP7/5/PyQALbXegfuzLNf65H+jeWC
        xa+t2XZLZwsHiaxmX3BD9vj2pOcTr+gaB+h7q37k+cs54WniFL67l7z/zf+h+nGCf8LL8Hdb
        JUtbnetv3X40YWWh5Svpcp7dCx5cNV2SszsreEXETF5zf5G0dX6dDxaVXl2mqyb7SvKH5sF5
        +zVvnLI7NGeW8748z3un5l5k2ck+4XPX/4NLP7KvChA4tNFqnZ2Q4fewsHULFggYCpmv+q5v
        e+Pz6+UWJgs2101WW3y66jJHvtXpg85nF3pm/WfxEyr9tdZs3fTrAftyF/VYVSixFGckGmox
        FxUnAgCLHwoFLQMAAA==
X-CMS-MailID: 20220520031354epcas1p4553a0a66ee74ccf9fdd9551fc682896c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520030551epcas2p1a67b9f026ce2ec56b0a167026ef96baf
References: <CGME20220520030551epcas2p1a67b9f026ce2ec56b0a167026ef96baf@epcas2p1.samsung.com>
        <20220520030625.145324-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 5/20/22 12:06 PM, Chanho Park wrote:
> _NR_CLKS which can be used to register clocks via nr_clk_ids. The clock
> IDs are started from 1. So, _NR_CLKS should be defined to "the last
> clock id + 1"
> 
> Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions for Exynos Auto v9")
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  include/dt-bindings/clock/samsung,exynosautov9.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
> index 71ec0a955364..ea9f91b4eb1a 100644
> --- a/include/dt-bindings/clock/samsung,exynosautov9.h
> +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
> @@ -166,7 +166,7 @@
>  #define GOUT_CLKCMU_PERIC1_IP		248
>  #define GOUT_CLKCMU_PERIS_BUS		249
>  
> -#define TOP_NR_CLK			249
> +#define TOP_NR_CLK			250
>  
>  /* CMU_BUSMC */
>  #define CLK_MOUT_BUSMC_BUS_USER		1
> @@ -174,7 +174,7 @@
>  #define CLK_GOUT_BUSMC_PDMA0_PCLK	3
>  #define CLK_GOUT_BUSMC_SPDMA_PCLK	4
>  
> -#define BUSMC_NR_CLK			4
> +#define BUSMC_NR_CLK			5
>  
>  /* CMU_CORE */
>  #define CLK_MOUT_CORE_BUS_USER		1
> @@ -183,7 +183,7 @@
>  #define CLK_GOUT_CORE_CCI_PCLK		4
>  #define CLK_GOUT_CORE_CMU_CORE_PCLK	5
>  
> -#define CORE_NR_CLK			5
> +#define CORE_NR_CLK			6
>  
>  /* CMU_FSYS2 */
>  #define CLK_MOUT_FSYS2_BUS_USER		1
> @@ -194,7 +194,7 @@
>  #define CLK_GOUT_FSYS2_UFS_EMBD1_ACLK	6
>  #define CLK_GOUT_FSYS2_UFS_EMBD1_UNIPRO	7
>  
> -#define FSYS2_NR_CLK			7
> +#define FSYS2_NR_CLK			8
>  
>  /* CMU_PERIC0 */
>  #define CLK_MOUT_PERIC0_BUS_USER	1
> @@ -240,7 +240,7 @@
>  #define CLK_GOUT_PERIC0_PCLK_10		41
>  #define CLK_GOUT_PERIC0_PCLK_11		42
>  
> -#define PERIC0_NR_CLK			42
> +#define PERIC0_NR_CLK			43
>  
>  /* CMU_PERIC1 */
>  #define CLK_MOUT_PERIC1_BUS_USER	1
> @@ -286,7 +286,7 @@
>  #define CLK_GOUT_PERIC1_PCLK_10		41
>  #define CLK_GOUT_PERIC1_PCLK_11		42
>  
> -#define PERIC1_NR_CLK			42
> +#define PERIC1_NR_CLK			43
>  
>  /* CMU_PERIS */
>  #define CLK_MOUT_PERIS_BUS_USER		1
> @@ -294,6 +294,6 @@
>  #define CLK_GOUT_WDT_CLUSTER0		3
>  #define CLK_GOUT_WDT_CLUSTER1		4
>  
> -#define PERIS_NR_CLK			4
> +#define PERIS_NR_CLK			5
>  
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV9_H */
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
