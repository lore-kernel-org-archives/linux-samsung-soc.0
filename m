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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AEBC388F2
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 06:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4313208B8
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 06:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rqaaKC7R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgKFGAb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Nov 2020 01:00:31 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:29208 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKFGAb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 01:00:31 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201106060027epoutp03f9ee0d0462f3ed169dadd67a1f5949ad~E1clASJCV2061020610epoutp03H
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2020 06:00:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201106060027epoutp03f9ee0d0462f3ed169dadd67a1f5949ad~E1clASJCV2061020610epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604642427;
        bh=+EW2Qh6aDW9Cz16ccO5hd5cFPApV0wbo+wt3sex+PnA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=rqaaKC7RATRCF7VscGqLkCtAL1AsUQ93D8s32FugYT+0C5z36h0um8phRtKWbO3Mq
         xWzQ+qxuwHOAXJm1alNTRsbfiEhkzxxtMQPopij0onC2qF1m6kTYdIQtQtqVRmv8Kl
         yU3kIU5jvxrLvsFIQ3mELx95KqibojvOwMLSA/CA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20201106060027epcas1p4559d5d5178940af60ea06c71da805334~E1ckigEFH1260212602epcas1p4Q;
        Fri,  6 Nov 2020 06:00:27 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.158]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4CS8r76bXtzMqYkn; Fri,  6 Nov
        2020 06:00:23 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        3F.A2.09582.776E4AF5; Fri,  6 Nov 2020 15:00:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201106060022epcas1p194674202e436cf7001c5dcd74c131b85~E1cgY39AA1471114711epcas1p1S;
        Fri,  6 Nov 2020 06:00:22 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201106060022epsmtrp1b26b9af321914e438b72e6641c153aa5~E1cgYA2as1867918679epsmtrp1b;
        Fri,  6 Nov 2020 06:00:22 +0000 (GMT)
X-AuditID: b6c32a37-e2fb8a800000256e-2e-5fa4e67705f2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C3.08.13470.676E4AF5; Fri,  6 Nov 2020 15:00:22 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201106060022epsmtip27e188fc2591cf3fc1d2ffa50b17f74b4~E1cf95ryn1236512365epsmtip2U;
        Fri,  6 Nov 2020 06:00:22 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: exynos: Use fixed index for the MMC devices
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org
From:   Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <2a14c8fe-9fb0-13d5-0dd1-8c39ae2bd17e@samsung.com>
Date:   Fri, 6 Nov 2020 15:00:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105114804.18326-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmrm75syXxBm/mG1tsnLGe1eL6l+es
        FufPb2C3uLxrDpvFjPP7mCxeHvnBaLH2yF12i9a9R9gdODxu3an32LSqk82jb8sqRo/Pm+QC
        WKKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOArlBS
        KEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUm
        ZGd0N+xmLGhSrnj/cgprA+NEmS5GTg4JAROJlTe2s4PYQgI7GCWWTBbvYuQCsj8xShxdvoQZ
        wvnGKNGwYC8rTMefTd/ZIDr2Mko8XRYDUfSeUeLbja3MIAlhAS+JL5tesYDYIgIhEvefvmAF
        KWIW+Mwo8fjINbBJbAI6Etu/HWcCsXkF7CT+XV8HFmcRUJHYsbQNzBYViJTY+fQlO0SNoMTJ
        mU/AhnIC1R/a9ggsziwgLnHryXwmCFteYvvbOWBnSwj0ckgsuv4TqIgDyHGRWDIhFOIDYYlX
        x7ewQ9hSEi/726DsaoldzWegejsYJW5ta2KCSBhL7F86mQlkDrOApsT6XfoQYUWJnb/nMkLs
        5ZN497WHFWIVr0RHmxBEiYrEpdcvmWBW3X3yHxqIHhK3Fzxnm8CoOAvJZ7OQfDMLyTezEBYv
        YGRZxSiWWlCcm55abFhgjBzZmxjBCVTLfAfjtLcf9A4xMnEwHmKU4GBWEuG94LcoXog3JbGy
        KrUoP76oNCe1+BCjKTCsJzJLiSbnA1N4Xkm8oamRsbGxhYmhmamhoZI47x/tjnghgfTEktTs
        1NSC1CKYPiYOTqkGJpuPR9/r2bGHfFvK27Hwb1qxTYn8n7/hKsbC8h/e9bVMrjk15Z5JWaW7
        9nZ/ZT57x8vPNXvnBYitydDR0Ik6xn2+3nTas67Hfxtt+lj5TKOje1Zwrws+ZBhgzq5Yblco
        kHd4Zu/FcqaJPFPXnOVf4ewyffHXbF82nrNddu71nyUYG+o5Jn9LFiuQXWmZoLp1wuqDzglL
        dJ48LeATO5ZqExAnLb037vzHr/9dpi6c6WrNwqjwqvzk+pvrjBwEpz086dvzXfP/njybO8Xv
        T0denaQ+9ekvy88Kq39b/dB4U1lRviVt11vWZ6+CjmzcvSLoSQyz1mz3XFeDFhOHr3Oa3bOf
        uz4zzE6vqRFT/cGixFKckWioxVxUnAgAaZG7nikEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvG7ZsyXxBpdfKlhsnLGe1eL6l+es
        FufPb2C3uLxrDpvFjPP7mCxeHvnBaLH2yF12i9a9R9gdODxu3an32LSqk82jb8sqRo/Pm+QC
        WKK4bFJSczLLUov07RK4MrobdjMWNClXvH85hbWBcaJMFyMnh4SAicSfTd/Zuhi5OIQEdjNK
        zPzbyQqRkJL4/HQqUIIDyBaWOHy4GKLmLaPE6aNLWEBqhAW8JL5sesUCUiMiECKx8L0eSA2z
        wGdGiatTu1ghGiYySiw69oEZpIFNQEdi+7fjTCA2r4CdxL/r68CWsQioSOxY2sYKMkhUIFJi
        5w5LiBJBiZMzn4Dt4gQqP7TtETuIzSygLvFn3iVmCFtc4taT+UwQtrzE9rdzmCcwCs1C0j4L
        ScssJC2zkLQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHDNamjsYt6/6oHeI
        kYmD8RCjBAezkgjvBb9F8UK8KYmVValF+fFFpTmpxYcYpTlYlMR5bxQujBMSSE8sSc1OTS1I
        LYLJMnFwSjUwNVevU5pn/SZ7Sd/GC9tnHNhoVb7Zta0++4P55/+L9ESltuQ3q570qklS3Z6Y
        zWHksrPYUX3Pr2LvdTu5bu4p7mJgDV11LsGtfMIOZ56E0qyG1YbRWfY1E/9bOZVbhknynDjK
        Hx9162EL28aSc/vVi5ruzRS2yq6+/4JH+vu9+jXJ05dzyvWZLOoUyvwtd3GKe25B1/ygON/T
        h4Xs5m3acCLFVlIuJPTxxdNx3cyL5m3jTJBi45eavee2hd117tLtL5uq8t8u0v7Ur25d0Drr
        Ru59x4UhB6vdI3cdvmvwcPvbT//P2exOzt8huCigjEcw22+Jr9/p8CnbDkbZpqec4pI2F5B6
        KS3sPPWg7jYlluKMREMt5qLiRAA5D8YdCAMAAA==
X-CMS-MailID: 20201106060022epcas1p194674202e436cf7001c5dcd74c131b85
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201105114814eucas1p18d9f11c44eec68738d929ad1a0263482
References: <CGME20201105114814eucas1p18d9f11c44eec68738d929ad1a0263482@eucas1p1.samsung.com>
        <20201105114804.18326-1-m.szyprowski@samsung.com>
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
>  arch/arm/boot/dts/exynos3250.dtsi | 3 +++
>  arch/arm/boot/dts/exynos4.dtsi    | 2 ++
>  arch/arm/boot/dts/exynos4210.dtsi | 1 +
>  arch/arm/boot/dts/exynos4412.dtsi | 1 +
>  arch/arm/boot/dts/exynos5250.dtsi | 4 ++++
>  arch/arm/boot/dts/exynos5260.dtsi | 3 +++
>  arch/arm/boot/dts/exynos5410.dtsi | 3 +++
>  arch/arm/boot/dts/exynos5420.dtsi | 3 +++
>  8 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 75ed82600ec8..510080bb4102 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -28,6 +28,9 @@
>  	aliases {
>  		pinctrl0 = &pinctrl_0;
>  		pinctrl1 = &pinctrl_1;
> +		mmc0 = &mshc_0;
> +		mmc1 = &mshc_1;
> +		mmc2 = &mshc_2;
>  		mshc0 = &mshc_0;
>  		mshc1 = &mshc_1;
>  		mshc2 = &mshc_2;
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index a1e54449f33f..e266f890eea4 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -45,6 +45,8 @@
>  		fimc1 = &fimc_1;
>  		fimc2 = &fimc_2;
>  		fimc3 = &fimc_3;
> +		mmc1 = &sdhci_1;
> +		mmc2 = &sdhci_2;
>  		serial0 = &serial_0;
>  		serial1 = &serial_1;
>  		serial2 = &serial_2;
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index fddc661ded28..f1d0d5959b7f 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -23,6 +23,7 @@
>  	compatible = "samsung,exynos4210", "samsung,exynos4";
>  
>  	aliases {
> +		mmc0 = &sdhci_0;
>  		pinctrl0 = &pinctrl_0;
>  		pinctrl1 = &pinctrl_1;
>  		pinctrl2 = &pinctrl_2;
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index fa8e8d6bc4d5..9fcf7383eb9d 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -28,6 +28,7 @@
>  		pinctrl3 = &pinctrl_3;
>  		fimc-lite0 = &fimc_lite_0;
>  		fimc-lite1 = &fimc_lite_1;
> +		mmc0 = &mshc_0;
>  		mshc0 = &mshc_0;
>  	};
>  
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 84677332a5a2..0a0436f92fac 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -30,6 +30,10 @@
>  		gsc1 = &gsc_1;
>  		gsc2 = &gsc_2;
>  		gsc3 = &gsc_3;
> +		mmc0 = &mmc_0;
> +		mmc1 = &mmc_1;
> +		mmc2 = &mmc_2;
> +		mmc3 = &mmc_3;
>  		mshc0 = &mmc_0;
>  		mshc1 = &mmc_1;
>  		mshc2 = &mmc_2;
> diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
> index 973448c4ad93..64bf1d8dc33b 100644
> --- a/arch/arm/boot/dts/exynos5260.dtsi
> +++ b/arch/arm/boot/dts/exynos5260.dtsi
> @@ -21,6 +21,9 @@
>  		i2c1 = &hsi2c_1;
>  		i2c2 = &hsi2c_2;
>  		i2c3 = &hsi2c_3;
> +		mmc0 = &mmc_0;
> +		mmc1 = &mmc_1;
> +		mmc2 = &mmc_2;
>  		pinctrl0 = &pinctrl_0;
>  		pinctrl1 = &pinctrl_1;
>  		pinctrl2 = &pinctrl_2;
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 584ce62361b1..503859153769 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -24,6 +24,9 @@
>  		pinctrl1 = &pinctrl_1;
>  		pinctrl2 = &pinctrl_2;
>  		pinctrl3 = &pinctrl_3;
> +		mmc0 = &mmc_0;
> +		mmc1 = &mmc_1;
> +		mmc2 = &mmc_2;
>  	};
>  
>  	cpus {
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 23a8fd5c8a6e..3a3eadd890fb 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -19,6 +19,9 @@
>  	compatible = "samsung,exynos5420", "samsung,exynos5";
>  
>  	aliases {
> +		mmc0 = &mmc_0;
> +		mmc1 = &mmc_1;
> +		mmc2 = &mmc_2;
>  		mshc0 = &mmc_0;
>  		mshc1 = &mmc_1;
>  		mshc2 = &mmc_2;
> 

