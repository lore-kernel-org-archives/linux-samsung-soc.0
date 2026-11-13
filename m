Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580499;
	b=qrUvsFyi9DM9qxga9pbHqN+eRO1BvLRB6uUyOPGnwtRW+DYpes72ZZy9uqhgirzwxfzj
	 xq6VamTH92mCj3le4qtjMxTE4bGqc450WgHpIAmcmG/ruqTuL59HSRMkM5YKu5gds/LzV
	 GI94xvNmXgYMI8zp8i14j5PK028aY6yc+Bvx7qwOc+U0e3Rr1au1/P2mbhaGGD4hDSR2f
	 moTr/lJ8BID/b4FQ2lrtIYTEahTTSuI8irHnvg/nihVKHAQQ5HJ8SQ15kQSsY0V40E+1A
	 8Mg4iGyejKmRARKgFZrOaBNrCI+hmYypOQYFFkYRsqTBW2s4/83UBpPGkWJiDPmNMPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580499;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PF7x+WHFDlFjFzclJMmi7Uvb2yYXpjZa21XSXBNN68Y=;
	b=AwtcTBaDdfYGIQSEHGb806RK7023aISFJq9sQaMbEpvoWCRpYpnhmwje2TN1cf8it7DU
	 lAsBIPUC6T72pZO33RA6MD1zeS4tmCONcu+zMYoh3Uvrd0oHCNXhHeo0PlZjKPXdjHxyo
	 OnkgDj5yALBcEGKKQ+8AixjAUu//r/8uJdCxve0yYEyWilvi/WgZhgR3DfrSSP5e1IElD
	 ipK7E4nnhNwIi5kI1u1Cw0Gs6tw3kjjjQazrlOWkmpBIJvpNMZ0DKEXWsx+TPuGAWvYGW
	 RFgH1CWa3kaxyTExwmF3iQqpLRisBLS3or6lXL2/GjxTTaI1t0cwRm2+R3zarX/nrTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zs+kdfNJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3C3606A32E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zs+kdfNJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7FE1F000CD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580499;
	bh=PF7x+WHFDlFjFzclJMmi7Uvb2yYXpjZa21XSXBNN68Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zs+kdfNJoLMkl/WkGe794yJ/6X4epq2Y0S9osHqwtoywyGWWo5acUIiHSXv04wbm7
	 jT/Lpt5RBcdJ4H/5KDckMWd11BZlN7NY3J7Kg4iq8zkmjv3UmtVQtTTmcZMdsogjpK
	 /1Ix/X/H1c1uvRoR9KuN41hX+QgC/q+/2BNBCz7ObiJCI0w4gNTmmxdBrBdzTVUyF7
	 HnaUrlhe6B3NCHoXhN4Wqcuj0NTPB0p51y5t28+X1h+4dJZJZlYqqyXqKnErGu3tCE
	 IT+KTIx9lAc5aSvhJMluLkZ+uS5+IzI807cN03nbgP9G38DTbnXDsJDnODPry9L/NQ
	 3PZRqmJoROLXA==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6d290b10a35so351013eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 06:34:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFqEDf/5/2uLDdCTOzOjF5CMgOtodN8Rthk+odkKOTDbou+Ztbox4pIrau36U9hHx1y/31T0weAOhVq1h8NGWBuTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5SFJVF1lhn+eZcyJ99FR59vQWsjcioD5DR2t0RZ9t0E6C+46f
	tWNug/DjgOWn7iTVTujRYChxxkzAB2YQSjYOKICPkpUH1mt+TfRVKkQsAx6dUrG6n9hiF+LR2M4
	hDTY2P18fbYRKCZ2yRhDB3qmZRnPm6s4=
X-Received: by 2002:a05:6820:238b:b0:6f4:d9d4:3948 with SMTP id
 006d021491bc7-71ab50535a7mr1136848eaf.45.1794580497611; Fri, 13 Nov 2026
 06:34:57 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com> <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 15:34:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLmME3b35ipG0N9agoe+5P1J6dsDiy3hoT9MJ9vyRwBA7A@mail.gmail.com>
X-Gm-Features: AclHuK879_MUVY4wh3-oLFktJApN7IrvQSuSi80dujOkyN3zJSTWDVcOyRF70LI
Message-ID: <CAD++jLmME3b35ipG0N9agoe+5P1J6dsDiy3hoT9MJ9vyRwBA7A@mail.gmail.com>
Subject: Re: [PATCH 22/35] drm/panel: drop the orientation workaround from get_modes()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Igor Reznichenko <igor@reznichenko.net>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, Nickolay Goppen <setotau@mainlining.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>, 
	David Heidelberg <david@ixit.cz>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 12:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Setting the orientation from get_modes() was a stopgap for the display
> drivers not calling drm_connector_set_orientation_from_panel(). It is
> also too late: by then the connector is registered and the property can
> no longer be attached properly.
>
> drm_bridge_connector and the panel bridge set the orientation on their
> own, and the drivers using a panel directly do it when creating the
> connector now. The exceptions are sun6i_mipi_dsi, sti_dvo and the Tegra
> DSI, which get the panel only after the DRM device has been registered.
> None of the in-tree boards using them has a rotated panel.
>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Makes sense.
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
