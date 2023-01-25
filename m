Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59155C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 06:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbjAYGyz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 01:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbjAYGyz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 01:54:55 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DD94609D
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 22:54:54 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id c124so21772556ybb.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 22:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wqs8wbPlAZDTLJakmydgiMmPGts6HLlVoCIHxpQubjo=;
        b=U9e8Wb1myASouSuwhQv8BZllXOdBrkn1B/LD3/eQtP3RbEskY2eAbeGHgnDeI2u+wL
         xbYUpDGHjyh2Jk2q5v/wz3K3I5cC0fvFcxFWAqPPMvbnivzVZplnxdM1DNMn6W8ctfKb
         cNe5JM5I3ZqDMasXSnCsqHwv2ijsTc1omaCaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqs8wbPlAZDTLJakmydgiMmPGts6HLlVoCIHxpQubjo=;
        b=H9AHx3dgtOODL4FN5LK1Fr1Ddif7bky5ACYr2KTiIv5DaqrxVH1BZivIUnsDv6F8wU
         J7MHZ6BnUv2YoYoC6HFUtq+Vheh/q5jb1ICUfmx6VFoJWKAiQN0izOseEJ7d9r45/6/A
         2P7Ujw1Tx0QghKYjA5oSFnRJrnlyoaU7kZlyknDLbZEBZ8tjEMV7fUxW0zJJ8QSC2T7Q
         wukcpAazlGmRHbW+2El9XXeZU13tsROqGq8wxujC1dmZ8s/dpoTYWIfqsrWQqjxKWqr0
         rvfc4MTGw5ljlPTVit+DSUCNAe68//P6BSjZzidgQp+YIpH1nwUFRFx5Lj+BjlPxIeYX
         XOrA==
X-Gm-Message-State: AFqh2kou4QS6b9rMwyR6mQ23jJc9o2so6ODdY43rikbCUiSz0eDq8+II
        9QUfPdzbUUdx3lql7JHPWoeC65d5XiXq+VVmkAkQnQ==
X-Google-Smtp-Source: AMrXdXvvAsurupMLHcGBtjeQclADi/LmwKvn2BnkYvtRMrfeYGqUbYn8zvts83S+YXbNwfYM1DXRJYMkL3VgSnzAZcc=
X-Received: by 2002:a25:5f43:0:b0:7fe:b611:d88c with SMTP id
 h3-20020a255f43000000b007feb611d88cmr2270813ybm.594.1674629693289; Tue, 24
 Jan 2023 22:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de> <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
In-Reply-To: <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 12:24:41 +0530
Message-ID: <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> > >
> > > On 1/24/23 22:01, Jagan Teki wrote:
> > > > On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> > > >>
> > > >> On 1/23/23 16:12, Jagan Teki wrote:
> > > >>> Enable and disable of te_gpio's are Exynos platform specific
> > > >>> irq handling, so add the exynos based irq operations and hook
> > > >>> them for exynos plat_data.
> > > >>
> > > >> If this is just an optional generic GPIO IRQ, why not keep it in the
> > > >> core code ? TE (tearing enable?) should be available on MX8M too.
> > > >
> > > > So far the discussion (since from initial versions) with Marek
> > > > Szyprowski, seems to be available in Exynos. So, I keep it separate
> > > > from the DSIM core.
> > >
> > > Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
>
> I will check this.

In order to use TE_GPIO we need te handler implementation, right now
Exynos CRTC DRM drivers have implementation for this. That is the main
reason to keep the TE_GPIO handling in exynos, maybe if we handle that
generically then it is a viable option to move TE_GPIO to the DSIM
core.

Jagan.
