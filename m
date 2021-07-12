Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50719C07E9C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Jul 2021 15:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3814C61004
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Jul 2021 15:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbhGLP03 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Jul 2021 11:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235481AbhGLP03 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 11:26:29 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0DAEC0613DD
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jul 2021 08:23:40 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gn32so35387352ejc.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jul 2021 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VA3yp4yZWDVxCC+ZLuEwER2TrK+o/mFjvWm7UpsSPIY=;
        b=NnYB8MzvR3bWYuv07pdYMOpvxr7ZdT5X5LJILgCRSWZa6lYStLwh1aVJo2KvQyrbp4
         07/iNnTJKcR7XYGQJpOCCQ7X70rHvWg7n+W8gkVzWxH2wQDH/PiQzdZoA9ELdENxMI0B
         GHtT+7zthyIEJ7kQGJxYi4iA+Uga6sZ0/5rH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VA3yp4yZWDVxCC+ZLuEwER2TrK+o/mFjvWm7UpsSPIY=;
        b=kvUwnJ1vMXsCxnqDxEY/dNTKXqnZ7QbawqAdJtXiDFuvK1PWQkKjgHY701Bz48A9nR
         wVsqqm/Nszy8ZVB5E/7qI1Vo+pKEiKm5xNjNYYVxpQHDWpug1Slc5Uh8vB0/9Zx7biHS
         aXAhkx9jsbTR+fCUH5FhXLWrmm2/Bp4yma4526oRJARcc0EjhybJMVPVw0W5pSvXNsHV
         NtjtMBTN5GzYqSA6Sg/7ygy4LfoajBjdsbStY+CKhSVg/M2krTOVV3aDl3QMjw/LtJWR
         FbitHrSb3578jZEyGVBiyQTkxI2W9m6kyuwK7whcgwIM7qivwsOVNQjyDV5RqCWIN4hW
         yABw==
X-Gm-Message-State: AOAM533qWUKoFj+wsUKblLOxaWrfOZLu8BNDB4mNITxYaPuywOJ+HmVd
        bnD7hqvHefGaYbru4JH0EVN9vGfqVJhAcIcVgYbcgA==
X-Google-Smtp-Source: ABdhPJyh9uaWNvwE5VjJ4T2AJwMVEx/AiAZFwRgxIv+sj2fMKlHmDiozU9MZIqUPGmhK9A7ZHvT8/z/mDn3SdE6EjpA=
X-Received: by 2002:a17:906:38f:: with SMTP id b15mr27458618eja.186.1626103419313;
 Mon, 12 Jul 2021 08:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-9-jagan@amarulasolutions.com> <20210712151322.GA1931925@robh.at.kernel.org>
In-Reply-To: <20210712151322.GA1931925@robh.at.kernel.org>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 12 Jul 2021 20:53:28 +0530
Message-ID: <CAMty3ZCa6sDKGvsJ3o8h6BX6CpPAuv_L17ErMcQ25-of-XNMVg@mail.gmail.com>
Subject: Re: [RFC PATCH 08/17] dt-bindings: display: bridge: Add Samsung MIPI
 DSIM bridge
To:     Rob Herring <robh@kernel.org>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jul 12, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Jul 04, 2021 at 02:32:21PM +0530, Jagan Teki wrote:
> > Samsing MIPI DSIM bridge can be found on Exynos and NXP's
> > i.MX8M Mini and Nano SoC's.
> >
> > This dt-bindings replaces legacy exynos_dsim.txt.
> >
> > Used the example node from latest Exynos SoC instead of
> > the one used in legacy exynos_dsim.txt.
> >
> > Add dt-bingings for it.
>
> typo
>
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../display/bridge/samsung,mipi-dsim.yaml     | 278 ++++++++++++++++++
> >  .../bindings/display/exynos/exynos_dsim.txt   |  90 ------
> >  MAINTAINERS                                   |   1 +
> >  3 files changed, 279 insertions(+), 90 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> > new file mode 100644
> > index 000000000000..b2970734ffd7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> > @@ -0,0 +1,278 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung MIPI DSIM bridge controller
> > +
> > +maintainers:
> > +  - Inki Dae <inki.dae@samsung.com>
> > +  - Joonyoung Shim <jy0922.shim@samsung.com>
> > +  - Seung-Woo Kim <sw0312.kim@samsung.com>
> > +  - Kyungmin Park <kyungmin.park@samsung.com>
> > +  - Andrzej Hajda <a.hajda@samsung.com>
> > +  - Jagan Teki <jagan@amarulasolutions.com>
> > +
> > +description: |
> > +  Samsung MIPI DSIM bridge controller can be found it on Exynos
> > +  and i.MX8M Mini and Nano SoC's.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - samsung,exynos3250-mipi-dsi
> > +      - samsung,exynos4210-mipi-dsi
> > +      - samsung,exynos5410-mipi-dsi
> > +      - samsung,exynos5422-mipi-dsi
> > +      - samsung,exynos5433-mipi-dsi
>
> What about i.MX compatibles?

I have added in the next patch since this is yml conversation for
existing .txt bindings.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 5
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    maxItems: 5
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: phandle to the phy module representing the DPHY
>
> Drop
>
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dsim
> > +
> > +  samsung,phy-type:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: phandle to the samsung phy-type
> > +
> > +  power-domains:
> > +    description: phandle to the associated power domain
>
> Drop
>
> > +    maxItems: 1
> > +
> > +  samsung,power-domain:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the associated samsung power domain
> > +    maxItems: 1
> > +
> > +  vddcore-supply:
> > +    description: MIPI DSIM Core voltage supply (e.g. 1.1V)
> > +
> > +  vddio-supply:
> > +    description: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
> > +
> > +  samsung,burst-clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      DSIM high speed burst mode frequency.
> > +
> > +  samsung,esc-clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      DSIM escape mode frequency.
> > +
> > +  samsung,pll-clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      DSIM oscillator clock frequency.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
>
> If there are no extra endpoint properties, then use
> '/schemas/graph.yaml#/properties/port'.

Okay.

>
> > +        description:
> > +          Input port node to receive pixel data from the
> > +          display controller. Exactly one endpoint must be
> > +          specified.
> > +        properties:
> > +          endpoint@0:
> > +            $ref: /schemas/graph.yaml#/properties/endpoint
> > +            description: sub-node describing the input from MIC
>
> I'd assume i.MX has a different input than MIC?

Yes, updated in next patch.

Thanks,
Jagan.
