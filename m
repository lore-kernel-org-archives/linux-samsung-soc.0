Return-Path: <SRS0=wHux=CT=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04970C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Sep 2020 11:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B063A21D6C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Sep 2020 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599739034;
	bh=gPPcyn/tq/4FUyBAZRHDVT1Hgp+0p85nxiUqeEM9stk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=D12NJHl6BgmgaN5ROfOTkgPi3+AI5MjbT459XwW1Qt/nFVobcqfgSCw+MWtPJdX/s
	 56N2g7U91Ia1nQuqPnaWHEq8lPaebfgBulzm3tOpoX7eg6FFX6JkJglQzoj3lwrz0Q
	 eyl5biC9PrqWnwOq1WnnfoQD+GV0bLIYqCikHxE8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgIJL4l (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Sep 2020 07:56:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730544AbgIJLzb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 07:55:31 -0400
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BDE0E2075B;
        Thu, 10 Sep 2020 11:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599738931;
        bh=gPPcyn/tq/4FUyBAZRHDVT1Hgp+0p85nxiUqeEM9stk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R+2PJqwvb/POPURnczQeZytNBDYrwNG3cB3AxjkMkIDgQ2PiA/mtKTPP9OocKvh3P
         tCdzJDhwilBH0uR9FbsthykDsqEQTJL43DvQfiq0598xDxbq5GkCAKt0EwHNelHHEk
         QKAMCW5EyF/wN8ScDWDAtYYVf53p29eWzzesmjHQ=
Received: by mail-ed1-f48.google.com with SMTP id g4so6044279edk.0;
        Thu, 10 Sep 2020 04:55:30 -0700 (PDT)
X-Gm-Message-State: AOAM530so6r8TNeqlaylpuph2Ypc/7lSeivC5ylmR59aX/SQlgVk0bB7
        8nCVM/XXzLmH/0lDHj0n/LXZAeUAK8Hiw2Wxllc=
X-Google-Smtp-Source: ABdhPJx3loxbsLcMOjqHauv2rzhE2oJfoWMPP91+KqTvxXBJf5pfIsbyDngaUG90FaVG80CRKYGIpNE+nfedlmzEzm8=
X-Received: by 2002:a05:6402:180a:: with SMTP id g10mr8750346edy.18.1599738929240;
 Thu, 10 Sep 2020 04:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200907161141.31034-1-krzk@kernel.org> <20200907161141.31034-3-krzk@kernel.org>
 <20200908202544.GB846754@bogus>
In-Reply-To: <20200908202544.GB846754@bogus>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 10 Sep 2020 13:55:17 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdvfb2xY0nCh_Dyf1545b+q-BMYQJFrxLuLk6rh1acVoQ@mail.gmail.com>
Message-ID: <CAJKOXPdvfb2xY0nCh_Dyf1545b+q-BMYQJFrxLuLk6rh1acVoQ@mail.gmail.com>
Subject: Re: [PATCH 02/25] dt-bindings: iio: adc: exynos-adc: require second
 interrupt with touch screen
To:     Rob Herring <robh@kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Jonathan Bakker <xc-racer2@live.ca>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 8 Sep 2020 at 22:25, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Sep 07, 2020 at 06:11:18PM +0200, Krzysztof Kozlowski wrote:
> > The ADC in S3C/S5P/Exynos SoCs can be used also for handling touch
> > screen.  In such case the second interrupt is required.  This second
> > interrupt can be anyway provided, even without touch screens.  This
> > fixes dtbs_check warnings like:
> >
> >   arch/arm/boot/dts/s5pv210-aquila.dt.yaml: adc@e1700000: interrupts: [[23], [24]] is too long
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../bindings/iio/adc/samsung,exynos-adc.yaml      | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> > index cc3c8ea6a894..89b4f9c252a6 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> > @@ -41,7 +41,10 @@ properties:
> >      maxItems: 2
> >
> >    interrupts:
> > -    maxItems: 1
> > +    description:
> > +      ADC interrupt followed by optional touchscreen interrupt.
> > +    minItems: 1
> > +    maxItems: 2
> >
> >    "#io-channel-cells":
> >      const: 1
> > @@ -107,6 +110,16 @@ allOf:
> >            items:
> >              - const: adc
> >
> > +  - if:
> > +      properties:
> > +        has-touchscreen:
> > +          true
>
> This evaluates as true if 'has-touchscreen' is not present too. You
> should use 'required' here.

I see, thanks. I'll send a v2.

Best regards,
Krzysztof
