Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AEF422E1D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552990; cv=none; b=bFUfT0qEb9TV6iEJ205Y/+7ypr0jvnq2w0Hw67e99g1M47Vdw2on9S3gxyAaixBBjBqJwMb70D8yGOJTk8x7CkTAWVQkQr/a1VKSQw7+nD9uq7infkwvB3XudMqhZ/nKwfFJ0nQ+Yw9fPjGVOcJj0cKDpvWiAE9Bc13s/vZupiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552990; c=relaxed/simple;
	bh=NibdtCwpxrzNYlWG3qc/r04EtocLChhxPuanrYhvQf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fW2kcJJ0831RP+Cga29jdzBEzHamslhtsSq0wIajK6NOMRnt7RRCalcGeNxxVvTSYCGhAy3F98v2nr8H6a4vUqlj49cpu7rwHo6lElrt4lPux1FVBqqKkX6mDeOWhrOmzwCb9Rdr3MKHEHGYjM+rMG7ppAB9uc158j8bPcbTDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHv6x7WZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHv6x7WZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4728c12ba97so5028938f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784552987; x=1785157787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8mYPhXUmZpNbn2oVo3k+YKafzsgCsS1GE9LMv7AFBw=;
        b=wHv6x7WZ/IV6ZYym8nQcXPLFMwS9lgllAo7xOYbOuwSQqsR0aQMfCZIOU7ib/S90Vo
         +5bMjMfpbKfVjE+1V39fstmHz9V+OuCkorKzJqFqqQbCyQwnq7UkjmN/AQzYUmnV2+L9
         vV4NvhyQZpA+DzH48IfXwHg7cP2d0UzVKiMctwOETCPrykdlruLxK6sakRFkaK+vlhoY
         w3fFquvx/0OgmNsQWlvAZBnljgWum8YJkZKIGmaLhPDL9Hi6NQCxq+QwEn36BbCUv6mE
         uCrUHi6b6iOTOY76BZ/sfWGYnf4G1DYmKIPvm1vkvBLNG3PzDYq+6KAra4CBDgLEB5dr
         0HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552987; x=1785157787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8mYPhXUmZpNbn2oVo3k+YKafzsgCsS1GE9LMv7AFBw=;
        b=T4Sg1FDK9sEMrAgaAOejc4ZUQSE6eu8jQ84z9JKJ3DCxrV39n7SyLzsthH09DWFXya
         ZJtkfX2WxZzHplD+Q4UfJwzqTN/Bgqk7qcHI2siCPcVdm9B0wLc49j8Hhm+6BgRHLQGL
         m/G76ADXkXOEwuYUrBvDC/R+n78SCDTGtilO8Yi/6U8/J/cC/gTXBq1hEZAbLl0Yo0VU
         kn2lOD4kma0eLfctz/uugqKcKD6IvuugG2W7oeaf5FRQf+t3fquuvARLzF1Rv6J8to3J
         CUjCdoS4+EF3QTd2uCqiPz9/PjtHuwXV0n+bVpjoahNwaCAqGYeqCOxIIjWobwG6XQZS
         1Sfg==
X-Forwarded-Encrypted: i=1; AHgh+Rrp0ki7nZxPXPx02NaGUIUB44vGTOHPcgPqF6mZEsrJXjg8Rkzy63doJWpOE5MaUckB57tY1hH79Qx3O2DnRwuoBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH1lxjDeqnII26TvXBrLwJiP7zeSED7149lV7ilULHffw7ZeNw
	aWKY8mhSoVFFPLysrP/cU65Pzz2fQ4we6gPZImDwy/BFYelSrVyZonP0cPqtlDh+bDY=
X-Gm-Gg: AR+sD13MUBKEtxB+/+d+bQpfdqurhIVZtCKYLGXZFrOe8C3JZPLsGBx7iHeuWxlEUBe
	faB7IhSwamDfcIY2btcJlLtnsZ87mNjJ4AXd2Ip1ZIz5NHEgZHMeFj6m+6JY955rrjEDYBqDwIz
	X0K5vSSMe1KqaVqhM0EhZbJhjjGpjPy4uJsMDsF5UEQDN+mUrAcq3JayZUYFEqMjRlk8Sv7SYOs
	wRfpnWvVwRJ6ZUGjCUA8dVDvKH4mpaqsf6mayz2OYvXYNXXXXW8BfvBmCigVry6SepvAvSSTIQF
	JssAkfCyVyNIe8O+MaXrdFld07p57VE/q7UOtPBSe/fb3eTagLvxuOyCrIHmpfRkdk3EDIkxoJZ
	0SmrO0XBtiekohC2ebOTetO63BCUyXdSY9/62E08WNk4BooR6vxmvhWjBnf9xeNcZdtPECvNg1M
	clVAa04/++J+XKLIDgRPwN4lo=
X-Received: by 2002:a05:6000:25fe:b0:46e:c978:7ddc with SMTP id ffacd0b85a97d-47f62316b85mr16082343f8f.24.1784552986541;
        Mon, 20 Jul 2026 06:09:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm30767434f8f.24.2026.07.20.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:09:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Linus Walleij <linusw@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Jingoo Han <jingoohan1@gmail.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alison Wang <alison.wang@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Albert Esteve <aesteve@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/4] drm/panel: refcounting panel lookups and references
Date: Mon, 20 Jul 2026 15:09:38 +0200
Message-Id: <178455228150.789946.15332957012612566281.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
References: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Fri, 17 Jul 2026 16:02:03 +0200, Albert Esteve wrote:
> The drm_panel subsystem provides kref-based reference counting [1]
> (drm_panel_get/put) but almost nothing in the tree actually uses it.
> This results in a systemic use-after-free pattern throughout the codebase.
> 
> This series aims to close all those issues.
> 
> Patches 1-2: fix the infrastructure. drm_panel_add/remove now keep
> a counted reference for the list entry. drm_panel_bridge_add_typed()
> now holds a counted reference for the lifetime of the panel_bridge.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm/panel: have drm_panel_add/remove manage a list reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b619d9d2af33db01ea237e3546e9d55595e94ea0
[2/4] drm/bridge/panel: hold a reference to the wrapped panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/34069e04d338a333561b64a2da055bd16bfba39b
[3/4] drm/panel: of_drm_find_panel() return a counted reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/738ff709f7cf82a41cbd9f6b8f9b1f236ce26610
[4/4] drm/panel: find_panel_by_fwnode() return a counted reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d857b8ce04a7ed4b36a11db16968ab1652ed702a

-- 
Neil
