Return-Path: <SRS0=qXZT=YX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33789CA9EAF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Oct 2019 08:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B532217F9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Oct 2019 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572423287;
	bh=/I/XdAmqC3W0ZbidrEPHILv0kwB10OkvAVYu1I/ABMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=a1OEpbOZTCUaL19hVeqspxUO3taL3SYMv8Q86h6yz3XKFIz4bawP5BqUMyNDVf5NM
	 1G2p1xIQ8ZM7zi3LsDaYP2qU2IP3GX00uI7uIVy0bT0GE2h5iTVReUAm6Brw+rETFG
	 MPOivLAzN8a18HxN6l8skYZcO+SMx8+Lnz467Q0U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfJ3IOq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 30 Oct 2019 04:14:46 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44880 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfJ3IOq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Oct 2019 04:14:46 -0400
Received: by mail-ed1-f68.google.com with SMTP id b18so997297edr.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2019 01:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1n8w6xKEN3g/M5sfu+FaAMSXKcxLqw2rs+v6nMFKHAQ=;
        b=rLUVD8lpkxjdFeveJDyuP3gcrhNO10jMLlDI8LNd9FVCMTRDVhKZ1b+iRaWihpkKyJ
         SYL9mItnGq8jUs+ufe7RMTALOitp9vOXXCAHQhCxYFwZRS29FHjzymRSIHrQv6t3ce1S
         D2+bJlDw+ciRp4aA5zF+aeHZideCH8ayNzXJG/KSDWpe/WCwEI3u2I2+UySP276u4nEP
         dTcrwt0PcBfTRYUx6g1unaiTRsM7A6ocXbV6Nq+4n0hnHNJ+WSriyNfXuh2R9DZggau0
         yMgkkGHk3ynPyQNcsZ0oCYVQajZ/cRXBtDw1CzPKOkO9OR3WUO/g5vlBBgNDraSwP52l
         BKug==
X-Gm-Message-State: APjAAAXHEL7+QpnxjIwykb72sGlDg/vOjYjSOmXxgEkTG6DDLHoNEhs4
        SEIr97TWkNMWbt2EiFoZy19YrHTW
X-Google-Smtp-Source: APXvYqwoieXfzojDskEBuqJjCs4yqMq7bUQGfg8g64suU4nC1eIIKC3wpkqodeja6NsaPMVb5c6pGg==
X-Received: by 2002:a50:e002:: with SMTP id e2mr1011427edl.278.1572423284671;
        Wed, 30 Oct 2019 01:14:44 -0700 (PDT)
Received: from pi3 ([194.230.155.180])
        by smtp.googlemail.com with ESMTPSA id n19sm9263edo.36.2019.10.30.01.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 01:14:43 -0700 (PDT)
Date:   Wed, 30 Oct 2019 09:14:42 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marian Mihailescu <mihailescu2m@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: exynos5420: add mali dt bindings and enable
 mali on Odroid XU3/4
Message-ID: <20191030081442.GA25260@pi3>
References: <20191029011312.4601-1-mihailescu2m@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191029011312.4601-1-mihailescu2m@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Thanks for the patch.

Use scripts/get_maintainer.pl to get list of maintainer and lists to Cc.

On Tue, Oct 29, 2019 at 11:43:12AM +1030, Marian Mihailescu wrote:
> Add device tree bindings for Mali GPU for Exynos 542x SoC.

"Add device tree nodes", not bindings.

> GPU is disabled by default, and is enabled for each board after the regulator
> is defined. Tested on Odroid-XU4.
> 
> Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi             | 49 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  5 +++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 7d51e0f4ab79..5d60e0f1b09a 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -670,6 +670,55 @@
>  			iommus = <&sysmmu_gscl1>;
>  		};
>  
> +		mali: mali@11800000 {

The node should be generic, so use gpu. Also for the label.

> +			compatible = "samsung,exynos5420-mali", "arm,malit628";

First compatible is not documented - please run scripts/checkpatch.pl.
See: https://patchwork.kernel.org/patch/10996479/

Second compatible looks wrong.

> +			reg = <0x11800000 0x5000>;
> +			interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> +						 <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
> +						 <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;

Broken indentation. Align it with <GIC_SPI before.

> +			interrupt-names = "JOB", "MMU", "GPU";

Does not match bindings.

> +
> +			clocks = <&clock CLK_G3D>;
> +			clock-names = "core";
> +			power-domains = <&g3d_pd>;
> +			operating-points-v2 = <&gpu_opp_table>;

This should be also cooling device so at least cooling cells are needed.
The best would be to connect it with TMU GPU but this could be in next
patches.

> +
> +			status = "disabled";
> +
> +			gpu_opp_table: gpu-opp-table {

The node name: just opp-table, to be generic.

> +				compatible = "operating-points-v2";
> +
> +				opp@177000000 {
> +					opp-hz = /bits/ 64 <177000000>;
> +					opp-microvolt = <812500>;
> +				};
> +				opp@266000000 {
> +					opp-hz = /bits/ 64 <266000000>;
> +					opp-microvolt = <862500>;
> +				};
> +				opp@350000000 {
> +					opp-hz = /bits/ 64 <350000000>;
> +					opp-microvolt = <912500>;
> +				};
> +				opp-420000000 {
> +					opp-hz = /bits/ 64 <420000000>;
> +					opp-microvolt = <962500>;
> +				};
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					opp-microvolt = <1000000>;
> +				};
> +				opp-543000000 {
> +					opp-hz = /bits/ 64 <543000000>;
> +					opp-microvolt = <1037500>;
> +				};
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <600000000>;
> +					opp-microvolt = <1150000>;
> +				};
> +			};
> +		};
> +
>  		scaler_0: scaler@12800000 {
>  			compatible = "samsung,exynos5420-scaler";
>  			reg = <0x12800000 0x1294>;
> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> index 422692b20c46..210c305a0ce8 100644
> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> @@ -659,6 +659,11 @@
>  	status = "okay";
>  };
>  
> +&mali {
> +	mali-supply = <&buck4_reg>;

Remove the always-on from buck4.

Best regards,
Krzysztof


> +	status = "okay";
> +};
> +
>  &rtc {
>  	status = "okay";
>  	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
> -- 
> 2.14.1
> 
