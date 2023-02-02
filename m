Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197A4C05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Feb 2023 16:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbjBBQw6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Feb 2023 11:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjBBQw5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 11:52:57 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3076DFC3
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Feb 2023 08:52:55 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id g2so2959503ybk.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2023 08:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nX/zKmX0Q/GemuA0YNuQhGDyE378ITO+eXfiCy/ngwE=;
        b=o0iZfUGb6d0Kzi77xWmivymhyzo1OiRlbSXPyd4ZJkkocAluGk12XH6F7vfmddOae8
         uu3tB5tLJrHx2+NY7vB38Tbp4hvPviU/T3gjyDpZPiynPhIBeEVQ32wBqTD8De1WqV6k
         tSHXkufx9cQSrd5/NfwDUV77tMVBFaoUVYjto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nX/zKmX0Q/GemuA0YNuQhGDyE378ITO+eXfiCy/ngwE=;
        b=pTgvDFykzItnqviqRdT3pSNFRnZK7WFXTiV9sLvsLGUXfQR+1RrJ/McM7McyDCNkC4
         Rfi6OW0bFDzg56uzxrEI3OhXZM6z6bWpzbljrjf/crPfcnRVXNoXLYCYJftBUHfreVyp
         RPlQWVw9ROky+ReQ9yN1B2uLtRBaciiE5ftWGZC9iqiFBGfRTC3gzOTfAK+Qb6hmrjGb
         1S7SMC3o7UQKiw5qr+o/ayon3AJXLmp6jHxnt6jE5rutg7mlXO27Pk3THu3uJddk7vBY
         oTeuFXG/6Jb42YFdQkHpRauAS8yXbmecJ2tgvjL8idHzJnOVOiH+DauNlrgddCYGVRO1
         szJg==
X-Gm-Message-State: AO0yUKUDe2nnHi3rPZBqhpWX8pxEnEu2caYmOw2Ow4MjBc8lVat/jeKC
        biqGuLVJd45O7IoT5dWlMIQMaowiJRLfMlhxhbg/Gg==
X-Google-Smtp-Source: AK7set9dFxtaPugkWj9eqrIvDkCPGZubPuG7mA/tRz5amPypEJNQ3lfwKqr9dOM1wL5qUUX9j9LvPI+jwsr3S12X7rY=
X-Received: by 2002:a25:e68b:0:b0:814:9c19:383b with SMTP id
 d133-20020a25e68b000000b008149c19383bmr697473ybh.462.1675356774675; Thu, 02
 Feb 2023 08:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com> <20230130125828.qkqsq6ax5mojkdbq@houat>
In-Reply-To: <20230130125828.qkqsq6ax5mojkdbq@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 2 Feb 2023 22:22:42 +0530
Message-ID: <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
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

Hi Maxime,

On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > >
> > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > next DSI device in the pipeline.
> > > >
> > > > Helper lookup a given child DSI node or a DT node's port and
> > > > endpoint number, find the connected node and return either
> > > > the associated struct drm_panel or drm_bridge device.
> > >
> > > I'm not sure that using a device managed helper is the right choice
> > > here. The bridge will stay longer than the backing device so it will
> > > create a use-after-free. You should probably use a DRM-managed action
> > > here instead.
> >
> > Thanks for the comments. If I understand correctly we can use
> > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > the panel or bridge - am I correct?
>
> It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> when the module is removed the device will go away and all the devm
> resources freed, but the DRM device sticks around until the last
> application with a fd open closes that fd.

Would you please check this, Here I'm trying to do

1. find a panel or bridge
2. if panel add it as a panel bridge
3. add DRM-managed action with the help of bridge->dev after step 2.

Didn't test the behavior, just wanted to check whether it can be a
possibility to use bridge->dev as this dev is assigned with
encoder->dev during the bridge attach the chain. Please check and let
me know.

struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
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
                bridge = devm_drm_panel_bridge_add(dev, panel);

        if (IS_ERR(bridge))
                return bridge;

        ret = drmm_add_action_or_reset(bridge->dev,
drmm_drm_panel_bridge_release,
                                       bridge);
        if (ret)
                return ERR_PTR(ret);

        return bridge;
}

Thanks,
Jagan.
