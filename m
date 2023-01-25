Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735B1C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 17:13:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjAYRNq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 12:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235395AbjAYRNn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 12:13:43 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0202F4C6D1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 09:13:14 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id a9so23879616ybb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 09:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=10jznw+dU73F3G+2htQ5BN40SBePEPoWssf6etHuDyY=;
        b=H2uHFkikzN+jd9LeHgxQ/ZY6toSFHwcEEkxyffyZMvcbcJiF+PemgjFXOd/+L8AeV1
         8BnSL9VEA+XC5RObgMF6gnFC+jLnrEARLmaI6/H7J37kal2g+MA4EKhyvTXw45Tje+8o
         DWNbCULokMtoUweg+FTfbYPQgiGII68lpuYMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10jznw+dU73F3G+2htQ5BN40SBePEPoWssf6etHuDyY=;
        b=mc0HoGtzxsZVKc0PBppTPiRlUJbOMJ/ZMnq4XBwXKrdwsVSO8kuBoYH3CZ8aHTj/nE
         Eme6DeO20PDOuXl7Q3HQksfv47XZlDwJ4D4VnvJGhe/KnDPf7eUqZi596Tfu2fmr0W12
         mhHsUpSSZ0+EZhQZfR3021utaFOda81q11PgO5P3XSn2Grof8BNwU93ya4Pn+WrBbDFO
         xQAPEAqLgLMYp9hyg09ZXdzwKbpNzN2YpqTyGp2fuW+mYMhykqEAhqEhKeL/ma9XjSIG
         +nhtFN/EcLPUxrgDOuH0ZuAhjcMVMu58obX/j+rl9LXY9lS8AxNOzu28S8dJymUhJmME
         GX2A==
X-Gm-Message-State: AFqh2koGs4INwza1oTmvjIbFT9/NWhYXfeq2OEiBg3KMYhmqved8//vI
        tYzBQs/55Lu/rNi79s+AP63InVCL9QB3DxRrQ30Q5w==
X-Google-Smtp-Source: AMrXdXsXwmHr8ksQpE5sZjWMMY7j20SdU+Ico84VAihCay6thuoD5W6vjfU0+10OYT51WJn5mFVccCJcQfcjiJ9GpME=
X-Received: by 2002:a25:5f43:0:b0:7fe:b611:d88c with SMTP id
 h3-20020a255f43000000b007feb611d88cmr2459544ybm.594.1674666791005; Wed, 25
 Jan 2023 09:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de> <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
 <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
 <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de> <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
 <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de>
In-Reply-To: <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 22:42:59 +0530
Message-ID: <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 10:16 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/25/23 15:04, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 7:23 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/25/23 07:54, Jagan Teki wrote:
> >>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>
> >>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>>
> >>>>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>
> >>>>>> On 1/24/23 22:01, Jagan Teki wrote:
> >>>>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>>>
> >>>>>>>> On 1/23/23 16:12, Jagan Teki wrote:
> >>>>>>>>> Enable and disable of te_gpio's are Exynos platform specific
> >>>>>>>>> irq handling, so add the exynos based irq operations and hook
> >>>>>>>>> them for exynos plat_data.
> >>>>>>>>
> >>>>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
> >>>>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
> >>>>>>>
> >>>>>>> So far the discussion (since from initial versions) with Marek
> >>>>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
> >>>>>>> from the DSIM core.
> >>>>>>
> >>>>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
> >>>>
> >>>> I will check this.
> >>>
> >>> In order to use TE_GPIO we need te handler implementation, right now
> >>> Exynos CRTC DRM drivers have implementation for this. That is the main
> >>> reason to keep the TE_GPIO handling in exynos, maybe if we handle that
> >>> generically then it is a viable option to move TE_GPIO to the DSIM
> >>> core.
> >>
> >> I think you can do this exactly the same way exynos does it -- check
> >> whether te_handler() callback is implemented by the glue code (the one
> >> you already have for various exynos and imx8mm/imx8mm SoCs) and if so,
> >> call it. If it is not implemented, do not call anything in the TE IRQ
> >> handler.
> >
> > I need to understand how i.MX8MM handles this on TE IRQ in the DSIM
> > host side, Can I do this in future patch set as it might involve
> > bindings changes as well if it's part of DSIM?
>
> Why not leave an empty te_handler implementation on MX8M for now ?
> You can fill that implementation in future patchset, but the generic
> part of the code would be in place .

Look like we have one issue to move regster te_irq into samsung-dsim.

exynos_dsi_register_te_irq is done after the bridge attach is done in
Exynos, here bridge attach is triggered in the component ops bind
call, since samsung-dsim is a pure bridge w/o any component ops.
https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1527
https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L112

Any suggestion on how to handle this?

Thanks,
Jagan.
