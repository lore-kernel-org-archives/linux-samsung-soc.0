Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C49C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 10:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CDBF20829
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603795087;
	bh=lyGFHrfHXVjnW2Mxj7Zqcw57LDQLT7QQrDOJDFE5rKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OeWbTBDxB4oNr+rMGsTUZvqjqIYM+b9coRX9F1Pvd819yBXFy9ZMCvmHLG0ghto02
	 q/vrqGuURSZ1s1QICBORVvxBeDMyIQDobHya1EA3TXs3yqaWWuoc5GvsyVwDsjWY1L
	 RcOf2ouQyBgIo9m6COlFuOP2j0MYmcE8IdaSSqxY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436980AbgJ0Kh7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:37:59 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:44710 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436596AbgJ0Khi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 06:37:38 -0400
Received: by mail-ej1-f66.google.com with SMTP id d6so1449710ejb.11;
        Tue, 27 Oct 2020 03:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UCQxlKOKzQn6npHWL+chgiqrZv7e5KPLyCbYaVbyysg=;
        b=FXe2lGus0CcETq/0NAZH8UCq17vj3Etk/oE0Rn8Ehqc6ciCstKd1uX3sIxY0aGEZn/
         QQw61ccAJ7g0FEo77vxLJvEfjm0X2KAQ7wxESDHLhPs8/wgrJjC1D4llpP2Y5Zw6jIAq
         LlZ+b+Xu/9Q5vi7fIDRn43Jzj3/KcNMGsersCfdrZ1ubGmVZsEYRNnWxF5l9If+zHt3e
         5XTsR6mpu6/hH/WZs7pASDn7A2AuTfSUfMh7g28gD0jZA017szi978v80vQOtLK17A8I
         ETM30TAURuU4m4Of9AqXwQO+/Ze8azputbkTiBDlS90GiLnOjP7qWracNDxlfF//zGYS
         sprA==
X-Gm-Message-State: AOAM530FnK42A+GkP0DpkoDOpL9oJu9NrPkBoSoaLkNNAiLL2p/KJwrN
        OEY86ksIo+ZGIJwSZvx6bD0=
X-Google-Smtp-Source: ABdhPJyDHPgPUFF8HO24yXsm5O+2et3SJH7AaZyv5j2kp7V8iKd5OFxvy1aK9EXyS3oSAdQ0tMhWJQ==
X-Received: by 2002:a17:906:ca54:: with SMTP id jx20mr1775790ejb.541.1603795055225;
        Tue, 27 Oct 2020 03:37:35 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id pw17sm762269ejb.116.2020.10.27.03.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:37:34 -0700 (PDT)
Date:   Tue, 27 Oct 2020 11:37:32 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 08/12] ARM: dts: exynos: adjust node names to DT spec in
 Exynos542x boards
Message-ID: <20201027103732.GA20429@kozik-lap>
References: <20201026181528.163143-1-krzk@kernel.org>
 <CGME20201026181608eucas1p17927126482dc9ed2aefa2ff4c64491cd@eucas1p1.samsung.com>
 <20201026181528.163143-9-krzk@kernel.org>
 <f14a69bc-bd8f-b0d7-2967-1e7582562d5e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f14a69bc-bd8f-b0d7-2967-1e7582562d5e@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 26, 2020 at 10:47:47PM +0100, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 26.10.2020 19:15, Krzysztof Kozlowski wrote:
> > The Devicetree specification expects device node names to have a generic
> > name, representing the class of a device.  Also the convention for node
> > names is to use hyphens, not underscores.
> >
> > No functional changes.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >   arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 4 ++--
> >   arch/arm/boot/dts/exynos5420-peach-pit.dts         | 4 ++--
> >   arch/arm/boot/dts/exynos5420-smdk5420.dts          | 2 +-
> >   arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 2 +-
> >   arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  | 2 +-
> >   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++--
> >   arch/arm/boot/dts/exynos5422-odroidxu3.dts         | 8 ++++----
> >   arch/arm/boot/dts/exynos5800-peach-pi.dts          | 4 ++--
> >   8 files changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> > index dd7f8385d81e..bf457d0c02eb 100644
> > --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> > +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> > @@ -39,7 +39,7 @@ oscclk {
> >   		};
> >   	};
> >   
> > -	gpio_keys {
> > +	gpio-keys {
> >   		compatible = "gpio-keys";
> >   
> >   		wakeup {
> > @@ -344,7 +344,7 @@ &hdmi {
> >   &hsi2c_4 {
> >   	status = "okay";
> >   
> > -	s2mps11_pmic@66 {
> > +	pmic@66 {
> >   		compatible = "samsung,s2mps11-pmic";
> >   		reg = <0x66>;
> >   
> > diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> > index 2bcbdf8a39bf..d54392fe6260 100644
> > --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> > +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> > @@ -138,7 +138,7 @@ panel_in: endpoint {
> >   		};
> >   	};
> >   
> > -	mmc1_pwrseq: mmc1_pwrseq {
> > +	mmc1_pwrseq: mmc1-pwrseq {
> >   		compatible = "mmc-pwrseq-simple";
> >   		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
> >   		clocks = <&max77802 MAX77802_CLK_32K_CP>;
> > @@ -205,7 +205,7 @@ &hsi2c_4 {
> >   	status = "okay";
> >   	clock-frequency = <400000>;
> >   
> > -	max77802: max77802-pmic@9 {
> > +	max77802: pmic@9 {
> >   		compatible = "maxim,max77802";
> >   		interrupt-parent = <&gpx3>;
> >   		interrupts = <1 IRQ_TYPE_NONE>;
> > diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > index 4e49d8095b29..d506da9fa661 100644
> > --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > @@ -129,7 +129,7 @@ &hdmi {
> >   &hsi2c_4 {
> >   	status = "okay";
> >   
> > -	s2mps11_pmic@66 {
> > +	pmic@66 {
> >   		compatible = "samsung,s2mps11-pmic";
> >   		reg = <0x66>;
> >   
> > diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> > index b1cf9414ce17..25fb6331c75e 100644
> > --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> > +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> > @@ -503,7 +503,7 @@ &dmc {
> >   &hsi2c_4 {
> >   	status = "okay";
> >   
> > -	s2mps11_pmic@66 {
> > +	pmic@66 {
> >   		compatible = "samsung,s2mps11-pmic";
> >   		reg = <0x66>;
> >   		samsung,s2mps11-acokb-ground;
> > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> > index b5ec4f47eb3a..f5f9c077df74 100644
> > --- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> > @@ -40,7 +40,7 @@ codec {
> >   
> >   &hsi2c_5 {
> >   	status = "okay";
> > -	max98090: max98090@10 {
> > +	max98090: codec@10 {
> >   		compatible = "maxim,max98090";
> >   		reg = <0x10>;
> >   		interrupt-parent = <&gpx3>;
> > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > index 5da2d81e3be2..e35af40a55cb 100644
> > --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > @@ -13,12 +13,12 @@
> >   #include "exynos5422-odroid-core.dtsi"
> >   
> >   / {
> > -	gpio_keys {
> > +	gpio-keys {
> >   		compatible = "gpio-keys";
> >   		pinctrl-names = "default";
> >   		pinctrl-0 = <&power_key>;
> >   
> > -		power_key {
> > +		power-key {
> >   			/*
> >   			 * The power button (SW2) is connected to the PWRON
> >   			 * pin (active high) of the S2MPS11 PMIC, which acts
> > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> > index d0f6ac5fa79d..5ff493ecb6ff 100644
> > --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> > @@ -21,28 +21,28 @@ &i2c_0 {
> >   	status = "okay";
> >   
> >   	/* A15 cluster: VDD_ARM */
> > -	ina231@40 {
> > +	sensor@40 {
> power-sensor?

Good point, thanks!

Best regards,
Krzysztof
