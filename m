Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97A40801E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Aug 2026 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761639; cv=none; b=RCJKuEuqzmAyc/ee8K2DAgO1btuS7bQZoYyKbScm70dNn2DCLc+Rz1f5ijnjre/Cy27h0volsZRXft64GrhN7ldqm63Jwa40gqBJg7E6Qdm5MtpdVYD5hGZT0dQEerxH2E0T7aoaD3PlsXNr/aFk6Jxvaq/dE7zHPuK/CB1BkqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761639; c=relaxed/simple;
	bh=Ir8txI41duHjjdUa1tYJv/Mb4slAcXRYTZiQjfKa4u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZX8xUHfeIBV2wDRAhBWD1OuNwmagGOYYfBHnDrb+9RdMB+pKFpZWF5vLibXmdvl358AxlE0sSlkpB6jI+auLOnwp3x+Md/RB9JqS+IFnwpuY/k2VUpFxFw336QYNbv99wse+3baev7TriD189qSKqbpwK66nB7dLZhZkyGtayI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso1947664e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2026 05:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761636; x=1786366436;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGVqxVKLC2Gks94xayPEyUqyvnJiYIaVHNXa8plDaec=;
        b=H2CBGy4YF7ozeV+zBKm4a2c55F/IyMI+mHa+JpH6jD/3cv/2kR3OGKJymrtanCr6BY
         WahPr0eDquTjAFfFalQsBnpoIkP6LhpntLTSltUcaL4/kxEPtHhQBAlV0bwjidXN2CK+
         ljPmtihIejxkSnL+owL7M+JLxH6nCw21S8Wrfnc9ba7roPFY8SxhcBJs0M87uARfCsQO
         iD8xostUMxobvUBnCkJcbFE1ToFKyWBgb8G7u49CAK4aKS7kCRIPqdmluw9Cw+bPWqKE
         BifygMStkvc4R1sjm+JqTJYJDeAEJd9QRaCD6Ly/NxtUw/WNVUrAL5fgJlk52khGrGfe
         4lDA==
X-Forwarded-Encrypted: i=1; AHgh+RqCrrHA3diBUiTPL4NLIE1ZTS1H4Sb7EqMvkWn6QutkzupsPWYwtumXus6IvA/BXXRsHUfyQZg8RfkNqTxjhcrZuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzObHwdyXhEidJomNww8X1IrsLV6FLmiOY9QQ1YPwCMamd7iElC
	HER/2/bIVW0N991+9TKQ0wcneV/t9yfgHaXcaRMSLd5UbrdE0zvgkNeALVv7GPDm
X-Gm-Gg: AR+sD10J+HtdLJwMqXCay00Gp1RKtCVyR52aHmqqLsLcfe6SRSJ+1GmpEpWrmweWiP0
	6HUtK7ypoMXWPF7ZECEFJBbtaD3rq0MU+SXecJcV/fYIE90TyfgdV3/JcSt5d91o+xVBcE5eY92
	OuY0UHu1P6vrMPzDg9+JRcOG3qJwunhe8y+f+A4YRCONsmo98G7CpBglNBEVC86e4WRJqUporoo
	dZ7ikNZnj1r8+P6Grw+JVeYjhY5wlpMyV11Iko1WhDy+/LuEkfBBilNx1Pf2RheYBCgTP7zj4M0
	MyPSNeJUsu8wUgZf9g1/tZzEKH+tay0IUwDzTTdb0VPuX/p4QKfXsUThzzkWPA3EliwCfGKVzH/
	feM5OzhutC5CEMbHm4OXhQXWXI+lcdJoEfmb8QD0s3s4aH8rJpS2wG2A1Xf+5vfDk/Rg6olvPcb
	8LuU8IdNvGtaTH30IaUBlQhirZ22kIFAKhz96PZh5OsfX15e0RhC1dkbwhQHTvqsrK0BUJTxurw
	APQtL9+OttY5BwyiAx0PBnGVQ==
X-Received: by 2002:a05:6122:c94:b0:5c2:c0de:d291 with SMTP id 71dfb90a1353d-5c3878dbb3amr3549361e0c.9.1785761636335;
        Mon, 03 Aug 2026 05:53:56 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37eb0abadsm8595590e0c.5.2026.08.03.05.53.56
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:53:56 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-738a5cc517eso2350534137.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2026 05:53:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqlrbJipdc4OhYXroM5CID184H1NA/aARedKNflW0DwT17Hq3BEU83xRfPyRfWeMZci0em6bM+Wz04HX84hQuLOIw==@vger.kernel.org
X-Received: by 2002:a05:6102:6a83:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-75b2295c6d6mr7103654137.8.1785761305110; Mon, 03 Aug 2026
 05:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:48:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
X-Gm-Features: AUfX_mz7dUNKx_CkXmX2bBiqeRWfQJXaKympC5b4Q722_mZANMq2M_rTZsMnNYo
Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Michal Simek <michal.simek@amd.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Mon, 20 Jul 2026 at 17:41, Diogo Silva <diogompaissilva@gmail.com> wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
>
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c

> @@ -29,7 +30,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>
>  #include <video/videomode.h>
> @@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
>         .mode_fixup = shmob_drm_encoder_mode_fixup,
>  };
>
> +static const struct drm_encoder_funcs shmob_encoder_funcs = {

Nit: shmob_drm_encoder_funcs?

> +       .destroy = drm_encoder_cleanup,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Encoder
>   */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
