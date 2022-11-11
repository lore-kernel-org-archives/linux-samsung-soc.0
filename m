Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80E3C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Nov 2022 08:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiKKIta (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Nov 2022 03:49:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbiKKIt3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 03:49:29 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5164A6DCDD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 00:49:29 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id s10so3154816ioa.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 00:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAOfqtD4t6Iov+GKWdcNGYt7OOruw1aiI2cat97jgC0=;
        b=eHChzSN+uZraxaSKRS3P3eFNuY3EI5c62iZlJDfxGvRDWddsYiHHSECeludFjDBy2G
         oFXIUrVPqybBj9FMmi2GBA3IMf/yUlhm+dqsaD35+jVF9qcSINApUSUaMzyQ/OVI5VGl
         7gL4niZpcCljSQauFKduPWefdL11fw1MxLh+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAOfqtD4t6Iov+GKWdcNGYt7OOruw1aiI2cat97jgC0=;
        b=Fgh40geQfU1+9OfkSOFHtjAmRNGKfVpXFcdQdBWfW91feN+oI1UTT0KHBCuYbbAYIO
         0FGWhBMFJ1J1guxVkavsHt521dm+5ACKhL7Oap0ZcJJ0G1FEU63GV1XU7qRLaTzJJR7t
         3o+eXgyw1YUyYY/f7ePAzxFVf4K/mVsvP2XL9C37hJl+RFQ385dKZ2j6Qj3OXWAzHQpY
         f/XC4jScpRYrv/a7dQfL7zVy1DNVKAlPsMtHY17ItX4iQCRQwRho1V5p9lu1FY7SHIef
         9AqAovLqq279s8vpr2wJ3gYswAlk0+i+DuF7CS2BWhsUE0Oxlv27J8EQMvsMB+0oL5vO
         GC2A==
X-Gm-Message-State: ANoB5pl2f45bjwgCODahUstn0fvZvp8Fsj4Sj3w17VWAVC39WXhojyIa
        YxpFyuKbxLw6QZOSyfv8uAajk4I3bEqTDxD3eC20Og==
X-Google-Smtp-Source: AA0mqf4YB8JnnedwQjoNfM0ypDQE3AoLbvHaHweu7xqhUzKKDY+IJOVxG62wn1eGloitvYrgpRBWLsuvrz6wf6I87+c=
X-Received: by 2002:a05:6602:418d:b0:6a3:8925:be51 with SMTP id
 bx13-20020a056602418d00b006a38925be51mr604390iob.51.1668156568750; Fri, 11
 Nov 2022 00:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com> <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
In-Reply-To: <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 11 Nov 2022 14:19:17 +0530
Message-ID: <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
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

On Fri, Nov 11, 2022 at 6:19 AM Nicolas Boichat <drinkcat@chromium.org> wro=
te:
>
> On Fri, Nov 11, 2022 at 2:40 AM Jagan Teki <jagan@amarulasolutions.com> w=
rote:
> >
> > HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> > 0 =3D Enable and 1 =3D Disable.
>
> Oh I see, that's confusing... IMHO you might want to change the
> register macro name... (but if that's what the datasheet uses, it
> might not be ideal either). At the _very_ least, I'd add a comment in
> the code so the next person doesn't attempt to "fix" it again...

02/14 on the same series doing the name change.
https://lore.kernel.org/all/20221110183853.3678209-3-jagan@amarulasolutions=
.com/

>
> BTW, are you sure DSIM_HSE_MODE is correct now?

Yes, we have tested in imx8m platforms as well. S=C3=A9bastien Szymanski
initially observed this issue on the imx8m platform.

Jagan.
