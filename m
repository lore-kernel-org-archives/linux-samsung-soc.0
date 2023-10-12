Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E14CDB483
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Oct 2023 10:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343811AbjJLKjR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Oct 2023 06:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343649AbjJLKjQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 06:39:16 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C24B8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 03:39:14 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-579de633419so9700447b3.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697107153; x=1697711953; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3oDNI1r5lnQu4SogBoFfe1dTr8U9qrvg3JFlPaLZjkQ=;
        b=uEVzMo6ANZEA4+H1Wp+o8FzyCyx7DgWwzuhBiD7vv28bFN1i24xFEjoAvNZOqG8VWw
         GUa/n844hCwQey90judRdFae+nZTpVdt5DOICJB7RONmf896qu6fvWh/FJBZj6ROUshn
         pVFyxUiN+ht+y269nsGpyG9+Uzb4x42nGRn2siu5J6dcN0Q58gXgj1lEYAq/VbqxlQEa
         X1cH7r3l05+LroKi4Qj6YIWWbR+PeNgkvJ5yG0zwkuLMhD5/IbGQDhBQXAtfI6wz8DO3
         b4DF0YIdzTMgCUow0SNAdp7SyMHzv+lovaiXv0KH+fY0mSKFPRMoYDfIrM/lMhDMMe0S
         4jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697107153; x=1697711953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oDNI1r5lnQu4SogBoFfe1dTr8U9qrvg3JFlPaLZjkQ=;
        b=XwRF/J5M+TxWAgDpZeKsh3JD3Yh4mxolo++J10e8YZTiBOmcPveMb2M6M7nS6fOcrN
         UtYY8Wv8gZnHQTAQ4dSAMQlKXS5caPRtphHRe3aTzwMR/5wHiBPiL5BayMVIvV9zTz+t
         eWLJ0WM2b/thwNBI3MbdF7q/qmiJZRdTaA3g4hca0l+qkDHCJ9/5xTa1HKblU8ipM1Vf
         lWGriI0eGBugfu+qPkZv+KeRhV+uBn/9nUpzqEzyWNFIAIhDrNfOYK1PTEO6uZ3E/RRg
         BsmcKnkzg4HbqfIKQU7nXLfYWurPupggS8/OQuM6+9CdulTZE1QVa7W8gK41u/jVKBLS
         hvaA==
X-Gm-Message-State: AOJu0YwHV3aQ8oEcBLg/hgJNsBojwCQuMCiOOzkYu4bko9FMVhIFXWP8
        k4G6B0Ddde7P3vBxmXQ11xfaxn9/DJpj787UbYSClw==
X-Google-Smtp-Source: AGHT+IFxRHuALoKeSjfKb3H4CN2bFTSSU2Bt+HgqEZX9jtOl6oxsdLqG69us8msuH/TRvisud8wxsgY5xod/E0gS4Uc=
X-Received: by 2002:a0d:f204:0:b0:569:479f:6d7f with SMTP id
 b4-20020a0df204000000b00569479f6d7fmr22902098ywf.43.1697107153677; Thu, 12
 Oct 2023 03:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-3-peter.griffin@linaro.org> <5907e2b3-9a0b-4871-be08-6ca42200b8ec@linaro.org>
 <CADrjBPqF67bcTnssQO8cN2n1ZbevziVNa+gA5azEDz_1wXzaNQ@mail.gmail.com> <809be13a-74b7-4934-8319-17330febc1b7@linaro.org>
In-Reply-To: <809be13a-74b7-4934-8319-17330febc1b7@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 11:39:02 +0100
Message-ID: <CADrjBPpzfOmmr4sVDSXCM_RyVK1GKM+nVN6Cm=eMSBfN3sMciA@mail.gmail.com>
Subject: Re: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof

On Thu, 12 Oct 2023 at 11:20, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/10/2023 12:15, Peter Griffin wrote:
>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: google,gs101-cmu-top
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          items:
> >>> +            - description: External reference clock (24.576 MHz)
> >>> +
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: oscclk
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>
> >> enum:
> >>   - google,gs101-cmu-apm
> >>   - google,gs101-cmu-misc
> >
> > Ok just to be clear, are you saying I should have it like this?
> >
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             enum:
> >               - google,gs101-cmu-misc
>
> No, my bad, I meant apm + google,gs101-cmu-top
>
> >               - google,gs101-cmu-apm

Ah OK, yes that makes more sense. Thanks for the clarification :)

Peter.
