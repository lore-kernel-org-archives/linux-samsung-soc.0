Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE97C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Jan 2023 13:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbjA3NZI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjA3NZI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 08:25:08 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683E834004
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2023 05:25:06 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id d132so13962581ybb.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2023 05:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fjv+/E7O9V7DZVWlNMMTfaSn1KNdTFVRK34aoQeSsQE=;
        b=azrR8dxvTG+zW+XTUkRM5iail1HeaGQQ6c3C8vQtn3oK4dJZ64cZrbxJxfsoKjz4XO
         k492kmeLLzP5wBXd1dZr5O9uf2y1/GS1v99kNAQbTTppxOtnhQA+PkYXInVYFyvujaIk
         eV70JlQM98yAnQgMV8amV1c02VkLF6Uvc0JHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjv+/E7O9V7DZVWlNMMTfaSn1KNdTFVRK34aoQeSsQE=;
        b=evBYS3kb4vT6rao00f5l3c4S4bhCw05GQqcJo4ujMJ2x6ZRm8J4e6kLVoVUqfBhxs8
         NukPY4SXCtbFLmdz45Mm1F5aJ0/iwHoV7LqQ2+lF6J/Fl3pMmo5tQi8nYsTWeerDNsIF
         ApYvMp95+jYgeTYBV2n1VkUiQFhzz4UphV6IhkXsKvVm+AYUgzEoLn3Kqstl5Yem5blS
         0qn/evGEIEZ4Ra2vao6eoiCFZVftSHY2MsCP22AA74U/6zI81rUeSKk5ZFGlhCRUc6qB
         SNaXWxu2UHkaBKBUSdP+0GbIUMJDFKzdP1uXJxRHZgAwUpn4QPy+pL3gKojj0OWOAiEA
         /jYA==
X-Gm-Message-State: AO0yUKXHaDiqpn5Lvha+gDoJP2RopHR2gp25RvX40NwZqrBAi3EMwYKy
        hDfU/wZ2TNBGsnh1Pl6sjgj/kDXsDEHookWGQYBDm64NS7Euy9FV
X-Google-Smtp-Source: AK7set9R/9ExSamHld21fB3UmF6BQKaP+543rXKY2KUZE7qJpQig5geVNt4zfsyMvM9rQzLSIf1gnaP5j6xIkgaAsLE=
X-Received: by 2002:a25:3745:0:b0:80b:6fc1:8b32 with SMTP id
 e66-20020a253745000000b0080b6fc18b32mr343908yba.126.1675085105613; Mon, 30
 Jan 2023 05:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com> <20230130125648.mlrtubymeooejvhg@houat>
In-Reply-To: <20230130125648.mlrtubymeooejvhg@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 30 Jan 2023 18:54:54 +0530
Message-ID: <CAMty3ZANxwUp8yOjo+EWHNngi7SoMYhm1FchM38v_EUDpLY7UQ@mail.gmail.com>
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

On Mon, Jan 30, 2023 at 6:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Jan 27, 2023 at 11:09:26PM +0530, Jagan Teki wrote:
> > Hi,
> >
> > On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > >
> > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > next DSI device in the pipeline.
> > > > >
> > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > endpoint number, find the connected node and return either
> > > > > the associated struct drm_panel or drm_bridge device.
> > > >
> > > > I'm not sure that using a device managed helper is the right choice
> > > > here. The bridge will stay longer than the backing device so it will
> > > > create a use-after-free. You should probably use a DRM-managed action
> > > > here instead.
> > >
> > > Thanks for the comments. If I understand correctly we can use
> > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > the panel or bridge - am I correct?
> >
> > Look like it is not possible to use DRM-managed action helper here as
> > devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
> > which we cannot find drm_device pointer (as drm_device pointer is
> > mandatory for using DRM-managed action).
> > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1545
> >
> > Please check and correct me if I mentioned any incorrect details.
>
> You shouldn't call that function from attach anyway:
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-care-with-mipi-dsi-bridges

True, If I remember we have bridges earlier to find the downstream
bridge/panels from the bridge ops and attach the hook, if that is the
case maybe we can use this DRM-managed action as we can get the
drm_device pointer from the bridge pointer. So, what is the best we
can do here, add any TODO comment to follow up the same in the future
or something else, please let me know?

Thanks,
Jagan.
