Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57DB2BD04;
	Tue, 29 Jul 2025 03:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753761354; cv=none; b=lnO3Ek1ho4lqdeEmjkIFte2IU3IdQSvJorhMSmKDJ5gz97d4ao3phQdpnftLA7VECnyDanYYjeE/D3Fz1RtMkXT9o8I/bVjq3PkyJLWyU1KeEiY9YgbFqy6myymz3gvD32rUEj8UkCAcnmTUuALY/Mmk9k9wT7xO39/E2K50ezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753761354; c=relaxed/simple;
	bh=XNaY6zjFNMOy/UiDZl0iNlt84kbapG83XbK3qEJHriE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qk1eYIVIrehjzSu+O/3eZSmMzBSL4OBe8mYqzz1tH7pK5rYrJ4mEqbNjkbbus2lGYKf1NWmmiNZa8jg8DRoS/m+vclJROR6mxQUjVXJXlVUAlDEDtIllTTYzHN2NA2RvzZrjTh7itEtVLChszMXpz9Dq/qfCjqa6LtpRvidaZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCKQm6xF; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCKQm6xF"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-884f22f9c90so1594443241.0;
        Mon, 28 Jul 2025 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753761351; x=1754366151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeyQgL4zAM9urQ/V2LLVC5jrotO1A696xW4MrH9cKZw=;
        b=VCKQm6xF+P12a844HDXwqdxb1lT4mI4L/nT6K5XNVX+DELYa8HkUlW6KxXJfEMYAIa
         THEY0u4yte+WWDapMDt81XuB90HGbLvrbU2zqyeKfznWpIGAgtLhPt0s9ACn5vu8uz49
         N0ltjwznlnZ/+T2Cn/TNruFAZOdoEt/DihI+zON7nff5KpC6cxl3UZHa+CfuSgU4bGKe
         0ISIvjeoXGETkBnKoyX0tjqzkwYRqzFMRT31s9/9Su4CPhnskCDTbqOLWU8A8Z1DmFxf
         DDWEnCVcpu2Y2hVFy92fgYttH2m6z+v6+lCSk35m1c8h9JxsgDEo+xHdqwL61HLGvBoG
         2Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753761351; x=1754366151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeyQgL4zAM9urQ/V2LLVC5jrotO1A696xW4MrH9cKZw=;
        b=ECJWUze+bE8Ul+rogrKM6YgrKDfXZ4TkACKGy0t1z6LhfGrHvMU8567ePz2WPDgtNo
         VL2kNEgukipB7qEyUYrxP9krlVYP1LmAjWYrc7DchH1nCdM3JGUd7cbgDlb7e1Mfcwwg
         226LA8Tngg1ay4hhm0OMNWUKuizM8xOt7Bqcor73hTZD+ldE27Lu7PqoVGBXw28WXgjB
         TX0i76bHIEWMxeVdbzESrmlDlr3Z6jWaPU9BjGWCDqRiY0jf9CtaS3vVWVNhsf1bUVIK
         BK29MRObD48b4XahY/THEMu19FJ/0jolg+SP2NqqsLg3tdYypNyrX9JvAKPUhfxFIMxO
         eSKA==
X-Forwarded-Encrypted: i=1; AJvYcCUAvNPwdKqLCX/qjy/MhOSumacXW8b7YqgiW+P3YsLTvVAHpCVL6gcw8q+JDs9Af7q9NgVXG0KZXbiHe7yfkLMIS2M=@vger.kernel.org, AJvYcCWm2k6awSyX/SdvKsd493yzv0uf+VC40Q+OlGsU1TMunyqKdk9l1j4wlJ+7YK0FxUopnwjG/ojLaJRl@vger.kernel.org, AJvYcCXrJDmkC2g1egMTZ43mo7z5ymSYXny+PUqaaWrNzRggWgBleXFqmCJViHHMLuwaH3gyDRr1EX43Rh0wBAZn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy2vRTftqmtLYhMix4qwgYPfF07Gce7LAHnJtzUGGgokq9sNyW
	kCHIQl5CqJrvTmighqd32ZrjHTlsrMvo5eReRTbI4q7Zmr9bJKR5pqHhD8klUqi31n9TObqPkbi
	Jb54EwvUeLHq8kYaE/hhRnaIdsE4OKSU=
X-Gm-Gg: ASbGnctfIcd1zNCETT0lRJ+9ldt5UUXfyVIPaAzBYT+31KndoV4s94iHCJixBnuIlTG
	LVdDJI52aW/tIVEBmgE0O07TAqCJUpv7TqdnRle+coYBZbJXLD6Sx7kwDJAkcwsDcl/IGwZXSc9
	vUN8hMmVNUd5Ne99b8T9eXQBGhAM6TxxlXW1jJrapJwuD/JqhxhXRzbeYFrP+KvdEn9AAu+vHX8
	XvEEw==
X-Google-Smtp-Source: AGHT+IG2mKzTaoyQhIzvXEq6IUJ/Cn1eY9r2poRKFBunLtB0fjLDRJGBG8ErMCT2vRGzzaUM0D1HViC2dX+iwTNt2js=
X-Received: by 2002:a05:6102:6885:b0:4e9:b793:1977 with SMTP id
 ada2fe7eead31-4fa3f6f2a22mr6292838137.0.1753761351455; Mon, 28 Jul 2025
 20:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org> <20250706-exynos7870-dsim-v3-3-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-3-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 12:55:09 +0900
X-Gm-Features: Ac12FXwWbP8lV4QH9kqWdIB3oIAGkUWrt4c9ZYSOynqYZlW4YQIBN8DquJzuVJI
Message-ID: <CAAQKjZPNh=r5xf7X_R58VhuKz61vVGO83Oe9KsA1m_nJ1OuMLA@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] drm/bridge: samsung-dsim: add flag to control
 header FIFO wait
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

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:26, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM device doesn't require waiting for the header FIFO
> during a MIPI DSI transfer. Add a flag in the driver data in order to
> control said behavior.

I will merge this patch as-is and just sharing the following comments
purely for reference (for other Exynos DRM contributors).

This patch likely needs follow-up improvements in conjunction with
Marek=E2=80=99s earlier patch (commit-id:
15f389da11257b806da75a070cfa41ca0cc15aae). I=E2=80=99m unable to verify thi=
s
at the moment because the SoC Technical Reference Manual (TRM)
documentation I have is incomplete.

Based on these two patches, we should plan for future code
improvements that account for two scenarios:

- The header FIFO must be waited for.
- The header FIFO does not need to be waited for.

Currently, this is handled via driver data using the
has_broken_fifoctrl_emptyhdr and wait_for_hdr_fifo flags. If the
handling of this behavior changes in newer Exynos SoCs, this approach
may become confusing or lead to inconsistencies.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++---
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index dca3939dd99fa07aee309067b93e652bc9a9b78f..84af24171b6856cbcf95b9077=
b997ee587fc0409 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -418,6 +418,7 @@ static const struct samsung_dsim_driver_data exynos3_=
dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -438,6 +439,7 @@ static const struct samsung_dsim_driver_data exynos4_=
dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -456,6 +458,7 @@ static const struct samsung_dsim_driver_data exynos5_=
dsi_driver_data =3D {
>         .has_legacy_status_reg =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -474,6 +477,7 @@ static const struct samsung_dsim_driver_data exynos54=
33_dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 5,
>         .max_freq =3D 1500,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 0,
>         .num_bits_resol =3D 12,
>         .pll_p_offset =3D 13,
> @@ -492,6 +496,7 @@ static const struct samsung_dsim_driver_data exynos54=
22_dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1500,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 12,
>         .pll_p_offset =3D 13,
> @@ -510,6 +515,7 @@ static const struct samsung_dsim_driver_data imx8mm_d=
si_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 2100,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 0,
>         .num_bits_resol =3D 12,
>         /*
> @@ -1117,6 +1123,7 @@ static void samsung_dsim_send_to_fifo(struct samsun=
g_dsim *dsi,
>  {
>         struct device *dev =3D dsi->dev;
>         struct mipi_dsi_packet *pkt =3D &xfer->packet;
> +       const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
>         const u8 *payload =3D pkt->payload + xfer->tx_done;
>         u16 length =3D pkt->payload_length - xfer->tx_done;
>         bool first =3D !xfer->tx_done;
> @@ -1157,9 +1164,11 @@ static void samsung_dsim_send_to_fifo(struct samsu=
ng_dsim *dsi,
>                 return;
>
>         reg =3D get_unaligned_le32(pkt->header);
> -       if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
> -               dev_err(dev, "waiting for header FIFO timed out\n");
> -               return;
> +       if (driver_data->wait_for_hdr_fifo) {
> +               if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
> +                       dev_err(dev, "waiting for header FIFO timed out\n=
");
> +                       return;
> +               }
>         }
>
>         if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index f0c1e5c5ed490afe0bcfd06830f52471710b29ea..62c07952bd00f9c2c287a6a99=
8f0e243dd4032a9 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -61,6 +61,7 @@ struct samsung_dsim_driver_data {
>         unsigned int num_clks;
>         unsigned int min_freq;
>         unsigned int max_freq;
> +       unsigned int wait_for_hdr_fifo;
>         unsigned int wait_for_reset;
>         unsigned int num_bits_resol;
>         unsigned int pll_p_offset;
>
> --
> 2.49.0
>
>
