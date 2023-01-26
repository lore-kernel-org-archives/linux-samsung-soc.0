Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43D1C61DA2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 15:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjAZPUG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 10:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjAZPTo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 10:19:44 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877E371668
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 07:19:05 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-501c3a414acso27176617b3.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 07:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H2iIBsu00H9gmCgE1ndDAGrufitOVygCG62ixZ4OeCs=;
        b=QXMR9D/0V2HDiY7QdY2pjQGdWi4SnYxOySqkpwIbYSejiEGfN0URhm/TA9YTpf8Rke
         0FxG8DHmyWv9c+aa6/uB5rX8uEI2JkmUmV9L0lGRIlSMxwMmEb8Nq/MHnkvsLNxew+DK
         RGnPxGHxAp7TxRAQh4Dr+ae92yBuldYzSJpV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2iIBsu00H9gmCgE1ndDAGrufitOVygCG62ixZ4OeCs=;
        b=swsZDrLsL+xLWv0myayXmA3A/RQn7lcLrdMwYlqvJcfJftUDhuxxy63YjKZWa5f64b
         nJw+PMY+0lPpXMExbH+TKMrrHpiNcxZF9Y2usXLqqnwQRq20xFRB6TKWmC6nywS6b/9Y
         v9xb6VEM5icUi1739cF0R4QJTWb29kx2+Z+ppZFvR5XUYs5VXC6EhGdDOyMwy/PT/z/l
         EgZc2h5mOLmgVfNgR4qcYHGGXKFbGsQRsgEjBwJXQXq/GM886RC0lYOrlaWDMr0lI/N4
         4Lx2IkvKSlcyv2PQkY8py+wvZivD0hPCiyA3S20cF1meTytZbKwEX5PGw06wC/8sYc7W
         zRkQ==
X-Gm-Message-State: AO0yUKXoW9XxfQ66/eQ9QAfnwqNJnYKoPtXxm2Tmv1S8JOP0Y5wGs5kn
        +ypcQRQitee78vlW+1VOW3MOCMN9REQ9b03JCiSx151QLIH1ke6rJs0=
X-Google-Smtp-Source: AK7set+jRC7u8wW7Xx1AG5xaUYOEg22JmByUS/W1o4X59rwJjwTCmRDM+0j4mi+mxvE1TGu8bTm0n9a6JOY3guYA/Lw=
X-Received: by 2002:a81:ae61:0:b0:506:6364:fda3 with SMTP id
 g33-20020a81ae61000000b005066364fda3mr912382ywk.72.1674746339676; Thu, 26 Jan
 2023 07:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com> <20230126121227.qcnftqvgiz44egpg@houat>
In-Reply-To: <20230126121227.qcnftqvgiz44egpg@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 26 Jan 2023 20:48:48 +0530
Message-ID: <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
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

On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > Add devm OF helper to return the next DSI bridge in the chain.
> >
> > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > helper uses the dsi specific panel_or_bridge helper to find the
> > next DSI device in the pipeline.
> >
> > Helper lookup a given child DSI node or a DT node's port and
> > endpoint number, find the connected node and return either
> > the associated struct drm_panel or drm_bridge device.
>
> I'm not sure that using a device managed helper is the right choice
> here. The bridge will stay longer than the backing device so it will
> create a use-after-free. You should probably use a DRM-managed action
> here instead.

Thanks for the comments. If I understand correctly we can use
drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
the panel or bridge - am I correct?

Jagan.
