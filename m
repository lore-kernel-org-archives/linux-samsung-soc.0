Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775B1C64EC7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Feb 2023 14:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjB1Ouz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Feb 2023 09:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjB1Oux (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Feb 2023 09:50:53 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F7713D4F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Feb 2023 06:50:32 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-536bbef1c5eso278919167b3.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Feb 2023 06:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKdp4nkQEKQ7cUOJDiwmXh7PoHitk4oEoH3Q9MQjDXM=;
        b=JB1QHx2j3b/cX2y0x6Odj/lJVaVYS8682mJWoJrt/uHKkyFFRVMyQlZpD02Swdzo4C
         414teE/O1UWZv58up2pVyntrc3IpdswCkrwynkmmy3rd4zEpLj5jJIsm4bCcK3mjLqJ6
         iPy1llxyWNKIy9lv34NVGKHi89KShkj09WscU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKdp4nkQEKQ7cUOJDiwmXh7PoHitk4oEoH3Q9MQjDXM=;
        b=wW3F3Y/CQLnx6sm+1OZSvyFkIK+qv6oUebD8OMB24FYJmVlAn+2E7ga0jMaNEZJITL
         F8XPX1d/oAlJU23bdDGY1Sby4/SyUBogT1HD7YTFEfCIu+cYx6m7IYAy24uoQhW4oSZi
         uvqK0WP1dKNRs8xG8GpXrNaaySzP1Pp1gO69UZso1/jXN3Ry6s8zOul4bNOrwQGFYNBy
         zOghpcP3u9nwRToZLTWmV5lcY1iZCdAR6Ef0mFxlC/k9JR061d+D5fBYhLwuEfQhTTQF
         sP9xmrLGgJ9Wt1h5VY5oZ/XnHhoysqh+ci06s0OaFH/CFwgOfpwUsH6k62IYPgFCEPqz
         oUNQ==
X-Gm-Message-State: AO0yUKUJh8JJL+VY+Tja0JWjXwnWjehLkhyE8fl6Gwoog/z1/jwKdF4l
        SZYxzE+j9Dp8BtTZcFvfYcCzcFrY9ApD/6iVglYOBA==
X-Google-Smtp-Source: AK7set9qPs6GM32Hpd5vlWQ17TAbMGQxBBZIS3TDjB5zrydEv4fShl5eDwE2P1wnct31EGmJM244y5PfPn4FfLu5jMQ=
X-Received: by 2002:a81:b664:0:b0:52e:cea7:f6e3 with SMTP id
 h36-20020a81b664000000b0052ecea7f6e3mr1774088ywk.10.1677595831183; Tue, 28
 Feb 2023 06:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de> <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de> <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de> <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de> <20230228121046.jfq6dqyuphfmqemi@houat>
 <CAMty3ZAYAsShnBPRirLCb+S-Ysg5TaNP9OC3xszNWwtJH5VREg@mail.gmail.com> <20230228143506.x73ojgtuld2yzrv3@houat>
In-Reply-To: <20230228143506.x73ojgtuld2yzrv3@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 20:20:19 +0530
Message-ID: <CAMty3ZCW=ZYtu3=W2GPm9PPJ6R6Ot5M+ntW=1si9WS8svSniWQ@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Marek Vasut <marex@denx.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 28, 2023 at 8:05 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Feb 28, 2023 at 06:04:39PM +0530, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 5:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Feb 27, 2023 at 08:41:22PM +0100, Marek Vasut wrote:
> > > > > If we go ahead with no need for DRM-managed helper at the moment, then
> > > > > find the panel hook in host.attach and then drop 2/18.
> > > >
> > > > The panel lookup must happen in .bind/.probe for exynos/imx respectively ,
> > > > that's really all that is required here. Then you can drop 1,2,3/18 and get
> > > > this series applied (I hope) .
> > > >
> > > > Can you implement just this one change ?
> > > >
> > > > There is no need to use drmm_* helper for now, that can be improved later if
> > > > possible.
> > >
> > > Yeah... The drmm helper isn't needed per se, but not using it will
> > > create a use-after-free pattern that is very easy to miss.
> > >
> > > I'd really prefer not to add a new helper that favors an unsafe pattern,
> > > but the driver seems to have a whole bunch of them anyway so it's not
> > > really a big deal.
> > >
> > > Which also raises another question: if it's code that is only really
> > > relevant in the context of that driver, why are you creating a helper
> > > for it in the first place?
> >
> > I can answer this question as I did add these helpers.
> >
> > 1. DSI-specific helper added since it is a good candidate for
> > common/helper code, based on the comments in V9 by Marek. V
> > https://patchwork.kernel.org/project/dri-devel/patch/20221209152343.180139-8-jagan@amarulasolutions.com/
> >
> > So, I have added this to the common drm_of code in V10.
> > https://patchwork.kernel.org/project/dri-devel/patch/20221214125907.376148-2-jagan@amarulasolutions.com/
> >
> > 2. DRM-managed discussion was commented on in V11 by you, so from
> > where all discussion moved.
> > https://patchwork.kernel.org/project/dri-devel/patch/20230123151212.269082-3-jagan@amarulasolutions.com/
> >
> > 1) helper wouldn't be an unsafe helper as it can reuse many DSI
> > drivers but 2) helper might be an unsafe helper at the moment.
>
> You're wrong. The first one is unsafe, for the same reason than the devm
> one you did is unsafe: the assumption everyone will get (and the one you
> implemented in your driver) is that the bridge reference will be put
> back at remove time.
>
> The DRM/KMS structures however are free'd only when the last user closes
> the file descriptor of the KMS device, so your driver functions will get
> called after remove has been called.
>
> If you are using the panel or bridge in any of your KMS hooks
> implementations, this is now a use-after-free.
>
> The drmm variant is safe though, because drmm actions run not when the
> device is removed but when the DRM device is last closed.

Okay. So, even if we manually use drm_of_dsi_find_panel_or_bridge in
mipi_dsi_host_ops.attach and drm_panel_bridge_remove() in
mipi_dsi_host_ops.detach KMS doesn't aware of it and is still unsafe.
- am I correct?

Jagan.
