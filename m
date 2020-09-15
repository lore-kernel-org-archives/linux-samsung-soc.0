Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34024C43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 18:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E49B22193E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 18:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgIOSDF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 14:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgIOSCo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 14:02:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD73C06178B
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 11:02:42 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kIFHt-0005KV-59; Tue, 15 Sep 2020 20:02:41 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kIFHr-00070z-MD; Tue, 15 Sep 2020 20:02:39 +0200
Date:   Tue, 15 Sep 2020 20:02:39 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        jy0922.shim@samsung.com, b.zolnierkie@samsung.com,
        narmstrong@baylibre.com, sw0312.kim@samsung.com, krzk@kernel.org,
        Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        sylvester.nawrocki@gmail.com
Subject: Re: [PATCH v2 08/16] drm/exynos: add host_ops callback for platform
 drivers
Message-ID: <20200915180239.GB16903@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <CGME20200911135451eucas1p245ccd6535a7ce18b400793cc5039bc87@eucas1p2.samsung.com>
 <20200911135413.3654800-9-m.tretter@pengutronix.de>
 <12dda4ee-8595-f534-b818-e97f4dfe6f2b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12dda4ee-8595-f534-b818-e97f4dfe6f2b@samsung.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:19:39 up 209 days, 50 min, 148 users,  load average: 0.02, 0.13,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 15 Sep 2020 19:07:59 +0200, Andrzej Hajda wrote:
> 
> W dniu 11.09.2020 o 15:54, Michael Tretter pisze:
> > Platform drivers need to be aware if a mipi dsi device attaches or
> > detaches. Add host_ops to the driver_data for attach and detach
> > callbacks and move the i80 mode selection and the hotplug handling into
> > the callback, because these depend on the drm driver.
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > v2:
> > - new patch
> > ---
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 64 ++++++++++++++++++++-----
> >   1 file changed, 53 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index 1a15ae71205d..684a2fbef08a 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -239,6 +239,12 @@ struct exynos_dsi_transfer {
> >   #define DSIM_STATE_CMD_LPM		BIT(2)
> >   #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
> >   
> > +struct exynos_dsi;
> > +struct exynos_dsi_host_ops {
> > +	int (*attach)(struct device *dev, struct mipi_dsi_device *device);
> > +	int (*detach)(struct device *dev, struct mipi_dsi_device *device);
> > +};
> > +
> >   enum exynos_reg_offset {
> >   	EXYNOS_REG_OFS,
> >   	EXYNOS5433_REG_OFS
> > @@ -254,6 +260,7 @@ struct exynos_dsi_driver_data {
> >   	unsigned int wait_for_reset;
> >   	unsigned int num_bits_resol;
> >   	const unsigned int *reg_values;
> > +	const struct exynos_dsi_host_ops *host_ops;
> >   };
> >   
> >   struct exynos_dsi {
> > @@ -467,6 +474,41 @@ static const unsigned int exynos5433_reg_values[] = {
> >   	[PHYTIMING_HS_TRAIL] = 0x0c,
> >   };
> >   
> > +static int __exynos_dsi_host_attach(struct device *dev,
> > +				    struct mipi_dsi_device *device)
> > +{
> > +	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> > +	struct drm_device *drm = dsi->encoder.dev;
> 
> 
> As I wrote yesterday drm device was guaranteed to be present here only 
> if mipi dsi host registration was performed in component bind. In case 
> it is performed in probe it will be always NULL, and the code does not 
> make sense.

Correct, but if the driver is used as a drm bridge, there won't be an encoder
until bridge_attach. Mipi dsi devices defer their probe until the mipi dsi
host is available. If I move the mipi dsi host registration into
bridge_attach, the driver does not know if the next device is another bridge
or a panel during bridge_attach, but the driver cannot successfully return
from bridge_attach, because then the drm driver expects a connector.

I guess that the encoder should be initialized before registering the mipi dsi
host during probe instead of bind. The probe won't be rolled back on
PROBE_DEFER during bind and the encoder will be available in host_attach.
When splitting the driver into the exynos platform specific code and the more
generic code, there won't be an encoder during host_attach in the generic
code, but the host_ops callback could (and will) use the platform specific
encoder, which is available before bridge_attach.

Does this make sense to you?

Michael

> 
> 
> Regards
> 
> Andrzej
> 
> 
> 
> > +	struct exynos_drm_crtc *crtc;
> > +
> > +	mutex_lock(&drm->mode_config.mutex);
> > +	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
> > +	crtc->i80_mode = !(device->mode_flags & MIPI_DSI_MODE_VIDEO);
> > +	mutex_unlock(&drm->mode_config.mutex);
> > +
> > +	if (drm->mode_config.poll_enabled)
> > +		drm_kms_helper_hotplug_event(drm);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __exynos_dsi_host_detach(struct device *dev,
> > +				     struct mipi_dsi_device *device)
> > +{
> > +	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> > +	struct drm_device *drm = dsi->encoder.dev;
> > +
> > +	if (drm->mode_config.poll_enabled)
> > +		drm_kms_helper_hotplug_event(drm);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct exynos_dsi_host_ops exynos_dsi_host_ops = {
> > +	.attach = __exynos_dsi_host_attach,
> > +	.detach = __exynos_dsi_host_detach,
> > +};
> > +
> >   static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
> >   	.reg_ofs = EXYNOS_REG_OFS,
> >   	.plltmr_reg = 0x50,
> > @@ -477,6 +519,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
> >   	.wait_for_reset = 1,
> >   	.num_bits_resol = 11,
> >   	.reg_values = reg_values,
> > +	.host_ops = &exynos_dsi_host_ops,
> >   };
> >   
> >   static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
> > @@ -489,6 +532,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
> >   	.wait_for_reset = 1,
> >   	.num_bits_resol = 11,
> >   	.reg_values = reg_values,
> > +	.host_ops = &exynos_dsi_host_ops,
> >   };
> >   
> >   static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
> > @@ -499,6 +543,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
> >   	.wait_for_reset = 1,
> >   	.num_bits_resol = 11,
> >   	.reg_values = reg_values,
> > +	.host_ops = &exynos_dsi_host_ops,
> >   };
> >   
> >   static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
> > @@ -510,6 +555,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
> >   	.wait_for_reset = 0,
> >   	.num_bits_resol = 12,
> >   	.reg_values = exynos5433_reg_values,
> > +	.host_ops = &exynos_dsi_host_ops,
> >   };
> >   
> >   static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
> > @@ -521,6 +567,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
> >   	.wait_for_reset = 1,
> >   	.num_bits_resol = 12,
> >   	.reg_values = exynos5422_reg_values,
> > +	.host_ops = &exynos_dsi_host_ops,
> >   };
> >   
> >   static const struct of_device_id exynos_dsi_of_match[] = {
> > @@ -1551,8 +1598,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >   				  struct mipi_dsi_device *device)
> >   {
> >   	struct exynos_dsi *dsi = host_to_dsi(host);
> > +	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
> >   	struct drm_encoder *encoder = &dsi->encoder;
> > -	struct drm_device *drm = encoder->dev;
> >   	struct drm_bridge *out_bridge;
> >   
> >   	out_bridge  = of_drm_find_bridge(device->dev.of_node);
> > @@ -1590,18 +1637,12 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >   			return ret;
> >   	}
> >   
> > -	mutex_lock(&drm->mode_config.mutex);
> > -
> >   	dsi->lanes = device->lanes;
> >   	dsi->format = device->format;
> >   	dsi->mode_flags = device->mode_flags;
> > -	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
> > -			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
> >   
> > -	mutex_unlock(&drm->mode_config.mutex);
> > -
> > -	if (drm->mode_config.poll_enabled)
> > -		drm_kms_helper_hotplug_event(drm);
> > +	if (ops && ops->attach)
> > +		ops->attach(dsi->dsi_host.dev, device);
> >   
> >   	return 0;
> >   }
> > @@ -1610,6 +1651,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
> >   				  struct mipi_dsi_device *device)
> >   {
> >   	struct exynos_dsi *dsi = host_to_dsi(host);
> > +	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
> >   	struct drm_device *drm = dsi->encoder.dev;
> >   
> >   	if (dsi->panel) {
> > @@ -1625,8 +1667,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
> >   		INIT_LIST_HEAD(&dsi->bridge_chain);
> >   	}
> >   
> > -	if (drm->mode_config.poll_enabled)
> > -		drm_kms_helper_hotplug_event(drm);
> > +	if (ops && ops->detach)
> > +		ops->detach(dsi->dsi_host.dev, device);
> >   
> >   	exynos_dsi_unregister_te_irq(dsi);
> >   
> 
