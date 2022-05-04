Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1848C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 09:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347541AbiEDJ7r (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 05:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbiEDJ7o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:59:44 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBB826AFB;
        Wed,  4 May 2022 02:56:08 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id a15-20020a17090ad80f00b001dc2e23ad84so4725101pjv.4;
        Wed, 04 May 2022 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uiamPFk0Q3zq2yFmBaHFzIGUOqetjbFDCmgmyxZF7O4=;
        b=SnJQrFWocgobc4LXgjf3sjbLOe78IkkWS8J/mqZ8tTx7ZX4L7lwnbSOJS3JzNkayjb
         WtIOcIKismeF9LfMK7aAUN/qPZVePwUCNfQonAKqBfe94mj6SVIXJ3ZxWnu7Dp+AWYxJ
         jXJ9PCTflomd3CwQd7EkLLDPVuMm2tPensN1yH3vxjboHJOm7buO4aN0KB8dE2tmQ+1y
         dG0NgpZw0OAuG3Woxc4TKHC6e0iYmRrM/V5JSX726f/OH8qyUzErI5gCK1KQwlGrPeVO
         WoLbJClbUWpmbnvSPhWGkErwFHh4+7XlbOYFw+9UGthQI6iLzshxkNOR5YWJqwP9hks8
         hZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uiamPFk0Q3zq2yFmBaHFzIGUOqetjbFDCmgmyxZF7O4=;
        b=ZjeZOsWFRpVq7+jHMFkrU6PrGyTDmC195GfZJfSrKk4wceHm/HRR7kqUQ2QibWf06o
         ZiXpaQnoOnFDwEfgxY9RE4NtIJSakcNqph8YpIojttCKt1BXcQ/3CogdK4mvTzBDNFia
         BcOGCyFHjuW4pVOFcBMb7xhgMj9FEuJHSATg2DlSJOKfvIC+ILBevWrv3yVwQKTEiRh8
         6Zuqzhsv2zZj8AIjMHNuMyaE1br2FDs1ky/kdvyiSfcf89KDVwCk5RCzEnqpHOQOS/eJ
         umkgX5JZGf8ltPau5Jd9m4JH3npL307t2+QNEBJytWCXkhNCkM/Ty1PZoAyHuVojJbk9
         J1zA==
X-Gm-Message-State: AOAM530EWgCgqoprys+ByoqMhYj6qYI9Thjnm4gf2hRy7xwOFslzPql/
        3U7Tmqtx5rA1lPR1QmZVDHU=
X-Google-Smtp-Source: ABdhPJwjOcXQ+QLfAd/fUs1MMU4AYewWj+pzio7KxSH+nmTpfQasOZl874nWoA1Lxoeu8q4KQTMDnQ==
X-Received: by 2002:a17:903:244c:b0:15e:b3f7:950d with SMTP id l12-20020a170903244c00b0015eb3f7950dmr8924703pls.9.1651658168452;
        Wed, 04 May 2022 02:56:08 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id s5-20020a17090aa10500b001d287fd3f79sm2811996pjp.46.2022.05.04.02.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 02:56:07 -0700 (PDT)
Message-ID: <754b7076-e3f5-ba07-6b26-5c60d9fe46af@gmail.com>
Date:   Wed, 4 May 2022 18:56:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 11/12] arm64: dts: exynosautov9: switch usi clocks
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075004epcas2p2fafaa565e78bfdbbf55c2b4da31743a9@epcas2p2.samsung.com>
 <20220504075154.58819-12-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-12-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 5. 4. 16:51, Chanho Park wrote:
> This changes to use cmu clock nodes instead of dummy fixed-rate-clock.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index c9cd3774f298..68335fefa5f3 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -158,17 +158,6 @@ xtcxo: clock {
>   			clock-output-names = "oscclk";
>   		};
>   
> -		/*
> -		 * Keep the stub clock for serial driver, until proper clock
> -		 * driver is implemented.
> -		 */
> -		uart_clock: uart-clock {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <133250000>;
> -			clock-output-names = "uart";
> -		};
> -
>   		/*
>   		 * Keep the stub clock for ufs driver, until proper clock
>   		 * driver is implemented.
> @@ -355,7 +344,8 @@ usi_0: usi@103000c0 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges;
> -			clocks = <&uart_clock>, <&uart_clock>;
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
>   			clock-names = "pclk", "ipclk";
>   			status = "disabled";
>   
> @@ -366,7 +356,8 @@ serial_0: serial@10300000 {
>   				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
>   				pinctrl-names = "default";
>   				pinctrl-0 = <&uart0_bus_dual>;
> -				clocks = <&uart_clock>, <&uart_clock>;
> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
> +					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
>   				clock-names = "uart", "clk_uart_baud0";
>   				status = "disabled";
>   			};

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
