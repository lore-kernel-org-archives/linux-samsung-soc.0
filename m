Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A719C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Dec 2021 10:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbhLHKt1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Dec 2021 05:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhLHKt1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 05:49:27 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97070C061746
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Dec 2021 02:45:55 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id a14so4009576uak.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Dec 2021 02:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/r6Dv/N7sjx+bdz8SBfuwnr1RHZrgVW/J013I8U9x04=;
        b=kqpTzFcpDLa+L+CfslxnwWddQibBmhRZXFxvkDULtr5SJGg/AqPmo5t8/GXQGfWq+W
         D+vsfikzO/R7omHoURsl8SnVEw4FDgblW/Nq0cTkrXl2Li+DlBR8BeJ0UjA0hfF1baNO
         2CbS6pROiu9yJRUMVJcRh8gPa1lWiiLFdKhMXI/Imvimz+4a9G2Oc+CTw4VGA2A1YQzl
         I8edQOEjgcfYlI+1Gp8IfDh0/gv5V0wEJ7KSBKIDYGFJgvZv0hl2h3YTI8ET8BjVrAXM
         ZxdTsc6TaGDYRVL0clyiIjkpEWHIhRyWhCOGsqNzO38cg6BrgvUjhFV2ZE46fhfGRr3T
         oqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/r6Dv/N7sjx+bdz8SBfuwnr1RHZrgVW/J013I8U9x04=;
        b=KFlFZZlbNUr4mskPtHZnaD/io9wMrzPb+0fj44hyZmt8xxne9vyh8qm0DDdpqvhFjJ
         Ndh1+/1wDSV5+JMQQxDVYwO1LhO6xOgiyosGxXIHV/RUSqJGmVtKzdtfaRNiNbvt/IYt
         H0pWQ0q7/GSxK6OUKlDJI6fsQRbVo2WEONNvzS5+ROs9bZvb6UrUppezMkQiW4wUBUrl
         sISE2/TrGcD4JpIHSNacRubwi7McSc7nRJyvSgAE2dNJBp+6n7EmJucbZfyOXTru6RFW
         149S5kP+kGbpaWYxOhA7JwNHR/uJX7uHLAt7CInypXy7wdYnNaw2wkWwmQjV9SxafZCy
         EBZA==
X-Gm-Message-State: AOAM530ymO2b62hHrdF34RVLpjvr+pwDR4ZGwkHxYU45cpjTdg+NQzFL
        I/TK0yE2/k5b7qGHU9ynE3ZiBtUq7VeND+9mphFm1N2kSo7CbQ==
X-Google-Smtp-Source: ABdhPJwEqgwHp9fBL0Ka1YyTVXJEg1K8ymi3U5TF0WZlUtAyDHkKDuzEEXMhA04java4DL+Ds36B1OPNYlQHNBZM6Wk=
X-Received: by 2002:a05:6102:f10:: with SMTP id v16mr53676115vss.86.1638960354687;
 Wed, 08 Dec 2021 02:45:54 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211208092527epcas2p28f6688d5a2742c03cf474d8b2fa773cd@epcas2p2.samsung.com>
 <20211208091853.8557-1-chanho61.park@samsung.com>
In-Reply-To: <20211208091853.8557-1-chanho61.park@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 8 Dec 2021 12:45:43 +0200
Message-ID: <CAPLW+4m_NBisjR5s_a-HUS8cwnpkAPVAAG--o65fKj9Njmo==g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: exynosautov9: convert serial_0 for USI
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 8 Dec 2021 at 11:25, Chanho Park <chanho61.park@samsung.com> wrote:
>
> According to USI v2 driver change[1], serial_0 node should be converted to
> use the USI node hierarchy. syscon_peric0 will be used as a syscon node
> to control the USI00_USI_SW_CONF register.
> This also changes the serial node name from uart@ to serial@.
>
> [1]: https://lore.kernel.org/linux-samsung-soc/20211204195757.8600-2-semen.protsenko@linaro.org/
>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---

Thanks for helping us out!

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> Change from v1:
> - Put usi_0 node alphabetically in sadk.dts
>
>  .../boot/dts/exynos/exynosautov9-sadk.dts     |  4 +++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 36 ++++++++++++++-----
>  2 files changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> index ef46d7aa6e28..57518cb5e8c4 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> @@ -54,3 +54,7 @@ &ufs_0 {
>         vcc-supply = <&ufs_0_fixed_vcc_reg>;
>         vcc-fixed-regulator;
>  };
> +
> +&usi_0 {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index a960c0bc2dba..de8fcb82eaec 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -7,6 +7,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>
>  / {
>         compatible = "samsung,exynosautov9";
> @@ -256,16 +257,35 @@ syscon_fsys2: syscon@17c20000 {
>                         reg = <0x17c20000 0x1000>;
>                 };
>
> -               /* USI: UART */
> -               serial_0: uart@10300000 {
> -                       compatible = "samsung,exynos850-uart";
> -                       reg = <0x10300000 0x100>;
> -                       interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
> -                       pinctrl-names = "default";
> -                       pinctrl-0 = <&uart0_bus_dual>;
> +               syscon_peric0: syscon@10220000 {
> +                       compatible = "samsung,exynosautov9-sysreg", "syscon";
> +                       reg = <0x10220000 0x2000>;
> +               };
> +
> +               usi_0: usi@103000c0 {
> +                       compatible = "samsung,exynos850-usi";
> +                       reg = <0x103000c0 0x20>;
> +                       samsung,sysreg = <&syscon_peric0 0x1000>;
> +                       samsung,mode = <USI_V2_UART>;
> +                       samsung,clkreq-on; /* needed for UART mode */
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
>                         clocks = <&uart_clock>, <&uart_clock>;
> -                       clock-names = "uart", "clk_uart_baud0";
> +                       clock-names = "pclk", "ipclk";
>                         status = "disabled";
> +
> +                       /* USI: UART */
> +                       serial_0: serial@10300000 {
> +                               compatible = "samsung,exynos850-uart";
> +                               reg = <0x10300000 0xc0>;
> +                               interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&uart0_bus_dual>;
> +                               clocks = <&uart_clock>, <&uart_clock>;
> +                               clock-names = "uart", "clk_uart_baud0";
> +                               status = "disabled";
> +                       };
>                 };
>
>                 ufs_0_phy: ufs0-phy@17e04000 {
> --
> 2.34.1
>
