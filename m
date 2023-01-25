Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32081C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 16:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjAYQDD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 11:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235501AbjAYQDA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 11:03:00 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FFD6EB6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 08:02:59 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id h5so6660326ybj.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 08:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GWAQIHIaK4kY4F/qnaA0oyYRwbLACZjXU/o10X03g+8=;
        b=oSDVXFnRqBTSFX9MpTINvF4dwnkWCgh7Ct/vBhzxizJUNRw4cPZ5y310BiD9rZ+5rg
         3oGuB6Gqc2SLy0j+D9JRbdDjdKf5KQkNWStHRtrJid6R4BHx+eMwTrqQQmokqx4OC+zZ
         FfPX26+TfD2FTGNv2CSp66Nz1HxteM4DaJk6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWAQIHIaK4kY4F/qnaA0oyYRwbLACZjXU/o10X03g+8=;
        b=EtArLzYkcYK/1Xhk6XIHrdcKKQQdMLnvqO7kcLadas42Q33UKTUsF0tVoRv1vmqbeJ
         n469SG8vidPu9j7QrT9cAVFrx4dnzMzTb+suVI+9Gi/E6Os1lH9oeFMncHxQqJqUq+aT
         MlJbNKS4zYJN4LGGZbjLVyuNxCmeZKN3bqxCtKfAFy7+ZO6YW7Xjg6dHTbdJxNiLL+Se
         BjJQbS/gWLtGHMs5UfTfi/87t7B8Pk+OqwHHeV23fSAnW09tKWnGvXCk8d+rxSaRCSGZ
         AhI3X3rWQYfZsRgLbxT3SSRVi/1QDGHRPif+rtzWVD6pvsdgOGT6YadYduriQFQencAN
         5shA==
X-Gm-Message-State: AO0yUKVKsxKJke4zZ4+0ZTnJ2rQIZJTyvkTP/Xbstv3fbWSqmiUNqJ+h
        H6jROrc3xe4NSbdatqfB0eIr339g3yfRt8QAWOU3Mw==
X-Google-Smtp-Source: AK7set905btTY92dMXWIlD16t90XzLedSU7F8cTub6DM31WHila/I3M6Bf4jEXYJqclVmDSdBDKapuKj1ctwlZ175Pg=
X-Received: by 2002:a25:d7d1:0:b0:80b:69cc:78d8 with SMTP id
 o200-20020a25d7d1000000b0080b69cc78d8mr812189ybg.475.1674662578459; Wed, 25
 Jan 2023 08:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com> <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
In-Reply-To: <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 21:32:46 +0530
Message-ID: <CAMty3ZDvdWu4E3J+8KY=fsuNCSD837AY24X4VyBhR63HYCsO0A@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
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

On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/24/23 22:01, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/23/23 16:12, Jagan Teki wrote:
> >>> Enable and disable of te_gpio's are Exynos platform specific
> >>> irq handling, so add the exynos based irq operations and hook
> >>> them for exynos plat_data.
> >>
> >> If this is just an optional generic GPIO IRQ, why not keep it in the
> >> core code ? TE (tearing enable?) should be available on MX8M too.
> >
> > So far the discussion (since from initial versions) with Marek
> > Szyprowski, seems to be available in Exynos. So, I keep it separate
> > from the DSIM core.
>
> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .

I didn't find this in the DSIM part in i.MX8M Manual nor in the i.MX
8/RT MIPI DSI/CSI-2 or bsp kernel [1], did you find anywhere in i.MX8M
part? Look like TE GPIO means tearing effect signal handle on the
panel side.

from, Documentation/devicetree/bindings/display/panel/panel-common.yaml

  te-gpios:
    maxItems: 1
    description:
      GPIO spec for the tearing effect synchronization signal.
      The tearing effect signal is active high. Active low signals can be
      supported by inverting the GPIO specifier polarity flag.

Maybe Exynos hack this gpio on the host side instead of on the panel
side for some reason, not sure about it - Marek Szypeowski any
comments please?

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0

Thanks,
Jagan.
