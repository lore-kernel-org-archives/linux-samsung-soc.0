Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1006BC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 10:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjBCKoO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 05:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbjBCKoJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 05:44:09 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9664B65EE6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Feb 2023 02:44:01 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id cf30so367332ybb.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Feb 2023 02:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S7VhcKV+ZFPX+Qz9s+IUdt/dAvA8DMpbAaiW2dHB/78=;
        b=WPKEt+csQ+poj49Obnxk1IiKCatBi+rRyCnJ5PBDjXwO4hslpWRI4R+00oX8BQrxTp
         zaiXAZLCM0T5hSgDjdqgPJPXLQjOTbpHDyp/d+N8bVj9+NpMEoSEmudvhoI+9f0X7s4k
         ZMX8Lfuv59UrzjxY4TBKa8ULwU5oMQ3IF84Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7VhcKV+ZFPX+Qz9s+IUdt/dAvA8DMpbAaiW2dHB/78=;
        b=jSyLr3wUDMSVvXL3HqZKK6EaUoC7RWKR1+M2H/gSqN4KWhEWphlwCzgly4lk0l2z0a
         7Aaez5R1YF3CLN6XdFlt34o+GdM22a6Z+SFkXeboQBXP9+qY9Jx0A2mFAhUvjUdFf8CS
         bt7sn6BkVzXbvyzs3ELb06Sdai92nSycF5N+IcQut9eBwFLX8LngPFmQ55v8Z+i1nJEA
         GC3Z/Z8xfLidmMlkaA6uu07Su58Lt7zwZmgMAVNxHTgllqiP7rtaKiBonGRBrRhKXoej
         akTGaN3hEoEoenfRX4wtmRunkl4YjbgcepDqtSZP6sT7LB7FL5Y30vGlOSkML5TUxT7q
         OQeQ==
X-Gm-Message-State: AO0yUKULLAGEu5YQkSUBKcVvWJMI1+gshtfLnTq+PuOLhS1OBBrH0+l/
        2P/84k7Ga2Eg1GdndnI52hgAnn3F7Ha/VlNSmx4p5g==
X-Google-Smtp-Source: AK7set+L9tRWOkGhK5vWUmcJD0ppP0w4EuqIAWFJSMIxWeMPwYan9MGURLFIiaqO7MBY4Ze/4x1w9hL8+s2CfH9AMc8=
X-Received: by 2002:a25:d413:0:b0:80b:6fc1:8b32 with SMTP id
 m19-20020a25d413000000b0080b6fc18b32mr1027978ybf.126.1675421040641; Fri, 03
 Feb 2023 02:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat> <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
 <20230203082607.xu6xv7c6eq2yq64c@houat>
In-Reply-To: <20230203082607.xu6xv7c6eq2yq64c@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 3 Feb 2023 16:13:49 +0530
Message-ID: <CAMty3ZCYi7k=MdxZA-VMW6tfU1tqu7vrwUQyj25Oyssc0HTOKQ@mail.gmail.com>
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

On Fri, Feb 3, 2023 at 1:56 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Feb 02, 2023 at 10:22:42PM +0530, Jagan Teki wrote:
> > Hi Maxime,
> >
> > On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > >
> > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > > next DSI device in the pipeline.
> > > > > >
> > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > endpoint number, find the connected node and return either
> > > > > > the associated struct drm_panel or drm_bridge device.
> > > > >
> > > > > I'm not sure that using a device managed helper is the right choice
> > > > > here. The bridge will stay longer than the backing device so it will
> > > > > create a use-after-free. You should probably use a DRM-managed action
> > > > > here instead.
> > > >
> > > > Thanks for the comments. If I understand correctly we can use
> > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > > the panel or bridge - am I correct?
> > >
> > > It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> > > when the module is removed the device will go away and all the devm
> > > resources freed, but the DRM device sticks around until the last
> > > application with a fd open closes that fd.
> >
> > Would you please check this, Here I'm trying to do
> >
> > 1. find a panel or bridge
> > 2. if panel add it as a panel bridge
> > 3. add DRM-managed action with the help of bridge->dev after step 2.
>
> The logic is sound in your patch
>
> > Didn't test the behavior, just wanted to check whether it can be a
> > possibility to use bridge->dev as this dev is assigned with
> > encoder->dev during the bridge attach the chain. Please check and let
> > me know.
> >
> > struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
> >                                               struct device_node *np,
> >                                               u32 port, u32 endpoint)
> > {
> >         struct drm_bridge *bridge;
> >         struct drm_panel *panel;
> >         int ret;
> >
> >         ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
> >                                               &panel, &bridge);
> >         if (ret)
> >                 return ERR_PTR(ret);
> >
> >         if (panel)
> >                 bridge = devm_drm_panel_bridge_add(dev, panel);
> >
> >         if (IS_ERR(bridge))
> >                 return bridge;
> >
> >         ret = drmm_add_action_or_reset(bridge->dev,
> > drmm_drm_panel_bridge_release,
> >                                        bridge);
> >         if (ret)
> >                 return ERR_PTR(ret);
> >
> >         return bridge;
> > }
>
> It's the implementation that isn't. You cannot use a devm hook to
> register a KMS structure, so it's not that you should add a
> drmm_add_action call, it's that you shouldn't call
> devm_drm_panel_bridge_add in the first place.

I think it is because the remove action helper uses
drm_panel_bridge_remove instead of devm hook.
>
> So either you use drm_panel_bridge_add and a custom drmm action, or you
> add a drmm_panel_bridge_add function and use it.

It is not possible to use this helper as it is expecting drm_device
point that would get only if we found panel_bridge, so combined calls
here can help.

Would you please check this updated implementation and let me know?

struct drm_bridge *drmm_panel_bridge_add_nodrm(struct drm_panel *panel)
{
        struct drm_bridge *bridge;
        int ret;

        bridge = drm_panel_bridge_add_typed(panel, panel->connector_type);
        if (IS_ERR(bridge))
                return bridge;

        ret = drmm_add_action_or_reset(bridge->dev,
drmm_drm_panel_bridge_release,
                                       bridge);
        if (ret)
                return ERR_PTR(ret);

        bridge->pre_enable_prev_first = panel->prepare_prev_first;

        return bridge;
}

struct drm_bridge *drm_of_dsi_get_bridge(struct device_node *np, u32
port, u32 endpoint)
{
        struct drm_bridge *bridge;
        struct drm_panel *panel;
        int ret;

        ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
                                              &panel, &bridge);
        if (ret)
                return ERR_PTR(ret);

        if (panel)
                bridge = drmm_panel_bridge_add_nodrm(panel);

        return bridge;
}

Thanks,
Jagan.
