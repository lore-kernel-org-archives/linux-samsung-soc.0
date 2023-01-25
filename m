Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57C5C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 17:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235513AbjAYRf7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 12:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235476AbjAYRf6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 12:35:58 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5429E18B1D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 09:35:57 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4c131bede4bso273934737b3.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sLdv2Pq53a6vZyVVcX2zLb9TAy6HzzMK+y+dx6JC+Lk=;
        b=dbmRy/zYnZU/M5INdVitjh85ZSEKWF1DQvm+OSMTwpP8/J7nXfaKdncz7Snr8+smLi
         7Xi/hsMp+w+prUmQQU409wp9ax/6qQ6lzuwrpyWRtwA03xm3lFryNM6vA0L0jNAv6O6I
         cMGzJnlaz6waMXOl5o+Yyvj1Pgm+a7toTM8dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLdv2Pq53a6vZyVVcX2zLb9TAy6HzzMK+y+dx6JC+Lk=;
        b=I1wta4+iELRO90slaMd2tLJzr3apx0Kt3a5gXy8W97d12K5DFxjq0eKNTHLGcuyFgi
         efHc/+b3fUql5TtmfPCpXux9NXEq8B0Zcm27n65MSYliHtBRRzb91JGIWVB254XjAbUU
         sUAI7Xv/2hBWjXJ0mVI7ZN7nWpyF2ASkpZHxSBnuvXHhc0pAUjAFU+USzLmVmAy+KbCy
         WzdeOKOih5X9/J4ULDhhBHpy+ISTmo765SdGPMi00zap5Gj8UPV0MFy2hoVtY1Nd60o0
         mtdlqJ+1iyTIjHYn4F39ASGABBQAbOuotC+YbkZw3X01vRzcoFrziXHrzeUNN2pb7s9O
         AjpA==
X-Gm-Message-State: AO0yUKWq2l3fbgg76UIZBbLT4FboWFfLCBgDwZmHN85ulAx73tz1jR+6
        TH29mbiZsl/KSs994G7egjLNGnQSscSYKurNRU+LBw==
X-Google-Smtp-Source: AK7set8dZvYXO9O3Yo3GqCYBfsHOcPW61gmf10CtU9i82U6qwqanae2Yypwvvel3B9n8cSWxBRjp/LOAB4yZWl5d3EA=
X-Received: by 2002:a81:ae61:0:b0:506:6364:fda3 with SMTP id
 g33-20020a81ae61000000b005066364fda3mr503445ywk.72.1674668156462; Wed, 25 Jan
 2023 09:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de> <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
 <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
 <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de> <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
 <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de> <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
 <a756fd20-28e4-85e7-3947-4c468bf3366d@denx.de>
In-Reply-To: <a756fd20-28e4-85e7-3947-4c468bf3366d@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 23:05:44 +0530
Message-ID: <CAMty3ZDTcnN_NgjL8hEBnABpFcaE=hCegZnzaC9tz-7wFxYSmw@mail.gmail.com>
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
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
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

On Wed, Jan 25, 2023 at 10:57 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/25/23 18:12, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 10:16 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/25/23 15:04, Jagan Teki wrote:
> >>> On Wed, Jan 25, 2023 at 7:23 PM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 1/25/23 07:54, Jagan Teki wrote:
> >>>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>>>
> >>>>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>>>>
> >>>>>>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>>>
> >>>>>>>> On 1/24/23 22:01, Jagan Teki wrote:
> >>>>>>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On 1/23/23 16:12, Jagan Teki wrote:
> >>>>>>>>>>> Enable and disable of te_gpio's are Exynos platform specific
> >>>>>>>>>>> irq handling, so add the exynos based irq operations and hook
> >>>>>>>>>>> them for exynos plat_data.
> >>>>>>>>>>
> >>>>>>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
> >>>>>>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
> >>>>>>>>>
> >>>>>>>>> So far the discussion (since from initial versions) with Marek
> >>>>>>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
> >>>>>>>>> from the DSIM core.
> >>>>>>>>
> >>>>>>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
> >>>>>>
> >>>>>> I will check this.
> >>>>>
> >>>>> In order to use TE_GPIO we need te handler implementation, right now
> >>>>> Exynos CRTC DRM drivers have implementation for this. That is the main
> >>>>> reason to keep the TE_GPIO handling in exynos, maybe if we handle that
> >>>>> generically then it is a viable option to move TE_GPIO to the DSIM
> >>>>> core.
> >>>>
> >>>> I think you can do this exactly the same way exynos does it -- check
> >>>> whether te_handler() callback is implemented by the glue code (the one
> >>>> you already have for various exynos and imx8mm/imx8mm SoCs) and if so,
> >>>> call it. If it is not implemented, do not call anything in the TE IRQ
> >>>> handler.
> >>>
> >>> I need to understand how i.MX8MM handles this on TE IRQ in the DSIM
> >>> host side, Can I do this in future patch set as it might involve
> >>> bindings changes as well if it's part of DSIM?
> >>
> >> Why not leave an empty te_handler implementation on MX8M for now ?
> >> You can fill that implementation in future patchset, but the generic
> >> part of the code would be in place .
> >
> > Look like we have one issue to move regster te_irq into samsung-dsim.
> >
> > exynos_dsi_register_te_irq is done after the bridge attach is done in
> > Exynos, here bridge attach is triggered in the component ops bind
> > call, since samsung-dsim is a pure bridge w/o any component ops.
> > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1527
> > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L112
> >
> > Any suggestion on how to handle this?
>
> Why isn't the generic code calling drm_bridge_attach() in
> samsung_dsim_host_attach(), like the exynos one ?

Exynos drm drivers follow component ops and generic dsim is a pure drm
bridge whose downstream bridge will attach in bridge ops attach and
the component-based drivers require an initial bridge attach (whose
previous is NULL) call in the component bind hook for establishing the
bridge chain.

Jagan.
