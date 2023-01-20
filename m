Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B63C05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 18:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjATS7f (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 13:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjATS7e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 13:59:34 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F06743B7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 10:59:33 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso2192610pju.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CSpcr6BECwbKqN5C4mS2QoXyKqAo8YI4sEb7as9mMCA=;
        b=KRSjIZAv+ErWFqsr1QieUudw00ZQ/GVCFpPHe8W2nhOfddYbmFpo959RykA0kpK8TD
         Fu5eLt60+46fFthd4RyUXPuIbaENX6lMR8PnOS4J7eJ5KtoYFcf48oLC3GeiqYZzfxfC
         OGVCGo0IYXqIohXVOTI2PfqQa632eS/ItjJIFTqIGX6z//lHtv/jgJ/QhQR+NTdllExj
         BB6OXAPy0fMBpwgaMHsF7JpFHzPJdBcxK56kagHNBwzEMwqCtNT9DwYxenqkBbteuF4e
         PCk3sJEbXyEd711OXL/Y7htNL3Pp+cp0ymqdcVrs7H7BYzf4i5/OxBrwqBq2QJBTSLB/
         ddYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSpcr6BECwbKqN5C4mS2QoXyKqAo8YI4sEb7as9mMCA=;
        b=5bcPbajn5doP2A9LSI8MWzH5Qw6daBomLoi/lQ7JqpzuxeBvidXE4RSW0kfjRSgBDX
         ZP/HghQpzm3nVXI093nZKhkP6N4ZUD2yyyWIaTQpsT+cnbYyPkHuXrDbx8X1qV30/0t5
         X3lSfal9Ya4fIKeEMbnLKL79ky/zxl89CiBBx3SghLxCxk1gHXC0EMDYAl+YFyjezMuv
         3KPsceOAkqT3JifEZb5/Ee9wft/Ss6+vM44scY1NzMIMWPQejH3ba4TAMrv+Q/QTtPqF
         oNnjh47auNeploM1LCSVPjyz53f1xUQXY94xLOaORZzhAZkn/Lj5RiwTAz8lrH5fZ5wp
         8s5A==
X-Gm-Message-State: AFqh2krZ8MhCPBIEssNskJVlzazngXzBZlLcpn/mASj6OEADw6FHwckZ
        77+FW16uK2U9yfsN+2VuClvR8wkMYBGhl5MyS7r5zA==
X-Google-Smtp-Source: AMrXdXv1/Neiv/1e/D5P3hmgshhPwFZKpYyhL6uK8A1HX8UY+b2o3mE5r+RLm2T1i2rglg86eoRy2FTS+aDvDiQOgmA=
X-Received: by 2002:a17:902:d894:b0:193:405:1704 with SMTP id
 b20-20020a170902d89400b0019304051704mr1621761plz.31.1674241173411; Fri, 20
 Jan 2023 10:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
 <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com> <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
In-Reply-To: <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 20 Jan 2023 18:59:15 +0000
Message-ID: <CAPY8ntDUeWMXY_VuNyXUzuerXbnt8SmVL3M6KEpmfsc041G_2w@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Marek Vasut <marex@denx.de>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Fabio Estevam <festevam@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
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
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek & Jagan

On Fri, 20 Jan 2023 at 15:06, Marek Vasut <marex@denx.de> wrote:
>
> On 1/20/23 15:41, Jagan Teki wrote:
> > Hi Fabio,
>
> Hello all,
>
> > On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >>> There are two patch series prior to this need to apply.
> >>>
> >>> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> >>> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
> >>
> >> Would it make sense to re-submit these two patches as part of your series?
> >
> > The previous version's comment was to separate them from the DSIM series.
>
> Hmmmmm, seems like those first two patches got stuck. I fixed up the
> malformed Fixes: line (it was split across two lines and had angular
> brackets around it) and picked the first series via drm-misc-next .
>
> Can you send a subsequent patch to convert the DSIM_* macros to BIT()
> macro , since checkpatch --strict complains about it ?
>
> For the second series, you likely want a RB from Maxime Ripard and Dave
> Stevenson first about the probe order handling.

Not sure what I can add for "Enable prepare_prev_first flag for
samsung-s6e panels" and "tc358764: Enable pre_enable_prev_first flag"
as I have no datasheet for those devices.
On the basis that they are wanting the DSI host to be in LP-11 before
prepare/pre_enable, then setting the flag is the right thing. More
than happy to say
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
to those two (I can't find them quickly in my mail to respond directly).

I have just sent a separate response on the third patch.

  Dave
