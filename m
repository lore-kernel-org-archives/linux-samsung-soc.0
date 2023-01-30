Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B54C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Jan 2023 13:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235924AbjA3NWT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjA3NWS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 08:22:18 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1872DE6B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2023 05:22:17 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4c24993965eso158494727b3.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2023 05:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gttOd15yZEiFoNt1YESSdvZd7eBWMsxLFeeyfZcuhEU=;
        b=i0x8ngqMvtZM5rDk05SRUFOCslYhjId7Oc4pmrJXchAtkUG78bOjFzsV/ZWCHUbrwU
         kcvKIKE5aL++pLWI/cmz2Rp1tA2F7bo0LXKGE2xTPTPOF4T1DvkKKWyMMYhWMPqxry6r
         s0vcIoS1/4nln/Fv4pci3f8szOHxxGxg1Tkn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gttOd15yZEiFoNt1YESSdvZd7eBWMsxLFeeyfZcuhEU=;
        b=u6m7pYNHvw4Lj6oMLop5qvfDhHNBapSx/KSPt0z64SFvk5jJMEpdxlNfKGvB12dKdY
         jpJcxATPDsEumwCEVmXoO/4ABgJdW551B7u++iu16SvAEtZ0iFlgEA4rXRac6PCAPE3R
         aUmF7AjskWvyO5sqP6t2dA4bjkdXButBCskxsZC4/uIfnAl6kNACzM4H2/KlbONUugI0
         XpFXhTDK65LYaDbGIdKSnjItCTL1ALAh8W1t+OcsAcfvTDwDg/5UVfMuMTY9ing7Q09h
         AKf9z+sSiohe4E2JfsSGACq3uikFB1jirHABHDNhUJjLzkaCitY/UyLdcDeIigL0bcsd
         /K1w==
X-Gm-Message-State: AO0yUKXGUFI9MTNpjp2/m3GamABtQAdo8MeDAz9/u/6yKl1O5TCBrhEH
        zzfW3VwQo/AZ32lWsThWmg5bJxD6xhScZ1OAXd3mFZJGQFJa5g51Q+o=
X-Google-Smtp-Source: AK7set+6a15jU4R+OVaFt1d47zLUJd+Iv5IFZZXua79rQ+nkNaCqxHZ6Jk/p7MJxLftepnIM3yN6jQGQQ6uGWOC/mjI=
X-Received: by 2002:a81:ae61:0:b0:506:6364:fda3 with SMTP id
 g33-20020a81ae61000000b005066364fda3mr2568530ywk.72.1675084937150; Mon, 30
 Jan 2023 05:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com> <20230130125828.qkqsq6ax5mojkdbq@houat>
In-Reply-To: <20230130125828.qkqsq6ax5mojkdbq@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 30 Jan 2023 18:52:05 +0530
Message-ID: <CAMty3ZDdbBTsKTzmMaUxwmR+YqdVZVB8vtMr4qEy99O03t6fSg@mail.gmail.com>
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

Thanks for the details. I think this is the reason you have introduced
this DRM-managed action helper - drmm_of_get_bridge. Initially, i
thought of adding similar, but as you are aware it is not possible to
call it from the host attach.

Jagan.
