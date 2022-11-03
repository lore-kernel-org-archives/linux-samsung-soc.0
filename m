Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C8AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Nov 2022 17:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiKCR1p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 13:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbiKCR1p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 13:27:45 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D905911C11
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 10:27:43 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id z9so1400923ilu.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Nov 2022 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AGC/klEz2b4U2dWfKdByQm5t3Nd2hzDiho7sYsJJDgc=;
        b=SxQO5nBmjuNSdv2VHJ4CSyeRyfkwzBe6T0yK5/F6IMLtKRF3CxyrWA01CaFn/5J81u
         tiNQyyaSE9bTKZ+plnoWjjgA8+Y9YiY/4txcMa38/FsOCsE86vENKo/6T8RSWKCE4VfG
         ceYqI1Zr2krJAcyzTOQOwTbq3rMDJZgjWipAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGC/klEz2b4U2dWfKdByQm5t3Nd2hzDiho7sYsJJDgc=;
        b=LPCKJYKwdryRGg9CmHi1VjlsePPQMXAksh9vPoToCBU0zXM2UIw9A/nxeRUFbqEdv4
         XOJoCaPlE+BqJAG/r+zAi2rYQy191Pq4knvZguTaNCf1K3c39HwSulmY87LJyWnItCF3
         N7oBM3Yt5g0/j0UoHHBTRdQ5L8gvmB6O+fWmupEoY8KeaqSPEt0aL5po1guvLhLno/pd
         0sxYoBmBbBTFDln2KSpGl/oB+QvcbTRMBNzbkbh6Zng9Bg5TBBHN05Fqn6J+OgD+NSqH
         qv76+QwepErDTObSHAwB01axzq4S0O0+zDg4/tFpDas1b/NKTC2AjNomYkY4ApiFUS+D
         d9fw==
X-Gm-Message-State: ACrzQf3nmICKP/X7TLLTiD2OS3dUJ126WFlhwxJF3yM8HmHAFkqeFg7g
        7qJBsg3l87BjgfBJ6CJtKrsYEtDgGnhZ/ETxgrxeqw==
X-Google-Smtp-Source: AMsMyM4WOlzrsf2MfLGKkfRUI+mR05yDHtzMkofGZmAqSsGnHOYANJuclflHNDLDq1gr17Au2yAG+W1lDdR1vP6pD0c=
X-Received: by 2002:a05:6e02:12cf:b0:300:61b9:96a5 with SMTP id
 i15-20020a056e0212cf00b0030061b996a5mr17356587ilm.43.1667496463200; Thu, 03
 Nov 2022 10:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com> <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
 <CAMty3ZDQCsJF+EuG_gvZ-MbkePO55GHfX_yvmKdzqE1fdAR55g@mail.gmail.com> <9262c207-2b72-6638-0274-0ce1d0d830c9@denx.de>
In-Reply-To: <9262c207-2b72-6638-0274-0ce1d0d830c9@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 3 Nov 2022 22:57:31 +0530
Message-ID: <CAMty3ZAzDMRYiWWRwKvA+QSaXRHYgadJ7d4JwKnJWHPqPBua7A@mail.gmail.com>
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

On Thu, Nov 3, 2022 at 9:56 PM Marek Vasut <marex@denx.de> wrote:
>
> On 11/3/22 10:39, Jagan Teki wrote:
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
> >>
> >> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >> 3.7.4 Pixel formats
> >> Table 14. DSI pixel packing formats
> >>
> >> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
> >> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
> >> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
> >
> > Look like these are unsupported in media-bus-format.h list.
>
> Aren't those:
>
> MEDIA_BUS_FMT_UYVY12_1X24

Why is UYVY12 - YCbCr, 4:2:2 is 4+2+2 = 8 then it has UYVY8 ?

> MEDIA_BUS_FMT_UYVY8_1X16

If YCbCr is UYVY (I still don't get this notation, sorry) then Packed
Pixel Stream, 24-bit YCbCr, 4:2:2 with 2 Pixels per packet from Table
14 can be

MEDIA_BUS_FMT_UYVY8_2X24
(YCbCr 4:2:2 is UYVY8)

 " based on a reference example from media bus format doc
4.13.3.4.1.1.3. Packed YUV Formats, For instance, a format where
pixels are encoded as 8-bit YUV values downsampled to 4:2:2 and
transferred as 2 8-bit bus samples per pixel in the U, Y, V, Y order
will be named MEDIA_BUS_FMT_UYVY8_2X8."

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html

_2X24 here 2 Pixels per packet is the exact packets to consider or we
can consider 1 Pixel per packet also. If later is true then _1X24 from
your notation is correct.

Thanks,
Jagan.
