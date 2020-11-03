Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72612C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 16:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D43C206FB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604421870;
	bh=vFBYHeZM+/RX3ozFoSh1u9y4ugDPHa2jOfL7jkiu+xI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zhpCHZptdPmRhdZzwZoVIXH68gNToQN1A7aAF06vJmAG7Pfi4FCAyPKCHYlRNux1h
	 lzk8oVEkd2sNQqd5EuRQ5llC6aieTQ//1BTD8v7Ui8DMTjYAHI+z7/5vpGFQoxaN9f
	 Mp4Xs6RSEDKbb06jRcR/LaS1FQwHeOwPJj5oezJs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgKCQo3 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 11:44:29 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39411 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbgKCQo3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:44:29 -0500
Received: by mail-wm1-f66.google.com with SMTP id 205so5667084wma.4;
        Tue, 03 Nov 2020 08:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JTb85/e5+sxvbGNi3PzTkPZpsFLaDB6PtzJ0PVISbfg=;
        b=DyjhSp1m0ook8d5IC6RCBU2w7dsxo/MmE0YMh4JEt9grfqTkrK49w/ECpQrpGoA8TL
         Eqveye7Loy3Q+mtkldP25IK3RilFrlnlS1Bk8AtzK72anCJB7g/6hcovS8yZZLCP3Bjg
         9DdXAUFpLLs8g6XAYc673U3F9452QsjdHfN02xXtIqg5JLhs//3xFnw9APMxh0Gyg6ak
         BujgWVKBEWwdu5YCRcCytAwEI4dJ7wPH+76V+R9iKo56NoFdwQmrxPApZOQr+LbpBRZW
         V+AsttyU1BPne3SnvSUrs1/Jq9oOuTfWE/0W7HPTYQ6E9p5S2UqciLqvkh1XOdCcuIiR
         oPIQ==
X-Gm-Message-State: AOAM532nDA2enSUPuKqhbSYdzPAAeTilhU11//l+C6u0tvfO3rmMPb/c
        WzxSlms2zaNFDB7BmWnqTP4=
X-Google-Smtp-Source: ABdhPJzwAkv7DBoYOSPg6lfzKD9Zi6APPrayfrvJZ8ZEMlNtQ5Y4epWtl5lNbp36NwVktss4yGfdRA==
X-Received: by 2002:a1c:6484:: with SMTP id y126mr625484wmb.141.1604421867316;
        Tue, 03 Nov 2020 08:44:27 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id n4sm3457759wmi.32.2020.11.03.08.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:44:26 -0800 (PST)
Date:   Tue, 3 Nov 2020 17:44:23 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 5/5] ARM: dts: exynos: Add Ethernet interface description
 for Odroid X/X2
Message-ID: <20201103164423.GE14739@kozik-lap>
References: <20201103124618.21358-1-l.stelmach@samsung.com>
 <CGME20201103124622eucas1p25be1feaf9194a0e6b183d041a574b406@eucas1p2.samsung.com>
 <20201103124618.21358-6-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103124618.21358-6-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 01:46:18PM +0100, Łukasz Stelmach wrote:
> Add Ethernet interface description for Odroid X/X2.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroidx.dts | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
> index 3ea2a0101e80..8f154f431f6c 100644
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
> +			compatible = "usb0424:9514";

Does not look like correct compatible.

Best regards,
Krzysztof
