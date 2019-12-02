Return-Path: <SRS0=GbDS=ZY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93B4C43215
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Dec 2019 15:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94132215E5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Dec 2019 15:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U1xYwtDb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLBPPN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Dec 2019 10:15:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:32858 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfLBPPM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 10:15:12 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E11D309;
        Mon,  2 Dec 2019 16:15:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575299709;
        bh=mFGJOpuePLZrsr7Ed2VYhGQqc4JmFTNL3aKD7BB6RME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U1xYwtDbAaxhE1hTGuuq+kUzf8of1Su/SFJ/5CD+ND1NhkYzdxvGPjMQnU9DDAlsK
         xdKO2BSloawGiChK9+z+QPTq8dFBSFS9xOMecLTyobVUVAW0hmzdJDacL6+LgL0s9n
         PmQDet0FgRvYJiviJwNNw81lV6KlvpHYKc6AuNZc=
Date:   Mon, 2 Dec 2019 17:15:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sean Paul <sean@poorly.run>
Cc:     Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Alison Wang <alison.wang@nxp.com>,
        Allison Randal <allison@lohutok.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enrico Weigelt <info@metux.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: Re: [PATCH v1 14/16] drm/panel: call prepare/enable only once
Message-ID: <20191202151502.GA18532@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-15-sam@ravnborg.org>
 <20190805170120.GZ104440@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190805170120.GZ104440@art_vandelay>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sean,

On Mon, Aug 05, 2019 at 01:01:20PM -0400, Sean Paul wrote:
> On Sun, Aug 04, 2019 at 10:16:35PM +0200, Sam Ravnborg wrote:
> > Many panel drivers duplicate logic to prevent prepare to be called
> > for a panel that is already prepared.
> > Likewise for enable.
> > 
> > Implement this logic in drm_panel so the individual drivers
> > no longer needs this.
> > A panel is considered prepared/enabled only if the prepare/enable call
> > succeeds.
> > For disable/unprepare it is unconditionally considered
> > disabled/unprepared.
> 
> Hi Sam,
> I did a similar thing a few years ago [1]. IIRC it was well received and just
> needed some nits cleaned up. Unfortunately I lost interest^W^W switched to other
> things and dropped it. So thanks for picking this back up!
> 
> Fast forward to today, I still think it's a good idea but I want to make sure
> this won't negatively interact with the self refresh helpers. With the helpers
> in place, it's possible to call disable consecutively (ie: once to enter self
> refresh and again to actually shut down). I did a quick pass and it looks like
> this patch might break that behavior, so you might want to take that into
> account.

Is this semantics documented somewhere ? The documentation of the panel
disable operation is pretty terse, and we need to explicitly state who
of the caller and callee needs to track the state.

> [1]- https://patchwork.freedesktop.org/series/30712/
> 
> > This allows calls to prepare/enable again, even if there were
> > some issue disabling a regulator or similar during disable/unprepare.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 66 ++++++++++++++++++++++++++++++-------
> >  include/drm/drm_panel.h     | 21 ++++++++++++
> >  2 files changed, 75 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index da19d5b4a2f4..0853764040de 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -66,10 +66,21 @@ EXPORT_SYMBOL(drm_panel_init);
> >   */
> >  int drm_panel_prepare(struct drm_panel *panel)
> >  {
> > -	if (panel && panel->funcs && panel->funcs->prepare)
> > -		return panel->funcs->prepare(panel);
> > +	int ret = -ENOSYS;
> >  
> > -	return panel ? -ENOSYS : -EINVAL;
> > +	if (!panel)
> > +		return -EINVAL;
> > +
> > +	if (panel->prepared)
> > +		return 0;
> > +
> > +	if (panel->funcs && panel->funcs->prepare)
> > +		ret = panel->funcs->prepare(panel);
> > +
> > +	if (ret >= 0)
> > +		panel->prepared = true;
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_panel_prepare);
> >  
> > @@ -85,10 +96,21 @@ EXPORT_SYMBOL(drm_panel_prepare);
> >   */
> >  int drm_panel_enable(struct drm_panel *panel)
> >  {
> > -	if (panel && panel->funcs && panel->funcs->enable)
> > -		return panel->funcs->enable(panel);
> > +	int ret = -ENOSYS;
> >  
> > -	return panel ? -ENOSYS : -EINVAL;
> > +	if (!panel)
> > +		return -EINVAL;
> > +
> > +	if (panel->enabled)
> > +		return 0;
> > +
> > +	if (panel->funcs && panel->funcs->enable)
> > +		ret = panel->funcs->enable(panel);
> > +
> > +	if (ret >= 0)
> > +		panel->enabled = true;
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_panel_enable);
> >  
> > @@ -104,10 +126,20 @@ EXPORT_SYMBOL(drm_panel_enable);
> >   */
> >  int drm_panel_disable(struct drm_panel *panel)
> >  {
> > -	if (panel && panel->funcs && panel->funcs->disable)
> > -		return panel->funcs->disable(panel);
> > +	int ret = -ENOSYS;
> >  
> > -	return panel ? -ENOSYS : -EINVAL;
> > +	if (!panel)
> > +		return -EINVAL;
> > +
> > +	if (!panel->enabled)
> > +		return 0;
> > +
> > +	if (panel->funcs && panel->funcs->disable)
> > +		ret = panel->funcs->disable(panel);
> > +
> > +	panel->enabled = false;
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_panel_disable);
> >  
> > @@ -124,10 +156,20 @@ EXPORT_SYMBOL(drm_panel_disable);
> >   */
> >  int drm_panel_unprepare(struct drm_panel *panel)
> >  {
> > -	if (panel && panel->funcs && panel->funcs->unprepare)
> > -		return panel->funcs->unprepare(panel);
> > +	int ret = -ENOSYS;
> >  
> > -	return panel ? -ENOSYS : -EINVAL;
> > +	if (!panel)
> > +		return -EINVAL;
> > +
> > +	if (!panel->prepared)
> > +		return 0;
> > +
> > +	if (panel->funcs && panel->funcs->unprepare)
> > +		ret = panel->funcs->unprepare(panel);
> > +
> > +	panel->prepared = false;
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_panel_unprepare);
> >  
> > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > index 624bd15ecfab..7493500fc9bd 100644
> > --- a/include/drm/drm_panel.h
> > +++ b/include/drm/drm_panel.h
> > @@ -65,6 +65,9 @@ struct drm_panel_funcs {
> >  	 * @prepare:
> >  	 *
> >  	 * Turn on panel and perform set up.
> > +	 * When the panel is successfully prepared the prepare() function
> > +	 * will not be called again until the panel has been unprepared.
> > +	 *
> >  	 */
> >  	int (*prepare)(struct drm_panel *panel);
> >  
> > @@ -72,6 +75,8 @@ struct drm_panel_funcs {
> >  	 * @enable:
> >  	 *
> >  	 * Enable panel (turn on back light, etc.).
> > +	 * When the panel is successfully enabled the enable() function
> > +	 * will not be called again until the panel has been disabled.
> >  	 */
> >  	int (*enable)(struct drm_panel *panel);
> >  
> > @@ -79,6 +84,7 @@ struct drm_panel_funcs {
> >  	 * @disable:
> >  	 *
> >  	 * Disable panel (turn off back light, etc.).
> > +	 * If the panel is already disabled the disable() function is not called.
> >  	 */
> >  	int (*disable)(struct drm_panel *panel);
> >  
> > @@ -86,6 +92,7 @@ struct drm_panel_funcs {
> >  	 * @unprepare:
> >  	 *
> >  	 * Turn off panel.
> > +	 * If the panel is already unprepared the unprepare() function is not called.
> >  	 */
> >  	int (*unprepare)(struct drm_panel *panel);
> >  
> > @@ -145,6 +152,20 @@ struct drm_panel {
> >  	 * Panel entry in registry.
> >  	 */
> >  	struct list_head list;
> > +
> > +	/**
> > +	 * @prepared:
> > +	 *
> > +	 * Set to true when the panel is successfully prepared.
> > +	 */
> > +	bool prepared;
> > +
> > +	/**
> > +	 * @enabled:
> > +	 *
> > +	 * Set to true when the panel is successfully enabled.
> > +	 */
> > +	bool enabled;
> >  };
> >  
> >  void drm_panel_init(struct drm_panel *panel);

-- 
Regards,

Laurent Pinchart
