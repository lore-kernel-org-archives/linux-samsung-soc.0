Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7906531282E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Dec 2025 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179487; cv=none; b=lPuhVGPp9DF3NgMsDbnXliYK9nGg/cOH58JR/TRD7viu1Ro0RXLFKWYyf2k3cbXcms3XCC9QPk41NF277kLCw1+V1rvtYoMVGYXMptHD+RfUQ+fUwBiKtDQHZ30uytdbWYDnHr8Fa9w5EiVzKnVEwYjeR9UCu7exFJE+7zcbdAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179487; c=relaxed/simple;
	bh=MMWC0dLFr7ImsLLBrwRfsSXbM89kIqiNvA29IB0yasY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=d5H4ggDxDQB+nxu1fzMxLqZ36GdHk2N/d02O2pdv/QSY2raVYDG3cwl+uCOqpYkh4lXyQJHKZ/FodNID1Et9IKmI/WKvN4mLxb1K+pvSWdDXzQ/V3tlqn+xUGZLlewLTq2nlfLEoUpwUI8l7jrDn4D9uWVf8oRVfoye70esRneg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SV1z9pfV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SV1z9pfV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 838ACC1AE22;
	Wed, 31 Dec 2025 11:10:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E455C60744;
	Wed, 31 Dec 2025 11:11:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23832113B0764;
	Wed, 31 Dec 2025 12:11:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767179480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=55XhYgANfix4/exU+jGGVTiGXqeuZF3yQcF00ZiG0dM=;
	b=SV1z9pfVtcvrATQfVDliiBBq97NU2utS5KLqyYqYIEj6QCeA4MJLMV0/aD0g5Kgy2ee3tw
	veAPFFUoIjkP14Qn16fce692SQjf3ADHMll9fqtbkPG3bp6oQWbpgBpvzE+wWPpZgT+pXV
	eYO2QQC1jxOxq44S19F4xyBKx0SCOpxb5zQ/ly1kI4hEIm4pb7Sh+yOhXln3rGW02DunPj
	EJQlHqWuVLbsLvvlhtnaoHXIERp1gRaD4S6ql/3Yjzy47tbZM/cCNTPWXT5qCEu53eNF1P
	AAve6YLAB9fWQWUp/Yu9yIzJrpJV1l1SZdgRcIuzp8Ez1v7p1prS1R34TIwyLw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 12:11:08 +0100
Message-Id: <DFCCU8AN0GZQ.2CYTKKV40JYLI@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 04/18] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.next_bridge
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-5-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-5-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> In order to move the panel/bridge parsing and attachmenet to the
> Analogix side, add component struct drm_bridge *next_bridge to
> platform data struct analogix_dp_plat_data.
>
> The movement makes sense because the panel/bridge should logically
> be positioned behind the Analogix bridge in the display pipeline.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> ---
>
> Changes in v4:
> - Rename the &analogix_dp_plat_data.bridge to
>   &analogix_dp_plat_data.next_bridge
> ---
>  include/drm/bridge/analogix_dp.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index cf17646c1310..582357c20640 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype=
 type)
>  struct analogix_dp_plat_data {
>  	enum analogix_dp_devtype dev_type;
>  	struct drm_panel *panel;
> +	struct drm_bridge *next_bridge;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	bool skip_connector;

It took a while to understand why you are adding the next_bridge pointer in
struct analogix_dp_plat_data instead of struct analogix_dp_device, where it
would be more natural. I found an answer in patch 16: with current code you
need to place next_bridge in struct analogix_dp_plat_data because it is
used by user drivers to attach, and those drivers have no access to struct
analogix_dp_device. However patch 16 (which looks a very good cleanup BTW)
next_bridge can be moved to struct analogix_dp_device.

So I'd suggest to move patch 16 before this one if it easily doable, so
that you can introduce next_bridge in struct analogix_dp_device from the
beginning. Should that be impossible, you can send a separate patch to move
next_bridge, after patch 16.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
