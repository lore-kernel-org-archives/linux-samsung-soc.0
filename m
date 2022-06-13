Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE16DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jun 2022 13:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240881AbiFMNA3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jun 2022 09:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357078AbiFMM62 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 08:58:28 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFCC10A9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 04:17:32 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id h23so10454517ejj.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FO5eQRnnKHa3c3u3uxHcn5ZlaPTIIVuUOMy3m36ikoQ=;
        b=K5E4/xzxiOPflSJ7TE4smffiIvjbrel6Kugrqo92KYRAU4jspIY3Q2jHQadjy+4un2
         8znSkTk//qJ/p3nmNcW1bVytKIxyBy8fpBgRbbNGhz/f45KXQ7TsWwgNnBvEhzEsGnGK
         NmiI2K01ywDlI+qtp6+Z2ocLTuCFhsTkeywP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FO5eQRnnKHa3c3u3uxHcn5ZlaPTIIVuUOMy3m36ikoQ=;
        b=mnP/V/77CRqeOnGfpCm0wnWwc1QttSjXz1QqlI+G7/dJ0jqPYEwJ/txr/gXkUTTG2G
         nGB5GvU0M+6EKfpl0Owv6VeuQPL9yPxNUIfNuIn0sl2Ys1gXQF8SgwAj7MQp6hMGGiAR
         9mcXMrJK8jP+1Ogyc8DMUuJGOZHGU6Ju85Jk6rKtT9dXkmch7Bh7ySRRMWI3WXFCA9kn
         ETo3ZbFOyaAShAoHtVeBQBHB52Z+gwHKdd7Bqym2T8dVOP5C9+zHoMCDGdxaes7LoHO8
         lidfWkn9B1ltUjh0RvQCntzEi1vsmcPK11R+pTeAp9l76MX44XAoeACp5/8XHkbIVNna
         SLsg==
X-Gm-Message-State: AOAM533OXBDdEe8iK/979WZtksVl+QiyZwiL10Yn/wx2L4rvUySJY+YI
        /59CnYur28avaOG7Ihki24jPw4COgGogHcr2FeSyiA==
X-Google-Smtp-Source: ABdhPJy1YGZXyB3xGCSbNeenonti+4M6z/MEDflCOhq9mOF1UZMvm9qqASBBngbBmqx6Ppcp1MWW8C49KWXoGSrDIkg=
X-Received: by 2002:a17:906:494b:b0:710:7954:f6ce with SMTP id
 f11-20020a170906494b00b007107954f6cemr43312372ejt.123.1655119050611; Mon, 13
 Jun 2022 04:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <20220504114021.33265-9-jagan@amarulasolutions.com> <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
In-Reply-To: <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 13 Jun 2022 16:47:19 +0530
Message-ID: <CAMty3ZBYkQ8GJL+9r+zXhjrFjb+XCLgBh8pY=f+FVM_DHm-SPQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
To:     Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, May 11, 2022 at 4:01 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> On 04.05.2022 13:40, Jagan Teki wrote:
> > Fixing up the mode flags is required in order to correlate the
> > correct sync flags of the surrounding components in the chain
> > to make sure the whole pipeline can work properly.
> >
> > So, handle the mode flags via bridge, atomic_check.
> >
> > v2:
> > * none
> >
> > v1:
> > * fix mode flags in atomic_check instead of mode_fixup
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index b618e52d0ee3..bd78cef890e4 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >       pm_runtime_put_sync(dsi->dev);
> >   }
> >
> > +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> > +                                  struct drm_bridge_state *bridge_state,
> > +                                  struct drm_crtc_state *crtc_state,
> > +                                  struct drm_connector_state *conn_state)
> > +{
> > +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> > +
> > +     adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> > +     adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>
>
> 1. Shouldn't this be in mode_fixup callback?

Possible to do it on mode_fixup, yes. if we want to do the same stuff
on atomic API then atomic_check is the proper helper.

> 2. Where this requirement comes from? As Marek says it breaks Samsung
> platforms and is against DSIM specification[1]:

At least the bridge chain starting from LCDIF+DSIM requires active high sync.

Jagan.
