Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368CC19ADBF;
	Tue, 29 Jul 2025 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753774574; cv=none; b=TOTi39w7QqssCDjKICWyptyyOOyA08vNcc1X/Nsq2YkSsEXdONmfv/dOHj4FdxCJb8+sfZh/lzzMZPMekpOlK05xQLNmzgrq8AldkLQeBjITsbIPLbZ1tGsh9g2EJSJT3V7mnnT8eKy4obcg/P/ecDsMScI5QDJIfoBQelX8ZIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753774574; c=relaxed/simple;
	bh=OCgAuH0poRpM8EdoB+9XWQ7QaY6GNM7nY8AsgVITxYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8pJg5Ugq899iwvbPYf2zkaxSdafGO0RwZZH3FRRJMKspPo65S7X7rTkaoP+ir3pngazq7creZGGrMynjvEvtDWjuSNBD6rNPz1ykVbRceb6GL1eUSclRi22d6viG19Ba9wg1u5qHuQaUCbowCU+WeCHQyS5bfTENXgk5UxpzOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBWTPmP3; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBWTPmP3"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso1552546137.3;
        Tue, 29 Jul 2025 00:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753774572; x=1754379372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybx9ZEB7Knt4sq4h7VniyBzicrS5wNfctmysoMkVU7g=;
        b=mBWTPmP3RTtrzKoLGzJo2Avp1zm3x5gp0MeIc3Oe+0Hvp2LCubnEwOSvWOmRUZz14q
         vFVc0zcajWDoQfi+ZgXo6U7/OkHVS1JeMK8Z25hjJv24CvHFTrzIFB8Auc33AKFsrcAb
         LXhhKJ2GgyzeTPYPonl1B3YvF+DkA/acLRqPgbUTbdIInwi3EgevFVc4FDE46RMi3E6o
         ciF3+6CZ85O/PDgOD5BG9FHsVxpYod9h9rXgI17zmC1KwYHNqv9TRTqBsOhJOsXs1u2t
         vZyP+KTIxTOrvoC2MnFXWam7rJ2uogHbeNXePVHlznPIb3Pd2YWKF8Lg5IVdvxGtT4AO
         PDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753774572; x=1754379372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybx9ZEB7Knt4sq4h7VniyBzicrS5wNfctmysoMkVU7g=;
        b=FgV6j7O7lCIHHTM3/CCXLj/rElyS0EX4VtAT1ueYws5wMA2/FsBetMWmKoyqgymNBB
         5oXJkatPKcG5HPArxODdYE2tbgJLuxDPXicOBrz8S7C6ntIgjuNXdDDO8ZyUBpiK60Eu
         iW/CubVuRCsd6z1t1kam19dtRRKcxfvb1OSgPKt3CVDykdEsJ0Ml+P6NLimACHQwwic1
         Xb1mXGJ1OXN+uJkBUSrYA/DpOuv1b3u4Bq/iMyQXRCtz9AuBvV94I4CW7eaaf1pjbf9M
         1MEGT3M68eaKyihkwIyIRxlTUM08Fs+AGU8iyUKE5tBDn9xef2p97aIoieSbE1kCRSZF
         2aUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoriUJavntt27Cho1Or3/3xTQ1XBG+MhrrmWkiyyXPcCNMFxcHw47sGsL0FL6C/NL9mViHjEexQ/xBon6u@vger.kernel.org, AJvYcCVbtgBGHDe+RM3c0vwrZJzWU7TGbGBqOrKus0Uu9bvjjtkSSFFJoSoM6HKi5jszna23XQ6Xg1bea853@vger.kernel.org, AJvYcCWDJfGchxpqiX5F+1krxwp3NnlUDmOsXx3Dg3lEruO8q/x+2d3xSwuSP5m8lh3+50MHVIr90tV3r1lAPhGeMi4prls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAVeTJ8uq3a6AAlxW2j3XPMs0EfbubytJOBeGTRBtGWgzRVwu1
	b3Ei420DmEjkSL2s3VZMfaHq86lSyXMC2KzY8SxUbxaMjF/9I1AeTAWdwTtLNnObHo+p/Vk0a4p
	DEcxI/1wmiHZonezaROea5caUBqOxJ4k=
X-Gm-Gg: ASbGncu1Rn1sFC9Xgttrb+AzIlyYkNtdQtiGaqh3Sg50FZU5kagqyz8ahSUNtSfeAtZ
	uXmuSk8PtvBuoy+MakHGnLOdqbU2o0mIt9Z0j0ACz799qDRQBiQwZE7daEbXKd3Uvi/1hvYTqOw
	SbFG45E8O+QMV4wPI51pZE+/FAR02T/dxGgcRT2KK1yqvbI+nmpQhBPjNyvyEy6r3foANhPAXoY
	u2eBA==
X-Google-Smtp-Source: AGHT+IENH2AW1ZXDnTlpVuHy58DEAA8L0hmQ3yc6dY3oxN1NrLrIl4BCIubHSKcHLtCqUNYVz4YtdWuKh0KtO3j5xGY=
X-Received: by 2002:a05:6102:3053:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-4fa3fc4c5b4mr5102345137.5.1753774572016; Tue, 29 Jul 2025
 00:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 16:35:29 +0900
X-Gm-Features: Ac12FXzR2-3ASwmrKN7QegXsTXtT3Y5L39TTtfej0LBVwYdqfV-4142nEMemsSM
Message-ID: <CAAQKjZP12LZPHcPo1ztvKq6Vts=Mp0o5NyJfdCZZoMB633wynQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Support for Exynos7870 DSIM bridge
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kaustabh Chakraborty,

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:26, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> This patch series introduces a lot of changes to the existing DSIM
> bridge driver, by introdcing new registers and making register offsets
> configurable for different SoCs. These preliminary changes are followed
> by the introduction of support for Exynos7870's DSIM IP block.
>
> Work is heavily inspired and only possible due to Samsung's vendor
> kernel sources. Testing has been done with Samsung Galaxy J7 Prime
> (samsung-on7xelte), Samsung Galaxy A2 Core (samsung-a2corelte), and
> Samsung Galaxy J6 (samsung-j6lte), all with DSI video mode panels.

Patches 1 through 12 have been merged into the exynos-drm-misc-next branch.
- Patch 9 was merged as-is. If you decide to accept my suggestion and
submit a revised version later, I will apply it on top of the existing
patch.
- Patch 10 was also merged without modification. Although it includes
a behavioral change (removal of the fallback to pll_clk), I don=E2=80=99t
foresee any issues. If any problems arise, I=E2=80=99ll revert it.

And patch 13 has been merged into the exynos-drm-next branch.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v3:
> - support both legacy STATUS and LINK_STATUS & DPHY_STATUS split (daeinki=
)
> - Link to v2: https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-143=
3b67378d3@disroot.org
>
> Changes in v2:
> - added commit to isolate clock names for each variant
> - replaced clock names with generic ones (krzk)
> - added maxItems to clocks property in dtschema (krzk)
> - Link to v1: https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a3=
30bca89df@disroot.org
>
> ---
> Kaustabh Chakraborty (13):
>       drm/bridge: samsung-dsim: support separate LINK and DPHY status reg=
isters
>       drm/bridge: samsung-dsim: add SFRCTRL register
>       drm/bridge: samsung-dsim: add flag to control header FIFO wait
>       drm/bridge: samsung-dsim: allow configuring bits and offsets of CLK=
CTRL register
>       drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
>       drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
>       drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
>       drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
>       drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
>       drm/bridge: samsung-dsim: add ability to define clock names for eve=
ry variant
>       dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
>       drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM br=
idge
>       drm/exynos: dsi: add support for exynos7870
>
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
>  drivers/gpu/drm/bridge/samsung-dsim.c              | 353 +++++++++++++++=
+-----
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   9 +
>  include/drm/bridge/samsung-dsim.h                  |  16 +-
>  4 files changed, 317 insertions(+), 88 deletions(-)
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20250523-exynos7870-dsim-f29d6eafca52
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>
>
