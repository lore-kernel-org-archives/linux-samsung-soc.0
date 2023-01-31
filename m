Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80329C636D3
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 Jan 2023 14:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbjAaOOY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 Jan 2023 09:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbjAaOOY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 09:14:24 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1C33C0A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2023 06:14:22 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id b1so18182505ybn.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2023 06:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=prH/psPdXOovOFWq0/gSq5dHJbYVv6d2Q2egqPXerhY=;
        b=W3n6qCLqnruVqGecETFBFq0aBW6cjMVUmBgjCje1jgbwH5o5JhQ2onKDpDEV60dx3A
         f4xarKZpw7ReuiezqRT1FqmBwO/lnXyCI0DxTd5wvAHVOwPdWm/C7htjt0LwXRCv8YTO
         L2XydHGS+hfL4vFTDGr2kRmaVkmv7rXQYUQLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prH/psPdXOovOFWq0/gSq5dHJbYVv6d2Q2egqPXerhY=;
        b=yLqTCcv1rC0WOLPSZDLlVcJVimJoDBeczqRaMLpzbUW9WWcSdsHLy+97crCq0m4vuw
         Q6g8C6SO1Dk8eJn4HvQvotdCuBXg6AYZQ9k9+eCMZZKFS2Ww3m3evlSlBL5nKIOpQujN
         103/q0pswt613QvkLI8aUQ4xiolq9e+uIUfIhL87Yg3PagSsixzgD8fWd6RzftJbrtjD
         r8aPTxDhqYmSDmFZpMKgnhGBDMA40YZXkByOFC+SDDC2QJ1zrYJ09ecVSnn3ndj4oBGC
         0HKhdlTpvIQoIMnrf2pdtq8iSyzczKpdiXuSY05LSgaOIr+cmjMNQ860L4756sA74gZg
         /TUw==
X-Gm-Message-State: AO0yUKUHh2ZLxzAupnWXJXOab2kOGePc8HxEaRBg5cg/HJFZkuBVyeHC
        1c6aNoAGxlCvKYNLMDLeaOIhbxORRt/XfMw+09UREw==
X-Google-Smtp-Source: AK7set8Ku9S4+B0F3l4WYPixvo7PXqkYUo17S1TJpJ2AOTC1sUFX382LDwC35+WMRQ9YX+HVJjg+OnROJ2Zfj8jkwTg=
X-Received: by 2002:a05:6902:1615:b0:80b:c8da:fa68 with SMTP id
 bw21-20020a056902161500b0080bc8dafa68mr2322359ybb.159.1675174461940; Tue, 31
 Jan 2023 06:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
 <20230130125648.mlrtubymeooejvhg@houat> <CAMty3ZANxwUp8yOjo+EWHNngi7SoMYhm1FchM38v_EUDpLY7UQ@mail.gmail.com>
 <20230131124550.6oalx43vz26gi5wt@houat> <CAMty3ZAtOV-jzpoJHdctEES-Mf3eNSKyuuCSgR5V2R+=K2W1aw@mail.gmail.com>
 <20230131135907.3jqxdnsxiqxi5bwz@houat>
In-Reply-To: <20230131135907.3jqxdnsxiqxi5bwz@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 31 Jan 2023 19:44:08 +0530
Message-ID: <CAMty3ZAsAKViDXY5KvAXKTmyDnpJShSTPb+jz51MdRRWcmUtGA@mail.gmail.com>
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

On Tue, Jan 31, 2023 at 7:29 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Jan 31, 2023 at 07:17:50PM +0530, Jagan Teki wrote:
> > On Tue, Jan 31, 2023 at 6:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Jan 30, 2023 at 06:54:54PM +0530, Jagan Teki wrote:
> > > > On Mon, Jan 30, 2023 at 6:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > On Fri, Jan 27, 2023 at 11:09:26PM +0530, Jagan Teki wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > > > > >
> > > > > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > > > > > next DSI device in the pipeline.
> > > > > > > > >
> > > > > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > > > > endpoint number, find the connected node and return either
> > > > > > > > > the associated struct drm_panel or drm_bridge device.
> > > > > > > >
> > > > > > > > I'm not sure that using a device managed helper is the right choice
> > > > > > > > here. The bridge will stay longer than the backing device so it will
> > > > > > > > create a use-after-free. You should probably use a DRM-managed action
> > > > > > > > here instead.
> > > > > > >
> > > > > > > Thanks for the comments. If I understand correctly we can use
> > > > > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > > > > > the panel or bridge - am I correct?
> > > > > >
> > > > > > Look like it is not possible to use DRM-managed action helper here as
> > > > > > devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
> > > > > > which we cannot find drm_device pointer (as drm_device pointer is
> > > > > > mandatory for using DRM-managed action).
> > > > > > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1545
> > > > > >
> > > > > > Please check and correct me if I mentioned any incorrect details.
> > > > >
> > > > > You shouldn't call that function from attach anyway:
> > > > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-care-with-mipi-dsi-bridges
> > > >
> > > > True, If I remember we have bridges earlier to find the downstream
> > > > bridge/panels from the bridge ops and attach the hook, if that is the
> > > > case maybe we can use this DRM-managed action as we can get the
> > > > drm_device pointer from the bridge pointer.
> > >
> > > I'm not quite sure what you mean. You shouldn't retrieve the bridge from
> > > the attach hook but from the probe / bind ones. If that's not working
> > > for you, this is a bug in the documentation we should address.
> >
> > Something like this, afterward the design has updated to move the
> > panel or bridge found to be in host attach.
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/bridge/nwl-dsi.c?h=v5.10#n911
>
> What are you pointing to exactly, it's not a MIPI-DSI host attach,
> that's a bridge attach, you have access to the DRM device there.

Yes, what I'm saying here is we can have the option to use a DRM
device pointer so finding the panel or bridge by using a DRM-managed
action helper can be possible rather than host attach.

Something like this,

struct drm_bridge *drmm_of_dsi_get_bridge(struct drm_device *drm,
                                      struct device_node *np,
                                      u32 port, u32 endpoint)
{
        struct drm_bridge *bridge;
        struct drm_panel *panel;
        int ret;

        ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
                                          &panel, &bridge);
        if (ret)
                return ERR_PTR(ret);

        if (panel)
                bridge = drmm_panel_bridge_add(drm, panel);

        return bridge;
}

static int nwl_dsi_bridge_attach(struct drm_bridge *bridge, enum
drm_bridge_attach_flags flags)
{
        struct nwl_dsi *dsi = bridge_to_dsi(bridge);
        struct drm_bridge *bridge;
        int ret;

       bridge = drmm_of_dsi_get_bridge(bridge->dev, dsi->dev->of_node, 1, 0);
       if (IS_ERR(bridge))
           ret = PTR_ERR(dsi->out_bridge);

       return drm_bridge_attach(bridge->encoder, dsi->panel_bridge,
bridge, flags);
}

static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
      .attach     = nwl_dsi_bridge_attach,
};

>
> > >
> > > > So, what is the best we can do here, add any TODO comment to follow up
> > > > the same in the future or something else, please let me know?
> > >
> > > Make it work in a safe way, as described in the documentation?
> >
> > Yeah, it is a clear deadlock. It is not possible to use DM-managed
> > action helper in host attach as there is no drm_device pointer and we
> > cannot move panel or bridge finding out of host attach as per design
> > documentation. I'm thinking of go-ahead with adding TODO for adding
> > the safe way with an existing patch. Please let me know.
>
> I've been telling you for three mails now that it's not acceptable. So,
> again, no, it's not acceptable. Do something else and follow the
> documentation instead.

Ohh, look like I didn't get this in the first e-mail. Okay, now I got
it, thanks. On the other hand, this series recurring for more than a
year, so to merge things go quickly can you please suggest some
solution based on this discussion?

Thanks,
Jagan.
