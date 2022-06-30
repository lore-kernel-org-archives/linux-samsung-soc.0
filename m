Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80B7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 07:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbiF3H6c (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 03:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbiF3H63 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 03:58:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C709317AAA
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:58:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a4so18725000lfm.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJMxRQnUNYQvlP7uEfgVmlMLr9rQqkQej3JH4PVMmdE=;
        b=aL1aT606iCTFZOa/2t6AEC5jU+oUtmBus4SJqq2CmfTKiyfQ/t/MuzUQoj4kPih6LN
         z7bL8E2SkH+TygVqlIkH55VjhnzTFy+9ntS7JhexGfq6JOEmJoGAO/i0PlyAEQQRQhH1
         D/sfrHWRL5hGqPCz7w5GBV6deH7m4tKJU6JP7RsNgf4wgx5XHJNy37DaNRHTw2x7SxHp
         Hdl+nqel2qgIFwSch8+CJ13tF/O66m5JJ2LmB6HqYdeUvedEEUUxNQy4Q7ZGfPt6ffWk
         LmmSvKfvlPWHNcM1TvXFzjZKiJGR0KKr99rD9Fz4Yqj/+ZUSKMhw6eBFmhslOX8PoGOG
         nNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJMxRQnUNYQvlP7uEfgVmlMLr9rQqkQej3JH4PVMmdE=;
        b=MBBFRvLm2iycf+hYmIa20YrxBodxAXM9RMF9yDnJ9xBxZX4qbLDF4+twKeaaco/lI1
         234+/QWLrhzYIKjiUGxVrSBdXPk9dmPnz39Xou5ccZv4lrDmKzAUEqKCh3RuW0Y/CHDN
         GUFS3jkCzBuVVuuQgxo+HrcNBEqJAc/7ZR1Flqg+7ArJD7l8ETPLMT0zpaUWpFO83owJ
         XF6i4syMOCrTkltogcntnhF8Xw/ejGl6yscA6Lrwzko55MpnDXPRo5TpUmWxkGtv1W/B
         2bJm75Tx1bVlpSm8JnuiBdbqODFfV4pUboJO3CMJGug9Leab8F2RkzSbJbqf6IUBHWW1
         US3Q==
X-Gm-Message-State: AJIora9imXrm+AYTdZ42r91pVNPuXKV/pQ2r+Ccynf1HT0QpXKAvxUVP
        Wuf7glCMZw/sLI0zb7usgNuYBcuNQh/flV9GbQhyig==
X-Google-Smtp-Source: AGRyM1ukGrSjpcuXE6bxl7rgH/OwrTDEttO2nj/+IU/ofXWJ4zArZf0/xpIclGzIJCRitKTVLVeQ1Et1Raj+eI45QaY=
X-Received: by 2002:a05:6512:2399:b0:47f:ad15:886f with SMTP id
 c25-20020a056512239900b0047fad15886fmr4639899lfv.226.1656575907178; Thu, 30
 Jun 2022 00:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd@epcas2p2.samsung.com>
 <cover.1656554759.git.chanho61.park@samsung.com> <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
 <CAPLW+4noFAHc+g7jTaaiMQH871OkqcOWjZ85-mpfPVbjiFO1iA@mail.gmail.com> <415e6440-0b46-8d3c-2e29-841bdb16e29a@linaro.org>
In-Reply-To: <415e6440-0b46-8d3c-2e29-841bdb16e29a@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 30 Jun 2022 10:58:16 +0300
Message-ID: <CAPLW+4kpH39O4hZNRG_JdVuV7v3PeA4biWSvdC5pZfGc-4GdXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: samsung: usi: add
 exynosautov9-usi compatible
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 30 Jun 2022 at 10:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/06/2022 07:59, Sam Protsenko wrote:
> > Hi Chanho,
> >
> > On Thu, 30 Jun 2022 at 05:19, Chanho Park <chanho61.park@samsung.com> wrote:
> >>
> >> Add samsung,exynosautov9-uart dedicated compatible for representing
> >> usi of Exynos Auto v9 SoC.
> >>
> >> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> >> ---
> >>  .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> >> index fde886a8cf43..6e806e950a36 100644
> >> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> >> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> >> @@ -22,8 +22,12 @@ properties:
> >>      pattern: "^usi@[0-9a-f]+$"
> >>
> >>    compatible:
> >> -    enum:
> >> -      - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
> >> +    oneOf:
> >> +      - items:
> >> +          - const: samsung,exynosautov9-usi
> >> +          - const: samsung,exynos850-usi
> >> +      - enum:
> >> +          - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
> >>
> >
> > Why "samsung,exynos850-usi" is duplicated? Maybe it would be correct
> > to leave only "items" and remove the "enum"?
>
> It has to be like this. Either you use exynos850-usi directly (on
> Exynos850) or as a fallback (on Autov9).
>

Thanks for the explanation, I never thought about that case before,
though noticed that pattern in bindings long ago.

> Best regards,
> Krzysztof
