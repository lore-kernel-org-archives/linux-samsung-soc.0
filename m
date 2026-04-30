Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE82FD7BE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550411; cv=none; b=M/GQ+mp02iEQ5amyTFuD06sX2Xhf806yy3CKLcrk+DYywUdAlk/e0E3Sk+DBp9LXLlgpch/m60VSb/KADww4NKkzKGs1BN8NZOG/dd3hGargXKxUwT7ZumV0SOSNrrznKOBYxdnZcz1t904gcT6yxH5CfKQPP4JCKjJqJdU5/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550411; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLvy/oRrbxONiy6aN85fbE5V5PcxyE15y3AXJ3OmsSuo2sasgWzOXaOxNty5og3JShdF0Z3eWwgVK3nr+gRrgnVl7pOkhNR1j/IbqYmgDR/RI6Eu+yK+m5R/XG1j4iidJCA8nBeAjlpLXZG67yu+IjBrd6pSBzl8K6fMVR4Sn08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-60579e72ff9so574586137.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550408; x=1778155208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=XXitPONjgC/Ol7nIlim/u3Uf2iPeiISFyI/Ezxx4/FhPDUeBw5G5FSc8PWJcB+VGGI
         t8i3fme+ONWUKjsG4+rW5m5rSHx8/bEsb7n0nY1pHGBCIAgZ3/5d5cOnGXG8sZNb0LRJ
         bArpkxpQeXxoQApiIz1Xi5xegGUgm5uZD5LZcGBmKQFfIYilpVpJ1tDzqRI+Xs7AzuCw
         HW6X3IryNAo1GaPk0x0pbHWBmeB1PKEXuxzWBXvL0bJQOVVcRLH16pMw2wloB1T0u/pz
         EsKgNv7Phqa5P/FtzdUHqaCAvSScm/Bek3aLEbTGTKRusIzGVtrVtyXvD59gQUEc+0B4
         ENfA==
X-Forwarded-Encrypted: i=1; AFNElJ+1Ebq4PVqaROzQJGvKh6A9Vo+fXeavS9EdsKQ7znh1wkdvFpW7wZdaUxr7ElVO8UdvrkKiuhvuSdTfJsb+tV18Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd67hlyJoRsCYEWPE7o+gVDF8Ir3vchwy01z16StIKxKE4UI6t
	u45YhdQsL9bTn3lRgUn/R67bOP7pG1amF4Mhz6zQvVJqsAeReOVTPL+XhMRhM4P23+s=
X-Gm-Gg: AeBDieto8+QGhXtP2BNIsGkRezK1nKTapsXmMzjzyjIxgcvWMNhE1rsQZUVVe7qrL+6
	YnzgZCmR0NxPHGI1gTwUdCEHgyihR+8BjsBgLmHkTP9Ux9kP0un97c6bwU2j2EdbkOaaB7aQQKZ
	G9O0UkuniNB0RShO8CAZjsCj2pgEfFGyxXaSIj2BJXgBYmnaULHFnMRLAl6onzVuhq+QzMMIAMD
	POIzYkRTI3YcNToqvHhizGM6vL2cTOP/tVaUxXEOdjqSrF/blNiNJ+n31AGA7YBjxi18zDTIRcO
	2r7xTcNQ2odDOz/d8MXMuhB/4Mwnb+v7VC76nO+80GlhsqpnOgXYyoVqNTdKCvCArCzelQ6CA8w
	Tw/tFG+CDHHZpB+neDYVrBFBpQiI91UmUXFkCejZ0LjyU8+c7pjmITiU8yYGJPOncYXg9n7pk4c
	9bqNYTWZ81cvy3/BCDz7iF8kqOGyMyoQqU+X9Kyqe7rZWPR8NXjCJ2X3apUu6+zHjBBa80lxA=
X-Received: by 2002:a05:6102:290a:b0:628:95d9:9607 with SMTP id ada2fe7eead31-62afc506238mr631647137.2.1777550408261;
        Thu, 30 Apr 2026 05:00:08 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62982135605sm2844661137.1.2026.04.30.05.00.05
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:00:06 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-60fea0840f3so1197508137.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/b1dy2hK5XOgKtO63tasD7iwqMLyRzVA9kOjso3OyZchKXNvjX+5QkPZrXp2g0fqbH38/tFovZJQAMva5lM9nXog==@vger.kernel.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
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
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
