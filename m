Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8B30B53A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696881; cv=none; b=JGIwl3J1wKCYIbCOaMgXE5l2FllEF0SRVYEuZwX4SBH9c5tXO2mhYm6dud1BQNQqLLFogI9ANr1Mtulj4bwntL5l5iKsNYUIKm62c2owX+QUiNsvSJhW2FTUjv1MAO2D/bv1HDVLlrvWNeOpzj6AK4LIW4XvqpTkeAZQbSg9n7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696881; c=relaxed/simple;
	bh=urVD1xPdaF3hV5GqXqVqTidMinFWi7P2lc2J0G3o7gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggY8+DOmy6kiDwy5UcgYTCCg/Beb2b87HmrzMDIfVF1yRealmKpwgSnXiufWZGZozQTaIK3CLa4Pf2zHRq4ITr1Mf+R2mztPSARwIYF8SoICPwxtV8J0+HMB63IBUSPjDdle5B5sKPoHY1u0PrHtDNdr255VSimrq77BN8TTNyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso1242493241.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 23:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772696879; x=1773301679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=Yt212NyxgC2MOHh5/FyjnhUTWXdgtXdljad8gMfGMKkFvasSJGu0q29ewUVj6JzOSg
         3eP/u7+VXHsPHxHPs8rruK0Vv8Yv/wQ8psKfQ/4QOKenpUeZItGxQ1wIE48OQ6wOQguI
         v+7sb//OMUqiVgNG6wL/bfWHQ4pkPeo0FsZQtZQxr/oU9F7b55CahRFHxiecMc8Bgy9g
         OI7Y3AXejh/lsAjheNN/c41p2h0u6/fNvNQD7cGcX0OdkQ4SWuBkxA0ajZoJ/oJvhlOP
         qpJONtQbbWaxrf6sKZQzuYQN0QQoNgNeYq8wCOIHjX1L2bvOsizb57HZ214S48bEgBOI
         SH1g==
X-Forwarded-Encrypted: i=1; AJvYcCWs21KZX605LxWo9OP0CETuyNKeetrT3mVlUrEgwakX64f4fA4MivI+ewua2z/cVOXSUibKY1hVC7/hPVtlm00RCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoN3AXXQgALGOXLtEgXnm3nfiJXvNhsDwLwW0tBPlL1fX3Owy4
	6CPL0E2fcMuwDpTY+EwdEB1IB74a9v5t45jSR96R04zB4W3bxy1hP6HaSzJkskhy
X-Gm-Gg: ATEYQzwiGPqIMrpDhq/YL4Mz2+CGeVMh6AlVLIiLTT0mD7RGGqF7kQohoC2Rb9SO75S
	FZMv479gBOw3ye5ItqyfZ94x7D1ns4o3deCqZCZRw6D5ZcKcPwq9m0Fta567keoseet+gEF7vd9
	N3kx/O9+ldusb4S77B24rPWTQrLPDfLbed2ZZ8A53kJ3Iiw2/jM1IKF1K2NIYfkdE2UdCnZu7pk
	WKP7tCEORQlSmKrhlL5Sy+jb4EZuCSzG+xOqXQeS+b88qoODliH3BqHg1H8oIi1zqw6WBT54CdL
	sRK4SLB2wMBmIWUZ3DEqnRC4vcfi2Zfpn5VJjAz1HVLu7RMP9a98dsvakUwYvc/SeLpnV7AdBj3
	SpswWOp0HD0V7mhAJ9x0aaO27gsTR+VYH3P7VSdozqk2Y6FUp+u2yM6KauKws0/BpWdR1raNAOs
	0f29+IBHw/JLMhqhUrzul2sng7Dv22uIBQzNnFj1VfHO9797QcXs87T/xm8hgIKWn187anuCY=
X-Received: by 2002:a67:ec0f:0:b0:5ff:bd9d:b1f8 with SMTP id ada2fe7eead31-5ffbd9dc40emr900707137.9.1772696879565;
        Wed, 04 Mar 2026 23:47:59 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffaca9c848sm4419015137.10.2026.03.04.23.47.58
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:47:58 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ffc1e25dc9so328418137.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 23:47:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxedG5Yl3AuGuFf48E8mIyeDtDq8n8kcqbxqk9YYYvLtMP9gxl0iyJP29pKMuEOqEF2cXjXvlqtSaOVhT9CeboLw==@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
