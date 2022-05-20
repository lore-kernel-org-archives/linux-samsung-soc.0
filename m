Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE659C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 May 2022 10:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348256AbiETKqc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 May 2022 06:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348255AbiETKqb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 May 2022 06:46:31 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A4313DEB
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 03:46:29 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q130so9217785ljb.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NpVWvREIh58/LHu13eUchb+fJEVBqK/3PdnkHXlwMgE=;
        b=SZwKyWRAArJ9d5hGnCd+KJRQ4gwh9P0wHi5G6rlL/9KC5j7YCGSYbrcRAxjJth0yAA
         oPXwWx1dfUB8EXqJsIKK0kZfn6CZSMcHiKf7RDBzNZbKi0zc18nAoADeTpob/TVSIM9V
         UIC/8hQu9zLuAY3BALIFAC7Ay6JFoX9dNvKKPdsXxL2yn+r+ybOLocSPfl9OR/d1zZAq
         SiobhJ/nV3TAk3yPaLCqS6sNycjgIeP42Vr9WYpCPQyJEVzGLw6bVbcjdJPMCpMVmtuQ
         FnEI26iVD3jOeyVkpZlhuqOzJherI6A3SfXO7wc8a4ccx8KTOmdjoc0fl9JYi6mk+Ak5
         qHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NpVWvREIh58/LHu13eUchb+fJEVBqK/3PdnkHXlwMgE=;
        b=6Af4aYN/V34+rQvKx+f/4l2haJCJ/rDmsdifIm+K1GB3uTTPJob0lS3WhHRaZJ3aF8
         eFMPoQT4AppeDWVl5EYv4Ql6hek7l6j/oA8ezqWRVaW3GpD7OkYLa8EVz74ncuprViuQ
         3W4s1BAkFrlpXnhfsQzzDlz5KWV4UvmUY5YW8hxCx7ZMOdMdNKtqajAQjjOS5EQzvf0h
         SEUCWGwxrDNOREZHA27StQ1gzf3K6rqO6qaebyTZMafD7gKMTR7Vjyp0MT9yGL8XP7Iz
         XXUUYxtN9KurpYRLWkK1ZwkF8kIw089tPVzEob++R0qPmNm5gutYWHZm/wOR7YvvVyBy
         Z7lg==
X-Gm-Message-State: AOAM532CuXidUiWUSfWJnnoKrA3KGSaV88bEnfMh40IpZu8dnheiFprU
        LZExEJUx1ku/5dQiKMFD9/DL4g==
X-Google-Smtp-Source: ABdhPJzEYbhH3kFvrJ4gGx6P3qn8f2dClOO6VYa+DUtkKv4APbXFg/fHqfFNqceqseNkigxPmf2rtw==
X-Received: by 2002:a2e:804e:0:b0:253:cb15:38ba with SMTP id p14-20020a2e804e000000b00253cb1538bamr5297526ljg.204.1653043588322;
        Fri, 20 May 2022 03:46:28 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x9-20020a056512078900b0047255d211f9sm611468lfr.296.2022.05.20.03.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 03:46:27 -0700 (PDT)
Message-ID: <13662a9c-19c6-cb3d-6073-c87835a3c95d@linaro.org>
Date:   Fri, 20 May 2022 12:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] arm64: dts: exynoautov9: add syscon reboot/reboot_mode
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <CGME20220520045124epcas2p12235472b7e9f7588003a7c8c238e8866@epcas2p1.samsung.com>
 <20220520045210.55132-1-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520045210.55132-1-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/05/2022 06:52, Chanho Park wrote:
> Reboot of exynosautov9 SoC can be handled by setting the bit(
> SWRESET_SYSTEM[1]) of SYSTEM_CONFIGURATION register(PMU + 0x3a00).
> syscon-reboot-mode can be used to indicate the reboot mode for
> bootloader. SYSIP_DAT0 register(PMU + 0x810) will not be cleared after
> reboot so bootloader can enter the boot mode according to the value.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 0ce46ec5cdc3..d99e53406ee0 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -312,6 +312,22 @@ pinctrl_peric1: pinctrl@10830000 {
>  		pmu_system_controller: system-controller@10460000 {
>  			compatible = "samsung,exynos7-pmu", "syscon";
>  			reg = <0x10460000 0x10000>;
> +
> +			reboot: syscon-reboot {
> +				compatible = "syscon-reboot";
> +				regmap = <&pmu_system_controller>;
> +				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
> +				value = <0x2>;
> +				mask = <0x2>;
> +			};
> +
> +			reboot_mode: syscon-reboot-mode {

Node name: just "reboot-mode"

> +				compatible = "syscon-reboot-mode";
> +				offset = <0x810>; /* SYSIP_DAT0 */
> +				mode-bootloader = <0xfc>;
> +				mode-fastboot = <0xfa>;
> +				mode-recovery = <0xff>;

These are magic values understood by firmware, so please add a header
for them (something like include/dt-bindings/soc/rockchip,boot-mode.h
but with some prefixes like EXYNOSAUTOV9_BOOT_FASTBOOT))

> +			};
>  		};
>  
>  		syscon_fsys2: syscon@17c20000 {


Best regards,
Krzysztof
