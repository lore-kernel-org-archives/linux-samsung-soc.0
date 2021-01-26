Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8F7C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jan 2021 13:09:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2354207A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jan 2021 13:09:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238218AbhA0NIq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jan 2021 08:08:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:53538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S313764AbhAZWpX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 17:45:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 580642067C;
        Tue, 26 Jan 2021 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611701083;
        bh=ODWHnU+vUf2zfuDRfx2nVSDz1hdZBIUFISiJD8zI944=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cm0HODEsGvYSt66s7yWvSYeipeNHgw7iJSiylVvHSbmELaVFGwhS6FqhY1C2tdYZu
         za78pd2l+y8I2MJbsrUkxDraY/lyO5dQubf3h2Ewicc9LFdUVwu6EEPcHmf9ORgQLd
         IKnaEucx9p8sbMFUn3aASGITf2kZd3T9VSBH063OIEfjsgjX1nvyyiIbm3w+VQFqEj
         FVi8nwwZVW6A0Jlnj+/qRRSGba+Gn7d/Pc7cgKIXqbCPwPOplHezYXOV9AxwOhSZqN
         FDVoAxRMStCc4hOzDMO9YethvEhzmLcD0aRB1N+E2rz2MBvVLxznmeEYH2ACi3r7iO
         xJxQiqBppqo9A==
Received: by mail-ot1-f43.google.com with SMTP id s2so15741069otp.5;
        Tue, 26 Jan 2021 14:44:43 -0800 (PST)
X-Gm-Message-State: AOAM5323MuP2GX7vaSWctRwroh6pcBmvgeWwcOAaIQQ9sCiTfEOnFii2
        XUQX6j0XSgcBogWvuu4+ru2tNENTNAi8G7joHZg=
X-Google-Smtp-Source: ABdhPJzg0PioE3hyZfUsZDHfNvyWERk/FdAgJhW90LOsfXvhX3C8sd8uQKUfre227TyRQcaQEUc84+K8otcpSOdPX+Y=
X-Received: by 2002:a9d:3bb7:: with SMTP id k52mr5713513otc.251.1611701082742;
 Tue, 26 Jan 2021 14:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
 <CGME20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737@eucas1p1.samsung.com>
 <20201120085637.7299-3-m.szyprowski@samsung.com> <20201120110503.GB26836@kozik-lap>
 <14102bab-33a1-45e0-0faf-883c7b1133a5@samsung.com>
In-Reply-To: <14102bab-33a1-45e0-0faf-883c7b1133a5@samsung.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 26 Jan 2021 23:44:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3QvbfYe5d_X4YcaRZaO4rykqoM_hm7nF-jwJGn0AQaug@mail.gmail.com>
Message-ID: <CAK8P3a3QvbfYe5d_X4YcaRZaO4rykqoM_hm7nF-jwJGn0AQaug@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY compatible
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 20, 2020 at 12:10 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
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
> >>                      compatible = "samsung,exynos4210-ehci";
> >>                      reg = <0x12110000 0x100>;
> >>                      interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> >> -                    phys = <&usb2_phy 1>;
> >> +                    phys = <&usb2_phy 0>;
> >>                      phy-names = "host";
> >>              };
> >>
> >> @@ -196,12 +196,12 @@
> >>                      compatible = "samsung,exynos4210-ohci";
> >>                      reg = <0x12120000 0x100>;
> >>                      interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> >> -                    phys = <&usb2_phy 1>;
> >> +                    phys = <&usb2_phy 0>;
> >>                      phy-names = "host";
> >>              };
> >>
> >>              usb2_phy: phy@12130000 {
> >> -                    compatible = "samsung,exynos5250-usb2-phy";
> >> +                    compatible = "samsung,exynos5420-usb2-phy";
> > The DTS change will wait till PHY driver adjustements get merged... or
> > if the difference is not critical, maybe using both compatibles (5420
> > and 5250) would have sense?
>
> It won't work easily with both compatibles, because in the 5420 variant
> I've also changed the PHY indices (5420 has no device and second hsic
> phy). IMHO the dts change can wait for the next release.

I see this made it into the pull request now, but I had not been aware
of the change earlier, and I'm slightly annoyed to have received it this
way:

- This is clearly an incompatible change to the dtb, and you all
   noticed that because it would cause a bisection problem. As
   a general rule, if a dts change does not work across bisection,
   we should not merge it at all, because it causes problems for
   anyone with external dts or dtb files.

- It would likely have been possible to define the new binding in
  a backward-compatible way. I don't see a reason why the index
  values in the binding had to change here, other than a slight
  inconvenience for the driver.

- If the change was really unavoidable, I would have expected
  a long explanation about why it had to be done in both the
  commit message and in the tag description for the pull
  request.

I've dropped the pull request for now, maybe this can still
be sorted out with another driver change that makes the
new compatible string backward-compatible.

        Arnd
