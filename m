Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ABCC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Oct 2022 20:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiJKU6e (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Oct 2022 16:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiJKU6d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Oct 2022 16:58:33 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA1058DEB
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Oct 2022 13:58:31 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id g9so9730995qvo.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Oct 2022 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mAHY6RXJ0nyPOXmiZe+CE8JvmNJU/Rv6H1VrtQQpaY=;
        b=YzVPehwVEYa5twQoFeGI45fkEkYXwVmX6VSDI0sLF59itZz8N5lt3HukThIAub9Uoi
         glaQr5ZUPcuGqfw2a/oa4HBN2ljScw/Z98y50iXxUCiEdBgP+iI9IJJTHgc86J4ZDQMQ
         HHrJFkORoOrxtskJlxsCq4vkzSowgZdLgtzajS8JQtVwNVi47qEOlmIlkK3uzVrc0WS8
         2yTJy6sBlmE9wkuaA1BXPCrIWbEdZVSGNQ0OAugke5lBvhZinLvcIjhPk1HfKvezcKhs
         yk5kp14weVRyUipL/d8iCq/xURXsrJF1gKkSE/e6jsAW+tI0QeFvaz7NPkZ1E2ZRlJk2
         wBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mAHY6RXJ0nyPOXmiZe+CE8JvmNJU/Rv6H1VrtQQpaY=;
        b=m4U6g1uxZ4aL/Lfk3XGLfCHhwihEbhAVTU7tdYJU2StLAQYpBnZty0fAiqrlWXg9oE
         BlgSGLRSzYdMQhjUAiCWiT8eTFCuaSq7ddy/5JFqdbmT4XFl7sbRrPB7m5OgPMZ/G+xC
         LjAcV6+CPr3EMJYW1maDa+6hBi7nkXjCCAU6RRi1/uXqpGfC/JpZpntlHz9fpnixOX/+
         IOHT7PXrXSW4b2JIIbgr/cbNwLLelOlTLBL5qgWpKoQ5EctuYvXvupoJCVYLSLdxJqb6
         UeMUoasqaL748r8A7wQlRPVJKnRS1yrKzqcPFvvxwKHGD/Qhht9LUQZG24l0kRzY98z3
         9GNA==
X-Gm-Message-State: ACrzQf2+td/1o9B6KLEbaXAPm7vkDSm2nZpwxH3j1nAn3ainevRcsu01
        z3QSm2p2fNTjgRw35Y4dySwVfQ==
X-Google-Smtp-Source: AMsMyM5WexhRoKAuqE1aNkWUn9DwGaVN5NqqdcUsKdNKxRxdcaFeCrG0LLK5l0onZLNKntt2qlysKQ==
X-Received: by 2002:ad4:5ba1:0:b0:4b1:9a15:4766 with SMTP id 1-20020ad45ba1000000b004b19a154766mr20628926qvq.6.1665521910121;
        Tue, 11 Oct 2022 13:58:30 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id r4-20020a05622a034400b00398a7c860c2sm7680696qtw.4.2022.10.11.13.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 13:58:29 -0700 (PDT)
Message-ID: <fa7c6054-7076-299d-ed0f-9e4fc0ffc194@linaro.org>
Date:   Tue, 11 Oct 2022 16:58:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH V2] arm64: dts: fix drive strength macros as per FSD HW UM
Content-Language: en-US
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, chanho61.park@samsung.com,
        linus.walleij@linaro.org, pankaj.dubey@samsung.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <CGME20221011083029epcas5p3cef6047d23d0682a9cb70ba6178067a8@epcas5p3.samsung.com>
 <20221011080359.76220-1-p.rajanbabu@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011080359.76220-1-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/10/2022 04:03, Padmanabhan Rajanbabu wrote:
> Drive strength macros defined for FSD platform is not reflecting actual
> name and values as per HW UM. FSD SoC pinctrl has following four levels of

s/name/names/

> drive-strength and their corresponding values:
> Level-1 <-> 0
> Level-2 <-> 1
> Level-4 <-> 2
> Level-6 <-> 3
> 
> The commit 684dac402f21 ("arm64: dts: fsd: Add initial pinctrl support")
> used drive strength macros defined for Exynos4 SoC family. For some IPs
> the macros values of Exynos4 matched and worked well, but Exynos4 SoC
> family drive-strength (names and values) is not exactly matching with
> FSD SoC.
> 
> Fix the drive strength macros to reflect actual names and values given
> in FSD HW UM. This also ensures that the existing peripherals in device
> tree file is using correct drive strength MACROs to function as
> expected.
> 
> Fixes: 684dac402f21 ("arm64: dts: fsd: Add initial pinctrl support")
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---

Rest of commit msg looks ok.

>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 34 +++++++++++-----------
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.h    |  6 ++--
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> index d0abb9aa0e9e..e3852c946352 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> @@ -55,14 +55,14 @@
>  		samsung,pins = "gpf5-0";
>  		samsung,pin-function = <FSD_PIN_FUNC_2>;
>  		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
> -		samsung,pin-drv = <FSD_PIN_DRV_LV2>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
>  	};
>  
>  	ufs_refclk_out: ufs-refclk-out-pins {
>  		samsung,pins = "gpf5-1";
>  		samsung,pin-function = <FSD_PIN_FUNC_2>;
>  		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
> -		samsung,pin-drv = <FSD_PIN_DRV_LV2>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
>  	};
>  };
>  
> @@ -239,105 +239,105 @@
>  		samsung,pins = "gpb6-1";
>  		samsung,pin-function = <FSD_PIN_FUNC_2>;
>  		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> -		samsung,pin-drv = <FSD_PIN_DRV_LV2>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
>  	};
>  
>  	pwm1_out: pwm1-out-pins {
>  		samsung,pins = "gpb6-5";
>  		samsung,pin-function = <FSD_PIN_FUNC_2>;
>  		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> -		samsung,pin-drv = <FSD_PIN_DRV_LV2>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
>  	};
>  
>  	hs_i2c0_bus: hs-i2c0-bus-pins {
>  		samsung,pins = "gpb0-0", "gpb0-1";
>  		samsung,pin-function = <FSD_PIN_FUNC_2>;
>  		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> -		samsung,pin-drv = <FSD_PIN_DRV_LV1>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;

You are now changing both the value for register and the meaning (name).
Your commit msg indicated that the names are not correct, not the
values. Based on the commit msg, I expect the DTBs are the same. Are
they? If not, it these are two different commits with their own
explanations/reasoning.

Best regards,
Krzysztof

