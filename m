Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC293C11F64
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 28 Jun 2021 23:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9981D61CBB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 28 Jun 2021 23:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhF1Xr2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Jun 2021 19:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbhF1XrZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Jun 2021 19:47:25 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36BAC061574
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jun 2021 16:44:56 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id d7so4351511vkf.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jun 2021 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+u9zamzkTK0tcOtoSmHBJMw1wdjgvet+oYikY+vPpw=;
        b=gHLbIqQSZA+sYnsVzhDgRcVbz0BRC2ayMuV17e7qZzEMN4HF7dGJqkddBXrMM4rghH
         GeoQQojrKE9FUO/96fJpvJ2tOoQooUQ3iwBawTeKxoxyRmQWpCw0i7GfqY+OyikgTU11
         SFjZOVK0ZexOcYN4FekunaLJlFEWU2wL6ijfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+u9zamzkTK0tcOtoSmHBJMw1wdjgvet+oYikY+vPpw=;
        b=eHYKs1jpoae4htJvxYqW5gXDTndYu8L2hJw+EB8D+69J4nTzqQmzlaOGpFxZ3a6IKt
         rGpGkMQd8d0P10aYk59nplsHe1dAFlhOq9HYuPrpTolKUbb9Vc5tHLSr9C7WivDEgAOO
         itKTz16YXx4cpyXc7qXlMNgOE16YPUqmaokZwjJGtlS203+h6t7mHHz3Yd4KeFhdJMMP
         MutaMnHmEaZxpGNGTxRMf3TWDaE/Tz2NMECE7bFaBClixsAX7gxFihCpAt5kYNClhf7K
         nokrCYd2VonFM7V4NZ9V9lxxMvX64Bch/Igg69SzegPBWt35XaJscjI+y9KeWikMv5Kz
         G3SQ==
X-Gm-Message-State: AOAM531WdAnFHzbCyygyX92Mn3Cj1bqcZiPMozGEUCoXjvPOBBjpttqg
        WEKkMeTNMYG07dDsJ4GUPu+jArCfIrLmQovraGQ/8A==
X-Google-Smtp-Source: ABdhPJzu8m7WzPUvBstEnrLdEWviDthvRrwmL0ifVahCxK9zdAzvpMQjspmMVmZthMZJ0Wl9qUBJ9r+Xqn08qNV929U=
X-Received: by 2002:a1f:4582:: with SMTP id s124mr19508263vka.10.1624923895693;
 Mon, 28 Jun 2021 16:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
 <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com> <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
In-Reply-To: <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 29 Jun 2021 07:44:44 +0800
Message-ID: <CANMq1KAO_4udNPsSQ+D3d=+Zhqj9KudNvTSQa5GpTXNUMPFUgA@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Xin Ji <xji@analogixsemi.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jun 28, 2021 at 7:10 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Mar 3, 2021 at 11:31 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > > >                 dsi->mode_flags =
> > > >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > > > -                       MIPI_DSI_MODE_EOT_PACKET;
> > > > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> > >
> > > Same, just delete the flag.
> > >
> > > These are all just semantic bugs due to the ambiguity of the flags, it is
> > > possible to provide a Fixes: flag for each file using this flag the wrong way
> > > but I dunno if it's worth it.
> >
> > Wow nice catch.
> >
> > I think we should fix all of those _before_ my patch is applied, with
> > proper Fixes tags so that this can be backported to stable branches,
> > even if it's a no-op. I can look into it but that may take a bit of
> > time.
>
> This is fixed now, please will you proceed with this patch, because I
> really like it!

Thanks for the ping, that fell off my radar, v2 on its way ,-)

> Yours,
> Linus Walleij
