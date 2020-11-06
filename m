Return-Path: <SRS0=C3hI=EM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A50AC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 06:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0B792087D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 06:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="imHvIeHW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgKFGAn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Nov 2020 01:00:43 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:58349 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgKFGAm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 01:00:42 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201106060039epoutp0228084b28755a1a86dfbf0c894b965fe7~E1cwDm65t1031010310epoutp02G
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2020 06:00:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201106060039epoutp0228084b28755a1a86dfbf0c894b965fe7~E1cwDm65t1031010310epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604642439;
        bh=H6UyVEDtCUHutc84XrkVe7KQjCGhQT8Emejis+MlvaA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=imHvIeHWyByp3cLFqKoT5koFaDxwA3tn7MeyskUPrAR7pgPihpiVgye2JKVfTkD+u
         bNdev3nOWI5L8hN+qWb+sdbdnC5V5t0NwV2uGRM0a2hv0Up4JkEuL54YNyVPTEXT/C
         kaNwFBgDJlDckSXSAii00px9J0+2ikn5rvl17i1U=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201106060039epcas1p1ad827682f90809735fdfef8d26f623b2~E1cvqcOXO0239002390epcas1p1v;
        Fri,  6 Nov 2020 06:00:39 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.153]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4CS8rN3Vc0zMqYkf; Fri,  6 Nov
        2020 06:00:36 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        C0.21.10463.186E4AF5; Fri,  6 Nov 2020 15:00:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201106060033epcas1p159f05b54fba9c097bbebec428fdc98a4~E1cqcZ4zm3209832098epcas1p1X;
        Fri,  6 Nov 2020 06:00:33 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201106060033epsmtrp1888c4120a2e9e898a7cb9ca93620b01d~E1cqbvk4N1867918679epsmtrp1i;
        Fri,  6 Nov 2020 06:00:33 +0000 (GMT)
X-AuditID: b6c32a38-efbff700000028df-63-5fa4e681ec4a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        46.87.08745.186E4AF5; Fri,  6 Nov 2020 15:00:33 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201106060033epsmtip2653cd362ba0840d7aef61cd280c48c44~E1cqO1s4R1025010250epsmtip2E;
        Fri,  6 Nov 2020 06:00:33 +0000 (GMT)
Subject: Re: [PATCH] arm64: dts: exynos: Use fixed index for the MMC devices
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org
From:   Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <119c90b2-7157-ed07-5ef2-ec64d98c8823@samsung.com>
Date:   Fri, 6 Nov 2020 15:00:54 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105114814.18372-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmgW7jsyXxBm8valtsnLGe1eL6l+es
        FufPb2C3uLxrDpvFjPP7mCxeHvnBaLH2yF12i9a9R9gdODxu3an32LSqk82jb8sqRo/Pm+QC
        WKKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOArlBS
        KEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUm
        ZGdMvv2IqeAzb8WH21vYGhhXcHcxcnJICJhIXJjymbWLkYtDSGAHo8S1s7+hnE+MEve+zmOG
        cD4zShxr2MsO09Jw8w5UYhejxKyNk1ggnPeMEs1PN7OBVAkL+EgsffSLFcQWEQiRuP/0Bdhc
        ZpBRj49cA0uwCehIbP92nAnE5hWwk/hy7T4LiM0ioCLR9n0t2CBRgUiJnU9fskPUCEqcnPkE
        rIYTqP7JqX3MIDazgLjErSfzmSBseYntb+eAnSch0MshMXfpF0aIu10kHm64yAphC0u8Or4F
        6h8piZf9bVB2tcSu5jNQzR2MEre2NTFBJIwl9i+dDGRzAG3QlFi/Sx8irCix8/dcRojFfBLv
        vvawgpRICPBKdLQJQZSoSFx6/ZIJZtXdJ/+hTvCQ+DltG9sERsVZSF6bheSdWUjemYWweAEj
        yypGsdSC4tz01GLDAhPk+N7ECE6jWhY7GOe+/aB3iJGJg/EQowQHs5II7wW/RfFCvCmJlVWp
        RfnxRaU5qcWHGE2BgT2RWUo0OR+YyPNK4g1NjYyNjS1MDM1MDQ2VxHn/aHfECwmkJ5akZqem
        FqQWwfQxcXBKNTDlb7g5S5NjVqL47WkNit3tnItCLmZ6yO+Sd1s1cfvllE/rzaburNosaGlh
        O2VHTMs3huUsOzvcXz/ce9h7ifCEvqsCaVf6PON0JyuHzLzadu1Ii45N5+H7uTenb31Y+eD/
        zhpt78+vCsKzkryYZ55k8d2Qr9md0jK7d1+whr7mtzTDfqlPGxy3iU94m+h5+m7wepGNbIbs
        POYTLqrJP9My4L1w+tP1V66e1XLFH+0eXvoo/YH99Jxt/r//1PL5Ll5wltmhX3vzBPtKlqS0
        5bJ+uuLKkaYbJm5ZIXtoXsczz18L/3NfWmq48+bWj3ubLjQefR+3Sk/q3+uJiQ8ufhCI6Zn+
        bM6WRXuUbqUeenk7X4mlOCPRUIu5qDgRALwHm44sBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvG7jsyXxBt2bRSw2zljPanH9y3NW
        i/PnN7BbXN41h81ixvl9TBYvj/xgtFh75C67ReveI+wOHB637tR7bFrVyebRt2UVo8fnTXIB
        LFFcNimpOZllqUX6dglcGZNvP2Iq+Mxb8eH2FrYGxhXcXYycHBICJhINN+8wdzFycQgJ7GCU
        OLB3EjtEQkri89OpbF2MHEC2sMThw8UQNW8ZJRZ0rAerERbwkVj66BcrSI2IQIjEwvd6IDXM
        Ap8ZJa5O7WKFaJjIKHHoczcrSAObgI7E9m/HmUBsXgE7iS/X7rOA2CwCKhJt39eCLRMViJTY
        ucMSokRQ4uTMJ2AlnEDlT07tYwaxmQXUJf7MuwRli0vcejKfCcKWl9j+dg7zBEahWUjaZyFp
        mYWkZRaSlgWMLKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYJjRktrB+OeVR/0DjEy
        cTAeYpTgYFYS4b3gtyheiDclsbIqtSg/vqg0J7X4EKM0B4uSOO/XWQvjhATSE0tSs1NTC1KL
        YLJMHJxSDUwyEkGZOzqfJWxfclh1r2mF7n6LtyGaumLbLV9q/stknd/COXP6i4Rn62YtXiQg
        e/W25jYXxtX/HKa8T4oo/bGq+sPZWaev3lW3Pz1LPs3RabPzpoq+e3t0xOab8/yR3yqw8YTB
        EacHtpWti9tv85S2s33825Y2R7rlZNv6rN9XVnYEb34cIGBRJ3hDxDLm4Z35nEvOecQKx09l
        2LEuROJu1XsO5zk7Vv539b7R2sh9Z3f2etbVn2Mb2w0uLe8o/nk1orBqe8iKHSELDdZYCgi0
        tb28sFJkzc+1G+puzs689NA28eePgp1iLXNCbpcIXVgqFCoRnOEiz/HEtY5tgfBmpvl52Y6s
        7u9ZTm2T2hqpxFKckWioxVxUnAgAehOUTAgDAAA=
X-CMS-MailID: 20201106060033epcas1p159f05b54fba9c097bbebec428fdc98a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201105114823eucas1p26250751a232cf55e39d2452e8bb83e46
References: <CGME20201105114823eucas1p26250751a232cf55e39d2452e8bb83e46@eucas1p2.samsung.com>
        <20201105114814.18372-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/5/20 8:48 PM, Marek Szyprowski wrote:
> Recently introduced asynchronous probe on the MMC devices can shuffle
> block IDs in the system. Pin them to values equal to the physical MMC bus
> number to ease booting in environments where UUIDs are not practical.
> 
> Use newly introduced aliases for mmcblk devices from commit fa2d0aa96941
> ("mmc: core: Allow setting slot index via device tree alias").
> 
> Suggested-by: Markus Reichl <m.reichl@fivetechno.de>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 ++++++
>  arch/arm64/boot/dts/exynos/exynos7.dtsi    | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 0a886bb6c806..3a37ad97fcdb 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -23,6 +23,12 @@
>  
>  	interrupt-parent = <&gic>;
>  
> +	aliases {
> +		mmc0 = &mshc_0;
> +		mmc1 = &mshc_1;
> +		mmc2 = &mshc_2;
> +	};
> +
>  	arm_a53_pmu {
>  		compatible = "arm,cortex-a53-pmu";
>  		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> index 48cd3a04fd07..3e319ec64997 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -16,6 +16,9 @@
>  	#size-cells = <2>;
>  
>  	aliases {
> +		mmc0 = &mmc_0;
> +		mmc1 = &mmc_1;
> +		mmc2 = &mmc_2;
>  		pinctrl0 = &pinctrl_alive;
>  		pinctrl1 = &pinctrl_bus0;
>  		pinctrl2 = &pinctrl_nfc;
> 

