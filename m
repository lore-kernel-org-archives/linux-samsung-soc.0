Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870053;
	b=B/0Jmq1AfxceAilfppARLND/vlud3b3fGdI5kMxsxC8O1miFdDumN42pk7NTwF5m/FTk
	 PknkkTUzXh82aGdUMJuhu0BZjsaoJGSAWQaW+2/D51RhZGhcH9IBoKsn3eoDdH4Prewci
	 nOeMRZPalO81ia0V7V6JUhBAN5SFsWWsB1rcSsXEmXuUVEUUVFCnLVBrcTlRK3HJM8Zy8
	 xu4joViBUPJpLJbuOogDKHOH1AQk60CN7jAnlxRpoAglbrm6jr9RyVCSw29JNbyl0XMPR
	 8gJejnfF1oQWRKkYv2it5sKr744sHw+0CQ0GgIi3JkcuDAJ3RiicciBfrz+Au0vkZsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870053;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
	b=Tll6yAKJM2XRM+QTEFlkLaEMyZx1eAQxvaM0lwmzcGpbiZgZ7GiFT8fmr+okCg+ujrfg
	 NYnKzDY0Phh9PlhlGNyg/cIIExgeWGZFCiRCUmYKQcuH0QbZzhukGRm6Gu6M8GxqvzT5+
	 4e8IY1Qq3t9Ynv25ZyyZT+INrCgi4defFKCWjlhtsEP5IfKIzlu+IALOxUbT8MkWdBv7S
	 O0U+tbMo90VCdrj+9ghXORZSsUiIm5KaGtQJMaHZD+mKnfZWOdr1jjo4tsNTficsGQWDj
	 pWoDEfmCqRMhwZZ5WHyn1HISgJ2EkuPdZbRiZGewoxHgQU3wbELhBogzi20XqpGKafw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD48606A31B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 09:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD48606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso954708137.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 01:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870052; x=1794474852;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
        b=BQ6HvmLLI1dFzSfcZg7D4+xC+5uCOq5z5Da4t9lz1HgDCsbfV3einezkuxe5IKl4Ud
         bXmPB/5fcrO5fuwZmLH7w04y7R6cUaEIarKjTMuKFB8jwYxPnTBdei/pZ19GXkCYA8pk
         73PZeEQVksCPsR599uqDABAu52qfvdJVCGHhqonhJEHN+MRQ35i6xD2foBoxsSWEr6WX
         haXbUtalXp5K+n/Q3Bgb3gSCYTFHMsaXc+9S3mjQqpxiQN+NnH/YWIYYE8lRxgDilHmV
         8WbBmG7O9qz5HiA01bIxXp6k3S6jgIB9mbPxxRZriKw5HF+JcchM4RXuw4+rwFjYSW70
         ezkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqi5RnsaJSBdfZwoz9tq/H8G9k6a6LYG3Nob70g2DgPcukAMq4Qdw+epf7/mcKUN2PRLHwe6BAjopxPgbxVPteLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zk26f/bAZ/P2OAoTHjRUBL9UrUlIN48uDv2vyvU2xrt/Ix8IB
	5nDkqnuOsB+yYswS9R4j/jhWEapDxSOHPY1EAvFCuns11XIdWHK7cFvSMNCTNauWa+4=
X-Gm-Gg: AYBFou3emhUWZyrJ4xVYSVqMHyXXeI4ImRbBHDhMPEmCZttJqsqu1I5cz9HvJJY03iS
	M/jzlLYuGubOFuW2X+nY5LjyYSPSkCV4+gRxkUWavFw8bWUdEcRJn48z8k9R434lPPUxM2Wtt+k
	ZecRGnEkajI46/ssiYOJr0DzCHQ34ky1X9guO1l4BeK9JKE1UlNUGs7uHQy1sYolhADjcgoyDZ5
	etkyOtzAC35jqB8qKwWJ57pR51Z4mN9dO7OBZaSml9DOgepZ2Rb2GsdLuIspkN599VIyCeLFCUA
	lYoCUka+MN0WFCOM7ipSGwNS+GJqijY8s35oMbmnuTb+ekjNHgfDA2K6bsSwDzDUop4M3Xsl4dV
	JIT/mMr9ZqzCTymGEctcpuGYvznA0yQ3DDflfvoNb2v0fRiJAqO8lO9yraYrJB6ZSZWRWbvTLHn
	QM0UF/NvOOKqU6JgYFTsy0qyWD6v+Zyo7R6U1XrSRRsnQ+SFR/D5sAy6rGGB4EQwzYwyBSEMRCz
	3NKYlsfkBEZXzqUZO/CHR3T8l4TlvG47v2B9jj3G0K1sWyoT+1kIemYjNmMkTQK3G1IiW3caQwt
	z4IpxHaJ317bOqLToTEbVtg7lLX7aadYLfuXjZ2I4BQqA6i0lfvvg3/kJWBp0bjM+Q==
X-Received: by 2002:a05:6102:a51:b0:7d0:65f5:2bab with SMTP id ada2fe7eead31-7d072d15aebmr8941831137.29.1793870051645;
        Thu, 05 Nov 2026 01:14:11 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d77c6esm3877441e0c.6.2026.11.05.01.14.11
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:14:11 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7bec5112765so1008305137.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 01:14:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxOAQl8ZTZZ7rX5U7ffeAGgb3H2RgOkpPn4NRK/LPU22+hkV51qZ5AJpzL+2DhongHCS4xODcXYhIDqSryOI2BCMg==@vger.kernel.org
X-Received: by 2002:a05:6102:a206:10b0:7d2:8610:3223 with SMTP id
 ada2fe7eead31-7d286103264mr1300643137.34.1793869578105; Thu, 05 Nov 2026
 01:06:18 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com> <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
In-Reply-To: <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:06:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
X-Gm-Features: AclHuK_EWQ4VeHP65pJfIPjcWj5wVVyn8PWm9OHeuqD-F_-a-ZgbZgStzpLwqQc
Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>, 
	Yenchia Chen <yenchia.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Sherry Sun <sherry.sun@nxp.com>, John Ogness <john.ogness@linutronix.de>, 
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, Robin Gong <yibin.gong@nxp.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu <2426767509@qq.com>, 
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, 
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kezysztof,

On Wed, 4 Nov 2026 at 18:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 02/11/2026 18:54, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Replace open-coded assignments to callback and callback_param fields
> > of struct dma_async_tx_descriptor with calls to the
> > dmaengine_desc_set_callback() helper across serial drivers.
> >
> > No functional change intended. Prepare to make struct
> > dma_async_tx_descriptor private to the DMA engine.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> >  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> >  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> >  drivers/tty/serial/amba-pl011.c     | 6 ++----
> >  drivers/tty/serial/atmel_serial.c   | 6 ++----
> >  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> >  drivers/tty/serial/imx.c            | 6 ++----
> >  drivers/tty/serial/msm_serial.c     | 6 ++----
> >  drivers/tty/serial/mxs-auart.c      | 6 ++----
> >  drivers/tty/serial/pch_uart.c       | 6 ++----
> >  drivers/tty/serial/samsung_tty.c    | 6 ++----
> >  drivers/tty/serial/serial-tegra.c   | 6 ++----
> >  drivers/tty/serial/sh-sci.c         | 9 +++------
> >  drivers/tty/serial/sprd_serial.c    | 3 +--
> >  drivers/tty/serial/stm32-usart.c    | 6 ++----
> >  15 files changed, 29 insertions(+), 58 deletions(-)
>
> ...
> I did not look at this code at all...

[...]

> Therefore:
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Then please add "# samsung", to make it clear and obvious.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
