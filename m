Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5922FC63798
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 11:05:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09CAA2222F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 11:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgKTLFL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Nov 2020 06:05:11 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:41538 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbgKTLFK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 06:05:10 -0500
Received: by mail-ej1-f66.google.com with SMTP id gj5so12296423ejb.8;
        Fri, 20 Nov 2020 03:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EBLZPAUMd8iP2TDoeCDvqJOwAfB0SEhGQ7/Pjk6apuw=;
        b=s5ZoTneukJaqOGM5BTau9pLjqwmrsCubJrXQVPjIqBxUHWJxCMWdu2GRG+KfMJTFlf
         mUmo32TPCm6kpKSH3G8XK8MB1vFJnlkZnqzIYApiHXGad+LalCNXtbGgTYCtXeUVWNNw
         gpOcgMwuXIIcZUa+H1sU7cyERttU1gHn62FkVXJtNCkZkMWJ9M89JBZ+hdfW9oNb72C5
         BW758qpt4wsyNAj4t+XV/ZvpeeDZgQ6+1wGBmCijy4U7qR35ogAuTYFqopxzX9DfMXxk
         PhmQX2Iu9a9A9hT8Wd7Jot90uGwlZWo9rn+jZYFYFBujXnGirJ9pe4/RZPUcxnnYCXDP
         p0iw==
X-Gm-Message-State: AOAM532g5npq3QsEgEKnkDpz7cKVZmq3s6Kldt/DlAI0T7pcJO1bLnN4
        IvJ3O5JESOoACbE/bQagvJA=
X-Google-Smtp-Source: ABdhPJztcArmWGA4q/+U4TNa9a/MtEwyBGeg06Xr7Pb6jxOlHEvS7eILLMPlqVPxHgEMptx8xzlGeA==
X-Received: by 2002:a17:906:ec9:: with SMTP id u9mr32667305eji.400.1605870306567;
        Fri, 20 Nov 2020 03:05:06 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id s6sm979774ejb.122.2020.11.20.03.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 03:05:05 -0800 (PST)
Date:   Fri, 20 Nov 2020 12:05:03 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY
 compatible
Message-ID: <20201120110503.GB26836@kozik-lap>
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
 <CGME20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737@eucas1p1.samsung.com>
 <20201120085637.7299-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120085637.7299-3-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 20, 2020 at 09:56:37AM +0100, Marek Szyprowski wrote:
> USB2.0 PHY in Exynos5420 differs from Exynos5250 variant a bit, so use the
> recently introduced dedicated compatible for Exynos5420.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos54xx.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
> index fe9d34c23374..2ddb7a5f12b3 100644
> --- a/arch/arm/boot/dts/exynos54xx.dtsi
> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
> @@ -188,7 +188,7 @@
>  			compatible = "samsung,exynos4210-ehci";
>  			reg = <0x12110000 0x100>;
>  			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&usb2_phy 1>;
> +			phys = <&usb2_phy 0>;
>  			phy-names = "host";
>  		};
>  
> @@ -196,12 +196,12 @@
>  			compatible = "samsung,exynos4210-ohci";
>  			reg = <0x12120000 0x100>;
>  			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&usb2_phy 1>;
> +			phys = <&usb2_phy 0>;
>  			phy-names = "host";
>  		};
>  
>  		usb2_phy: phy@12130000 {
> -			compatible = "samsung,exynos5250-usb2-phy";
> +			compatible = "samsung,exynos5420-usb2-phy";

The DTS change will wait till PHY driver adjustements get merged... or
if the difference is not critical, maybe using both compatibles (5420
and 5250) would have sense?

Best regards,
Krzysztof
