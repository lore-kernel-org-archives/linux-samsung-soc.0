Return-Path: <SRS0=Ewlv=DH=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38F9C4727E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Sep 2020 10:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BCBC2075F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Sep 2020 10:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pmQqwuwj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgI3KNU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 30 Sep 2020 06:13:20 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55672 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729196AbgI3KNT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Sep 2020 06:13:19 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200930101317euoutp01f7d8548624325a5ef9ca8b0187d5d0a3~5iBxHMNSw0047600476euoutp01U
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2020 10:13:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200930101317euoutp01f7d8548624325a5ef9ca8b0187d5d0a3~5iBxHMNSw0047600476euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601460797;
        bh=xlcTeN7sHMv0mi2gQWyF7GRcz7cX8CxoUiNws2AIMKI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=pmQqwuwjrBa3DneE/KrkS4hvd8wwrQUO3LWKw3TwxYxaUrJv3Wvux0X5S9//VFsOZ
         JE7FbBfRuzfT7NxweI3GwXH3ELVm7Yj0a5LO7K9mRg6Z/VIWSEfmpNROV8EpWmZCbw
         lmC40TSrv+JllRZTjvpg2xMGIinTLbBNHfqwPfoA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200930101317eucas1p108863281bf0081dd94a07c526adbd7af~5iBwu2uXq0745707457eucas1p1A;
        Wed, 30 Sep 2020 10:13:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E4.D6.05997.C3A547F5; Wed, 30
        Sep 2020 11:13:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200930101316eucas1p10827c5ef274452417e612c6b418c5721~5iBwT5VbK0067100671eucas1p1D;
        Wed, 30 Sep 2020 10:13:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200930101316eusmtrp17a3f677b6d07bee0229e678006889799~5iBwTQXoX0946809468eusmtrp16;
        Wed, 30 Sep 2020 10:13:16 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-bf-5f745a3c03a5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E9.25.06017.C3A547F5; Wed, 30
        Sep 2020 11:13:16 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200930101315eusmtip230e4fdf64ef66cf45ad28fed57319abe~5iBvpWz0J0179701797eusmtip2r;
        Wed, 30 Sep 2020 10:13:15 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: tc358764: restore connector support
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <1f62b659-4534-c4de-28c1-07043b6468a7@samsung.com>
Date:   Wed, 30 Sep 2020 12:13:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0)
        Gecko/20100101 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200924083145.23312-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87q2USXxBvfamCyufH3PZnH1+0tm
        i5NvrrJYdE5cwm5xedccNosZ5/cxWaw9cpfd4lBftAOHx/sbrewesztmsnqcmHCJyeN+93Em
        j74tqxg9DvROZvH4vEkugD2KyyYlNSezLLVI3y6BK2PPleusBd1WFW/nfmNuYFys38XIySEh
        YCKxYmYLaxcjF4eQwApGiZ6dT9ghnC+MEtNXfWMFqRIS+Mwo8XZLGUzHxcUr2CCKljNK9J7/
        DdXxnlFi2aplLF2MHBzCAi4SnSfZQRpEBEol5v4/BlbDLHCRUeLG+0eMIAk2AU2Jv5tvsoHY
        vAJ2Es9nfgSzWQRUJdpaTjGB2KICCRJ7Hp1jhagRlDg58wkLiM0JVD9/61qwOcwC8hLNW2cz
        Q9jiEk1fVrJCXHqMXWLTUXeQeySA7pm+gwsiLCzx6vgWdghbRuL05B4WCLte4v6KFmaQOyUE
        Ohgltm7YyQyRsJa4c+4XG8gcZqCb1++CBp2jxOuN7cwQ4/kkbrwVhLiAT2LStulQYV6JjjYh
        iGpFiftnt0INFJdYeuEr2wRGpVlI/pqF5JdZSH6ZhbB3ASPLKkbx1NLi3PTUYqO81HK94sTc
        4tK8dL3k/NxNjMDUdPrf8S87GHf9STrEKMDBqMTDmyBRHC/EmlhWXJl7iFGCg1lJhNfp7Ok4
        Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhhZRDk0z23w
        /vvl8aSM7Mx29+q7W3SN9lxv9+fZ2iLutExqQ0gPx6T/Z/Ja/y+bZH/0TL9qj/P+i6kWWlLq
        PD/d3t56/FvqQeTNE2bOraFRz0t9jcXF807lfNs6eeeJaEYfq4XTmlhclKV6dv65tpkn9t0e
        TWmzEPabIfuD6tr+R2X88w0491KJpTgj0VCLuag4EQCNl06XSQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7o2USXxBo0XlS2ufH3PZnH1+0tm
        i5NvrrJYdE5cwm5xedccNosZ5/cxWaw9cpfd4lBftAOHx/sbrewesztmsnqcmHCJyeN+93Em
        j74tqxg9DvROZvH4vEkugD1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnf
        ziYlNSezLLVI3y5BL2PPleusBd1WFW/nfmNuYFys38XIySEhYCJxcfEKti5GLg4hgaWMEmuu
        LWaFSIhL7J7/lhnCFpb4c60Lqugto8T8/ReAijg4hAVcJDpPsoPUiAiUSrzqv88IUsMscJFR
        4s+pBqiGiYwSEy/cYwKpYhPQlPi7+SYbiM0rYCfxfOZHMJtFQFWireUUWI2oQILEwy+XmSFq
        BCVOznzCAmJzAtXP37qWEcRmFjCT6NraBWXLSzRvnc0MYYtLNH1ZyTqBUWgWkvZZSFpmIWmZ
        haRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMCY3Hbs55YdjF3vgg8xCnAwKvHwJkgU
        xwuxJpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OB6SKvJN7Q
        1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVANj4r9dV1al7r6TOI3R4W9D
        xMoVS4ozZs9+GyZ2VcVxQeZ9q+InYtLaxTP89338+tbXmG++vFvVlnUTtFO6UiwnKip0P3fr
        33NpO1Og0lRZY7OuVXNtZP8u2uRQJK89vzylaqXVqzWvYlRX7FsV+3SKzy2/yervF68ozPip
        +39bf4PfdvPN/9J/KrEUZyQaajEXFScCADq5lJ3fAgAA
X-CMS-MailID: 20200930101316eucas1p10827c5ef274452417e612c6b418c5721
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200924083156eucas1p14406128445a655393013effe719f2228
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200924083156eucas1p14406128445a655393013effe719f2228
References: <CGME20200924083156eucas1p14406128445a655393013effe719f2228@eucas1p1.samsung.com>
        <20200924083145.23312-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


W dniu 24.09.2020 o 10:31, Marek Szyprowski pisze:
> This patch restores DRM connector registration in the TC358764 bridge
> driver and restores usage of the old drm_panel_* API, thus allows dynamic
> panel registration. This fixes panel operation on Exynos5250-based
> Arndale board.
>
> This is equivalent to the revert of the following commits:
> 1644127f83bc "drm/bridge: tc358764: add drm_panel_bridge support"
> 385ca38da29c "drm/bridge: tc358764: drop drm_connector_(un)register"
> and removal of the calls to drm_panel_attach()/drm_panel_detach(), which
> were no-ops and has been removed in meanwhile.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
> ---
> As I've reported and Andrzej Hajda pointed, the reverted patches break
> operation of the panel on the Arndale board. Noone suggested how to fix
> the regression, I've decided to send a revert until a new solution is
> found.
>
> The issues with tc358764 might be automatically resolved once the Exynos
> DSI itself is converted to DRM bridge:
> https://patchwork.kernel.org/cover/11770683/
> but that approach has also its own issues so far.
>
> Best regards,
> Marek Szyprowski
> ---
>   drivers/gpu/drm/bridge/tc358764.c | 107 +++++++++++++++++++++++++-----
>   1 file changed, 92 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index d89394bc5aa4..c1e35bdf9232 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -153,9 +153,10 @@ static const char * const tc358764_supplies[] = {
>   struct tc358764 {
>   	struct device *dev;
>   	struct drm_bridge bridge;
> +	struct drm_connector connector;
>   	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
>   	struct gpio_desc *gpio_reset;
> -	struct drm_bridge *panel_bridge;
> +	struct drm_panel *panel;
>   	int error;
>   };
>   
> @@ -209,6 +210,12 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
>   	return container_of(bridge, struct tc358764, bridge);
>   }
>   
> +static inline
> +struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct tc358764, connector);
> +}
> +
>   static int tc358764_init(struct tc358764 *ctx)
>   {
>   	u32 v = 0;
> @@ -271,11 +278,43 @@ static void tc358764_reset(struct tc358764 *ctx)
>   	usleep_range(1000, 2000);
>   }
>   
> +static int tc358764_get_modes(struct drm_connector *connector)
> +{
> +	struct tc358764 *ctx = connector_to_tc358764(connector);
> +
> +	return drm_panel_get_modes(ctx->panel, connector);
> +}
> +
> +static const
> +struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
> +	.get_modes = tc358764_get_modes,
> +};
> +
> +static const struct drm_connector_funcs tc358764_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static void tc358764_disable(struct drm_bridge *bridge)
> +{
> +	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> +	int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
> +
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
> +}
> +
>   static void tc358764_post_disable(struct drm_bridge *bridge)
>   {
>   	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>   	int ret;
>   
> +	ret = drm_panel_unprepare(ctx->panel);
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
>   	tc358764_reset(ctx);
>   	usleep_range(10000, 15000);
>   	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> @@ -296,28 +335,71 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
>   	ret = tc358764_init(ctx);
>   	if (ret < 0)
>   		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
> +	ret = drm_panel_prepare(ctx->panel);
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
> +}
> +
> +static void tc358764_enable(struct drm_bridge *bridge)
> +{
> +	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> +	int ret = drm_panel_enable(ctx->panel);
> +
> +	if (ret < 0)
> +		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
>   }
>   
>   static int tc358764_attach(struct drm_bridge *bridge,
>   			   enum drm_bridge_attach_flags flags)
> +{
> +	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> +	struct drm_device *drm = bridge->dev;
> +	int ret;
> +
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		DRM_ERROR("Fix bridge driver to make connector optional!");
> +		return -EINVAL;
> +	}
> +
> +	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +	ret = drm_connector_init(drm, &ctx->connector,
> +				 &tc358764_connector_funcs,
> +				 DRM_MODE_CONNECTOR_LVDS);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize connector\n");
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(&ctx->connector,
> +				 &tc358764_connector_helper_funcs);
> +	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> +	ctx->connector.funcs->reset(&ctx->connector);
> +	drm_connector_register(&ctx->connector);
> +
> +	return 0;
> +}
> +
> +static void tc358764_detach(struct drm_bridge *bridge)
>   {
>   	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>   
> -	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
> -				 bridge, flags);
> +	drm_connector_unregister(&ctx->connector);
> +	ctx->panel = NULL;
> +	drm_connector_put(&ctx->connector);
>   }
>   
>   static const struct drm_bridge_funcs tc358764_bridge_funcs = {
> +	.disable = tc358764_disable,
>   	.post_disable = tc358764_post_disable,
> +	.enable = tc358764_enable,
>   	.pre_enable = tc358764_pre_enable,
>   	.attach = tc358764_attach,
> +	.detach = tc358764_detach,
>   };
>   
>   static int tc358764_parse_dt(struct tc358764 *ctx)
>   {
> -	struct drm_bridge *panel_bridge;
>   	struct device *dev = ctx->dev;
> -	struct drm_panel *panel;
>   	int ret;
>   
>   	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> @@ -326,16 +408,12 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
>   		return PTR_ERR(ctx->gpio_reset);
>   	}
>   
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> -	if (ret)
> -		return ret;
> -
> -	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(panel_bridge))
> -		return PTR_ERR(panel_bridge);
> +	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
> +					  NULL);
> +	if (ret && ret != -EPROBE_DEFER)
> +		dev_err(dev, "cannot find panel (%d)\n", ret);
>   
> -	ctx->panel_bridge = panel_bridge;
> -	return 0;
> +	return ret;
>   }
>   
>   static int tc358764_configure_regulators(struct tc358764 *ctx)
> @@ -381,7 +459,6 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
>   		return ret;
>   
>   	ctx->bridge.funcs = &tc358764_bridge_funcs;
> -	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
>   	ctx->bridge.of_node = dev->of_node;
>   
>   	drm_bridge_add(&ctx->bridge);
