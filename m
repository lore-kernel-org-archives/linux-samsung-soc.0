Return-Path: <SRS0=Wlns=CZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4D4C43461
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 22:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A11020732
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 22:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lJtpXpGT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgIPWIM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Sep 2020 18:08:12 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56599 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgIPWH7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 18:07:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200916220104euoutp021a60fd21b5dc4b32b3af87ab68c33131~1YpvxMhEn1183711837euoutp02W
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2020 22:01:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200916220104euoutp021a60fd21b5dc4b32b3af87ab68c33131~1YpvxMhEn1183711837euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600293664;
        bh=Ohj4F+YC/5yeR0d4FiQQVyk4AJZQwWUK4rNHFywlNkM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=lJtpXpGT5Ae8+/XGjxdRcttqOlmhcjan6ftMuz3BzY7c1P60m21ljb269tXcGCFpk
         7vJe6zGcbIZM3qgkjnVwbpsNooMGryaXW/VuvfV5HgKW6uix5PtqLuGRGCCc6OajJb
         qrQk076OtRXKsYM0gxXtzqsfiwwoqTR4fGeYnXiA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200916220103eucas1p2ee4ccfc38403a66180c89df4b7bd8d9f~1Ypuxdj_X0691306913eucas1p2X;
        Wed, 16 Sep 2020 22:01:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 95.5F.06456.F1B826F5; Wed, 16
        Sep 2020 23:01:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200916220103eucas1p23715a9f254a935b904ed5ec68c0fb608~1YpuaEH8g3100131001eucas1p2-;
        Wed, 16 Sep 2020 22:01:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200916220103eusmtrp1b2d733ed6a142e7b547602974c21c8e4~1YpuZTw2G1202712027eusmtrp1I;
        Wed, 16 Sep 2020 22:01:03 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-5d-5f628b1fa49a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1C.3E.06017.E1B826F5; Wed, 16
        Sep 2020 23:01:02 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200916220102eusmtip22dae48a6e1db9d97e64fabc2a861509c~1Ypt0EP3A0914009140eusmtip2R;
        Wed, 16 Sep 2020 22:01:02 +0000 (GMT)
Subject: Re: [PATCH v2 08/16] drm/exynos: add host_ops callback for platform
 drivers
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org,
        krzk@kernel.org, kernel@pengutronix.de,
        sylvester.nawrocki@gmail.com, Laurent.pinchart@ideasonboard.com
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <4d77a4e9-e5c7-5c8e-5646-1333a3b972a8@samsung.com>
Date:   Thu, 17 Sep 2020 00:01:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0)
        Gecko/20100101 Thunderbird/81.0
MIME-Version: 1.0
In-Reply-To: <20200915180239.GB16903@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zk752hNjvP2ZqE0SErKC/XjgCkaISMhFFIo8TL15CWdtjlr
        /UnSxEuppeKcIRKFc5LzjhpmrshbOpMJBt4mUZrZzGtaRs6j5L/nfd7neb/ngY/ChAN8ZypR
        ms7KpJJkEWGNt73fNJx1LYiJ8nrVCUyjSsdnjGtmgpmb+ogz2rIOnDEYGkgm7/FzklEZXvOY
        Ns0wn9EXhjOqknmCqVrp4PkfFpvHH5DiDvUkKa7MreCLm7R5hHi6oJcnLtr2Ehe2aJF4pckl
        mLpufSGOTU7MYGWeftHWCcX1yrS1oDt9NX38TFTrm4+sKKDPQ9+CEeUja0pIaxDkGN7i3LCK
        YLnmK8ENKwj06npy31KnyiS5RQ2CvoFNjBvMCNZ1/bsqOzoMKnvGcAu2pz2gu1ZNWDBGV/Dg
        t05gwQR9GrabP+3yAtoPPhhmePmIonD6JPQv7Vod6GgYndwgOYkt9Fd83uWtdkJoe1Zx7qQr
        ZLVWYhx2gvurtXxLHqCnSDCVbSMu9SVY+JGLcdgOvvW27LU5DoMlD3EO34NpTTbGmXMRtDZ0
        7Bl8YGJ4i7CEw3ZC6zo9OToARtrbSQsNtA2ML9pyGWzgSVs5xtECyM0RcuoTMD3UunfQCV6M
        rBHFSKQ+0Ex9oI36QBv1/3erEa5FTqxCnhLPyr2l7G0PuSRFrpDGe8SmpjShnR82+Ld3uR2t
        jcboEU0h0RFBg0NMlJAvyZArU/QIKExkL7g4NBgpFMRJlHdZWWqUTJHMyvXoGIWLnATnns1H
        COl4STp7k2XTWNn+lkdZOWciFRmPQkTvSpNGjAVbXbNVV6/c6vpideapKbDVXDSQ7rb6p26j
        unPsmm+hqc3le1JofWi4cfaNZ6ybZi540THOrH3kPzeqmWlpDmh8WcpTGL0WNNkx7iajT9Dl
        0V830gq9ZYqsiZ/KpVPmsA1H06Gj3RHTkeW6QOaEMkO6HmIIFOHyBIm3OyaTS/4Bgnc9+F0D
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsVy+t/xe7py3UnxBhs+W1lsnLGe1eLK1/ds
        Fi/uXWSxWDV1J4vF+fMb2C06Jy5ht5hxfh+TxbYV51gtDvVFW8yY/JLNYt7nnUwO3B7vb7Sy
        e+ycdZfdY3bHTFaPTas62Tzudx9n8uj/a+DRt2UVo8fnTXIBHFF6NkX5pSWpChn5xSW2StGG
        FkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GRPWVRZ89a44sfwEawPjStsuRk4O
        CQETidUzGti7GLk4hASWMkocW9DKDJEQl9g9/y2ULSzx51oXG0TRW0aJFefWsoMkhAXCJGYf
        vMoCYosI6EnsXzkLrIhZYCaTxKYHL5ggOlYwSZxd/Q5sFJuApsTfzTfZQGxeATuJM+cfABVx
        cLAIqEqc/AA2SFQgQWLvjAvsECWCEidnPgGLcwKduurgFzCbWcBMYt7mh8wQtrxE89bZULa4
        RNOXlawTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiM223H
        fm7Zwdj1LvgQowAHoxIP7wbRpHgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQW
        H2I0BfptIrOUaHI+MKXklcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+Lg
        lGpg7D7THaEw919KZ9pH/YZLYv8vswnUHVuixrxT1m3uUl87vj/XbudvPymnbXX47JdKUbkr
        u27ut10vMlnG6jPTlv8ma66tV94lHOhqtPCTRcSLaR7X6jsvVYrIZjI5JP24Ndvn09pH7mc+
        92YxaNz7JSZjEWickR2jLBGtyd87hXnqivSbeY0/lFiKMxINtZiLihMBTjK7MPECAAA=
X-CMS-MailID: 20200916220103eucas1p23715a9f254a935b904ed5ec68c0fb608
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911135451eucas1p245ccd6535a7ce18b400793cc5039bc87
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911135451eucas1p245ccd6535a7ce18b400793cc5039bc87
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <CGME20200911135451eucas1p245ccd6535a7ce18b400793cc5039bc87@eucas1p2.samsung.com>
        <20200911135413.3654800-9-m.tretter@pengutronix.de>
        <12dda4ee-8595-f534-b818-e97f4dfe6f2b@samsung.com>
        <20200915180239.GB16903@pengutronix.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


W dniu 15.09.2020 o 20:02, Michael Tretter pisze:
> On Tue, 15 Sep 2020 19:07:59 +0200, Andrzej Hajda wrote:
>> W dniu 11.09.2020 o 15:54, Michael Tretter pisze:
>>> Platform drivers need to be aware if a mipi dsi device attaches or
>>> detaches. Add host_ops to the driver_data for attach and detach
>>> callbacks and move the i80 mode selection and the hotplug handling into
>>> the callback, because these depend on the drm driver.
>>>
>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>> ---
>>> v2:
>>> - new patch
>>> ---
>>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 64 ++++++++++++++++++++-----
>>>    1 file changed, 53 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> index 1a15ae71205d..684a2fbef08a 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> @@ -239,6 +239,12 @@ struct exynos_dsi_transfer {
>>>    #define DSIM_STATE_CMD_LPM		BIT(2)
>>>    #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
>>>    
>>> +struct exynos_dsi;
>>> +struct exynos_dsi_host_ops {
>>> +	int (*attach)(struct device *dev, struct mipi_dsi_device *device);
>>> +	int (*detach)(struct device *dev, struct mipi_dsi_device *device);
>>> +};
>>> +
>>>    enum exynos_reg_offset {
>>>    	EXYNOS_REG_OFS,
>>>    	EXYNOS5433_REG_OFS
>>> @@ -254,6 +260,7 @@ struct exynos_dsi_driver_data {
>>>    	unsigned int wait_for_reset;
>>>    	unsigned int num_bits_resol;
>>>    	const unsigned int *reg_values;
>>> +	const struct exynos_dsi_host_ops *host_ops;
>>>    };
>>>    
>>>    struct exynos_dsi {
>>> @@ -467,6 +474,41 @@ static const unsigned int exynos5433_reg_values[] = {
>>>    	[PHYTIMING_HS_TRAIL] = 0x0c,
>>>    };
>>>    
>>> +static int __exynos_dsi_host_attach(struct device *dev,
>>> +				    struct mipi_dsi_device *device)
>>> +{
>>> +	struct exynos_dsi *dsi = dev_get_drvdata(dev);
>>> +	struct drm_device *drm = dsi->encoder.dev;
>>
>> As I wrote yesterday drm device was guaranteed to be present here only
>> if mipi dsi host registration was performed in component bind. In case
>> it is performed in probe it will be always NULL, and the code does not
>> make sense.
> Correct, but if the driver is used as a drm bridge, there won't be an encoder
> until bridge_attach. Mipi dsi devices defer their probe until the mipi dsi
> host is available. If I move the mipi dsi host registration into
> bridge_attach, the driver does not know if the next device is another bridge
> or a panel during bridge_attach, but the driver cannot successfully return
> from bridge_attach, because then the drm driver expects a connector.


Hmm, I am not sure why do you think driver expects connector on return 
of briddge_attach.


>
> I guess that the encoder should be initialized before registering the mipi dsi
> host during probe instead of bind.


But you should have already drm dev on encoder init which in probe is 
unavailable.



> The probe won't be rolled back on
> PROBE_DEFER during bind and the encoder will be available in host_attach.
> When splitting the driver into the exynos platform specific code and the more
> generic code, there won't be an encoder during host_attach in the generic
> code, but the host_ops callback could (and will) use the platform specific
> encoder, which is available before bridge_attach.
>
> Does this make sense to you?


Nope :) But maybe I am missing sth.

Generally I see two ways (which I have already described in different 
e-mail, in different words):

A. Static - we wait for every part of display stack to be probed, then 
create drm_dev - typical approach, but slow (deferred probe causes late 
drm creation), and racy - only(?) component framework and DSI bus have 
possibility to signal driver unbind, so we can react on it properly.

B. Dynamic - drm framework requires only crtcs and encoders to be 
attached to drm on init, connectors, and hidden parts (drm_bridges, 
drm_panels) can be created/destroyed and attached/detached at any time 
(almost), so lets take advantage of it - create drm_dev ASAP and attach 
other parts when they become available, the only issue is that there is 
no generic way to be notified when given parts becomes available - in 
interesting area only mipi devices have such notifications via attach 
callbacks.


So either we convert exynos_dsi to A either we continue B approach. In 
second case we should assure mipi_dsi host is created if drm_dev is 
available.


Regards

Andrzej



>
> Michael
>
>>
>> Regards
>>
>> Andrzej
>>
>>
>>
>>> +	struct exynos_drm_crtc *crtc;
>>> +
>>> +	mutex_lock(&drm->mode_config.mutex);
>>> +	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
>>> +	crtc->i80_mode = !(device->mode_flags & MIPI_DSI_MODE_VIDEO);
>>> +	mutex_unlock(&drm->mode_config.mutex);
>>> +
>>> +	if (drm->mode_config.poll_enabled)
>>> +		drm_kms_helper_hotplug_event(drm);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int __exynos_dsi_host_detach(struct device *dev,
>>> +				     struct mipi_dsi_device *device)
>>> +{
>>> +	struct exynos_dsi *dsi = dev_get_drvdata(dev);
>>> +	struct drm_device *drm = dsi->encoder.dev;
>>> +
>>> +	if (drm->mode_config.poll_enabled)
>>> +		drm_kms_helper_hotplug_event(drm);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct exynos_dsi_host_ops exynos_dsi_host_ops = {
>>> +	.attach = __exynos_dsi_host_attach,
>>> +	.detach = __exynos_dsi_host_detach,
>>> +};
>>> +
>>>    static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
>>>    	.reg_ofs = EXYNOS_REG_OFS,
>>>    	.plltmr_reg = 0x50,
>>> @@ -477,6 +519,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
>>>    	.wait_for_reset = 1,
>>>    	.num_bits_resol = 11,
>>>    	.reg_values = reg_values,
>>> +	.host_ops = &exynos_dsi_host_ops,
>>>    };
>>>    
>>>    static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>>> @@ -489,6 +532,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>>>    	.wait_for_reset = 1,
>>>    	.num_bits_resol = 11,
>>>    	.reg_values = reg_values,
>>> +	.host_ops = &exynos_dsi_host_ops,
>>>    };
>>>    
>>>    static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>>> @@ -499,6 +543,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>>>    	.wait_for_reset = 1,
>>>    	.num_bits_resol = 11,
>>>    	.reg_values = reg_values,
>>> +	.host_ops = &exynos_dsi_host_ops,
>>>    };
>>>    
>>>    static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
>>> @@ -510,6 +555,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
>>>    	.wait_for_reset = 0,
>>>    	.num_bits_resol = 12,
>>>    	.reg_values = exynos5433_reg_values,
>>> +	.host_ops = &exynos_dsi_host_ops,
>>>    };
>>>    
>>>    static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
>>> @@ -521,6 +567,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
>>>    	.wait_for_reset = 1,
>>>    	.num_bits_resol = 12,
>>>    	.reg_values = exynos5422_reg_values,
>>> +	.host_ops = &exynos_dsi_host_ops,
>>>    };
>>>    
>>>    static const struct of_device_id exynos_dsi_of_match[] = {
>>> @@ -1551,8 +1598,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>    				  struct mipi_dsi_device *device)
>>>    {
>>>    	struct exynos_dsi *dsi = host_to_dsi(host);
>>> +	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
>>>    	struct drm_encoder *encoder = &dsi->encoder;
>>> -	struct drm_device *drm = encoder->dev;
>>>    	struct drm_bridge *out_bridge;
>>>    
>>>    	out_bridge  = of_drm_find_bridge(device->dev.of_node);
>>> @@ -1590,18 +1637,12 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>    			return ret;
>>>    	}
>>>    
>>> -	mutex_lock(&drm->mode_config.mutex);
>>> -
>>>    	dsi->lanes = device->lanes;
>>>    	dsi->format = device->format;
>>>    	dsi->mode_flags = device->mode_flags;
>>> -	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
>>> -			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
>>>    
>>> -	mutex_unlock(&drm->mode_config.mutex);
>>> -
>>> -	if (drm->mode_config.poll_enabled)
>>> -		drm_kms_helper_hotplug_event(drm);
>>> +	if (ops && ops->attach)
>>> +		ops->attach(dsi->dsi_host.dev, device);
>>>    
>>>    	return 0;
>>>    }
>>> @@ -1610,6 +1651,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>>>    				  struct mipi_dsi_device *device)
>>>    {
>>>    	struct exynos_dsi *dsi = host_to_dsi(host);
>>> +	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
>>>    	struct drm_device *drm = dsi->encoder.dev;
>>>    
>>>    	if (dsi->panel) {
>>> @@ -1625,8 +1667,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>>>    		INIT_LIST_HEAD(&dsi->bridge_chain);
>>>    	}
>>>    
>>> -	if (drm->mode_config.poll_enabled)
>>> -		drm_kms_helper_hotplug_event(drm);
>>> +	if (ops && ops->detach)
>>> +		ops->detach(dsi->dsi_host.dev, device);
>>>    
>>>    	exynos_dsi_unregister_te_irq(dsi);
>>>    
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/v1/url?k=80c78954-dd15920c-80c6021b-0cc47a31c8b4-c39fad41cb70b194&q=1&e=b51d6682-ba72-48c0-b0c9-013866ba39ab&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
