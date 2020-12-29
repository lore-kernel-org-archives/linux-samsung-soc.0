Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8DFC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Dec 2020 15:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7221621D1B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Dec 2020 15:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgL2Pdm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 29 Dec 2020 10:33:42 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:34563 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgL2Pdl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Dec 2020 10:33:41 -0500
Received: by mail-wr1-f48.google.com with SMTP id q18so15010692wrn.1;
        Tue, 29 Dec 2020 07:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KbxC8BUslXOi2nw16TW+JiMMsQR/dWR1trqbXcDMTy8=;
        b=APpSlc5qPON6m+qWjYdb1XguvWo0Q2SATXRRGQul8G4VMsQZrCMkmMvEZgl9JI+Sa4
         SUr3oqlfDPpCqgcxNqPmPCuYHBhRZSVaGgVAWUtw5b1x7W40KVRKJfXcNmc4Qd5kU0CG
         WJedweP9CndMO9/MPO88aZr7u64Lqff8Ai97Ueq0bvAuI5UK2LBHq+ZeSAkwMcfOwSEa
         5s4jbcsyQyA/vSU6H6VSdHXdDyhTcDd0qGTv8y4AKWKoNDqHkxi+doGSrGRZri6ntb4G
         vJAS2YXPdQ1Wpz1OwBYdlS1eFBGiJ4iqMJE3pgkuOgV6EruMi/Ye04sJNmquTtfFQWwK
         mIwg==
X-Gm-Message-State: AOAM5307EOnILw0kgSpa0p0CltCeFlOEy770hXCyaaSacAspmpBh1r6t
        SLQWGk6uRaN7WUxA8ZI+oFQ=
X-Google-Smtp-Source: ABdhPJyV8W1AL7evIbfda+5yo8u6Xg5PPPkbBYn2kwFU5kwjyv1m5dIh/uuNcHNlKhwZ910s8iV2+Q==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr56580714wrn.300.1609255979314;
        Tue, 29 Dec 2020 07:32:59 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id h16sm60513836wrq.29.2020.12.29.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 07:32:58 -0800 (PST)
Date:   Tue, 29 Dec 2020 16:31:58 +0100
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
Message-ID: <20201229153158.GA11658@kozik-lap>
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
 <CGME20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737@eucas1p1.samsung.com>
 <20201120085637.7299-3-m.szyprowski@samsung.com>
 <20201120110503.GB26836@kozik-lap>
 <14102bab-33a1-45e0-0faf-883c7b1133a5@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14102bab-33a1-45e0-0faf-883c7b1133a5@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 20, 2020 at 12:07:44PM +0100, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 20.11.2020 12:05, Krzysztof Kozlowski wrote:
> > On Fri, Nov 20, 2020 at 09:56:37AM +0100, Marek Szyprowski wrote:
> >> USB2.0 PHY in Exynos5420 differs from Exynos5250 variant a bit, so use the
> >> recently introduced dedicated compatible for Exynos5420.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>   arch/arm/boot/dts/exynos54xx.dtsi | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
> >> index fe9d34c23374..2ddb7a5f12b3 100644
> >> --- a/arch/arm/boot/dts/exynos54xx.dtsi
> >> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
> >> @@ -188,7 +188,7 @@
> >>   			compatible = "samsung,exynos4210-ehci";
> >>   			reg = <0x12110000 0x100>;
> >>   			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> >> -			phys = <&usb2_phy 1>;
> >> +			phys = <&usb2_phy 0>;
> >>   			phy-names = "host";
> >>   		};
> >>   
> >> @@ -196,12 +196,12 @@
> >>   			compatible = "samsung,exynos4210-ohci";
> >>   			reg = <0x12120000 0x100>;
> >>   			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> >> -			phys = <&usb2_phy 1>;
> >> +			phys = <&usb2_phy 0>;
> >>   			phy-names = "host";
> >>   		};
> >>   
> >>   		usb2_phy: phy@12130000 {
> >> -			compatible = "samsung,exynos5250-usb2-phy";
> >> +			compatible = "samsung,exynos5420-usb2-phy";
> > The DTS change will wait till PHY driver adjustements get merged... or
> > if the difference is not critical, maybe using both compatibles (5420
> > and 5250) would have sense?
> 
> It won't work easily with both compatibles, because in the 5420 variant 
> I've also changed the PHY indices (5420 has no device and second hsic 
> phy). IMHO the dts change can wait for the next release.

Thanks, applied.

Best regards,
Krzysztof

