Return-Path: <SRS0=2lPF=5M=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CB4C43331
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 12:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25DBE2082D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 12:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585311855;
	bh=C5YlTLcDRxMZfK0h5wUDoWJt0/1yyatc5bq02PNhc24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KozDhKa6a3ehxnCH36G833iXAvh1rVR19C99+0bKiXIPZcLCZQ9kWYl6x//9W3J5d
	 mp0R4yCVHYuuuTvxGWg6l9WqvX6BbxSyJq/VPGnK5vDtFegG4eduUfVrd2Napmpfb4
	 NU8mhMvVp3ACUCwObyU74t8cUmO+wvfI/QDVEKnY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgC0MYO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 08:24:14 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38713 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgC0MYO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:24:14 -0400
Received: by mail-ed1-f66.google.com with SMTP id e5so10843420edq.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8uuNmwFzVOIYcfv+FLik7LntEF+jcvB7QBpJHF74M1A=;
        b=R4W04archre5/GGq2kvB0AtYfbJ2yM1+eAEB0RU9f1BtET3yKwGAKJ66y+Hap9vtvY
         W3M8nt8c62I3z+YaupcjOouIK3HVNUcj8RVcw64l0K36m3XHmTJphFLzkOEqz6PhDyk7
         3yEG9uxYBjqlUz8SAhlZ788tz6oitpzZ2WWInDhx/fkzxCRrT4WVBqbDb40icpqxzMO6
         SmLuS7BuMwqEpe3tUZt23E8IR/Uk5PbG0ipvxxj/Mvc5PWiPjK/RVMd7XwVfRUfuJ0NP
         F/Pbi3HbRTmcWqM5rHZePxum+pwE7DCOn6S3lfX8q2mpgK1nF6jChkjbgouMC2Y02CQN
         Hwgg==
X-Gm-Message-State: ANhLgQ2fkrZ+/961DgMS2bMstLWZqV3NLNR6skxWxpoCM4qmAA2uDwFB
        JEucaIiM7YpOSszfZGx91cO7D+Ck
X-Google-Smtp-Source: ADFU+vvz663JDTIcjKZV/x/5X6B6xy8ZGo6WIJG/h/Un4LFEwLhssav4BrjqMZdj0tfwVC9wHApjEg==
X-Received: by 2002:a50:f104:: with SMTP id w4mr13294555edl.258.1585311852872;
        Fri, 27 Mar 2020 05:24:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id v1sm726023ejj.87.2020.03.27.05.24.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:24:11 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:24:10 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 3/4] ARM: dts: exynos: Enable WLAN support for the Rinato
 board
Message-ID: <20200327122410.GE7233@kozik-lap>
References: <20200326094626.28308-1-m.szyprowski@samsung.com>
 <CGME20200326094635eucas1p17fbc47aecd9be9df10daacf091bc52be@eucas1p1.samsung.com>
 <20200326094626.28308-4-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326094626.28308-4-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 10:46:25AM +0100, Marek Szyprowski wrote:
> Add a node for BCM43342A SDIO chip on MSHC bus #1 and the required MMC
> power sequence node for the Exynos3250-based Rinato board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 36 +++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
> index 03f214089fd4..86fedccf277c 100644
> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> @@ -50,6 +50,11 @@
>  		};
>  	};
>  
> +	wlan_pwrseq: mshc1-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	i2c_max77836: i2c-gpio-0 {
>  		compatible = "i2c-gpio";
>  		gpios = <&gpd0 2 GPIO_ACTIVE_HIGH>, <&gpd0 3 GPIO_ACTIVE_HIGH>;
> @@ -625,6 +630,37 @@
>  	status = "okay";
>  };
>  
> +&mshc_1 {
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	broken-cd;
> +	non-removable;

These two exclude each other. I guess it should be non-removable only.

Best regards,
Krzysztof

> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	card-detect-delay = <200>;
> +	samsung,dw-mshc-ciu-div = <1>;
> +	samsung,dw-mshc-sdr-timing = <0 1>;
> +	samsung,dw-mshc-ddr-timing = <1 2>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
> +	bus-width = <4>;
> +
> +	mmc-pwrseq = <&wlan_pwrseq>;
> +
> +	brcmf: wifi@1 {
> +		compatible = "brcm,bcm4334-fmac";
> +		reg = <1>;
> +
> +		interrupt-parent = <&gpx1>;
> +		interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "host-wake";
> +	};
> +};
> +
>  &serial_0 {
>  	assigned-clocks = <&cmu CLK_SCLK_UART0>;
>  	assigned-clock-rates = <100000000>;
> -- 
> 2.17.1
> 
