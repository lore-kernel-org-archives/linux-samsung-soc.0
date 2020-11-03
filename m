Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659B1C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 16:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A8D8206DF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604421376;
	bh=uJ3h+4iizqbAisoa/vB6xgtZMiJxmXRUMMP/9MaIgvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZLVVegOoh96woO3Q1oCJiPMkw9zKpjz2lsdThHwJujjB3q1qrTj1FjwSEHMmJrVKS
	 XzRvQMm1+gGO4PF9wT0jBSAOimYt3ZhUI6RAdMKj1Oyp8h9sa1Cynf+UtlOb8rh+JF
	 Xgjv4yKadE/q6HLL0GKc5PnpA9rmAYPj/R1PQzcI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbgKCQgP convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 11:36:15 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33101 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbgKCQgP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:36:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id p19so263894wmg.0;
        Tue, 03 Nov 2020 08:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cTjlYON13Zu56G6DRMOT0+CuDlotYCOu5ATCgZ1qAYA=;
        b=pTkrNbGL0ECF5PDUdMo+uYvp9WqonpZVkhnrK6nqBIhD/lJO8I56pmropuDU5lSBvs
         YkIrRnRrSe8aYm1tDQdjzcIiFSV4aYJgvX0fYA8741StmpqcmbMd+zfJlcl4AHP9M7uk
         ts2Zj8Ug9+RgzTxSlTOJEcC5ulfJP3ohnb6XgChFZP6gVA9tqSX7+qm+e91+4zZDN2kg
         4WHSXHUUuvfasPIAqTZEqV4P2mHooTEqZ9X2EuFdAj8Nqv3iMxEvZADuKI2hWhVg6Qnr
         qb1M6rO9bYj3zJbfWIAGn/vFhWOpRreFbXRBLwngNzh4/lv8B6vdm2AUcBWhjclGpPOk
         P1Xw==
X-Gm-Message-State: AOAM531LK2e61s4sfIe9oC8Run8QZV8J1xAW6Jxfx5Qfh0RUAqB9mNE+
        dPii6U5p8UlBnpFrCFdWboI=
X-Google-Smtp-Source: ABdhPJxHzxo5YQixVSJNJEaG6+VK30+X9uB9IVlFZG8qSVKAUVEINpbu5yYjVrgUDBesX+tzGFzP3A==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr593534wmj.109.1604421373200;
        Tue, 03 Nov 2020 08:36:13 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id t199sm3530470wmt.46.2020.11.03.08.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:36:12 -0800 (PST)
Date:   Tue, 3 Nov 2020 17:36:10 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/5] ARM: dts: exynos: Fix ethernet description for
 Odroid XU3
Message-ID: <20201103163610.GA14739@kozik-lap>
References: <20201103124618.21358-1-l.stelmach@samsung.com>
 <CGME20201103124620eucas1p14e76afe9fd53184f1a689b5a654e7e1e@eucas1p1.samsung.com>
 <20201103124618.21358-2-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103124618.21358-2-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 01:46:14PM +0100, Łukasz Stelmach wrote:
> Create ethernet alias 

Your commit msg should explain why.


> and assign appropriate compatible properties.

Then what was before? Indeed they do not look like anything
reasonable... old VID do not appear on any of Odroid boards.

> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---

Best regards,
Krzysztof

>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index d0f6ac5fa79d..2a4153484664 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -15,6 +15,10 @@
>  / {
>  	model = "Hardkernel Odroid XU3";
>  	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
> +
> +	aliases {
> +		ethernet = &ethernet;
> +	};
>  };
>  
>  &i2c_0 {
> @@ -76,13 +80,13 @@ &usbhost2 {
>  	#size-cells = <0>;
>  
>  	hub@1 {
> -		compatible = "usb8087,0024";
> +		compatible = "usb0424,9514";
>  		reg = <1>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
>  		ethernet: usbether@1 {
> -			compatible = "usb0c45,6310";
> +			compatible = "usb0424,ec00";
>  			reg = <1>;
>  			local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
>  		};
> -- 
> 2.26.2
> 
