Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01DFC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Nov 2022 01:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235660AbiKNBLb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 13 Nov 2022 20:11:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235579AbiKNBLa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 13 Nov 2022 20:11:30 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B3DFCFA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Nov 2022 17:11:29 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id r13so4277449vkf.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Nov 2022 17:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2JJJpT0ZAjed7VELB5YPuXJMHJUvXdHN4Gx50WFZ2Q=;
        b=dbe3cQHbcFqonNsjvCZQxgrzGLGy8dfsGA55BO3FuXHwPkRofmYZFbA+gd7jJDCmc8
         Qa8IXmkZIB6FVJETBpi2t5ZBpgw8T5c4MPh2DqY9K57vX/1/xhcif4E04r/vao7gwLv6
         s7voBGiIy4NEzxwqdVANa8ZMpEDvndGprBV6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2JJJpT0ZAjed7VELB5YPuXJMHJUvXdHN4Gx50WFZ2Q=;
        b=kFo3/GWN8hhyqMiWgVejMYeJZd5Iveo/1LRa3t9EDR8QWLJHiUYuRO1TQvIQQ5RqLi
         6VXAqND1HxJ08/FbUQCPWG0IXiFvBZ6ZEj/GEqyJxue9jqjOf0MH/91g5YYgoZDfI3Ly
         4JWSDQDN9zmmos6c00KFHcQYcoCDLAC93yqmEr4e8U9KVFy+0NU19+IaSokY5SRlyegx
         mvliNSy+GahNNt/W8G6s2Ze52Hb6MKgAj7zADG/Go7uKHzYXMzE0h95d/nOx6aN86CjT
         2VaUTUOOJRXuqFSqyEcgatzUe02/SKXcYwfrIwb8p/hQQYtvsOpk18Ps1jn/81p1KtBP
         Y6nQ==
X-Gm-Message-State: ANoB5plXnbs+Bh3shUwTEgKFlwHx7V534f5vsJH1oCE24Coy2VtjYSpi
        O5eG+JkNUPqEqoJoXik1KKksfV52oWYp03bZpQJUaA==
X-Google-Smtp-Source: AA0mqf7OCNSTYyU8cwy8NjWFqYTpVq0mYrZ6+3c5WtDvjw5nmr5nQzFmn/CpTIoO/+6tW19gfFk+dUy7QDooVct8Z7o=
X-Received: by 2002:a05:6122:1786:b0:3b8:a3f9:be82 with SMTP id
 o6-20020a056122178600b003b8a3f9be82mr5348280vkf.18.1668388288785; Sun, 13 Nov
 2022 17:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com> <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
 <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com> <c82a77f3-17a1-1b59-96da-924daae3678c@denx.de>
In-Reply-To: <c82a77f3-17a1-1b59-96da-924daae3678c@denx.de>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 14 Nov 2022 09:11:17 +0800
Message-ID: <CANMq1KBMJDcfcbfYGtRj+MDJgFKg_i5Rw6ZJuoZy0D_kzkob3Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To:     Marek Vasut <marex@denx.de>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        linux-amarula <linux-amarula@amarulasolutions.com>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Nov 13, 2022 at 8:29 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/11/22 13:12, Nicolas Boichat wrote:
>
> [...]
>
> >>> BTW, are you sure DSIM_HSE_MODE is correct now?
> >>
> >> Yes, we have tested in imx8m platforms as well. S=C3=A9bastien Szymans=
ki
> >> initially observed this issue on the imx8m platform.
> >
> > I'll repeat, are you sure about HSE specifically? You invert the
> > polarity for HBP, HFP, and HSA, which makes sense given your patch
> > 02/14.
> >
> > I'm concerned about HSE. Is the bit really a disable bit?
> > MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
> > should not do `reg |=3D DSIM_HSE_DISABLE;`, probably.
>
> I suspect the HSE bit is a misnomer, but its handling in the driver is
> correct.
>
> i.MX 8M Plus Applications Processor Reference Manual, Rev. 1, 06/2021
> Page 5436
>
> 23 HseDisableMode
>
> In Vsync pulse and Vporch area, MIPI DSI master transfers only Hsync
> start packet to MIPI DSI slave at MIPI DSI spec 1.1r02. This bit
> transfers Hsync end packet in Vsync pulse and Vporch area (optional).
>
> 0 =3D Disables transfer
> 1 =3D Enables transfer
>
> In command mode, this bit is ignored.

Okay. I'd suggest adding a comment in the code, it'd be so tempting to
attempt to "fix" this as the if/or pattern looks different from the
others.

But it's up to you all.

Thanks,
