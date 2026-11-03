Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731486;
	b=oCUnSuw2o6iCjbc4T9uLD9jAGbYERH7Gj9SovObarUQPihf27Jr/6daM4ws9hLocV2tn
	 SBECCdVK+bNpFbMLWp+ZVy8iJh8I/utHNEwOSU/C6BRDjzW+2nhMdL/i+FjJAIYnnnkjf
	 jm5RC1+F6xvKz2gAT8IMSUiVOBxwldacoRncUkIndve/G9irqtq5aouS00VnumNuY7DZH
	 86J4yC9RYxdwcXP2ujJubjwl9k0lZEdTytYDDeVeSdqFBnC1BbZHOMmS5eDvvaBRNHAeq
	 W032AVbo0sRrpER/+qGUvME+5EVegEILH2ff/Vy/CGFLI6B9O8OiMUi6waOJ1lMORng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731486;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=W6/JYFIS2gBbrryXL8wBsd9TWGVGmS+61AzczLDlVL8=;
	b=UAjT/LssHHKplgloW+IT3zX/Exrfipmc3IvMHHmcfCkgOVs95c8/m2ZImCpQbsD/ABvd
	 x2G6KOkC+CkY9fb5J+qrqPPqES72SHQS29ep6tFVA/hE1RABA6cQfhFIcHew9kpMvePLi
	 XMzdWS9vXtvZEP/FFApRa60nYi+ui/kJF6Eo/ihZh5w8+w0AKRcB1KzRGLARTQ1o1AioG
	 q1yIVk37efuZhWQ6rd6EgDPZr6+hjRV2uRPvA/taAAk9XPV8IFWNHzHXb6hPRI84A5vNc
	 G1oSLj2mi27mL8tLV49t+/8S2hYS2DUoBhGfXEW49iCZnaZUYeJe7OAZurCGLW6df/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="Bx4jN+/C";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6C606A32F
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2026 18:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B6C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Bx4jN+/C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=W6/J
	YFIS2gBbrryXL8wBsd9TWGVGmS+61AzczLDlVL8=; b=Bx4jN+/CUlNIFrFEfcZT
	DWnp8D3KgQ3RUAi57jaWHne3umwEazqItZQTPk90jcrkdqvvhubVubpT5CCmNEfB
	/g+w2DyTRdx1uo22fhbin0kux9Y9nu8VuHWZqX+a31npXbTs3OfVVmVnJi5o97lI
	3cpudOMSylHj4AcWjU71IcIr+OL4GFnE1e72JJgFfMSTdKQ3jTL5Qwp9+KgvUy98
	Vrughpyl3hyO1Y88CTAL/ng8Mz4lzYKHQi99Rat4dkK7EQx7ZMusfrnEfipTR9lZ
	PIIjBVDl7Zwwkfvv018HuF4t98uVkT44kwuLhDn7IY0jseMG18KhPTggId27cesU
	mA==
Received: (qmail 389850 invoked from network); 3 Nov 2026 19:44:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2026 19:44:34 +0100
X-UD-Smtp-Session: l3s3148p1@KfVXp2NfZqnAwtcC
Date: Tue, 3 Nov 2026 20:44:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alison Wang <alison.wang@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Ondrej Jirman <megi@xff.cz>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Igor Reznichenko <igor@reznichenko.net>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
	Purism Kernel Team <kernel@puri.sm>,
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
	Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Junjie Cao <junjie.cao@linux.dev>,
	Ryan Brue <ryanbrue.dev@gmail.com>,
	Nickolay Goppen <setotau@mainlining.org>,
	Stefan Mavrodiev <stefan@olimex.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Markuss Broks <markuss.broks@gmail.com>,
	Artur Weber <aweber.kernel@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Yedaya Katsman <yedaya.ka@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 08/35] drm: rz-du: use devm_drm_panel_bridge_add()
Message-ID: <auorkq3_lHY-rc1D@shikoro>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-8-5e3070a3478f@oss.qualcomm.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-drm-panel-funcs-v1-8-5e3070a3478f@oss.qualcomm.com>

On Mon, Oct 26, 2026 at 01:09:57PM +0200, Dmitry Baryshkov wrote:
> The connector type passed to devm_drm_panel_bridge_add_typed() has been
> ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
> every drm_panel"), the bridge always has the type of the panel.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

