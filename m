Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A81F4188
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Aug 2025 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754035755; cv=none; b=TYI+wHJhjbRHiBPwhsLMtTci1eAlCHmBe57fxwAOWHxF+uq4stRdgRLDcImdxymhOjNk4lHEhydNu/DKbDqgogySq6yZwzMEa5cPvsbwegcnhUrEDdf1mc8LcEHzAwbF9ee1e+71aJoWL80Vly8VVqb5ktgHcAKVHnFUP66f9wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754035755; c=relaxed/simple;
	bh=/3i3DwM1bviXpyEPkFsjOrji/Ip10FKup5lf7SmA00c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=FcTebR166IF27GgrZ1yG353JOgFM5+IZ3O/8LXF+7xE8II81VVEEq5aDhYRYh14TB82yQcU28IP4IQIY/vX1IMeoqF5YBdGygnwdWYZ27RJEP0kPMawX3TU8VsL82u6lmH7Gq5Jfc+Vs26oTWROGEYjytIN7bQkFTE5Js/LkgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dq/pAQli; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dq/pAQli"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250801080911euoutp011eb4c67d14e4830926dce37fc7476efe~Xljjznr722835028350euoutp01K
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Aug 2025 08:09:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250801080911euoutp011eb4c67d14e4830926dce37fc7476efe~Xljjznr722835028350euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754035751;
	bh=CaJcHDOzA+hHb813p+ST06ip6E2jd61Wwl3CegxVDz0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dq/pAQli6fe9CHyiKBzxAJs1iM686tOBH7/IGHyWQL9Gid4h4lWWxgBUDN8F2chS/
	 CJRVFXrFNZLY3NgjsICaAVgZJRbeOp885OvWj8PaBj++rGgGWXhzidXI9byS/HPM8D
	 DfzY6JwjlFVfIfMYdOEFKKx3T9CFJ/U5PGC5+kxQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250801080910eucas1p2f1df164c31b5305c464b91776ba8926c~Xljjaj_TE2448524485eucas1p2F;
	Fri,  1 Aug 2025 08:09:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250801080909eusmtip2d720f947cde20ca6d7882022ec00adc3~Xljh720iC2775327753eusmtip2Z;
	Fri,  1 Aug 2025 08:09:09 +0000 (GMT)
Message-ID: <ef676bc4-a4e8-45d8-9db7-5f9843241d0c@samsung.com>
Date: Fri, 1 Aug 2025 10:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
To: Henrik Grimler <henrik@grimler.se>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677@grimler.se>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250801080910eucas1p2f1df164c31b5305c464b91776ba8926c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250721094425eucas1p2a427e209cd0f1933118b2046c01e1c3f
X-EPHeader: CA
X-CMS-RootMailID: 20250721094425eucas1p2a427e209cd0f1933118b2046c01e1c3f
References: <20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se>
	<CGME20250721094425eucas1p2a427e209cd0f1933118b2046c01e1c3f@eucas1p2.samsung.com>
	<20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677@grimler.se>

On 21.07.2025 11:43, Henrik Grimler wrote:
> To use MHL we currently need the MHL chip to be permanently on, which
> consumes unnecessary power. Let's use extcon attached to MUIC to enable
> the MHL chip only if it detects an MHL cable.
>
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---

Thanks!

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

You should also add "select EXTCON" (like in case of Sii8620) to Kconfig 
to avoid potential build break if extcon support is built as a module.


>   drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 86 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 0e0bb1bf71fdcef788715cfd6fa158a6992def33..4d84ba01ea76816bebdbc29d48a041c9c6cd508e 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -19,6 +19,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/err.h>
> +#include <linux/extcon.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
> @@ -26,6 +27,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/of_graph.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
>   
> @@ -170,8 +172,12 @@ struct sii9234 {
>   	struct drm_bridge bridge;
>   	struct device *dev;
>   	struct gpio_desc *gpio_reset;
> -	int i2c_error;
>   	struct regulator_bulk_data supplies[4];
> +	struct extcon_dev *extcon;
> +	struct notifier_block extcon_nb;
> +	struct work_struct extcon_wq;
> +	int cable_state;
> +	int i2c_error;
>   
>   	struct mutex lock; /* Protects fields below and device registers */
>   	enum sii9234_state state;
> @@ -864,6 +870,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>   	return 0;
>   }
>   
> +static void sii9234_extcon_work(struct work_struct *work)
> +{
> +	struct sii9234 *ctx =
> +		container_of(work, struct sii9234, extcon_wq);
> +	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
> +
> +	if (state == ctx->cable_state)
> +		return;
> +
> +	ctx->cable_state = state;
> +
> +	if (state > 0)
> +		sii9234_cable_in(ctx);
> +	else
> +		sii9234_cable_out(ctx);
> +}
> +
> +static int sii9234_extcon_notifier(struct notifier_block *self,
> +			unsigned long event, void *ptr)
> +{
> +	struct sii9234 *ctx =
> +		container_of(self, struct sii9234, extcon_nb);
> +
> +	schedule_work(&ctx->extcon_wq);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int sii9234_extcon_init(struct sii9234 *ctx)
> +{
> +	struct extcon_dev *edev;
> +	struct device_node *musb, *muic;
> +	int ret;
> +
> +	/* Get micro-USB connector node */
> +	musb = of_graph_get_remote_node(ctx->dev->of_node, 1, -1);
> +	/* Then get micro-USB Interface Controller node */
> +	muic = of_get_next_parent(musb);
> +
> +	if (!muic) {
> +		dev_info(ctx->dev,
> +			 "no extcon found, switching to 'always on' mode\n");
> +		return 0;
> +	}
> +
> +	edev = extcon_find_edev_by_node(muic);
> +	of_node_put(muic);
> +	if (IS_ERR(edev)) {
> +		dev_err_probe(ctx->dev, PTR_ERR(edev),
> +			      "invalid or missing extcon\n");
> +	}
> +
> +	ctx->extcon = edev;
> +	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
> +	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
> +	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
> +	if (ret) {
> +		dev_err(ctx->dev, "failed to register notifier for MHL\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
>   					 const struct drm_display_info *info,
>   					 const struct drm_display_mode *mode)
> @@ -916,12 +986,17 @@ static int sii9234_probe(struct i2c_client *client)
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = sii9234_extcon_init(ctx);
> +	if (ret < 0)
> +		return ret;
> +
>   	i2c_set_clientdata(client, ctx);
>   
>   	ctx->bridge.of_node = dev->of_node;
>   	drm_bridge_add(&ctx->bridge);
>   
> -	sii9234_cable_in(ctx);
> +	if (!ctx->extcon)
> +		sii9234_cable_in(ctx);
>   
>   	return 0;
>   }
> @@ -930,7 +1005,15 @@ static void sii9234_remove(struct i2c_client *client)
>   {
>   	struct sii9234 *ctx = i2c_get_clientdata(client);
>   
> -	sii9234_cable_out(ctx);
> +	if (ctx->extcon) {
> +		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
> +					   &ctx->extcon_nb);
> +		flush_work(&ctx->extcon_wq);
> +		if (ctx->cable_state > 0)
> +			sii9234_cable_out(ctx);
> +	} else {
> +		sii9234_cable_out(ctx);
> +	}
>   	drm_bridge_remove(&ctx->bridge);
>   }
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

