Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66874C4741F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:30:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2E5220728
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 19:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604604652;
	bh=5QEet2sYOT/h+CaS1S7UoMcTtDG1XCqc8RhfIUiH+LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=L9GWpIX8b1fyyNLNgW9TGlBIidbJTUpjQhH50r9BwQvfdVmicVaF/iHNXsBAkmJfQ
	 KDZy4mQ6equtWPLzHKgmRquHFk12SmjnvBzjVH9uJl1B90JmwLFt2//mTmW6j9T66p
	 eDDJ7xn+pvJDh56VxdBH6btsRhzbNpjJdFMMhsEA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgKETas convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:30:48 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41019 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729783AbgKETas (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 14:30:48 -0500
Received: by mail-ed1-f65.google.com with SMTP id j20so2801712edt.8;
        Thu, 05 Nov 2020 11:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jkvlXuPqC8y5EfIuBYLbV4uMlj4O4TTGdEEKTKXMswY=;
        b=SH7lzVs0a0PM0B/MJ/RNx9eg02zq58opG3T9+Eo8CNdIcN2Ek47cQvl4vfObbmkucm
         z5clin9itcPTgv2Krlzs5rE1jJaaI4KsZdY7kfvPJGwYVF/eKTH5cf/CkTzxGPBtD1PW
         FzrgR6Zn/PcLP3e3yrK49vsx0Lmh3g9tCWbgSB47vaULBnvCubafY1A/dq7vDTu2IAep
         TVkfEqQtImyJWCeXJaN+0MoHF1B8VgKsqx9bR4AFC5IKrCNF3EacG1XdsIDRn0jb0L2O
         edspxtsuLiRlzg55kRQsjvQo/s+e56psaY8Kspkip6hN9aTq4oj5XIiqUUBCVADvGiju
         OVag==
X-Gm-Message-State: AOAM530LhnXg6AUHxgOBiN4rB4yuQRfEMS1SmkmZghtK/+GF/+MfP2xp
        K/66osBtTQhv1W+oXkymAKU=
X-Google-Smtp-Source: ABdhPJzzn1JoPqCV7F9XEL8duFvf2H+tVM4z+uH73ppCiFaanh09usM87fdjvMdTEYS0dkeJZGaurA==
X-Received: by 2002:a05:6402:1585:: with SMTP id c5mr4131676edv.372.1604604644988;
        Thu, 05 Nov 2020 11:30:44 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id s25sm1510710ejc.29.2020.11.05.11.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 11:30:43 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:30:42 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 6/6] ARM: dts: exynos: Add Ethernet interface
 description for Odroid X/X2
Message-ID: <20201105193042.GE236732@kozik-lap>
References: <20201103184412.18874-1-l.stelmach@samsung.com>
 <CGME20201103184419eucas1p1e5f855727fae95d992f8e95c7dbda787@eucas1p1.samsung.com>
 <20201103184412.18874-7-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103184412.18874-7-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 07:44:12PM +0100, Łukasz Stelmach wrote:
> Add Ethernet interface description for Odroid X/X2.
> 
> Add an alias to enable bootloaders to find the Ethernet
> interface and assign a MAC address.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroidx.dts | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
> index 3ea2a0101e80..2da220102883 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
> @@ -15,6 +15,10 @@ / {
>  	model = "Hardkernel ODROID-X board based on Exynos4412";
>  	compatible = "hardkernel,odroid-x", "samsung,exynos4412", "samsung,exynos4";
>  
> +	aliases {
> +		ethernet = &ethernet;
> +	};
> +
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x40000000 0x3FF00000>;
> @@ -72,8 +76,32 @@ &buck8_reg {
>  };
>  
>  &ehci {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	phys = <&exynos_usbphy 2>;
>  	phy-names = "hsic0";
> +
> +	hub@2 {
> +		compatible = "usb0424,3503";
> +		reg = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		hub@1 {
> +			compatible = "usb0424,9514";
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ethernet: usbether@1 {
> +				compatible = "usb0424,ec00";
> +				reg = <1>;
> +				local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
> +			};
> +		};
> +	};
> +
> +

Thanks, applied with space fixup.

Best regards,
Krzysztof

