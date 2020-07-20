Return-Path: <SRS0=3vSf=A7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834DCC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jul 2020 14:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ABB122482
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jul 2020 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595255705;
	bh=IUaCGFz+1FkfmX6UmlCld3D4jv/AkfevYOsihf32mXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1WKcTPLZLOtUiXpB63HTw4KGP+xczcTymHCfSryErWMiLSb0L6zT9soU7Q7Jufi/4
	 FznTc36yo3O64NwxS/Zf1jOr05Mb4R0hmwYOXA1yBigl7OiyKXA4/Tv5a5UeFzPicg
	 i/VmI05Ey/Sbr+QEMAMYJPPXJ1x9OGp7lSxBGG6g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgGTOfF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jul 2020 10:35:05 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36088 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbgGTOfE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 10:35:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id 17so25399240wmo.1;
        Mon, 20 Jul 2020 07:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+r2u+PCexGuJVhWs1yoHEOY5ocWtnaVreiGt6s45ER8=;
        b=qZw90NqEr7NBlFu3sEebSXKGyPcNCYnHHDwQX7vDi2FyiHDM5NSqCQtAfHaaMTWPXE
         OX8OuaiBBjCtm/pZ0r+y4o4fUfFbGYlWe8hKBOW1UblsfegnrZrKWWP81O4J1qy3BPGL
         gqYvPE4L6whvdD8KXJUrHkSd2xfmgZupiecW6s3Aj7WrZv8grkadjccm/ep9SAVrE7ss
         T6wAo8eWMwOPzgxRyKthCz17zc2Jn4jmiAyZIPYn2jTcMyyZw3DBxrmhzsL1cbjXVL8E
         /Mgc4tIhgH9p/rvjgnfLWfLPGuZKZAptBAkqsEP1mUuUML89Bd5jTJ3sLQsbi8rIlMPh
         GWSA==
X-Gm-Message-State: AOAM531lwz7YmDtGdhiFnrTBvCckv+9pBzprFAf6AO0ZYfz1Nxe0eQrv
        D+jGicgF+2UNtG8M6iXgqBjqURBMMMnlJQ==
X-Google-Smtp-Source: ABdhPJxRipv2tkqEqYkuo3zpdcP1VGOvvK0e9Fm2hGi2sGAcG+HMrTSZDYO2+lcXdtzkwgjLmtKn/A==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr21536363wmf.103.1595255702383;
        Mon, 20 Jul 2020 07:35:02 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
        by smtp.googlemail.com with ESMTPSA id u20sm31202600wmm.15.2020.07.20.07.35.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 07:35:01 -0700 (PDT)
Date:   Mon, 20 Jul 2020 16:34:58 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, simon@lineageos.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Add sound support to Midas
Message-ID: <20200720143458.GB22554@kozik-lap>
References: <20200710173500.22365-1-s.nawrocki@samsung.com>
 <CGME20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213@eucas1p1.samsung.com>
 <20200710173500.22365-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710173500.22365-3-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jul 10, 2020 at 07:35:00PM +0200, Sylwester Nawrocki wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> Update the never-mainlined "samsung,trats2-audio" binding and instead
> use the new "samsung,midas-audio" binding.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> [s.nawrocki: fixed DAPM routing entries for MICBIAS1/2, adjusted to
>  changes in the DT binding]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 38 ++++++++++++++
>  arch/arm/boot/dts/exynos4412-i9300.dts      |  4 ++
>  arch/arm/boot/dts/exynos4412-midas.dtsi     | 78 ++++++++++++++++++++++++-----
>  arch/arm/boot/dts/exynos4412-n710x.dts      | 35 +++++++++++++
>  4 files changed, 142 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> index 53b3ca3..cff0980 100644
> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> @@ -175,3 +175,41 @@
>  	gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
>  };
> +
> +&submic_bias_reg {

Put them in alphabetical order against oder phandle overrides. Same for
n710x.dts.

> +	gpio = <&gpf2 0 GPIO_ACTIVE_HIGH>;
> +	enable-active-high;
> +};
> +
> +&sound {
> +	samsung,audio-routing =
> +		"HP", "HPOUT1L",
> +		"HP", "HPOUT1R",
> +
> +		"SPK", "SPKOUTLN",
> +		"SPK", "SPKOUTLP",
> +		"SPK", "SPKOUTRN",
> +		"SPK", "SPKOUTRP",
> +
> +		"RCV", "HPOUT2N",
> +		"RCV", "HPOUT2P",
> +
> +		"HDMI", "LINEOUT1N",
> +		"HDMI", "LINEOUT1P",
> +
> +		"LINE", "LINEOUT2N",
> +		"LINE", "LINEOUT2P",
> +
> +		"IN1LP", "MICBIAS1",
> +		"IN1LN", "MICBIAS1",
> +		"Main Mic", "MICBIAS1",
> +
> +		"IN1RP", "Sub Mic",
> +		"IN1RN", "Sub Mic",
> +
> +		"IN2LP:VXRN", "MICBIAS2",
> +		"Headset Mic", "MICBIAS2",
> +
> +		"IN2RN", "FM In",
> +		"IN2RP:VXRP", "FM In";
> +};
> diff --git a/arch/arm/boot/dts/exynos4412-i9300.dts b/arch/arm/boot/dts/exynos4412-i9300.dts
> index f8125a9..3691802 100644
> --- a/arch/arm/boot/dts/exynos4412-i9300.dts
> +++ b/arch/arm/boot/dts/exynos4412-i9300.dts
> @@ -20,3 +20,7 @@
>  		reg =  <0x40000000 0x40000000>;
>  	};
>  };
> +
> +&sound {
> +	fm-sel-gpios = <&gpl0 3 GPIO_ACTIVE_HIGH>;
> +};
> diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
> index 2c8111c..2752363 100644
> --- a/arch/arm/boot/dts/exynos4412-midas.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
> @@ -102,6 +102,30 @@
>  		status = "disabled";
>  	};
>  
> +	vbatt_reg: voltage-regulator-9 {

Since this is the basic DTSI for multiple boards, the numbering here
should be consistent. You will have to rename the ones in Galaxy S3 and
N710 DTSI.

> +		compatible = "regulator-fixed";
> +		regulator-name = "VBATT";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	mic_bias_reg: voltage-regulator-10 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "MICBIAS_LDO_2.8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		gpio = <&gpf1 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	submic_bias_reg: voltage-regulator-11 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SUB_MICBIAS_LDO_2.8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-names = "default";
> @@ -266,16 +290,18 @@
>  		clock-names = "ext_clock";
>  	};
>  
> -	sound {
> -		compatible = "samsung,trats2-audio";
> -		samsung,i2s-controller = <&i2s0>;
> -		samsung,model = "Trats2";
> -		samsung,audio-codec = <&wm1811>;
> -		samsung,audio-routing =
> -			"SPK", "SPKOUTLN",
> -			"SPK", "SPKOUTLP",
> -			"SPK", "SPKOUTRN",
> -			"SPK", "SPKOUTRP";
> +	sound: sound {
> +		compatible = "samsung,midas-audio";
> +		model = "Midas";
> +		mic-bias-supply = <&mic_bias_reg>;
> +		submic-bias-supply = <&submic_bias_reg>;
> +
> +		cpu {
> +			sound-dai =  <&i2s0 0>;

Double space after '='.

Best regards,
Krzysztof
