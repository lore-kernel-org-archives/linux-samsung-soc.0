Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAD0C38142
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 Jan 2023 13:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjAaNsK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 Jan 2023 08:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbjAaNsI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 08:48:08 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA869F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2023 05:48:03 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id c124so18067151ybb.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2023 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cSXpJOa9iEfg0k5fDlS7y4qL3SedBz+BCWAw9qFTuQQ=;
        b=nP3CdyfPD+RVr+WbuyLRr3gd7peTtFCrRMvrXM+G4KFp3YBknchXXIRkvwa4jkcPDa
         4PXe+KFvCIw1nAC/tN7Tzh4Xgr7yCZYmz20gpAwf78MIV1NJi3PPU9+ic+3OY9g7ya/T
         IJZ3y8Mb1f21o+YWF/KMxZKaQsFA09f6EdLIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSXpJOa9iEfg0k5fDlS7y4qL3SedBz+BCWAw9qFTuQQ=;
        b=EtNcUN7WFESR+areWF6p1liWgW0ZCu6LXAw6uEM1hwKRzXhjriuqsdfa5B8qU5yxPr
         bKyQtkd91Otc9sRXl+GtZqesxzXkS5feN5pNDETnE8D0yqY60BmOKPLWtXtK6dOBDc0E
         uSnMhgcw5jfVONOjDOHhFH0kDej3nIcrwHFvacJR9HucPZCKvH+DtFUK8HAgpncReSWf
         Z9iEMiLHWCfdJrN4dgd18nZa9A605frzKXpVVfaUnC8URutHy1B9r90fcShBYIAzEdmE
         0aJirZfLn9KHQjHPE8V/GA9na/10XkxQyhl/gfPGpnnPu9Mz/raV5WBp458RjWEzumA9
         E6+A==
X-Gm-Message-State: AO0yUKVSAjuvRuLUmQNd9O1/jnRTB0yrhrEzmszr2I0p8xvrK97PqK6j
        WaoeH9lJWkhHBp1x93FftYZiq0g6Y/0EmpwM4JHPmQ==
X-Google-Smtp-Source: AK7set/dJ2/j0hNK/iwX7WOu/h0ISBKCdvYDjoi8Gvq4HzXHHv67o+G4XdbXKpJ0y1LC0o5hai8NYJAmCy/qxchkEn4=
X-Received: by 2002:a25:3c5:0:b0:835:560e:ab15 with SMTP id
 188-20020a2503c5000000b00835560eab15mr348969ybd.84.1675172882378; Tue, 31 Jan
 2023 05:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
 <20230130125648.mlrtubymeooejvhg@houat> <CAMty3ZANxwUp8yOjo+EWHNngi7SoMYhm1FchM38v_EUDpLY7UQ@mail.gmail.com>
 <20230131124550.6oalx43vz26gi5wt@houat>
In-Reply-To: <20230131124550.6oalx43vz26gi5wt@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 31 Jan 2023 19:17:50 +0530
Message-ID: <CAMty3ZAtOV-jzpoJHdctEES-Mf3eNSKyuuCSgR5V2R+=K2W1aw@mail.gmail.com>
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

On Tue, Jan 31, 2023 at 6:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jan 30, 2023 at 06:54:54PM +0530, Jagan Teki wrote:
> > On Mon, Jan 30, 2023 at 6:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Fri, Jan 27, 2023 at 11:09:26PM +0530, Jagan Teki wrote:
> > > > Hi,
> > > >
> > > > On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > >
> > > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > > >
> > > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > > > next DSI device in the pipeline.
> > > > > > >
> > > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > > endpoint number, find the connected node and return either
> > > > > > > the associated struct drm_panel or drm_bridge device.
> > > > > >
> > > > > > I'm not sure that using a device managed helper is the right choice
> > > > > > here. The bridge will stay longer than the backing device so it will
> > > > > > create a use-after-free. You should probably use a DRM-managed action
> > > > > > here instead.
> > > > >
> > > > > Thanks for the comments. If I understand correctly we can use
> > > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > > > the panel or bridge - am I correct?
> > > >
> > > > Look like it is not possible to use DRM-managed action helper here as
> > > > devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
> > > > which we cannot find drm_device pointer (as drm_device pointer is
> > > > mandatory for using DRM-managed action).
> > > > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1545
> > > >
> > > > Please check and correct me if I mentioned any incorrect details.
> > >
> > > You shouldn't call that function from attach anyway:
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-care-with-mipi-dsi-bridges
> >
> > True, If I remember we have bridges earlier to find the downstream
> > bridge/panels from the bridge ops and attach the hook, if that is the
> > case maybe we can use this DRM-managed action as we can get the
> > drm_device pointer from the bridge pointer.
>
> I'm not quite sure what you mean. You shouldn't retrieve the bridge from
> the attach hook but from the probe / bind ones. If that's not working
> for you, this is a bug in the documentation we should address.

Something like this, afterward the design has updated to move the
panel or bridge found to be in host attach.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/bridge/nwl-dsi.c?h=v5.10#n911

>
> > So, what is the best we can do here, add any TODO comment to follow up
> > the same in the future or something else, please let me know?
>
> Make it work in a safe way, as described in the documentation?

Yeah, it is a clear deadlock. It is not possible to use DM-managed
action helper in host attach as there is no drm_device pointer and we
cannot move panel or bridge finding out of host attach as per design
documentation. I'm thinking of go-ahead with adding TODO for adding
the safe way with an existing patch. Please let me know.

Thanks,
Jagan.
