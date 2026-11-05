Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870910;
	b=EAn83W2t/rYpANHUoR+mHvAI0kTLjqdUwf+zenrvasP+SWwtCpu4wDw003AkKOX9jB58
	 WOz02WplaeTapPheE7l8eU2cXjaJBxHDCWaebmHePzOmwu28+h3ANZd+CSR8wTbnwfFnZ
	 7l6dugBWXdRB2TDfMuYGRiPB2cNvppCpr+0tBxDi8pRxARq4r6nCneWdfsWPj5aE4Y8xd
	 IxN1/qUdZOYJt0K/5t7Dur8Xa7FwhXn/euPGn7PgqXJ1fqixyeuaee7pzw0rgxQ+5TO1U
	 IgC8NiuISjB7b8j9qllBsVAag+0gA9/iQb0kcZd8ueK+esdbWAlTBR34QWejbY2omCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870910;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
	b=rmZY7+1+jWs/CJ7XcnSx435frr1M36lTuI2VnyR7z8SCrwMXeFKkF7vaiwbWNytElUKP
	 AtNF+sHlbFJgePWp6M8A3+xzS/Ve+J+VDMXCeathfH4S+Z3p+IioMp2BnUUCx6eiLIvRC
	 xqRyU6y8l1QpGLjd72xN08fHRsQ8JCqEocwn05DzF84aTx/X4Rtg/G2AXWTn0lj/zchce
	 sbZI6d1KcexMAHeteJPMr3W2V9ucXRAsIPHluynbh3UwObyeN/rPlz5gqGWj1ohuIDZ2g
	 9GcBunVMtP/k0zQH4fk44AN5Jg5H78YLQinYCcP812JXcJ1+87463Vnl0/Qu+K67CNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65408606A329
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 09:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65408606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91e7c847aceso14757916d6.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 01:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870909; x=1794475709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
        b=I4RgSYJbV2CcrmV1NqlcQ0UwvhrGRd9USozxoYF0bGTgp1YigP6j9EhMAb9xdCvwrG
         4DEK9PV5gccBbylnPY409u45KnHkVROvIdpP//pw5Eb7BdWGLS7dMAmutNXSa92Xl8kb
         1en0PaxpHKPq1EjQxR0VgaePoEtuytPrcdMZS9Pix5utEjxyMC6M4h764IEmzsugIFpL
         8th29yqZvhe6mGN0TCnj39qT9IpgJZDWogursPi2ZczD2ouBj1OVfk6MCstnCpEounWT
         OfCIB/DdNl6lWiLSx7O7rNPTFhboeh4WAQR7C/KYmldj6dm0Cvy8soR3QK2ymqKs6upr
         3I1A==
X-Forwarded-Encrypted: i=1; AKwUvBxGriST8Gb+EQbtZkXhS2OZhnzrp4zsZCv03ylXYKu9EVr3crhnieBcGmz4QV2RgmQxDxg8lc572+lLXr7he854UA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bOxBHj2vHHU8MG7eSC4KQdw1zO4wh65mRvbqqusk/tEWDjMsk
	DNLOCtKnksyjWA2GjdcsWecnDr2LGelqrbU+7PKbsTrdDYImavEr9umED+aY1UItnZo=
X-Gm-Gg: AYBFou2CEu2SPQOgsulctPBZNKE/HMVLfFHpxo20gYPjpDu5V5w0JkyADWD5sBNwaJP
	NigFdtS0sKj2JulqEdUIUgwEgz3fLP5DJpc86FquukOmfpqSG0ynPCoGV8ozc3DKMtqrrWDeq1f
	EUGbYAp0E/o9m4GfEcP3eTeMMwXWmXH0P6UED0xETyWVdIQMfz/kY9KWJUSL4hODWqY1YMUkEWq
	oyXnaMCNNHJkQ43Ee8U9XQvVdwQ8j74TosiWQydxzhRLL/P+DPWsFSzkzxHpheOsmv0qA/hADgb
	y8hn+74phR3hWMKjXF3YSbFppfUN+eQyOOpSfvqmr1KwYOFSscDm00ZtpKTQOtpr+odtzW/mr8K
	/8pk+FGfeZuu8IvYnrSmnBiM7wyNYr7yBCl3xSP7YFS32NNYadchGANyFcFj+b5wyHzDlzotxWc
	0tV+RM0d+pqsWgjiaZVGJk7a07731FsNETYP9TkbPUBXAkKuuSN3hI8PUXXU7JmfWxvR6BdZ0Dg
	2K7Dr3d5HMydWzqmoJM84J1QePjNCwPuYe8myvhk3VkusYbeGe5DEgeEbB9QdJXLu8n3Q8aEhD3
	8MgXijCNfevq1hkJO8ekGQXHac7XoLkJueBjjkXHmutaWu/Wzq72UGgUQwh5Skyc1A==
X-Received: by 2002:a05:6214:310f:b0:91c:61e9:7b68 with SMTP id 6a1803df08f44-91ca4b7ad25mr270368986d6.21.1793870909241;
        Thu, 05 Nov 2026 01:28:29 -0800 (PST)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e70f84dsm42796096d6.32.2026.11.05.01.28.28
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:28:29 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ea16d8072so110896d6.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 01:28:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxdktOvW+BHd1Qomi/d/EGArG3D0X3+drnIacFr7x3S2DAK882q7eeFHiW8j1wOOHeDkgF5p9ELGs7cpCCnagTb+Q==@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:7cc:1045:610 with SMTP id
 ada2fe7eead31-7d072cc4a42mr6604019137.27.1793870415083; Thu, 05 Nov 2026
 01:20:15 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
X-Gm-Features: AclHuK-9tAw2bAtaZucYUxK8rDds9GR808jJtyoj1R1Fxu-dNuDK-M2tP9yoLrk
Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Wed, 4 Nov 2026 at 16:30, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *

You have lost the "# Renesas related drivers" part from Wolfram's
review?
https://lore.kernel.org/all/auoQiuIm9FxdOrYl@shikoro/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
