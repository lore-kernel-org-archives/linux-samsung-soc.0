Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D20AEE49AC
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Aug 2023 08:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjHSId5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Aug 2023 04:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjHSId4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Aug 2023 04:33:56 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDA1626BC
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Aug 2023 01:33:54 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so2138333a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Aug 2023 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692434033; x=1693038833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGcYL8UJ9k+/+DJ0dBVO4Lzq0csyHEZnijoTke8Cth8=;
        b=eQweFE+zOXpiSGJCh41kc+mszGLappZm5QTuSAtCMa+Xo1ifGgHrifQnazVKiFWMFE
         6lR0OYPgjVJS9Y6RGIUmAjyRvCx/7HNVs8dUrnfrcN79aBDXsukcO4yLuMP/VfPNy0eZ
         sDgF9Ur0wcxIkcjUeVAdLiqIlgPuW/A3rr2xPy5oGB4uoP75ThdH+BR1x7RqW5HsSFqy
         Y3fXffERC5znb4G2KaWeQrOHk6Km7zh8rNVP9ICqfgZYXqsXH4ZMVRi+7qYKEVMkLPCh
         ocTplA2aIboAVAez1tCDGKnxlW4POlyBNw8cV0Ssc40uwBvEgM57sf9IITS/1CJkffqv
         Wh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692434033; x=1693038833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGcYL8UJ9k+/+DJ0dBVO4Lzq0csyHEZnijoTke8Cth8=;
        b=Zd8o83fpcAkMdXgCjqlVECRpKsotvZyT6EPF9DCYLhdWmF434Xr+s1M8/2Et9TDIwo
         01VrOVZe9VffLtxIbSVhF21PFeHjEjzb8LMM2dbeGPUU2zuLZ4KFTrpe4/20FRi/1sWC
         X3nu9hEewebNfFx0IM47wuIbwz0aXfFJstmT9S1fcJo/DJ9JczM1U4rkavxzBacYV5aR
         UKBpv+DX/UYm0FTun2kBCjWQpdP2uZ2GSh93ftgeJ5yOp0jetk4gXHiE43AyVRtshQKb
         pMJKVjc5Nu248whoPKEDZf7Z6GrohqFSdWsHYoewxJaWyyhtyfzli1dX1ajvtGNG2wuE
         wtvg==
X-Gm-Message-State: AOJu0Yzw3lDKijeF9enMwx7I6C8a0Wux6bL4glWOpROSChWRXM1di8fK
        LP2G4Tr5rt5+39Bx5QpOBIQh9Q==
X-Google-Smtp-Source: AGHT+IH2DANJNHPRHzwPV1JrvPKiDcaHhTJsowdhXqW3c/aKX1l9pGW11yVAH/OOICuBrY2Scpu/DQ==
X-Received: by 2002:a17:906:76d9:b0:99e:12ab:f197 with SMTP id q25-20020a17090676d900b0099e12abf197mr1229566ejn.42.1692434033037;
        Sat, 19 Aug 2023 01:33:53 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id e16-20020a170906045000b0098dfec235ccsm2288004eja.47.2023.08.19.01.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 01:33:52 -0700 (PDT)
Message-ID: <920e4748-c0c8-940f-464a-aba8e925ee24@linaro.org>
Date:   Sat, 19 Aug 2023 10:33:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 7/8] arm64: dts: exynos: Enable USB in Exynos850
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
 <20230819031731.22618-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230819031731.22618-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/08/2023 05:17, Sam Protsenko wrote:
> Add USB controller and USB PHY controller nodes for Exynos850 SoC.
> 
> The USB controller has next features:
>   - Dual Role Device (DRD) controller
>   - DWC3 compatible
>   - Supports USB 2.0 host and USB 2.0 device interfaces
>   - Supports  full-speed (12 Mbps) and high-speed (480 Mbps) modes with
>     USB device 2.0 interface
>   - Supports on-chip USB PHY transceiver
>   - Supports up to 16 bi-directional endpoints (that includes control
>     endpoint 0)
>   - Complies with xHCI 1.00 specification
> 
> Only USB 2.0 is supported in Exynos850, so only UTMI+ PHY interface is
> specified in "phys" property (index 0) and PIPE3 is omitted (index 1).
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 30 +++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index aa077008b3be..198d1dfcc672 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -570,6 +570,36 @@ sysreg_cmgp: syscon@11c20000 {
>  			clocks = <&cmu_cmgp CLK_GOUT_SYSREG_CMGP_PCLK>;
>  		};
>  
> +		usbdrd: usb@13600000 {
> +			compatible = "samsung,exynos850-dwusb3";
> +			clocks = <&cmu_hsi CLK_GOUT_USB_BUS_EARLY_CLK>,
> +				 <&cmu_hsi CLK_GOUT_USB_REF_CLK>;
> +			clock-names = "bus_early", "ref";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x13600000 0x10000>;

Please put ranges after compatible. I know that existing code does not
follow this convention, though.

> +			status = "disabled";
> +


Best regards,
Krzysztof

