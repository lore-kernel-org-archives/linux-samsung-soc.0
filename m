Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D37BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Nov 2022 12:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbiKKMqA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Nov 2022 07:46:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbiKKMp6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 07:45:58 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7894819C0B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 04:45:57 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id 63so3461951iov.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 04:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xS4s0avgD255rcYtA4Gae74h0+wxtz39GOAv7A9upU=;
        b=ObGg9stT9HoCf/3hi1Z8le25KXMunJrziAtRLVbUrZC4OS5ZtiDcTMHcaGRON8E8GL
         f70DgnO7ZlPPXUeY1riLAsY4ZhsJ37ghiVyGrL3GrcSv6n+V+1vU8ZIskBXu6uGBlifV
         uuHw2MHM12kOhnHVUcPa9b4kVnHlJ3/egwDuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xS4s0avgD255rcYtA4Gae74h0+wxtz39GOAv7A9upU=;
        b=t5p7+e3nIixRSaJnC1xHmLf8ZqFcvtQ868KjOGwqez17JxZmZbRH4rVGRSqsViPtJ8
         3zJT3GPgFCZmwj00N90XyIEOf+26UnVvXDUYYbl9+QVEgx+18h3jd6JT171bm/03JyoT
         e115zRXtTDQyC/6102w2fKwImatpwOTnz1PDQMZ1BCPXdPSkZuqSHhwimid5BKJrut+y
         KVlk+2jHuBOJpHHCdxJFwL+cdlGQNWCb2eKCaoV+pFZZUPr5YCgpseHEgdHzmMVK5+0x
         mi0V+uihnWJgIadaWZhlzTC5JySoaRuEiJk7wBLEA2DEuoNgdCYL2sKfpr8HQ8C92gem
         Ogaw==
X-Gm-Message-State: ANoB5plyr9BCxvsS/BNt7d3/Hby4tA/ao0XQ1jOSj85yXqughZSDpSpw
        JHlg4PDil+pvdy162xUecvLTwsGyK4lSjRlYH3Nrxg==
X-Google-Smtp-Source: AA0mqf7rYEZg0X5ct8WvgQlQepH0xO2ddeWLJ/U9eXDDUpUybtT+Gidz8gRXMfRuJhf1bDsJCgY4OkIFIvHR1swiyNI=
X-Received: by 2002:a02:860e:0:b0:375:2c83:3f2f with SMTP id
 e14-20020a02860e000000b003752c833f2fmr636049jai.104.1668170756860; Fri, 11
 Nov 2022 04:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com> <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com> <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
In-Reply-To: <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 11 Nov 2022 18:15:45 +0530
Message-ID: <CAMty3ZBzNZgJkKDXTSG4onqtFK9SJ2qN9Cxv2XTg40JyX4TjaA@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To:     Nicolas Boichat <drinkcat@chromium.org>
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
        Marek Vasut <marex@denx.de>,
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

On Fri, Nov 11, 2022 at 5:42 PM Nicolas Boichat <drinkcat@chromium.org> wro=
te:
>
> On Fri, Nov 11, 2022 at 4:49 PM Jagan Teki <jagan@amarulasolutions.com> w=
rote:
> >
> > On Fri, Nov 11, 2022 at 6:19 AM Nicolas Boichat <drinkcat@chromium.org>=
 wrote:
> > >
> > > On Fri, Nov 11, 2022 at 2:40 AM Jagan Teki <jagan@amarulasolutions.co=
m> wrote:
> > > >
> > > > HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> > > > 0 =3D Enable and 1 =3D Disable.
> > >
> > > Oh I see, that's confusing... IMHO you might want to change the
> > > register macro name... (but if that's what the datasheet uses, it
> > > might not be ideal either). At the _very_ least, I'd add a comment in
> > > the code so the next person doesn't attempt to "fix" it again...
> >
> > 02/14 on the same series doing the name change.
> > https://lore.kernel.org/all/20221110183853.3678209-3-jagan@amarulasolut=
ions.com/
>
> Oh thanks I wasn't cc'ed on that one, makes sense.
>
> You can add my reviewed tag to this one, as my HSE comment doesn't change=
 this.
>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
>
> But please double check HSE.
>
> >
> > >
> > > BTW, are you sure DSIM_HSE_MODE is correct now?
> >
> > Yes, we have tested in imx8m platforms as well. S=C3=A9bastien Szymansk=
i
> > initially observed this issue on the imx8m platform.
>
> I'll repeat, are you sure about HSE specifically? You invert the
> polarity for HBP, HFP, and HSA, which makes sense given your patch
> 02/14.
>
> I'm concerned about HSE. Is the bit really a disable bit?
> MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
> should not do `reg |=3D DSIM_HSE_DISABLE;`, probably.

HSE typically enables bit logic, unlike other bits which are disabled bits.

HseDisableMod:
In Vsync pulse and Vporch area, MIPI DSI master transfers only Hsync
start packet to MIPI DSI slave at
MIPI DSI spec 1.1r02. This bit transfers Hsync end packet in Vsync
pulse and Vporch area (optional).
0 =3D Disables transfer
1 =3D Enables transfer

HfpDisableMode:
Specifies HFP disable mode. If this bit set, DSI master ignores HFP
area in Video mode.
0 =3D Enables
1 =3D Disables

I think the naming of 'HseDisableMod' is misleading in the datasheet,
but I have used it as per the spec.

Jagan.
