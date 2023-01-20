Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4264EC05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 14:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjATOmh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 09:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjATOmc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 09:42:32 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F4256EDF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 06:42:02 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 129so2934015ybb.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 06:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ody2VwbWyzJCEoTCrPWuZTMErMgICWUGOLVYILw0XoA=;
        b=Eae9Of/Ov1XhcCmov+o08TB7ndmw04F4U9QlIiHCWqegFzyQicvUpYy9ALP6GmPL1d
         Uil5SoEzJYNYz/MkJl9Yxr5yLe1DkJV6a4Ckzzpwo17R9IL5VIFdSr+z66Tqlqymp4VK
         wcegKTLIGammf1WrCXoPS18e3xYQlObfQJS9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ody2VwbWyzJCEoTCrPWuZTMErMgICWUGOLVYILw0XoA=;
        b=Apc8WY78U2tXdZtmCcb8NBdIlo1+9tzJ3opTVZi9YcNBxl2dO7ANKjfWlwiGqdPGg3
         MaM96UbZ7g+cx84UdKM85LAHzJVC54z6oBVo1SH3unQ1zzER+xk8hoyk58a8wMcU4eJt
         uwiHJKnxtS7tgZnml7MoOQAaua7cwyYXZoKNj6/JSiQgadVGk0n38S8bUvrq1aUlWuy2
         mIcyEhiUtdqWfgOD9vTmSWDLeF2fJc4GAhIEDuwJVCllMicNuHNPL0vYTtaGZ9WIlGVb
         5MVXUz1yE7eK1AS4r7uQLBV26sKUOjcDXbV73pKyVigMLVtl8bOsnFLdV6k+lgQZZ0ym
         rcSg==
X-Gm-Message-State: AFqh2koVoqMYivAPvbHKheboFS2RceGo+qwE393u386ybQtC3kyhiW1v
        YQy/pnjtdOIBdSR12ASQ1X6cqwZto2ru7bqwDrCmpw==
X-Google-Smtp-Source: AMrXdXs+dnVURFc+udtKNceuDm29bsMaET8vGrIITAFJcxpO5SeW7X85UMxRmvAoWDnQk+iWyE1bwHwtLPEi+HNOqTE=
X-Received: by 2002:a25:ac66:0:b0:800:5d4e:8063 with SMTP id
 r38-20020a25ac66000000b008005d4e8063mr353173ybd.126.1674225688483; Fri, 20
 Jan 2023 06:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com> <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 20 Jan 2023 20:11:16 +0530
Message-ID: <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Fabio Estevam <festevam@gmail.com>
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
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Fabio,

On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > There are two patch series prior to this need to apply.
> >
> > https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> > https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
>
> Would it make sense to re-submit these two patches as part of your series?

The previous version's comment was to separate them from the DSIM series.

Jagan.
