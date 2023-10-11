Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02CACDB47E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Oct 2023 23:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235197AbjJKXLC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Oct 2023 19:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbjJKXK7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 19:10:59 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB78A9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 16:10:55 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5855333fbadso270766a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 16:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065855; x=1697670655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/jasr9MC8Q6p4ZHn0V5Ncug2TkCqML9WgvcfMCVqZc=;
        b=rn5XYdpXBJmRRxzLl64pOttL81Znkyvc86DtKfvm77gnnEK1y3GCexHtg24ZtaNfwC
         5kC6okwJQ6Kr1w52vg8THyT8T1L/bRs3s59hHR7N/zYScOTeJUteUeJp07DUw4IM/V94
         GqOoz/E6LzU08J/nvRQLOVmiYcRsRPq06yEkgXubs3bT0HomCcFPbjmpbqmOoq7tKVmo
         VXneyDRSRYs97RiJ+jJtTl8YtpEVT7pRLLJ+ac8PlFEg6oqrnqRi4unckdzVZZJesB6f
         W/ceZ+orIlLpE3zo9v5Vmna5m+X86ialW+78PTDRZkre7jubvuILSRzvpeiE2vn0W75Q
         TRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065855; x=1697670655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/jasr9MC8Q6p4ZHn0V5Ncug2TkCqML9WgvcfMCVqZc=;
        b=Zg/laarEpU5h6V2X8XK1ebgMjEcag1R5CueAjosfHeaegW2qekvPPkCCJ6BYp26bfH
         BlX5dXipddv60qWbEaFmzChP7QZtZ5etiAlPzeiGQFoW8Ml+fXvm6bertrNjNgNGrSyc
         NhYGvuLdoh8OcJpQru9fKq/ZbdpLzoTyTILddw6HeTVBrwteFd1YdUriD2rYqbRCArAm
         TYkl21TkN1beGRagAD0xWXDV15N9p3OxHowdEo4YxcxPpeyk7tJcihhba6BGGuI0oJzQ
         J8gM4Akn9mgCnnqE1zJpNMjCiefZ/sKi3g+tg8D9cLodJgnJqqvFQkIRS82bt6IL8W0u
         o0ag==
X-Gm-Message-State: AOJu0YzPYpaniQvfrZHtIM4f/RmKePLNz0tFYLKhz8dXoP6NaPkTioMO
        zpimPOzKDHy9m9EI4CjqhrzliswbOciMbWT6tC76Ag==
X-Google-Smtp-Source: AGHT+IFIp8h+HJuF+A0hsmsQVC0HXjBDyrJM8tEfZ3SsW5MlLdmWSUbNrzXCF7aVJEtvzszUcBZLzs/De5VMD3dWoVE=
X-Received: by 2002:a05:6a20:5485:b0:161:25e5:8de9 with SMTP id
 i5-20020a056a20548500b0016125e58de9mr24576989pzk.48.1697065854855; Wed, 11
 Oct 2023 16:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-7-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-7-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 18:10:43 -0500
Message-ID: <CAPLW+4n=dBdpwPP5bgww6wGE1bPd32k=OT4R8ZUOt4BUvjVPGg@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] dt-bindings: pinctrl: samsung: add
 google,gs101-pinctrl compatible
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
> documentation.
>
> Add maxItems of 50 for the interrupts property as gs101 can have
> multiple irqs.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/pinctrl/samsung,pinctrl.yaml     | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.ya=
ml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 26614621774a..6dc648490668 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -35,6 +35,7 @@ properties:
>
>    compatible:
>      enum:
> +      - google,gs101-pinctrl
>        - samsung,s3c2412-pinctrl
>        - samsung,s3c2416-pinctrl
>        - samsung,s3c2440-pinctrl
> @@ -58,7 +59,8 @@ properties:
>    interrupts:
>      description:
>        Required for GPIO banks supporting external GPIO interrupts.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 50
>
>    power-domains:
>      maxItems: 1
> @@ -134,6 +136,24 @@ allOf:
>            minItems: 1
>            maxItems: 1
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-pinctrl
> +    then:
> +      properties:
> +        interrupts:
> +          description:
> +            Required for external wakeup interrupts. List all external
> +            wakeup interrupts supported by this bank.
> +          minItems: 1
> +          maxItems: 50
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.42.0.655.g421f12c284-goog
>
