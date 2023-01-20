Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464CAC25B4E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 09:32:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjATJcc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 04:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjATJca (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 04:32:30 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36130A3152
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 01:32:03 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so5407555wmb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 01:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kwcNWOJu++BSeRCaBZOYmzH+VNI6xbZXZZDxdGPdiVw=;
        b=ZddLHJ21L6LvL+VLyEVw2qy8taGHe0iy5tPJiiKRZ6ceveVeMciYO1lkRYca8zUfIo
         pQDIbKbCkEWsezy5rY/WocrhWzECr6gQ7tow9OPVuQqlbBmX9kq4YdCYZTt1TOvGf2fQ
         9dFelVP29QGMMjT+jAKE2VR0bimyBY8J1sFTLdqMAWH2GYzl6KGwMVglH6JfqCf/TLoC
         ANiolyMquW/5EUvTgFaKQnvQjnlrh9D4+gqX3aBoDgJCcgSSPa259laF5iaDZBk9TULD
         cfrKp7gPIA2r24+1q/p/1zubwJlaZ7AmXNbP/0l4B471FzNmngl/mlU6AMtOFRvd1aTK
         Ulkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwcNWOJu++BSeRCaBZOYmzH+VNI6xbZXZZDxdGPdiVw=;
        b=OLl6AtEEfIzZVm/RWw8D8WqOfM/qlFAPE9hm2oY2e2ftqrPecHwcFCCBAYVaUxlCOy
         /NW0EbjKs48Zw4QIUoqOT8dsTNftiUSK/IlK+I576balQ6zr18km82JdL6Mz/rRICGbf
         Bsntpe1rojRXWKX+4PEl17EoCu8QBRTLCyE4RWMWimqxGh3dPszANzqFl+ZDPp9z98Cg
         wtWP3rGalDh+EZ+B6c7dgQB/UzbXJm2u1hypjgQPpOfcIrh0604a52XoaUEWn2fH8qOb
         WGeXiD054vcFPiamrdQhyqwBrywsF6heiXU4hsBfniQXa7TYCiARgVG+11nmvzdINSOQ
         OM+w==
X-Gm-Message-State: AFqh2kr2dkh+7WeVJNS8HAnZW64iLuYcd20KNGxG0FtpMHxphmyt0aW+
        Y1slO6+XHIBhCswy8ee3GjHSgQ==
X-Google-Smtp-Source: AMrXdXskA1O2lr97eO1VtkYEVuAeFE+zfo7K+thpsW39zCg4BoBdphV/Sl932BgLu6aezuBUgbBlXg==
X-Received: by 2002:a05:600c:684:b0:3cf:5d41:b748 with SMTP id a4-20020a05600c068400b003cf5d41b748mr21784793wmn.36.1674207121229;
        Fri, 20 Jan 2023 01:32:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:39d8:cbee:30fb:cdaa? ([2a01:e0a:982:cbb0:39d8:cbee:30fb:cdaa])
        by smtp.gmail.com with ESMTPSA id q7-20020a05600c46c700b003c6bbe910fdsm2259681wmo.9.2023.01.20.01.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 01:32:00 -0800 (PST)
Message-ID: <770fb64a-b844-79ae-8cd7-bb80cf49b408@linaro.org>
Date:   Fri, 20 Jan 2023 10:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: mmc: drop unneeded quotes
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tony Huang <tonyhuang.sunplus@gmail.com>,
        Li-hao Kuo <lhjeff911@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Markus Pargmann <mpa@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/01/2023 09:57, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  2 +-
>   .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   |  2 +-

For Amlogic part:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../devicetree/bindings/mmc/arasan,sdhci.yaml |  6 ++--
>   .../devicetree/bindings/mmc/cdns,sdhci.yaml   | 22 ++++++------
>   .../bindings/mmc/fsl-imx-esdhc.yaml           |  4 +--
>   .../devicetree/bindings/mmc/fsl-imx-mmc.yaml  |  2 +-
>   .../mmc/microchip,dw-sparx5-sdhci.yaml        |  4 +--
>   .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  2 +-
>   .../devicetree/bindings/mmc/mxs-mmc.yaml      |  2 +-
>   .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 36 +++++++++----------
>   .../devicetree/bindings/mmc/owl-mmc.yaml      |  2 +-
>   .../bindings/mmc/renesas,mmcif.yaml           |  2 +-
>   .../devicetree/bindings/mmc/renesas,sdhi.yaml |  6 ++--
>   .../bindings/mmc/rockchip-dw-mshc.yaml        |  2 +-
>   .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |  2 +-
>   .../devicetree/bindings/mmc/sunplus,mmc.yaml  |  2 +-
>   .../bindings/mmc/synopsys-dw-mshc-common.yaml |  2 +-
>   17 files changed, 50 insertions(+), 50 deletions(-)
> 

<snip>

> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> index 1c391bec43dc..1a6cda82f296 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Amlogic Meson SDHC controller
>   
>   allOf:
> -  - $ref: "mmc-controller.yaml"
> +  - $ref: mmc-controller.yaml
>   
>   maintainers:
>     - Martin Blumenstingl <martin.blumenstingl@googlemail.com>

<snip>

