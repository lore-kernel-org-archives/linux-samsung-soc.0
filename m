Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDDFC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 11 Dec 2022 05:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLKFmk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 11 Dec 2022 00:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiLKFmj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 11 Dec 2022 00:42:39 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19A83A7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 21:42:37 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3c090251d59so104545747b3.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 21:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFxawhL0KfDzuzdjctBHI9Ha+b92IrPz3S8apbaIAuw=;
        b=n4xri01w9mgE1NGrQAztjwvfE9iV3uWuueuIXpbo7KZk5QIt/7wHDEo0EozqtsddWQ
         QE9CryX4yy27NDoOyxLed3YjtmiWnyozfpODdcqHqGbHkNaN7medJEGdIMQch34L8o7B
         a4efIUKf7em/YpUoslNIif0gjmy3BVPCNdfq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFxawhL0KfDzuzdjctBHI9Ha+b92IrPz3S8apbaIAuw=;
        b=FjZbkXs+JYwo/+3w7TCy6gznX4vhAPQrPhv13PAnv8uT3B64XMQjR/v8QlOfp9aN2d
         ixb7tVdQjcG52HZcvA5bMbSquFz311FW1qkKiVdJz3KnIsCAq1xmocTsCxUcHBTHq2TP
         BmXhd/1YzuyGHO4CSUppOEZuV9Lhkq8iMV+qajKX9f88TdLzB+yYZ2YVNlpodhWOoJCG
         qd3AMQQYTggLaWCzqeqk9f3qiONWOpbFfgL0KFp/E2irjtYv1kK2nBoYsmLqBG5bocrg
         sbYy/bgyusU4BaSHmjoV7ICB65ziKsInCZh6esbo+Li+tlCL2lfAG2aUy3FfhTrfxS2R
         RYTg==
X-Gm-Message-State: ANoB5plTbY58yp0fXujh/9y4QxqRbgTzjIO1xrErmauwDxcYXWisM9sK
        aQcuhKc3NHkeUgRwJV/6f3JggRpzMfmid9DvMeDspw==
X-Google-Smtp-Source: AA0mqf7thi1tNlYFTPA6vPcT/C7J48KFPQeC2m6uwVTSUSWtmYDnaf5i22q4xvbZwndDQQq6XZzQcMJ23MZKlKlKhAE=
X-Received: by 2002:a0d:d595:0:b0:3c4:df92:a3d2 with SMTP id
 x143-20020a0dd595000000b003c4df92a3d2mr49499665ywd.487.1670737356880; Sat, 10
 Dec 2022 21:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-8-jagan@amarulasolutions.com> <4396da63-d9c0-a9b4-3953-67e6bcfb1bf1@denx.de>
In-Reply-To: <4396da63-d9c0-a9b4-3953-67e6bcfb1bf1@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sun, 11 Dec 2022 11:12:25 +0530
Message-ID: <CAMty3ZBOR_Bif9PUdiFgVzFLANhFn57pQTrn5=aFXgHEnA1=rA@mail.gmail.com>
Subject: Re: [PATCH v9 07/18] drm: bridge: samsung-dsim: Lookup OF-graph or
 Child node devices
To:     Marek Vasut <marex@denx.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Dec 11, 2022 at 7:58 AM Marek Vasut <marex@denx.de> wrote:
>
> On 12/9/22 16:23, Jagan Teki wrote:
> > The child devices in MIPI DSI can be binding with OF-graph
> > and also via child nodes.
> >
> > The OF-graph interface represents the child devices via
> > remote and associated endpoint numbers like
> >
> > dsi {
> >     compatible = "fsl,imx8mm-mipi-dsim";
> >
> >     ports {
> >       port@0 {
> >            reg = <0>;
> >
> >            dsi_in_lcdif: endpoint@0 {
> >                 reg = <0>;
> >                 remote-endpoint = <&lcdif_out_dsi>;
> >            };
> >       };
> >
> >       port@1 {
> >            reg = <1>;
> >
> >            dsi_out_bridge: endpoint {
> >                 remote-endpoint = <&bridge_in_dsi>;
> >            };
> >       };
> > };
> >
> > The child node interface represents the child devices via
> > conventional child nodes on given DSI parent like
> >
> > dsi {
> >     compatible = "samsung,exynos5433-mipi-dsi";
> >
> >     ports {
> >          port@0 {
> >               reg = <0>;
> >
> >               dsi_to_mic: endpoint {
> >                    remote-endpoint = <&mic_to_dsi>;
> >               };
> >          };
> >     };
> >
> >     panel@0 {
> >          reg = <0>;
> >     };
> > };
> >
> > As Samsung DSIM bridge is common DSI IP across all Exynos DSI
> > and NXP i.MX8M host controllers, this patch adds support to
> > lookup the child devices whether its bindings on the associated
> > host represent OF-graph or child node interfaces.
> >
> > v9, v8, v7, v6, v5, v4, v3:
> > * none
> >
> > v2:
> > * new patch
>
> This looks like a good candidate for common/helper code which can be
> reused by other similar drivers.

Yes, I have responded to the same comment of yours in v7 [1]. It is
hard to make this code work in a generic way.

[1] https://lore.kernel.org/all/CAMty3ZBtRZ-vDPQYX+m8uWmsD+vmbFOnCGVba8swQ8GWtWaKJQ@mail.gmail.com/
