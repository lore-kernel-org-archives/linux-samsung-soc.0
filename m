Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDE1C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjAZO6z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjAZO6z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:58:55 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC1662260
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:58:54 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-506609635cbso26302557b3.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F+hnVEHWhv1xBaJ1U7spBSPMrJ9sXpPQta5PjiVCDtk=;
        b=bt3SpHN+sRz6tSirTZKY5wDQH90STxi/RLwjwG4+XthZJ+ZWN2X85Z6aICwvMZs05P
         52o5qi133GGJ9xHKv0gEkcR5lUNm8eldFqSqdbxeC/sv4tSTW1nQP3Ah57G6fSDzAHsx
         QmHS5sMoYz4EDTJjsOPuqj6Tww9AdvBf91R3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+hnVEHWhv1xBaJ1U7spBSPMrJ9sXpPQta5PjiVCDtk=;
        b=uuWf7CRxxNCBN4hGhwo64SXqb/S35LAyzbsoAWpfqhOUme+ZklENZNvlMxM4YqAN7H
         o9/ZCTqee0OTl8hPZoXUgHLSKKah5bViJF8WNHpLWncYva4m+ZBy5zQyMAzOdteBIasI
         Smpe77X48Z8RsixUcSWaFkNlgAmas/8X9OSmX9xezfBhb4xgZuFc20EQXYwGmUCgeGuX
         f+xnc4c5U+cv/VwvSreNGIio0ZuQQmAdw18OruC/t6vbKqzGHMggvuJ9C/5lbagxNZhk
         7WzqYgYVSCKlMJPWokHijqHWSTl0K/4fNPdvkGuP3BYPvKTwXYIYnzoaCp9GGz7DHo+L
         /Xaw==
X-Gm-Message-State: AFqh2kpSjQc30jsj33MI0xJqRqGIfHWy7l9e9RW6rZmh5mBRtvF98tz0
        E+n6Yk2DAvFJ9hjzzMqpqRwaU4nTUV93yBulgyic7w==
X-Google-Smtp-Source: AMrXdXs5yK+DoJlQQlLQlVVwsCkCFhxE7bTrku1TJXrm0rNp6kW5dWTC6+wLxRv9HcE0LxxkHMZEDuVzue2VSCtVoTw=
X-Received: by 2002:a05:690c:852:b0:4d7:eb11:6bf7 with SMTP id
 bz18-20020a05690c085200b004d7eb116bf7mr4313303ywb.235.1674745132681; Thu, 26
 Jan 2023 06:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <20230126144427.607098-3-jagan@amarulasolutions.com> <20230126144722.ahnfzrl7ohy4lsah@houat>
In-Reply-To: <20230126144722.ahnfzrl7ohy4lsah@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 26 Jan 2023 20:28:41 +0530
Message-ID: <CAMty3ZDzF=yUM0OCFdcdRJgaAqozTeLetCrCGD3xmG5_pyLQRQ@mail.gmail.com>
Subject: Re: [PATCH v12 02/18] drm: bridge: panel: Add devm_drm_of_dsi_get_bridge
 helper
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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

On Thu, Jan 26, 2023 at 8:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jan 26, 2023 at 08:14:11PM +0530, Jagan Teki wrote:
> > Add devm OF helper to return the next DSI bridge in the chain.
> >
> > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > helper uses the dsi specific panel_or_bridge helper to find the
> > next DSI device in the pipeline.
> >
> > Helper lookup a given child DSI node or a DT node's port and
> > endpoint number, find the connected node and return either
> > the associated struct drm_panel or drm_bridge device.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v12, v11:
> > - none
> > Changes for v10:
> > - new patch
>
> I sent you an email earlier today telling you to change this.

Ohh. Missed it, I will respond to that thread.

Thanks,
Jagan.
