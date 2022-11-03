Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F8EC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Nov 2022 09:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiKCJjU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 05:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKCJjT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 05:39:19 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C7410B5
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 02:39:18 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id p141so855068iod.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Nov 2022 02:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z2aDcE30KF6HV9WFix/WfXdq/qSSwshUhyx5dJXQkJ4=;
        b=ELGro+sn5jcjR2FNxoF403hqzoOVhYjmyRb40ZXG/98xaiPxbusLsic81F/WmeymwB
         JW0/DhP0LvbnEX27TeOd9OqLbxsr7eZRkSPq+jxyDpGGd5cH1my7Ywna2d7/2MRjQeVq
         wm5dL8WocJMLbQzEiBc8o5suTCMzcbV7fL4Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2aDcE30KF6HV9WFix/WfXdq/qSSwshUhyx5dJXQkJ4=;
        b=38FJSsuXNJZehtumbjWCPVaHTT1q+tF+ZHmBB4h6ACpXt6lk7e7uIokmXHE5hpTCju
         4JdpcDl7K0G/mpiPazBmD8mdsRk/106MkioZoNm3zPriBu7tTKgIUnepQQ57BC+uPmUb
         9ABIuctRdjh9axKKA/oTpMDsOPDmgUOwNShB0DAeoRzA4FazBeZSlxkCExPG/i0fBHXS
         hybXdS9EHAE/cxvlt0S9uLRoCKNuVCRCVp87KVooeN8+McOFgX6KzQHuIufuJEC3cMrA
         bi/Zbr08VTq2gZ1zNanf8n58N9yNZFGd7OHAuDlsvEYlgSw0u3+TqeQvuk3/HiqQhwbw
         P5bA==
X-Gm-Message-State: ACrzQf2Io19yZM6eZz/5/cFpKuWsV3nwtYgSID729CqKm9zW1xytIjPU
        WWma/wIzpwl++ynMHpobU0jbzVepzWpGYsdlUYxoWA==
X-Google-Smtp-Source: AMsMyM7i1cJ1adfQWknZqHerOPoSLPE6wIKNG9c7HDL6ZbUsVzokbpzslvuWbSNLdQA0thLll9jH3R3bNPwhSqm4Q9E=
X-Received: by 2002:a05:6638:240a:b0:375:4e6:1d98 with SMTP id
 z10-20020a056638240a00b0037504e61d98mr18517437jat.37.1667468357544; Thu, 03
 Nov 2022 02:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com> <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
In-Reply-To: <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 3 Nov 2022 15:09:06 +0530
Message-ID: <CAMty3ZDQCsJF+EuG_gvZ-MbkePO55GHfX_yvmKdzqE1fdAR55g@mail.gmail.com>
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
>
> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> 3.7.4 Pixel formats
> Table 14. DSI pixel packing formats
>
> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
> Packed Pixel Stream, 16-bit YCbCr, 4:2:2

Look like these are unsupported in media-bus-format.h list.

> Packed Pixel Stream, 30-bit RGB, 10-10-10
> Packed Pixel Stream, 36-bit RGB, 12-12-12
> Packed Pixel Stream, 12-bit YCbCr, 4:2:0

Same issue, unsupported.

> Packed Pixel Stream, 16-bit RGB, 5-6-5

MEDIA_BUS_FMT_RGB565_1X16

> Packed Pixel Stream, 18-bit RGB, 6-6-6

Same issue, unsupported.

> Loosely Packed Pixel Stream, 18-bit RGB, 6-6-6
> Packed Pixel Stream, 24-bit RGB, 8-8-8 Format

MEDIA_BUS_FMT_RGB666_1X18
MEDIA_BUS_FMT_RGB888_1X24

>
> The MX8MM/MN LCDIF can generate all of those RGB formats , the MX8MP
> LCDIFv3 can also generate the 16bit YCbCr .

Is YCbCr denoted as UYVY in media-bus-format.h ?

Thanks,
Jagan.
