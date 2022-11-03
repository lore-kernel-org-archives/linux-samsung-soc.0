Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF709C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Nov 2022 07:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiKCHkn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 03:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKCHki (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 03:40:38 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B67CC8
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 00:40:38 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id 7so640776ilg.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Nov 2022 00:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=llhHs6TrfVSI43y0dEQV5piS8WRy9hmxGh/cbD6QRu0=;
        b=ckeLiJVPhLdjoASd8/BGXKs+77xK5N6uVFxrG/BAeVZY7Q8/IodPW53rJg3rVw214l
         lyUsRbPg+E/TJhjLZJrd+qMJEmlcCQ8S5pKDx5/azDdrWdXapSoc1cAjI8pGBtM/ySHb
         JKZXhJRf+LfA+RU5dWMn9hnb+ecLrDqX7vcik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llhHs6TrfVSI43y0dEQV5piS8WRy9hmxGh/cbD6QRu0=;
        b=1rmYoeecEjdtKVocp20StqyLmjsaf6Zlhmq92KJeAJ6jmIbyDbzTNgVPFQSxoLHtxA
         rzTpCAAO/WllOMofZ3y75iiEiYpPOkxbUD7gpmEr5Uho+/UDRh+rEFIMyJaoerRDExCv
         s13WoWMOjqmONcFElZWYXqekRb12gUs8FRZVBRlT6j0okycTglzgBTs/iy4EB2T1g7vM
         XU+mbdTKFZXSutAdIJs3D7FZULnW2UNZ6eu36nx0QBywGbkbXOqaWEyH1/RE0SM4qZMw
         sQy3lOsbR0BFKwQoqdyD/BJWWxegWj5TYJ9cieYYrZpOwxUzfPn78t9kxHUR6/jpAqnp
         Or0A==
X-Gm-Message-State: ACrzQf2VdvpWIhg0R/50+zqfl3+UcDSh3oSX5jeyj0eMyscN962MNBq+
        s8Oo3T9kG6+LgbMWNHNOCTBMZJ51PscgY40OpCDSkQ==
X-Google-Smtp-Source: AMsMyM6TXegdS2i9PAoPxKahJa2ZBfQjt6w0zgqCj460BDWDmoOVjgGt/T3D5KkDAPaQ4c56lGbIjteDy2lcbw5Rx5s=
X-Received: by 2002:a05:6e02:1287:b0:2ff:dd33:8483 with SMTP id
 y7-20020a056e02128700b002ffdd338483mr16821536ilq.21.1667461237548; Thu, 03
 Nov 2022 00:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com> <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
 <CAMty3ZAAmeHFG-n6LKeq6Mb2GcHxFBJr5DDPJcxrgYn=J_XHmg@mail.gmail.com> <a5788a69-d9bf-a998-3c1b-223903721696@denx.de>
In-Reply-To: <a5788a69-d9bf-a998-3c1b-223903721696@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 3 Nov 2022 13:10:26 +0530
Message-ID: <CAMty3ZC4k+5s0LgV=bCRrCugVLzwz5AWvRajdZz=b9+UKgyQVA@mail.gmail.com>
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

On Mon, Oct 17, 2022 at 12:54 PM Marek Vasut <marex@denx.de> wrote:
>
> On 10/17/22 05:58, Jagan Teki wrote:
> > On Sun, Oct 16, 2022 at 3:31 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 10/5/22 17:13, Jagan Teki wrote:
> >>
> >> [...]
> >>
> >>> @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >>>        pm_runtime_put_sync(dsi->dev);
> >>>    }
> >>>
> >>> +#define MAX_INPUT_SEL_FORMATS        1
> >>> +
> >>> +static u32 *
> >>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>> +                                    struct drm_bridge_state *bridge_state,
> >>> +                                    struct drm_crtc_state *crtc_state,
> >>> +                                    struct drm_connector_state *conn_state,
> >>> +                                    u32 output_fmt,
> >>> +                                    unsigned int *num_input_fmts)
> >>> +{
> >>> +     u32 *input_fmts;
> >>> +
> >>> +     *num_input_fmts = 0;
> >>> +
> >>> +     input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> >>> +                          GFP_KERNEL);
> >>> +     if (!input_fmts)
> >>> +             return NULL;
> >>> +
> >>> +     /* This is the DSI-end bus format */
> >>> +     input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> >>> +     *num_input_fmts = 1;
> >>
> >> Is this the only supported format ? NXP AN13573 lists the following:
> >
> > At least it only formats I have tested on my panel.
> >
> >>
> >> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >> 3.7.4 Pixel formats
> >> Table 14. DSI pixel packing formats
> >>
> >> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
> >> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
> >> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
> >> Packed Pixel Stream, 30-bit RGB, 10-10-10
> >> Packed Pixel Stream, 36-bit RGB, 12-12-12
> >> Packed Pixel Stream, 12-bit YCbCr, 4:2:0
> >> Packed Pixel Stream, 16-bit RGB, 5-6-5
> >> Packed Pixel Stream, 18-bit RGB, 6-6-6
> >> Loosely Packed Pixel Stream, 18-bit RGB, 6-6-6
> >> Packed Pixel Stream, 24-bit RGB, 8-8-8 Format
> >>
> >> The MX8MM/MN LCDIF can generate all of those RGB formats , the MX8MP
> >> LCDIFv3 can also generate the 16bit YCbCr .
> >>
> >> It seems there should be more formats here.
> >
> > The idea of this patch is to support the default format first, and can
> > possibly add future patches with the addition of new formats.
>
> Since you already know about the list, please add all the formats, so we
> won't be adding known broken code first, only to fix it later.

Okay. I can see the DSI section Mini TRM shown below formats. (13.6.2 Features)

Supports pixel format: 16bpp, 18bpp packed, 18bpp loosely packed (3 byte
format), and 24bpp

I will try to add these 4 formats. let me know.

Jagan.
