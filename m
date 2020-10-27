Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CB8C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 10:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AF9E20829
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603795201;
	bh=X8Xyve4MYX67GfBGJ3N+m4SIdpruTaDwOF4qjUokwcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wYhxjR6nwUilyqrCtbP60EHwh/O7T2DQc450yqvzxewW6DREJBgXmZRi3nAbspMOJ
	 kWWQ6jf+frceb6/v8TFCPE0b8cHFLVG0ZNG/vCujHsXlm1Qv4XR1TUO3FM0Kn6Yg7h
	 dhBjAjaNxP0XD/se83Ci+WGw/yzxzV9Hkl/iNOBs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898621AbgJ0Kj6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:39:58 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42772 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2898506AbgJ0Kie (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 06:38:34 -0400
Received: by mail-ed1-f68.google.com with SMTP id v19so876090edx.9;
        Tue, 27 Oct 2020 03:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zzbL0qgnxvkylMPxUyokTgdHZhJ6dzP68QozQ0NsjAw=;
        b=doGNypTCBA3XXQDO6tIPgBOfUO3MPIY+b0QPg83n+bJRvSu727HLqadyYdBEQ4CnRo
         l8zqGTGgKqHqC9Qm4DQicB17KamfikNAyLyOIIeLBHWytKTrvcfophnaeQBwKfGtRijn
         e5qNHKEALfS1OnHgVzzUyZVvGVBZ42quevD5qOwrK4AoujYniKknYeSQyx6SdFhaWgni
         kNkhYaF/Uj/1l5JiH+h7fQn2MDFpu9P8Gw0tLNlAh0egBPQSx+ajamTSindj4vz5uk4R
         ynAe/LPO2rptuw3yzjYAr11A2du1jEwr+AFuJ5ayFxBZzLzykppvcQpAXBUCaFM3uH90
         jL5Q==
X-Gm-Message-State: AOAM532KgsNaBL7HIuXSCjAYHqs0ccLHkOG3KlT/hFdg0nqN0SNiGLCF
        ncIzpPF8X8a+hUKyMdZB0Kc=
X-Google-Smtp-Source: ABdhPJw8TfiuptrRMy++P7RN563EXW35+UsWPBp0Gi2hS6qF+KTgHU3flJBSCR32Gaq9Jj/Gvb75gA==
X-Received: by 2002:a50:e447:: with SMTP id e7mr1510315edm.263.1603795111248;
        Tue, 27 Oct 2020 03:38:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id op24sm775374ejb.56.2020.10.27.03.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:38:29 -0700 (PDT)
Date:   Tue, 27 Oct 2020 11:38:27 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 04/12] ARM: dts: exynos: adjust node names to DT spec in
 Exynos4412 boards
Message-ID: <20201027103827.GB20429@kozik-lap>
References: <20201026181528.163143-1-krzk@kernel.org>
 <CGME20201026181555eucas1p265c52e647f7cd28d410135ccbd236b70@eucas1p2.samsung.com>
 <20201026181528.163143-5-krzk@kernel.org>
 <7832e031-81b0-c77e-57fa-cf122cd989d4@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7832e031-81b0-c77e-57fa-cf122cd989d4@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 26, 2020 at 10:02:10PM +0100, Marek Szyprowski wrote:
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
> >   arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |  8 ++++----
> >   arch/arm/boot/dts/exynos4412-itop-elite.dts   |  2 +-
> >   .../boot/dts/exynos4412-itop-scp-core.dtsi    |  2 +-
> >   arch/arm/boot/dts/exynos4412-midas.dtsi       | 12 +++++------
> >   arch/arm/boot/dts/exynos4412-n710x.dts        |  2 +-
> >   .../boot/dts/exynos4412-odroid-common.dtsi    |  8 ++++----
> >   arch/arm/boot/dts/exynos4412-odroidx.dts      |  4 ++--
> >   arch/arm/boot/dts/exynos4412-origen.dts       | 14 ++++++-------
> >   arch/arm/boot/dts/exynos4412-smdk4412.dts     | 20 +++++++++----------
> >   9 files changed, 36 insertions(+), 36 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> > index 89ed81fb348d..db91678f5648 100644
> > --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> > +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> > @@ -15,7 +15,7 @@ aliases {
> >   		i2c10 = &i2c_cm36651;
> >   	};
> >   
> > -	aat1290 {
> > +	led-controller {
> >   		compatible = "skyworks,aat1290";
> >   		flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
> >   		enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
> > @@ -60,7 +60,7 @@ i2c_ak8975: i2c-gpio-0 {
> >   		#size-cells = <0>;
> >   		status = "okay";
> >   
> > -		ak8975@c {
> > +		magnetometer@c {
> >   			compatible = "asahi-kasei,ak8975";
> >   			reg = <0x0c>;
> >   			gpios = <&gpj0 7 GPIO_ACTIVE_HIGH>;
> > @@ -75,7 +75,7 @@ i2c_cm36651: i2c-gpio-2 {
> >   		#address-cells = <1>;
> >   		#size-cells = <0>;
> >   
> > -		cm36651@18 {
> > +		sensor@18 {
> light-sensor?

Ack, to this and all following. Thanks.

Best regards,
Krzysztof
