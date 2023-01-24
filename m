Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA09C61D97
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:16:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234776AbjAXVQy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234547AbjAXVQv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 16:16:51 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E291751C7C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:16:19 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d30so25523610lfv.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=arS602j7b1PD/geangp4x5yLnesnSPivQKKbta96l7c=;
        b=EiWZ+x0fdUG0Ua/Q1YpwSARBwu8nnGu1ShQuasYMWIQx6pKm2C8T4XJQiDTGFHqCA7
         psumDhTSSBQLVkpr1MQBxMsI9+moKWW/eKat0TmAD7chVjdzHypGLGPPeegaUnAGT4pv
         LB/d2SXqQy0uuezKMzhtDcLELMaE+xFFa+QJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arS602j7b1PD/geangp4x5yLnesnSPivQKKbta96l7c=;
        b=okpfwSxBrS336Q6tIVlqgz5xXFtqocg+gl5EEt/JbOpW/KqlFKcdZdkDVVp8AAw+xi
         qTUhxI/+PieFqnzajzb9i3N5xTpUI9CbW0NTeVwXHOGtSP0ceKXaayfE1mah9qZKHozd
         leyzXBFPWiW2ipUaGreLUrt+H9TOkumSrRDu08cpSr3WtLBfwhEwYEoHWszTStYcNn62
         ElO9q1FIDl75qmTFNhJxAOQhzGYpk7xgv0JgF+V408ro4ibSUqcElMGUjM3QWaJoPxYq
         5ddLrkXSkurXERaHGoK2tk8y9m4ibaaXUr09kAi1KRHvxrBBv8n3nG2r7kxunAVl1kBW
         bXIw==
X-Gm-Message-State: AFqh2kq/dMzt2RtkexOtbAAd4ju9b7jQSfM6Aoe7O7GzFL/vS8Q2HUsh
        F6i99QnH38niXZFNcMeczDCkTaD7sYE9+wI7Rjcz2A==
X-Google-Smtp-Source: AMrXdXtR0M84WWFR/eFBxITTRFntc4w0fBApuquxeL369biQsoSFRs/Ai0jAFBo9WYXH9vMIAdEzT7t5y1a94VJdPMU=
X-Received: by 2002:a05:6512:32ae:b0:4be:a4cb:be38 with SMTP id
 q14-20020a05651232ae00b004bea4cbbe38mr1452324lfe.501.1674594977999; Tue, 24
 Jan 2023 13:16:17 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-12-jagan@amarulasolutions.com> <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
In-Reply-To: <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 02:46:04 +0530
Message-ID: <CAMty3ZBdiXnxcak5aKi9cR7OxNPXCQOh2PB0DZ1aEYtySOs--A@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 11/18] drm: exynos: dsi: Add atomic_get_input_bus_fmts
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

On Wed, Jan 25, 2023 at 2:15 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/23/23 16:12, Jagan Teki wrote:
>
> [...]
>
> > +static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
> > +{
> > +     int i;
>
> if (fmt == MEDIA_BUS_FMT_FIXED)
>   return false;
>
> > +     for (i = 0; i < ARRAY_SIZE(exynos_dsi_pixel_output_fmts); i++) {
> > +             if (exynos_dsi_pixel_output_fmts[i] == fmt)
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> > +static u32 *
> > +exynos_dsi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                  struct drm_bridge_state *bridge_state,
> > +                                  struct drm_crtc_state *crtc_state,
> > +                                  struct drm_connector_state *conn_state,
> > +                                  u32 output_fmt,
> > +                                  unsigned int *num_input_fmts)
> > +{
> > +     u32 *input_fmts;
> > +
> > +     if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
> > +             /*
> > +              * Some bridge/display drivers are still not able to pass the
> > +              * correct format, so handle those pipelines by falling back
> > +              * to the default format till the supported formats finalized.
> > +              */
> > +             output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
>
> You can move this ^ past the kmalloc() call, so in unlikely case the
> kmalloc() fails, it would fail first.

I didn't get this point, what do we need to do if
exynos_dsi_pixel_output_fmt_supported returns false?

Jagan.
