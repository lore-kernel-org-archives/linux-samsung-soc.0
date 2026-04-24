Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BAD371045
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Apr 2026 07:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017437; cv=none; b=QUu+LWlksQHrCyGvspzPejxsYEJxdITc79SdjM6lRUHJ40IlAv7kGcN9bDEWFdgmzOuIMi+sveagCI6HlHcAr3Xp9tBHwQBAidFjX8Eda7eWhCcH8uwCWfSb3jsD7X9EOV4IvimQEop8O4HYZJpUFo52Qy70R+blSmS9bQqGSYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017437; c=relaxed/simple;
	bh=BZaZ3g7ZBPkjQoz8nLCka6ZxevyTyp8FYNkCXs7p8Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggSt7VBfAPHd/NngcwiclmYHKtWiol8N7bO4ZsMQ3ulUrBg0ZyBlDOtoc+0R+Mo6KacAKaW+eCFIchuZrnINy9vEjBPADkRmAeLWcmPJukqslYbAbiXuSas3qzkXXcx/vDojBVxqJb121b9OVeYBqJzBgufGZFAsW072k5ONL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7de431da8fbso1994211a34.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Apr 2026 00:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017433; x=1777622233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k21mzy1Q8IyL290m/XCuURamP2UyoHvl1hWQE5Pk/w=;
        b=fhGgIF2WIWcHsjFkp0pxbz75Z9X42yxPT6HTpuDwiYnJbwb7P1d9kmbNMCnFmNu2JK
         16CmbqiFEFVggwoxu/LcLPAKSIBiAOYBp81NBO83OYp9/V8PxslDQng8YzX4Hac1BaYZ
         6oXIOoW4Vu/m/IhD8MC/pvMEUUjCEjdk4ac+mAa20qBS4582/Yd0Ov0oZ+r+8PI95Joy
         YSE9ybhQ+Z3HPf81VoO3a9MkwQt5SxFk7nmwBdB2ninlavDnP6k9su885pJ1MlrH1b2A
         92+DRbSdMgVHSn4lWRCg5ZdhbjmixNRuchuFyscp4QHSH62GIOZTrp6hq2AJibyrzIHN
         2pzA==
X-Forwarded-Encrypted: i=1; AFNElJ8kJttfBRXkkbF/WLB4sahuzq63KjQbgaouCxlVsA1wsG8q+WyfnxH9CBRrgtGVTc+LktSAJsLb1Q9iH+utEJJU1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1Iqqyx2WdS5zLhT75aipb4Gn9RS947LTjLvuisojon4hlE02
	EY3Mdt+tq6Ak1m2oAIHUSXnPY/V/k8y238Eur/bmhGJnuIF3NvPsrLO4kg5Old/k6PA=
X-Gm-Gg: AeBDieteLx14cT2wydefhTiabVLC/4g8nX+upRpe59mJOySzcszVIhjf/W8bQcQLEwx
	DqahhpiUbH81dA0tFHG6Om3BCWwWmy/Ark0irWOsEUtd2BoeNhI07K92mIqitbrZ43HjCenm2Pt
	yK4lQFEE30DCv2jApSRHyw2cuIYvITwPjnK2OgNefbPllzuxQfSW/Yb9ioqYU5f5RY/pnxmbUjt
	WePtOARG7JmmdxTzBqILBrfGnSFss+/T6p0T0tTSIh5LiSd9/2n5fcjznZXIn4t8nruqUjWtNvY
	uCIMhvA7Pk9loKH+MvNQtA+XohxYjlQh2O9fo8Hb+5za3f9T/gsJ3xQGv+Pi04UoucEY+HeG19N
	M/rq+GEgsT/rdn7BdsMN0t4jAX2bXRAu93nB/JHbbnew4l8RFCMMBA7JAU787J6cjyqSrikhJLg
	Tt61myPfHxUHO3nxiNwLoN0Wyqm4loSPnX/l/Kv2QRKyFexkIrlTXGan6Y+2KAP6zyR0eVthA=
X-Received: by 2002:a05:6830:81c8:b0:7de:4ebe:e44 with SMTP id 46e09a7af769-7de4ebe164dmr3126774a34.2.1777017433037;
        Fri, 24 Apr 2026 00:57:13 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dce2b2652bsm7241008a34.9.2026.04.24.00.57.12
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:57:12 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-67c22b05346so3920355eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Apr 2026 00:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9SYWFEM94SMYbx+2QmfrkuCz1oUo1veov89dkd+WvnVX9rPRGUBjmxcbPczTIbW7+vZ8ABoqlfluarwoYwxHqaXA==@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-616f772e968mr14645934137.15.1777017023068; Fri, 24 Apr 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:50:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
X-Gm-Features: AQROBzASdrVB_Aky8lNaIViGqa4fIOoRKTkBEjNLF-nFJbKyYgy5oQezNNnYjKM
Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
	Douglas Anderson <dianders@chromium.org>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Luca,

On Thu, 23 Apr 2026 at 13:59, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
>
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
>
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
>
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

For case 2:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As none of the old SH platform have been converted from
sh_mobile_lcdc_fb to shmob-drm yet, case 1 cannot be tested.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
