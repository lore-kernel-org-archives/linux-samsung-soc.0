Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F29C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jan 2021 08:32:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 512952073C
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jan 2021 08:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhA0IbR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:31:17 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:41824 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbhA0I3G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:29:06 -0500
Received: by mail-wr1-f45.google.com with SMTP id p15so948965wrq.8;
        Wed, 27 Jan 2021 00:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=41gl6Fnhj03Hx5/M76IkgYSS5orNB1WxIO0IASZAjIY=;
        b=BEBN2iPimf0QjzEgLFvBBAqFrRwQuzXz8ji4wLqAVA4N84DOeohHPhShjPMFyakHNL
         f7DdgjjOGa+1shV6b/Mtf4MKcTAsw0bSO5Kvt/q2XQ50jEKqu/aG8rMdUK6LP5B4f21Q
         r7kD8G31U/BSap5lsHsdRQFUoIQC1UPysgUQ+dPw9cPLv67NBWNVwgcCWEiJuKeltIVM
         nl9T6cLdaMMnG55KEfvpsgSfaZUZ3ajfTpinpckYpD3DRmAR2YnXE1DR8dq0nZsKtcMi
         ysDTTTUyGj40ql/yfAXEzSJUcMOB8M1VXA/CYE/dE7T7pWxyE5NY8Hc9Fy8qgR23t94W
         plJg==
X-Gm-Message-State: AOAM530Mm5/VDEn5rXPrwlOOB2XxvbAaNEODozrEUkcLjfDpL/2ZVHRC
        J8IwyJZ8VFzO+mzYJdsVkBJByitVUw4=
X-Google-Smtp-Source: ABdhPJxb4U0L1sIeKJeqRz+W1+pCOhcnSQc3orVK5+DnjTLjuQVSPObkbdpVsqllDqizUGdzjWLPKw==
X-Received: by 2002:a5d:4f87:: with SMTP id d7mr9627439wru.385.1611734344838;
        Tue, 26 Jan 2021 23:59:04 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id u5sm1657992wmg.9.2021.01.26.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 23:59:03 -0800 (PST)
Date:   Wed, 27 Jan 2021 08:59:02 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY
 compatible
Message-ID: <20210127075902.esm3tukq4pwmdf3j@kozik-lap>
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
 <CGME20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737@eucas1p1.samsung.com>
 <20201120085637.7299-3-m.szyprowski@samsung.com>
 <20201120110503.GB26836@kozik-lap>
 <14102bab-33a1-45e0-0faf-883c7b1133a5@samsung.com>
 <CAK8P3a3QvbfYe5d_X4YcaRZaO4rykqoM_hm7nF-jwJGn0AQaug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a3QvbfYe5d_X4YcaRZaO4rykqoM_hm7nF-jwJGn0AQaug@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jan 26, 2021 at 11:44:26PM +0100, Arnd Bergmann wrote:
> On Fri, Nov 20, 2020 at 12:10 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > On 20.11.2020 12:05, Krzysztof Kozlowski wrote:
> > > On Fri, Nov 20, 2020 at 09:56:37AM +0100, Marek Szyprowski wrote:
> > >> USB2.0 PHY in Exynos5420 differs from Exynos5250 variant a bit, so use the
> > >> recently introduced dedicated compatible for Exynos5420.
> > >>
> > >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > >> ---
> > >>   arch/arm/boot/dts/exynos54xx.dtsi | 6 +++---
> > >>   1 file changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
> > >> index fe9d34c23374..2ddb7a5f12b3 100644
> > >> --- a/arch/arm/boot/dts/exynos54xx.dtsi
> > >> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
> > >> @@ -188,7 +188,7 @@
> > >>                      compatible = "samsung,exynos4210-ehci";
> > >>                      reg = <0x12110000 0x100>;
> > >>                      interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> > >> -                    phys = <&usb2_phy 1>;
> > >> +                    phys = <&usb2_phy 0>;
> > >>                      phy-names = "host";
> > >>              };
> > >>
> > >> @@ -196,12 +196,12 @@
> > >>                      compatible = "samsung,exynos4210-ohci";
> > >>                      reg = <0x12120000 0x100>;
> > >>                      interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> > >> -                    phys = <&usb2_phy 1>;
> > >> +                    phys = <&usb2_phy 0>;
> > >>                      phy-names = "host";
> > >>              };
> > >>
> > >>              usb2_phy: phy@12130000 {
> > >> -                    compatible = "samsung,exynos5250-usb2-phy";
> > >> +                    compatible = "samsung,exynos5420-usb2-phy";
> > > The DTS change will wait till PHY driver adjustements get merged... or
> > > if the difference is not critical, maybe using both compatibles (5420
> > > and 5250) would have sense?
> >
> > It won't work easily with both compatibles, because in the 5420 variant
> > I've also changed the PHY indices (5420 has no device and second hsic
> > phy). IMHO the dts change can wait for the next release.
> 
> I see this made it into the pull request now, but I had not been aware
> of the change earlier, and I'm slightly annoyed to have received it this
> way:
> 
> - This is clearly an incompatible change to the dtb, and you all
>    noticed that because it would cause a bisection problem. As
>    a general rule, if a dts change does not work across bisection,
>    we should not merge it at all, because it causes problems for
>    anyone with external dts or dtb files.

Hi Arnd,

No, it does not create a bisection problem. The driver change adding new
compatible is already in v5.11-rc1.

> 
> - It would likely have been possible to define the new binding in
>   a backward-compatible way. I don't see a reason why the index
>   values in the binding had to change here, other than a slight
>   inconvenience for the driver.

It does not matter since it's a new compatible and old one is not
affected. Nothing got broken before this patch, nothing got broken after
applying it via samsung-soc. No backwards compatibility is affected.

> 
> - If the change was really unavoidable, I would have expected
>   a long explanation about why it had to be done in both the
>   commit message and in the tag description for the pull
>   request.
> 
> I've dropped the pull request for now, maybe this can still
> be sorted out with another driver change that makes the
> new compatible string backward-compatible.

It's a different hardware. New hardware does not have to be compatible
with old hardware. However old DTB is still doing fine (although with
the original issue not fixed).

Best regards,
Krzysztof

