Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E79C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Feb 2023 07:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjBIHRd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Feb 2023 02:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjBIHRQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 02:17:16 -0500
Received: from out-239.mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FE1564B2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Feb 2023 23:15:59 -0800 (PST)
Date:   Thu, 9 Feb 2023 08:14:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1675926881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aDefePb9DzE68gMvRuH6VgPExZBXi4eiCm1B5eLWrq4=;
        b=HmcDohBMTsSZToZvxKzDdIAGZRS9A7jNchA6rtcqby/5wjGIifQzTcJ1VkifmfF9E5Pnc5
        pJdn94Xd0Q50BGvPXnGofxexQeIdDD38C0HwrFUFIev+pWBPvFGgjLR0I+J+gH1EH7bHsq
        EZ8Mfx1DgYeRmEv8d1aHfUCUFVysdUE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Henrik Grimler <henrik@grimler.se>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Subject: Re: [RFT PATCH 1/3] ARM: dts: exynos: add "gpios" suffix to
 wlf,ldo1ena on Midas
Message-ID: <Y+SdXZpJbm+7+SPp@L14.lan>
References: <20230208172634.404452-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208172634.404452-1-krzysztof.kozlowski@linaro.org>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Feb 08, 2023 at 06:26:32PM +0100, Krzysztof Kozlowski wrote:
> The GPIOs properties should end with "gpios" suffix and Linux gpiolib
> already handles both names, so switch to preferred one.
> 
> While touching the lines, replace open-coded GPIO_ACTIVE_HIGH flag.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Tested-by: Henrik Grimler <henrik@grimler.se>

Audio still works fine on i9300, and there are no new warnings/errors
in dmesg.

Best regards,
Henrik Grimler

> ---
>  arch/arm/boot/dts/exynos4412-midas.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
> index d5074fa57142..525f945c4b91 100644
> --- a/arch/arm/boot/dts/exynos4412-midas.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
> @@ -653,8 +653,8 @@ wm1811: audio-codec@1a {
>  		CPVDD-supply = <&vbatt_reg>;
>  		SPKVDD1-supply = <&vbatt_reg>;
>  		SPKVDD2-supply = <&vbatt_reg>;
> -		wlf,ldo1ena = <&gpj0 4 0>;
> -		wlf,ldo2ena = <&gpj0 4 0>;
> +		wlf,ldo1ena-gpios = <&gpj0 4 GPIO_ACTIVE_HIGH>;
> +		wlf,ldo2ena-gpios = <&gpj0 4 GPIO_ACTIVE_HIGH>;
>  	};
>  };
>  
> -- 
> 2.34.1
> 
