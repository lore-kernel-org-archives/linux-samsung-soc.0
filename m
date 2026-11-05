Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870144;
	b=pAyvuf3jZk98ZHjHxZ3iejs3B2mEty/X1ntkC3Fv7VPtXWnJ6Y4Itk5cjaeCVdMqUdgy
	 m5xyAQr3LNqTxeVVMiGcmYW9uzaU2GMDyUbhID+UsXlJSVwtOxZZEwgUnVOomG+tojIOQ
	 s1E1GdzCD4whuwkR1ZkauwFTLcuXeUXCHt7hXTmQBPwQsRbQm8plco3UWlfuJOkyDRPti
	 gpugjnVZRWLNoRRW4vp8Kq7wqosEG0lC54TufQmI2NYr1Xdu5Cs0q2+k6kU6aCfoINPjz
	 JrzbjV2RPiC3wInCKNdWBdiItR3SSnQkzuzk4qZxfVAQsyXADcvxtarOUwgTucXWAWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870144;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
	b=ndzwliqOyJ97P0TVKpF8Uu81bAwkwc2b/xtCgPaz8xPaJe/SDx9yQDkkD5zuI84h2Fjd
	 EQ1MRTPeSjNPkODEB+v9v6+OvT73WRnE0fpbQbW+Nbbes8WDYT3ihhsKB5xEttAzIhLc6
	 dP6oHNSqcAIBKdQyfK2DRo0DLJrHg4g4FNpqFbrZ9De+ijl8N3WTPJhbPed6G2kES8thy
	 p/4Fzz8LymkpizJ3T4e0dZ6FSujqCgBdIDbrhf5K8t94doZocLXpbP9G0c7OI9R9XpTAF
	 NWgdhgHwYIco4rXdTuDjbp6Z3fW+Vtlywy09PGInpevhcpkbuc826Jz6H6KGF6Dfdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21AE606A326
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 09:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5364042eecfso22176731cf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 01:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870143; x=1794474943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
        b=I1rRVwEKbQpULxnImG/XcH/YcW9DGHEOViTNxCmprFGgds6RApLaoiVBFQ+1C1EmnT
         6ONVzgaYAWeEYyig3lDaFZ0i7/YjVbfKf4+9NthO2jbZkC+xpesGZBZLWZ3dD72+T/X+
         BstdpxNDmA8c9+EzPFIzhNSPyGCFDNtad7e2ryDiRX56EcPSUDWSl8xeNA+W0jIAw87F
         G+ZK3jZzGORODe7n5mTJh/cFsa4UEbI3QZ56b59iqo+Li/arhdXfP/5HTHe0+EAWGg9t
         /VskZH/IpdTfVOnSiCP5wljHLyF98Puvkqcr5yUkrhMYYT718bESl6lAFyKjYKyvFk9k
         BK4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8Wpj8C3HIpMisxRqce0D7pAngHk2WrCCHFUdjysZ8t2Qzq1Ieq0QleiPInj5vY3z9BeTgrNSKEeGBBolmphqvZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jTZ2ojTk+ANac1CBiY02rTlniRW55loyd+O1Yz2N/cRuqE5cR
	LFjBm6gaQhbZ0Ruc+rdI77tPAVY1GFbiyxZ7OgMlC5CPTDh8P/mfWsyz9xeTXwVgD+s=
X-Gm-Gg: AYBFou364FZKsYN/fBZDEPAEAHnK0JUULJbfbcTmIxJFmXqbhpqba7wQUcBVhTk0Yrj
	rbDqmouPWz+RqEATeydJc0EzUU+BH9M73aVdp2cBqT/YWgOxnUn/Bw36NrMpVnuLmgY9kdYCN4n
	/++Wv/4ZH9MfdgqHbQVOrZrSskJ3lxHtmeWKCK36iGm3mtFhNHMnS++s47TcVygBO6xl5Cv1qtU
	s59hPxFpnfudDS2ZjdwFPSRI5mhwMPxjhluNq7+vORV0VNyLK0sqW+M5Agdd/xZRoSxkNFTsojj
	2t59302ItS0rNu7sjq8lX0BhHfD7gMTiM2O+DNXt6zTzeFn2/prEYp6wPJR3o7wrbUzJNtqHMro
	spvqOZYCoNqA47kRkD/d3HxHe8RXaozjXA/U1QFBO3RZZg1pV0VeE879qa5salSPBggynOGQAGa
	qvdEjhsO1qXUf8vBsKlZTPw47MMj1LE/SLLX3tyEWzvCNvaIpQwcfLYFLEctYqcfv37KdnjF67R
	bUuc57nX+o4c09dt/XWQH1TnP2nVXG8U2R4FxVaFcCeGd7fgeP9eBxeLHEtlNZgl9aUdNgJMo/1
	Q1hYPTzagOKwAcEB2fIlD7T7f/JBcK0FSwHl7gbVdTUChIOr3pdZzhT/8YmlzNxeTqE=
X-Received: by 2002:a05:622a:aac9:10b0:535:a5f7:d586 with SMTP id d75a77b69052e-54ba24ee263mr48373371cf.64.1793870142562;
        Thu, 05 Nov 2026 01:15:42 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9ab6558dsm8616746d6.10.2026.11.05.01.15.41
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:15:41 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91c5e31bea9so22587366d6.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 01:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy/V+IusurPs4HbWEIfyLCC6eSlS0olacMkylzmzh/zvkM5FgxnWDhO73Jb7avyf3uvA2Qp3fAZ3ff/LWTifY2sgw==@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr9146730137.33.1793869733877; Thu, 05 Nov 2026
 01:08:53 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:08:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
X-Gm-Features: AclHuK-Joxo1A4dnmlO7hQLoxC6QCg3Be9nelvt7mgpbpsg01EIWZ9Dok6aJ4CQ
Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Cunhao Lu <1579567540@qq.com>, 
	Raul E Rangel <rrangel@chromium.org>, Yenchia Chen <yenchia.chen@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Carlo Caione <ccaione@baylibre.com>, 
	Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
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

On Mon, 2 Nov 2026 at 18:56, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across serial drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

>  drivers/tty/serial/sh-sci.c         | 9 +++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh-sci

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
