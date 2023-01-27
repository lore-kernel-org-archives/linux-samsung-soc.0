Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D567C54EAA
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 17:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjA0Rjk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 12:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbjA0Rjj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 12:39:39 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82E31CAD3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 09:39:38 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-506609635cbso76737597b3.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e2YXWr1HG5PC3aXK4CzFGhgLqF4TwbPxIsqKBeKBW4g=;
        b=gA0EatzTjAacYhO0/TiDJdnXTuNNdWjyIt0DkW1qsY9p2TRJsCAFdsNZUiz4QyezT+
         XkPQ2kSc3j93oxdfnMkzO9fBPoCRo34HTApdF4eTkDFt0niTOH+aWm4ZRwBt1gSmupIU
         9XjIxZ2jsjOTb3WU1902XnI/4kpuuQAcNkrrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2YXWr1HG5PC3aXK4CzFGhgLqF4TwbPxIsqKBeKBW4g=;
        b=z0OuljvihwPqSFdbeGjYyTB2omX95YLNZu50XhnVfFkaffWiPyMTt5+tsDT6PkGzue
         g7na/UzQW+LTswM1X6x8pgmDePP1LZcGm7Z7bqIHdcHW8pQsVRfZCs4rer0ZfPqvkDxI
         0bcS636pjzYeo85hJ47YkXFolQQLrjqO3/i0VRV32YFzgJqmUqEveisjk/CkgHSClnFz
         owEICcN+PWCiCJsdE9O56vKM/0oKZGlnAabrFZv++g+WD0p+Y+56spdd8WWYz5dRABnU
         aK+UJKgqpZGvyUols1CVi/wpB2MJAxkG4rsb8Ukkt3Shjwx0FsZAqDNFiSiWmt4CcNOx
         va0A==
X-Gm-Message-State: AFqh2kpBasoa9j1TjZRkEvQiDQmNp+mNm/Dgm09Xkxj6hBjVdW9q/w2S
        i8G/Qv8S3zddiFJCGEUJjop9X3qM5ypr6jBwHh5fdQ==
X-Google-Smtp-Source: AMrXdXuVNwSWKBh/6v0X8S1+k0INDffwXqKFD9ZdtW09goRn50INi1zYFaJ87D2lzXSkCd/8DMiIHazjH3DcrGBwhNY=
X-Received: by 2002:a0d:fe03:0:b0:470:533:cb89 with SMTP id
 o3-20020a0dfe03000000b004700533cb89mr5543044ywf.81.1674841178008; Fri, 27 Jan
 2023 09:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
In-Reply-To: <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 27 Jan 2023 23:09:26 +0530
Message-ID: <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
To:     Maxime Ripard <maxime@cerno.tech>
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
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > Add devm OF helper to return the next DSI bridge in the chain.
> > >
> > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > helper uses the dsi specific panel_or_bridge helper to find the
> > > next DSI device in the pipeline.
> > >
> > > Helper lookup a given child DSI node or a DT node's port and
> > > endpoint number, find the connected node and return either
> > > the associated struct drm_panel or drm_bridge device.
> >
> > I'm not sure that using a device managed helper is the right choice
> > here. The bridge will stay longer than the backing device so it will
> > create a use-after-free. You should probably use a DRM-managed action
> > here instead.
>
> Thanks for the comments. If I understand correctly we can use
> drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> the panel or bridge - am I correct?

Look like it is not possible to use DRM-managed action helper here as
devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
which we cannot find drm_device pointer (as drm_device pointer is
mandatory for using DRM-managed action).
https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1545

Please check and correct me if I mentioned any incorrect details.

Thanks,
Jagan.
