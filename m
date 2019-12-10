Return-Path: <SRS0=92EP=2A=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A1DC2D0BF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Dec 2019 21:42:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B7C120637
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Dec 2019 21:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELDYffyP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbfLJVmW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Dec 2019 16:42:22 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42904 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbfLJVeB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 16:34:01 -0500
Received: by mail-lj1-f194.google.com with SMTP id e28so21540808ljo.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Dec 2019 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sfwPNW+0w7SYOVN5vzqnBaCzSrm1enkZiO9HCQzgqjc=;
        b=ELDYffyPwLTppPAGsVU3YxNSQOLOcATsg+IC8f7KpshW1lI8HVOS/LPhBAsT3ufSID
         fT8v7xNJc4kv0wTGrieBMQqsRE05FMAqAlQlWeqPYjlA6ow0ox6lVlQeD3a0gHQCNpvO
         UQuarskxChn5qju4s1+DdsIwkp9B7GHuVeF6VYnrRLMyisteUJaHFhFjU/S8KbDGs+wP
         PxqBkBxPJ4ttyp+Sef34gOKwQPC9beuKUBnoGOn5XjUWMEO9A2EEJEl1u9PnSr5O44Lx
         VMiuT+azPKHva2915rPrbzbWb1+RwsYjjYQJPUWnIZz+Df5kMzfE10XKxc8RFFUbhxa5
         icmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sfwPNW+0w7SYOVN5vzqnBaCzSrm1enkZiO9HCQzgqjc=;
        b=PmGsFH0bpoOEwLMV6KAv5ZrqnyjvK/6xiiz0Cqyr7YiEzqDc+7Vl50iOC0W/HiJU9H
         JuvkOa8vexyoXc3iVGEc/aB2CtpbLv529LY4g5BKedD89+TGHJbsnbVMlVyY+/9QwhCA
         5Wn/JH999JQDXHrs+wbmYzeWNF61g6gcUhDgizl6Q3wcQ+FFPvtlAJT2gYKJcoCYJWSd
         qUFktEq5p9jZaq7l2kEwkTPGaFSIj78M6SwCmE+sFz3SSuDZDWdVuUZwMBR2WEfgiX+/
         ZARy7sVCWFFvXrzRj8bacjr1BpNO2KQLpf1E6rdUge95R41VtQ69BW/Vjp0NHjmfxi22
         glHg==
X-Gm-Message-State: APjAAAXv9t7ezrEz7flqtyOJP3YF0DAqSLWvzsEyOj0pNsnwVRkX7R7y
        6G+Q7Wdw6aCybkNvcibRubGKuaTDrXbm+AttPW2dRQ==
X-Google-Smtp-Source: APXvYqxlNtTXCGGpW9eRPgRQxUIXYH1CqIcL6wpo3KqsA4rHt7y1htGJhYXnIDuRbtBsJbNT4EJP7YmxbMU5QzD97u0=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr21298405ljh.42.1576013639357;
 Tue, 10 Dec 2019 13:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan> <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
 <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
In-Reply-To: <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Dec 2019 22:33:48 +0100
Message-ID: <CACRpkdZ7jg7JwNk12m9pGXOVBxHRta8nBWmpdqFvfQHB=8LptA@mail.gmail.com>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Dec 4, 2019 at 9:16 AM Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Dec 03, 2019 at 04:20:24PM +0100, Linus Walleij wrote:

> > On the DSI displays in video mode there is also this EOL area
> > which seems to be where the logic is normally just idling for a
> > while, that can be adjusted on some hardware as well, but
> > I don't quite understand it admittedly. Sometimes I wonder if
> > anyone really understands DSI... :/
>
> I'm not aware of any EOL area in MIPI-DSI that would make the hardware
> idle, don't you mean LP-11?

I think in the spec the bubble used for this is tagged "BLLP"
Blanking-Line-Low-Power or something.

IIUC it is possible for displays to either receive continuous NULL
packets or blanking packets or go to LP mode in this area.

And since that is not there for e.g. DPI displays I feel it adds
another layer of confusion to timings.

Yours,
Linus Walleij
