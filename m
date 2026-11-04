Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812502;
	b=2zPfikstgASxO1Le6Tg5BzYFWdg2xZW/SFEu79x4xXq/bkWHuOSixEWd8hlc5QeEmpAz
	 t5Qu98jVzhzivXCQtw8A7iiYt3upNLac91LBV+EVrfK6N/LWfMNReSBJ8ZI0+vXMIMlAr
	 T5rZYrmkGBR3drM8Zq9ItV6+2MmmAGou5xmoyplkakKfGpZTGW2P9FtVpSBjrcXpX9F1z
	 CJXjY5kiBSUVZVGUYVQ9q1rv+3JPGjMHBzqQ6YNs/Q/UeJLxaiuhQK2FSlaL1WmbLWNRk
	 LIw0VjyaAeKR9wo6UnGcpSTcvh95jYJ/ZPabVHukOh9lF3ui6VswiID0jRSDGD/5CnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812502;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=e0mH8Uvvp1KhH4B0DvL/07BtsFGhDQCfwMueXbsaUKE=;
	b=2gri/iE5HS7vAaCmXRVOYc07uNzHQKgoGnzK8cNhFBBkGE4YCA9CNLvXje7ZW8hWiCKn
	 NIXp2bOq0eRWG/SH0+Y/1gnjqMpBh24bG8czk4jzBR4ckn6lH4SUp89e2XY1NO47DbTxm
	 8jAhFmH455FFxgIhn+QpAKXg8eN3ubXe6Enq+7rkstQTwjuDKWK0gkRHb5DxeOL5Grjs1
	 +NhleXr5nhah5vXojIGLpyzS8K/pkJ5ER1dKcfPQ8wU97G0jfizRBQ9YoQb3IjjnMyAhw
	 QPqrMsSOO7kaAB0s/IIAyZTfvEqMA232RyW8sD1dEErW32fTVZ5y8aanqQ/jXbh+OhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xh+BIRuK;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169D606A32C;
	Wed,  4 Nov 2026 17:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D169D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xh+BIRuK
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3274D1A1455;
	Wed,  4 Nov 2026 17:14:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E20B260772;
	Wed,  4 Nov 2026 17:14:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DD1010329206;
	Wed,  4 Nov 2026 18:14:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793812488; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e0mH8Uvvp1KhH4B0DvL/07BtsFGhDQCfwMueXbsaUKE=;
	b=xh+BIRuKGpdtkDNLcgikfHinfWANO1z+IcUf6KOQmmm6nLiq4T+9VcqbwklXmm8989SILi
	5RyAu+7NA3jwH0J3EdFZEP5ehJqCBdrvYXzxvvRlNF5v9h9qjTAf2PhXThDGBguYOF4wdN
	lLj7wyH0fjbSSDT4Tkj3bUh1KTyBdK2ASKx6kiZbP3DaQkxZ4zPneJDOQGL5kEycC6URPs
	hBKDGU/v318Ig8grBq81dMmBmTLeqnM379TsH+ikY7G0PZwjyaaikbTeeA4PRC2GftHKOh
	KJjy3TueEHT66xyf7spqWBgQ956dmusKVr/oGs/z3LpP4nj7u1fEvUi0+GtBhg==
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 18:14:19 +0100
Message-Id: <DMMLG3KHSTM3.1EATLVDX1MK66@bootlin.com>
Cc: "Douglas Anderson" <dianders@chromium.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Marek Vasut" <marex@denx.de>, "Stefan
 Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Laurent
 Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Linus Walleij" <linusw@kernel.org>,
 "Sandy Huang" <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, "Andy Yan" <andy.yan@rock-chips.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Alison Wang" <alison.wang@nxp.com>, "Paul Kocialkowski"
 <paulk@sys-base.io>, "Yannick Fertre" <yannick.fertre@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Philippe Cornu"
 <philippe.cornu@foss.st.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Ondrej Jirman" <megi@xff.cz>, "Javier
 Martinez Canillas" <javierm@redhat.com>, "Igor Reznichenko"
 <igor@reznichenko.net>, "Michael Walle" <mwalle@kernel.org>, "Dario
 Binacchi" <dario.binacchi@amarulasolutions.com>, "Jagan Teki"
 <jagan@edgeble.ai>, "Jianhua Lu" <lujianhua000@gmail.com>,
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, "Purism Kernel Team"
 <kernel@puri.sm>, "Jerry Han" <hanxu5@huaqin.corp-partner.google.com>,
 "Joel Selvaraj" <jo@jsfamily.in>, "Icenowy Zheng" <icenowy@aosc.io>,
 "Michael Trimarchi" <michael@amarulasolutions.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "Casey Connolly" <casey.connolly@linaro.org>,
 "Michael Tretter" <m.tretter@pengutronix.de>, "Cristian Cozzolino"
 <cristian_ci@protonmail.com>, "Junjie Cao" <junjie.cao@linux.dev>, "Ryan
 Brue" <ryanbrue.dev@gmail.com>, "Nickolay Goppen" <setotau@mainlining.org>,
 "Stefan Mavrodiev" <stefan@olimex.com>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>, "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Robert Chiras"
 <robert.chiras@nxp.com>, "Alexander Koskovich" <akoskovich@pm.me>, "Markuss
 Broks" <markuss.broks@gmail.com>, "Artur Weber" <aweber.kernel@gmail.com>,
 "David Heidelberg" <david@ixit.cz>, "Dzmitry Sankouski"
 <dsankouski@gmail.com>, "Yedaya Katsman" <yedaya.ka@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <linux-tegra@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 00/35] drm/panel: let the panels use the atomic state
X-Mailer: aerc 0.22.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <cxsgo7u2hfb4jskscqcbeaaneiyfh7bdmlvku2wxwtduekwhxz@3vsizgxvekw7>
 <DMICO60J4G03.1QBH2T9SQ7XEZ@bootlin.com>
 <py3tch5wmx4g2zjpebzbgtpwji4ci3vk5obeuy44fbi4vw2em2@gpjmxyvwpimn>
In-Reply-To: <py3tch5wmx4g2zjpebzbgtpwji4ci3vk5obeuy44fbi4vw2em2@gpjmxyvwpimn>
X-Last-TLS-Session-Version: TLSv1.3

Hi Dmitry,

On Sat Oct 31, 2026 at 5:44 PM CET, Dmitry Baryshkov wrote:
...
>> The first 13~14 patches are nice and fairly independent cleanups. I gues=
s
>> they can be sent separately, or just be applied. However I'd still want =
to
>> review patch 14 and do some testing next week before I consider them rea=
dy
>> for applying.
>
> Sounds like a plan. Would you ack the patch 14? I'll review and repost
> patches 15+.

Just did that, and also reuntime tested patches 1-14.

Aren't patches 15-25 another self-contained batch, that might be sent on
its own?

Ah, hopefully if you repost the series without parthes 1-14 (after they are
applied I mean) this will reduce the Cc list too.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
