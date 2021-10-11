Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291A0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1008560F43
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235853AbhJKKPX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Oct 2021 06:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235847AbhJKKPX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 06:15:23 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCDBC061745
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Oct 2021 03:13:23 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id i7so1160660vsm.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Oct 2021 03:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I14GHi8jxA3YeP5lUl6dG6cQQNqNA9f8zkpHem77AXE=;
        b=Iyead7c/Yz9/z8w1zLsuQQXRN4N9xsgHIwvPRw/5EPRjx2VnCODWhctr4Zs1zxLkWb
         G9c640BWp1yyOHh6XjFuA8iTnplnJpinYbPCbzWjInweK3g0JNuVsxSKbQsdY8Gs+G2Y
         I1As+3Yr3qRokQ+zh87zcBVd8FZDuCiza/MhyN7QbvuoGUXultzStxQ3/I2iw3p4BnqE
         WuQZhEpseiPXvquKDoxG0hLuhdWnH6J0v8PNr8pk320ZMCsqsxCax71j/LNfTo69lke/
         7YNCGaiUKNHPRcgUEFrErclqNB7aB0hjQCL5wJ3zpu0NZqfdtkbnul2qjydbvn9INcNe
         3DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I14GHi8jxA3YeP5lUl6dG6cQQNqNA9f8zkpHem77AXE=;
        b=5qjyDYDJvhhx+czMfbSNwsgrXeKxCOoRwlcW7uK3Nas2NRJun+m8SIjEYhqI3fRWm7
         jZkhH4DnPsTq42UXp8kb+/DleuxIyBLtMIdQhWcC3YtiSj4Fvm+EMgtogDiEycG31owz
         k4NIZIcsSdD74HwPiJi1PFazDaZcTjqCcpGgyTssxh1i3veZzHGcr+r5RSZglVJgBYfw
         Gxn2QmBR4Ltjp7X81WuuDaNHpInEwX+L60+8GnBlaBv8bYgQjiHnbPvu8PKaxrOQiXo/
         w5cqtvWMedbSi0pTwNV9gu92KfRU1LcwufKhUzaS6Gc04Ts/unU5hKVgvKiueNKpdfMF
         uEQw==
X-Gm-Message-State: AOAM531NV549WOaA6PCJL+9FvdY1fFkks4+oorfkXpGPQoMDmweY0mxu
        jyqzgLpu6pK+jShPFZsgItXF/Kb8w8jqdtDpAJHdiQ==
X-Google-Smtp-Source: ABdhPJzGhrvtSadLZJqKqJT3TOK0uyxaeX4nkcu5WKwayrjByJLIRU9CZUQy7omYuptslyvwrSEi19f6Q6iSlbAHsv4=
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr21164272vsp.35.1633947202056;
 Mon, 11 Oct 2021 03:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
 <20211008154352.19519-5-semen.protsenko@linaro.org> <7049b3a9-dc8f-2ae9-01e6-eb3b6f461400@kernel.org>
In-Reply-To: <7049b3a9-dc8f-2ae9-01e6-eb3b6f461400@kernel.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 11 Oct 2021 13:13:10 +0300
Message-ID: <CAPLW+4kJK=kaiCLDXX1EGLhbKJo5pcHQY9QCj0SVyGQP1n7q0g@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: Document Exynos850 CMU bindings
To:     Sylwester Nawrocki <snawrocki@kernel.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 9 Oct 2021 at 23:41, Sylwester Nawrocki <snawrocki@kernel.org> wrote:
>
> On 08.10.2021 17:43, Sam Protsenko wrote:
> > Provide dt-schema documentation for Exynos850 SoC clock controller.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>
> > diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> > new file mode 100644
> > index 000000000000..79202e6e6402
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> > @@ -0,0 +1,185 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/samsung,exynos850-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung Exynos850 SoC clock controller
> > +
> > +maintainers:
> > +  - Sam Protsenko <semen.protsenko@linaro.org>
> > +  - Chanwoo Choi <cw00.choi@samsung.com>
> > +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> > +  - Tomasz Figa <tomasz.figa@gmail.com>
> > +
> > +description: |
> > +  Exynos850 clock controller is comprised of several CMU units, generating
> > +  clocks for different domains. Those CMU units are modeled as separate device
> > +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> > +  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
> > +  clocks must be defined as fixed-rate clocks in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> > +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this identifier
> > +  to specify the clock which they consume. All clocks that available for usage
>
> s/All clocks that available/All clocks available ?
> No need to resend, I can amend it when applying.
>

Yeah, not a native speaker, I tend to do such mistakes sometimes :)
Please fix when applying.

Btw, I can see that you already applied 3 out of 5 patches from this
patch series here: [1]. Can you please also apply the rest, or is
there any outstanding comments that I missed?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git/log/?h=for-v5.16/next
