Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD64C05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjAWMWX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbjAWMWW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:22:22 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58A85599
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:22:18 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id p15so10858045ybu.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UImd4awdxFPdpogR2bLL32GPkJVcMDf+bJ0+XqjT/+g=;
        b=KI/IKL0xHPWWjPS0yHjQgOYbdZWKsZbOiL4pN+aeWUwny0YjTRUrL2D/X1MHCmV6jY
         HiHVZuqVCBOEPO+30LBl0q4trz/6rhjdHjVkI/7le86ZBkBZUrQkvTiEXUABRRFEvJrQ
         9a0utKuZH2xgZRrmxdfz8MwDrwSWZTrI9Xtyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UImd4awdxFPdpogR2bLL32GPkJVcMDf+bJ0+XqjT/+g=;
        b=YsCDqY8GHZvwgBGv8+6ziAyt75tsBRmv3WEioPnrfP0Wo3bTNHeJI8DuM4hgwdPrqz
         TQ4mSKOQA2+AGD1Kz0gYI4UFGcvi7n0/nNr/P1r1v9kgH2Ub+o5aAwgi3R1NSaIrvyEY
         KtnrAJYuCfk2VBkKaqsIjpciCeyavm3jYbbYIirbEBXaqbhDZeCeOP964YOdgQnqR/Xk
         VaQRbdQ3N02lM4PVWG50wpHCbZpCFP7Ip6ktAak7B7fFIw/SVcII0kUWli2FPiUsR+sR
         lWsFUxkKOR6ON27kAZWIfqDeJWQhVAvcwdQlrFUuJHSh07Arw2MqcT7BNe6Wr2nevRhr
         yv9A==
X-Gm-Message-State: AFqh2krL0sE7028r8YwOLA+ZdV0UPZWXpFGIQDNOh4ULo5pQMgueyENn
        hNFM84spMGbMng+ZIYvcbkjgQkYUBYhETzAKx9CbsA==
X-Google-Smtp-Source: AMrXdXuj1JqAZLs0ghviagzmrr23s2E4xqnbXEVoOviHzO0vWJbrYl03rO/OlX+0WrnCVVkptBxaS/6pnllreWedBNI=
X-Received: by 2002:a25:bd54:0:b0:7d3:851c:e744 with SMTP id
 p20-20020a25bd54000000b007d3851ce744mr2962050ybm.84.1674476538009; Mon, 23
 Jan 2023 04:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
 <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com>
 <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de> <CAPY8ntDUeWMXY_VuNyXUzuerXbnt8SmVL3M6KEpmfsc041G_2w@mail.gmail.com>
In-Reply-To: <CAPY8ntDUeWMXY_VuNyXUzuerXbnt8SmVL3M6KEpmfsc041G_2w@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 23 Jan 2023 17:52:06 +0530
Message-ID: <CAMty3ZD_4MwSBWU=4ywXsQvN9QhiwowDxhqHgLsvmPbCfECFmg@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
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

On Sat, Jan 21, 2023 at 12:29 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Marek & Jagan
>
> On Fri, 20 Jan 2023 at 15:06, Marek Vasut <marex@denx.de> wrote:
> >
> > On 1/20/23 15:41, Jagan Teki wrote:
> > > Hi Fabio,
> >
> > Hello all,
> >
> > > On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >>
> > >> Hi Jagan,
> > >>
> > >> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >>
> > >>> There are two patch series prior to this need to apply.
> > >>>
> > >>> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> > >>> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
> > >>
> > >> Would it make sense to re-submit these two patches as part of your series?
> > >
> > > The previous version's comment was to separate them from the DSIM series.
> >
> > Hmmmmm, seems like those first two patches got stuck. I fixed up the
> > malformed Fixes: line (it was split across two lines and had angular
> > brackets around it) and picked the first series via drm-misc-next .
> >
> > Can you send a subsequent patch to convert the DSIM_* macros to BIT()
> > macro , since checkpatch --strict complains about it ?
> >
> > For the second series, you likely want a RB from Maxime Ripard and Dave
> > Stevenson first about the probe order handling.
>
> Not sure what I can add for "Enable prepare_prev_first flag for
> samsung-s6e panels" and "tc358764: Enable pre_enable_prev_first flag"
> as I have no datasheet for those devices.
> On the basis that they are wanting the DSI host to be in LP-11 before
> prepare/pre_enable, then setting the flag is the right thing. More
> than happy to say
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> to those two (I can't find them quickly in my mail to respond directly).
>
> I have just sent a separate response on the third patch.

Fyi: please check my answers on that thread.

Thanks,
Jagan.
