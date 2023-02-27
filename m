Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7345C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 11:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjB0LZ6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjB0LZ5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:25:57 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63DA1E5C5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:25:55 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-536c02eea4dso166678067b3.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nNg2nPpMgLLDVX3xnf9PMvVBiF465kosAtVWrVSaXbU=;
        b=GMuA1QClha2DZejPEjCPW/CWDxHuv/6wFK/t/rGhf3Fk9RkktV8Q2MRlwvgtgZfv0J
         2n6/wySrbQfV+46Q+ezMsh9/4fIy7Bt3pHLlu1skxzBmQVfvMsLw6QzMj7dSxvhhEft/
         ETKGAKC4V7H+rLCulC9BTnM+yDd/sdVe2EWGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNg2nPpMgLLDVX3xnf9PMvVBiF465kosAtVWrVSaXbU=;
        b=nsQVbp+4EbfDXg6qFzp7nP9l57mdkWYps29caKP/O+9/iGIPhY30jbrvqxw4kB9dbY
         RldfPsaHAyRu08UbhFmvvzyXsDDGtxB8DpXpSxCPE0o/wPj8/hMdzPyxeUtqLJEf2RgP
         E6H1ZsKBUojnTe2WDEgMzENyL6Tl7p9C7hzl6KKKl/QtinhBdrnYN6tOJuHkMRwEVYbP
         lwnxQdeYygDdpvJw3k+vsJ3aew33ESTFktNMUTISFTJqDkhLCUrpZvkgse0knV2SV9Xq
         utKnFjRxT/vuAvXxTb2XMD+N/7aMctf5h69B5fVyf81ul6mLq3h50RQDUbQDiTK8IGsT
         KJdA==
X-Gm-Message-State: AO0yUKUf0n7SloplqSERQFB6JEdC7+0cNBdwYF7Ok/YE5JYozkQtW7eS
        J3ak80JfL8KTMo75JE8yENKuXuHffepTFkQ22tO5tA==
X-Google-Smtp-Source: AK7set+bEA2GTil328S9PwuohS6+IhKvhKBhLJUYJA6fq6nVzOquyvDFaVaYnpi1K4ip4bDmE+V8Xt3tbTa6iHYsMmc=
X-Received: by 2002:a81:af5d:0:b0:52e:cea7:f6e3 with SMTP id
 x29-20020a81af5d000000b0052ecea7f6e3mr9917618ywj.10.1677497155043; Mon, 27
 Feb 2023 03:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat> <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
 <20230203082607.xu6xv7c6eq2yq64c@houat> <CAMty3ZCYi7k=MdxZA-VMW6tfU1tqu7vrwUQyj25Oyssc0HTOKQ@mail.gmail.com>
 <20230203104938.qink5iuibxux2bjz@houat> <CAMty3ZB=v=0SZ5SX2y4bDMty8bdN260zs5ZCOy3Esr0+ZZsZ7A@mail.gmail.com>
 <20230203110437.otzl2azscbujigv6@houat>
In-Reply-To: <20230203110437.otzl2azscbujigv6@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 27 Feb 2023 16:55:43 +0530
Message-ID: <CAMty3ZBRtWcqBoEhtka+Zt9+j+8FYNfXgbnTVc6KstPQ0+VHWQ@mail.gmail.com>
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

On Fri, Feb 3, 2023 at 4:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Feb 03, 2023 at 04:28:30PM +0530, Jagan Teki wrote:
> > On Fri, Feb 3, 2023 at 4:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Fri, Feb 03, 2023 at 04:13:49PM +0530, Jagan Teki wrote:
> > > > On Fri, Feb 3, 2023 at 1:56 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > On Thu, Feb 02, 2023 at 10:22:42PM +0530, Jagan Teki wrote:
> > > > > > Hi Maxime,
> > > > > >
> > > > > > On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > > > > > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > >
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > > > > > >
> > > > > > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > > > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > > > > > > next DSI device in the pipeline.
> > > > > > > > > >
> > > > > > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > > > > > endpoint number, find the connected node and return either
> > > > > > > > > > the associated struct drm_panel or drm_bridge device.
> > > > > > > > >
> > > > > > > > > I'm not sure that using a device managed helper is the right choice
> > > > > > > > > here. The bridge will stay longer than the backing device so it will
> > > > > > > > > create a use-after-free. You should probably use a DRM-managed action
> > > > > > > > > here instead.
> > > > > > > >
> > > > > > > > Thanks for the comments. If I understand correctly we can use
> > > > > > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > > > > > > the panel or bridge - am I correct?
> > > > > > >
> > > > > > > It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> > > > > > > when the module is removed the device will go away and all the devm
> > > > > > > resources freed, but the DRM device sticks around until the last
> > > > > > > application with a fd open closes that fd.
> > > > > >
> > > > > > Would you please check this, Here I'm trying to do
> > > > > >
> > > > > > 1. find a panel or bridge
> > > > > > 2. if panel add it as a panel bridge
> > > > > > 3. add DRM-managed action with the help of bridge->dev after step 2.
> > > > >
> > > > > The logic is sound in your patch
> > > > >
> > > > > > Didn't test the behavior, just wanted to check whether it can be a
> > > > > > possibility to use bridge->dev as this dev is assigned with
> > > > > > encoder->dev during the bridge attach the chain. Please check and let
> > > > > > me know.
> > > > > >
> > > > > > struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
> > > > > >                                               struct device_node *np,
> > > > > >                                               u32 port, u32 endpoint)
> > > > > > {
> > > > > >         struct drm_bridge *bridge;
> > > > > >         struct drm_panel *panel;
> > > > > >         int ret;
> > > > > >
> > > > > >         ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
> > > > > >                                               &panel, &bridge);
> > > > > >         if (ret)
> > > > > >                 return ERR_PTR(ret);
> > > > > >
> > > > > >         if (panel)
> > > > > >                 bridge = devm_drm_panel_bridge_add(dev, panel);
> > > > > >
> > > > > >         if (IS_ERR(bridge))
> > > > > >                 return bridge;
> > > > > >
> > > > > >         ret = drmm_add_action_or_reset(bridge->dev,
> > > > > > drmm_drm_panel_bridge_release,
> > > > > >                                        bridge);
> > > > > >         if (ret)
> > > > > >                 return ERR_PTR(ret);
> > > > > >
> > > > > >         return bridge;
> > > > > > }
> > > > >
> > > > > It's the implementation that isn't. You cannot use a devm hook to
> > > > > register a KMS structure, so it's not that you should add a
> > > > > drmm_add_action call, it's that you shouldn't call
> > > > > devm_drm_panel_bridge_add in the first place.
> > > >
> > > > I think it is because the remove action helper uses
> > > > drm_panel_bridge_remove instead of devm hook.
> > > > >
> > > > > So either you use drm_panel_bridge_add and a custom drmm action, or you
> > > > > add a drmm_panel_bridge_add function and use it.
> > > >
> > > > It is not possible to use this helper as it is expecting drm_device
> > >
> > > It's definitely possible, just change the prototype of the function to
> > > take a drm_device pointer, just like any other drmm_* function.
> >
> > But, in my case, I only get the drm_device pointer once I found the
> > bridge pointer of panel_bridge but the actual bridge finding for
> > panel_bridge is happening in the drmm_panel_bridge_add definition.
> > Doesn't it redundant if I find the panel_bridge and pass drm_device
> > and panel pointer for calling drmm_panel_bridge_add?
>
> We've already discussed this, but you can't use
> devm_drm_of_dsi_get_bridge() from the MIPI-DSI host attach function. So
> fix that first, and then you'll have access to the DRM device in your
> driver.

I have updated the new series with this change. Please have a look.

Thanks,
Jagan.
