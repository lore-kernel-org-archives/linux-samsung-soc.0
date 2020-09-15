Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888B6C43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 17:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0290620829
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 17:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JuTxEEa6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgIORQC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 13:16:02 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54087 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbgIORPy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 13:15:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200915170801euoutp01c4f0f77c01bf0288632717cb62253970~1BAmFFPY41405814058euoutp01Z
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 17:08:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200915170801euoutp01c4f0f77c01bf0288632717cb62253970~1BAmFFPY41405814058euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600189681;
        bh=EeuMknqJOHdvPXucE1OaFJ20CCwS7T1i9Eo/NkqVlVc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=JuTxEEa6GNM0YjCaiE/mGDquSayZHzqKmGgFudk4TyksicfzHCMoAM2IAVCpXDSnV
         OV0eYXUSciOxjC7QogwkU4vdRM3wKfW5yZuPx+KGO/3VAnfD23eb0Xcomw595HmzU3
         mvMJzIF/ApRBUAMeOcJTElsEX5EBvC0iB5nrtB38=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200915170801eucas1p2fd1ec916301247c131ea1636850b4e7e~1BAllxwLO1892018920eucas1p2H;
        Tue, 15 Sep 2020 17:08:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 72.92.06318.0F4F06F5; Tue, 15
        Sep 2020 18:08:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200915170800eucas1p2e5ab60a738d2f13b1869bfbe4d7fbf93~1BAlPcOqJ2555425554eucas1p2n;
        Tue, 15 Sep 2020 17:08:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200915170800eusmtrp2e0a138a3574084e084758e5db7b2948e~1BAlOs6fB2115221152eusmtrp2E;
        Tue, 15 Sep 2020 17:08:00 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-8c-5f60f4f0e8a4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BA.B8.06017.0F4F06F5; Tue, 15
        Sep 2020 18:08:00 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200915170759eusmtip2f70e578182a3219077b49db8e8f95edb~1BAkc2gur0756707567eusmtip2q;
        Tue, 15 Sep 2020 17:07:59 +0000 (GMT)
Subject: Re: [PATCH v2 08/16] drm/exynos: add host_ops callback for platform
 drivers
To:     Michael Tretter <m.tretter@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     jy0922.shim@samsung.com, b.zolnierkie@samsung.com,
        narmstrong@baylibre.com, sw0312.kim@samsung.com, krzk@kernel.org,
        Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        sylvester.nawrocki@gmail.com
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <12dda4ee-8595-f534-b818-e97f4dfe6f2b@samsung.com>
Date:   Tue, 15 Sep 2020 19:07:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200911135413.3654800-9-m.tretter@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfyyUcRz2vfe9931dnb0Ou09E67ZaaSFavS1MVuvKP/yRP7Rw8oblV3eI
        /JGKdn6TCXeR/BjdVn6EXEpjxhoOcxZTWYoQqR2WFnLes/z3PJ/P83y+z7N9KUzUx7elIqLj
        WHm0LFJCCPCW7lXd0Z9LwUEu316fYBqK6/iMfnmRYGY+DeGMplCLMwMD9SSTnl9FMsUD7Tym
        pVbHZzpzLjPFBbMEU2bQ8rx2SRdH00ipVvWRlKqVJXxpoyadkE5k9vCkuWsu0pwmDZIaGh18
        qQCBeygbGZHAyp09gwXhQ3PLeOwb18SOolw8BekPZSBzCujj8MjQjGUgASWiaxE8aajAObKE
        4EtaK58jBgTjK8/wbcuKcsVkqUGgnM4nObKIoOClijSqrGh/UHeMbDooypqOg/lJH6MGo0cQ
        ZE2vb10i6MOw9mKMMGIh7QmajOfIiHH6AOR1FWNGbEOHwNslnUljCe9Kvm55zWkv0M3PbGkw
        eh/ca1absBjuLj3dig30JAnvu4oILvZZ0M6WmipYwVxPE8nhvbChfczj8G2YqE3FOLMSQXO9
        FuMWp+GD7g9hbINtpq575cyNz8BgaytpHANtAaMLllwGC3jQUoRxYyEo74s49X6Y6G82HRRD
        9eAykYckqh3NVDvaqHa0Uf1/txzhGiRm4xVRYazCLZq96aSQRSnio8OcrsZENaLNP9a73rPc
        itr/hnQimkKS3cLy8eAgEV+WoEiK6kRAYRJroXd/b6BIGCpLusXKY4Lk8ZGsohPZUbhELHSr
        mL0iosNkcex1lo1l5dtbHmVum4JcpwotSy4EGk7mXuq+k+Q+c9Ave87DOWAmJStzuEbcdl6z
        oC9T9/Gy909NbVTOTrr/uvEw4fs55tr6KbvVUl+viEX9kYuVTXx9VltpeYBM6JGcV1Dk7aD2
        cfmdXbdm1p/vH1BNtHWl+g4n+5l9DrJJNI9Z6wmtcdT82KMes6+yz5fginDZMUdMrpD9AyhL
        wIlfAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsVy+t/xe7ofviTEG0zcqWCxccZ6VosrX9+z
        Wby4d5HFYtXUnSwW589vYLfonLiE3WLG+X1MFttWnGO1ONQXbTFj8ks2i3mfdzI5cHu8v9HK
        7rFz1l12j9kdM1k9Nq3qZPO4332cyaP/r4FH35ZVjB6fN8kFcETp2RTll5akKmTkF5fYKkUb
        WhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZVx89ZWlYK9RxcHp/SwNjFc0uhg5
        OSQETCS+dXxj7mLk4hASWMoo8b59MztEQlxi9/y3zBC2sMSfa11sEEVvGSVuvFjLCpIQFgiT
        mH3wKguILSJQIvHp3CMmkCJmgauMEidePIEae5JR4vy/52Bj2QQ0Jf5uvskGYvMK2Ems6lrH
        CGKzCKhKTDgyA2ydqECSxI11dxkhagQlTs58AraBU8BB4tybF2A1zAJmEvM2P4Sy5SWat86G
        ssUlmr6sZJ3AKDQLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusZFecWJucWleul5yfu4mRmDs
        bjv2c8sOxq53wYcYBTgYlXh4F9xOiBdiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFp
        TmrxIUZToOcmMkuJJucD00peSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+
        Jg5OqQbGixX9WZsVDhrvvWimIvI9WJLbf9r9mN0HVxVs/7njTnj16/ovx+5kC0gran2eL+VV
        FSydPfntLpWP96Yp/pRuF5qtsKzwlArLzKfJUTrZ665HfIjm+PrvxWaxqjaVTxp9c3IWnf+j
        vmLBwtfhcp5CbNOlPTgT/oY/Xjx1Q7Yyq5THxFqPtzpzlFiKMxINtZiLihMB5ekzNPMCAAA=
X-CMS-MailID: 20200915170800eucas1p2e5ab60a738d2f13b1869bfbe4d7fbf93
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911135451eucas1p245ccd6535a7ce18b400793cc5039bc87
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911135451eucas1p245ccd6535a7ce18b400793cc5039bc87
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <CGME20200911135451eucas1p245ccd6535a7ce18b400793cc5039bc87@eucas1p2.samsung.com>
        <20200911135413.3654800-9-m.tretter@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


W dniu 11.09.2020 o 15:54, Michael Tretter pisze:
> Platform drivers need to be aware if a mipi dsi device attaches or
> detaches. Add host_ops to the driver_data for attach and detach
> callbacks and move the i80 mode selection and the hotplug handling into
> the callback, because these depend on the drm driver.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> v2:
> - new patch
> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 64 ++++++++++++++++++++-----
>   1 file changed, 53 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 1a15ae71205d..684a2fbef08a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -239,6 +239,12 @@ struct exynos_dsi_transfer {
>   #define DSIM_STATE_CMD_LPM		BIT(2)
>   #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
>   
> +struct exynos_dsi;
> +struct exynos_dsi_host_ops {
> +	int (*attach)(struct device *dev, struct mipi_dsi_device *device);
> +	int (*detach)(struct device *dev, struct mipi_dsi_device *device);
> +};
> +
>   enum exynos_reg_offset {
>   	EXYNOS_REG_OFS,
>   	EXYNOS5433_REG_OFS
> @@ -254,6 +260,7 @@ struct exynos_dsi_driver_data {
>   	unsigned int wait_for_reset;
>   	unsigned int num_bits_resol;
>   	const unsigned int *reg_values;
> +	const struct exynos_dsi_host_ops *host_ops;
>   };
>   
>   struct exynos_dsi {
> @@ -467,6 +474,41 @@ static const unsigned int exynos5433_reg_values[] = {
>   	[PHYTIMING_HS_TRAIL] = 0x0c,
>   };
>   
> +static int __exynos_dsi_host_attach(struct device *dev,
> +				    struct mipi_dsi_device *device)
> +{
> +	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> +	struct drm_device *drm = dsi->encoder.dev;


As I wrote yesterday drm device was guaranteed to be present here only 
if mipi dsi host registration was performed in component bind. In case 
it is performed in probe it will be always NULL, and the code does not 
make sense.


Regards

Andrzej



> +	struct exynos_drm_crtc *crtc;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
> +	crtc->i80_mode = !(device->mode_flags & MIPI_DSI_MODE_VIDEO);
> +	mutex_unlock(&drm->mode_config.mutex);
> +
> +	if (drm->mode_config.poll_enabled)
> +		drm_kms_helper_hotplug_event(drm);
> +
> +	return 0;
> +}
> +
> +static int __exynos_dsi_host_detach(struct device *dev,
> +				     struct mipi_dsi_device *device)
> +{
> +	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> +	struct drm_device *drm = dsi->encoder.dev;
> +
> +	if (drm->mode_config.poll_enabled)
> +		drm_kms_helper_hotplug_event(drm);
> +
> +	return 0;
> +}
> +
> +static const struct exynos_dsi_host_ops exynos_dsi_host_ops = {
> +	.attach = __exynos_dsi_host_attach,
> +	.detach = __exynos_dsi_host_detach,
> +};
> +
>   static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
>   	.reg_ofs = EXYNOS_REG_OFS,
>   	.plltmr_reg = 0x50,
> @@ -477,6 +519,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
>   	.wait_for_reset = 1,
>   	.num_bits_resol = 11,
>   	.reg_values = reg_values,
> +	.host_ops = &exynos_dsi_host_ops,
>   };
>   
>   static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
> @@ -489,6 +532,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>   	.wait_for_reset = 1,
>   	.num_bits_resol = 11,
>   	.reg_values = reg_values,
> +	.host_ops = &exynos_dsi_host_ops,
>   };
>   
>   static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
> @@ -499,6 +543,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>   	.wait_for_reset = 1,
>   	.num_bits_resol = 11,
>   	.reg_values = reg_values,
> +	.host_ops = &exynos_dsi_host_ops,
>   };
>   
>   static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
> @@ -510,6 +555,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
>   	.wait_for_reset = 0,
>   	.num_bits_resol = 12,
>   	.reg_values = exynos5433_reg_values,
> +	.host_ops = &exynos_dsi_host_ops,
>   };
>   
>   static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
> @@ -521,6 +567,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
>   	.wait_for_reset = 1,
>   	.num_bits_resol = 12,
>   	.reg_values = exynos5422_reg_values,
> +	.host_ops = &exynos_dsi_host_ops,
>   };
>   
>   static const struct of_device_id exynos_dsi_of_match[] = {
> @@ -1551,8 +1598,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   				  struct mipi_dsi_device *device)
>   {
>   	struct exynos_dsi *dsi = host_to_dsi(host);
> +	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
>   	struct drm_encoder *encoder = &dsi->encoder;
> -	struct drm_device *drm = encoder->dev;
>   	struct drm_bridge *out_bridge;
>   
>   	out_bridge  = of_drm_find_bridge(device->dev.of_node);
> @@ -1590,18 +1637,12 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   			return ret;
>   	}
>   
> -	mutex_lock(&drm->mode_config.mutex);
> -
>   	dsi->lanes = device->lanes;
>   	dsi->format = device->format;
>   	dsi->mode_flags = device->mode_flags;
> -	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
> -			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
>   
> -	mutex_unlock(&drm->mode_config.mutex);
> -
> -	if (drm->mode_config.poll_enabled)
> -		drm_kms_helper_hotplug_event(drm);
> +	if (ops && ops->attach)
> +		ops->attach(dsi->dsi_host.dev, device);
>   
>   	return 0;
>   }
> @@ -1610,6 +1651,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   				  struct mipi_dsi_device *device)
>   {
>   	struct exynos_dsi *dsi = host_to_dsi(host);
> +	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
>   	struct drm_device *drm = dsi->encoder.dev;
>   
>   	if (dsi->panel) {
> @@ -1625,8 +1667,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   		INIT_LIST_HEAD(&dsi->bridge_chain);
>   	}
>   
> -	if (drm->mode_config.poll_enabled)
> -		drm_kms_helper_hotplug_event(drm);
> +	if (ops && ops->detach)
> +		ops->detach(dsi->dsi_host.dev, device);
>   
>   	exynos_dsi_unregister_te_irq(dsi);
>   
