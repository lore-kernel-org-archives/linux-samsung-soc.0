Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307D0C43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 03:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbiJQD7F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Oct 2022 23:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbiJQD7E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 23:59:04 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906B152E50
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:59:00 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id x188so10908367oig.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kVFGWA4vlnvHGqq1JkQQXIB1SOPJqVT47VGXYJ9zQzQ=;
        b=CmlM7D+XgyDkXtyHNa2Aw/OpP0NplioWIfnAwpjw9jL2cHQjaIRZcixh+m6AXoqYLl
         OPmnN5d3mU4RtGvAIWxO3sB6sg/DYkvcTtjVhjKpwPK+VfeEnsSe1nQHhLAii/Ngh+Gq
         6ZTH+QO/1H7emX2VzcVC4RGJeKlcJrMTGLRWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVFGWA4vlnvHGqq1JkQQXIB1SOPJqVT47VGXYJ9zQzQ=;
        b=ivnnOIdzyMdGz3/7Y5q1BmIF2ZtxflUc3XVJNJPsL1NBDuu+isWUSUzorM0PyRE/f+
         GKw5t958KOLY70fSiQn9c/8MSk/ww9fOpgd3d+Xke3+pjt5Cq13sXGSEQTqykwR4Oi1M
         5FzwUKqkCiUgECr2dUMwdocTg5OoQ/wBfJ2b/4fCGmvgwKpd2eAzZYslKRZH/mMBBJZy
         w6PP5pRoK8eCxMc10Szv0+4e/GJIjPyAsguFRr0v4Ac2UfMtn+hX1GS2d5kQ5Ebc6UDc
         /G9a8yCX3NTSTLWWS+XeMOz0g/nwp0RZUmPqI6nhQ7EdpyZuZVeTmMX6+Lw+w/lbM6Dd
         8TYQ==
X-Gm-Message-State: ACrzQf1b8bSneZo0FzoNQceFJpLZSvdsGrFCpHqzA5cqRgVzH0mNi1Di
        RY8KtpNfK1jfprelDZjzp2tIKDWiNbD8eDXMyI1vNg==
X-Google-Smtp-Source: AMsMyM5Agp1aOVhkq7OF9uzqr9qECybxmYU2DZoosoRxoqFzJVZqRhr3dILQjk73C7gegAWPQRkQgGvxZMgHSZbPxk8=
X-Received: by 2002:a05:6808:128e:b0:355:35f5:c939 with SMTP id
 a14-20020a056808128e00b0035535f5c939mr1742589oiw.276.1665979138999; Sun, 16
 Oct 2022 20:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com> <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
In-Reply-To: <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 17 Oct 2022 09:28:48 +0530
Message-ID: <CAMty3ZAAmeHFG-n6LKeq6Mb2GcHxFBJr5DDPJcxrgYn=J_XHmg@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
To:     Marek Vasut <marex@denx.de>
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
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Oct 16, 2022 at 3:31 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/22 17:13, Jagan Teki wrote:
>
> [...]
>
> > @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >       pm_runtime_put_sync(dsi->dev);
> >   }
> >
> > +#define MAX_INPUT_SEL_FORMATS        1
> > +
> > +static u32 *
> > +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                    struct drm_bridge_state *bridge_state,
> > +                                    struct drm_crtc_state *crtc_state,
> > +                                    struct drm_connector_state *conn_state,
> > +                                    u32 output_fmt,
> > +                                    unsigned int *num_input_fmts)
> > +{
> > +     u32 *input_fmts;
> > +
> > +     *num_input_fmts = 0;
> > +
> > +     input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> > +                          GFP_KERNEL);
> > +     if (!input_fmts)
> > +             return NULL;
> > +
> > +     /* This is the DSI-end bus format */
> > +     input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +     *num_input_fmts = 1;
>
> Is this the only supported format ? NXP AN13573 lists the following:

At least it only formats I have tested on my panel.

>
> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> 3.7.4 Pixel formats
> Table 14. DSI pixel packing formats
>
> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
> Packed Pixel Stream, 30-bit RGB, 10-10-10
> Packed Pixel Stream, 36-bit RGB, 12-12-12
> Packed Pixel Stream, 12-bit YCbCr, 4:2:0
> Packed Pixel Stream, 16-bit RGB, 5-6-5
> Packed Pixel Stream, 18-bit RGB, 6-6-6
> Loosely Packed Pixel Stream, 18-bit RGB, 6-6-6
> Packed Pixel Stream, 24-bit RGB, 8-8-8 Format
>
> The MX8MM/MN LCDIF can generate all of those RGB formats , the MX8MP
> LCDIFv3 can also generate the 16bit YCbCr .
>
> It seems there should be more formats here.

The idea of this patch is to support the default format first, and can
possibly add future patches with the addition of new formats.

Thanks,
Jagan.
