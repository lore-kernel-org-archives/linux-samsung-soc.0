Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166B7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jun 2022 17:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbiFMRKY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jun 2022 13:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242051AbiFMRJe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 13:09:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D97A4F1E1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 05:15:34 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1o0iyg-0005cr-1L; Mon, 13 Jun 2022 14:15:30 +0200
Message-ID: <36ec8ab4b8defbc48b240682d487ce6e0f5c77d5.camel@pengutronix.de>
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Date:   Mon, 13 Jun 2022 14:15:25 +0200
In-Reply-To: <8e3ea285-7837-1b22-9a88-738edd626d12@samsung.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
         <20220504114021.33265-9-jagan@amarulasolutions.com>
         <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
         <CGME20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc@eucas1p1.samsung.com>
         <CAMty3ZBYkQ8GJL+9r+zXhjrFjb+XCLgBh8pY=f+FVM_DHm-SPQ@mail.gmail.com>
         <8a0727e2-134f-c34e-aa32-cf828255ce8c@samsung.com>
         <CAMty3ZAUBVjkDuB2MjMYzZiEc9K7h6tQWn-RozHt7AYNApsJow@mail.gmail.com>
         <8e3ea285-7837-1b22-9a88-738edd626d12@samsung.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Am Montag, dem 13.06.2022 um 13:36 +0200 schrieb Marek Szyprowski:
> On 13.06.2022 13:34, Jagan Teki wrote:
> > On Mon, Jun 13, 2022 at 5:02 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> > > On 13.06.2022 13:17, Jagan Teki wrote:
> > > > On Wed, May 11, 2022 at 4:01 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> > > > > On 04.05.2022 13:40, Jagan Teki wrote:
> > > > > > Fixing up the mode flags is required in order to correlate the
> > > > > > correct sync flags of the surrounding components in the chain
> > > > > > to make sure the whole pipeline can work properly.
> > > > > > 
> > > > > > So, handle the mode flags via bridge, atomic_check.
> > > > > > 
> > > > > > v2:
> > > > > > * none
> > > > > > 
> > > > > > v1:
> > > > > > * fix mode flags in atomic_check instead of mode_fixup
> > > > > > 
> > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
> > > > > >     1 file changed, 14 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > > index b618e52d0ee3..bd78cef890e4 100644
> > > > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > > @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> > > > > >         pm_runtime_put_sync(dsi->dev);
> > > > > >     }
> > > > > > 
> > > > > > +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> > > > > > +                                  struct drm_bridge_state *bridge_state,
> > > > > > +                                  struct drm_crtc_state *crtc_state,
> > > > > > +                                  struct drm_connector_state *conn_state)
> > > > > > +{
> > > > > > +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> > > > > > +
> > > > > > +     adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> > > > > > +     adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> > > > > 1. Shouldn't this be in mode_fixup callback?
> > > > Possible to do it on mode_fixup, yes. if we want to do the same stuff
> > > > on atomic API then atomic_check is the proper helper.
> > > > 
> > > > > 2. Where this requirement comes from? As Marek says it breaks Samsung
> > > > > platforms and is against DSIM specification[1]:
> > > > At least the bridge chain starting from LCDIF+DSIM requires active high sync.
> > > Then please make this specific to the imx variant. The current version
> > > breaks DSI operation on all Exynos based boards.
> > But exynos trm also says the same?
> > 
> > "45.2.2.1.2 RGB Interface
> > Vsync, Hsync, and VDEN are active high signals"
> 
> Right, but You are forcing the negative sync signals:
> 
> adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> 
And this is a quirk of the i.MX8MM (and possibly i.MX8MN) SoC
integration. The same Samsung DSI IP core on the i.MX8MP does require
active high sync signals, matching the documentation.

Regards,
Lucas

