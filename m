From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 2/4] dma: add dmaengine driver for Samsung s3c24xx SoCs
Date: Fri, 17 May 2013 14:20:49 +0200
Message-ID: <CACRpkdaGBjUfhfT2zCEeNmMh3KhouOMjKSB7H6_cu_uDM6cm=w@mail.gmail.com>
References: <201305111330.05046.heiko@sntech.de>
	<201305111331.25405.heiko@sntech.de>
	<CACRpkdaT195McX9NeccJYpmWbuYK-AZUTHr9AXKHnJdkf+Qzuw@mail.gmail.com>
	<201305152231.52423.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201305152231.52423.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, May 15, 2013 at 10:31 PM, Heiko St=FCbner <heiko@sntech.de> wro=
te:

> If I understand the writel semantics and the thread from you from 201=
1 [0]
> correctly, only the writel to DMASKTRIG mustn't be relaxed to make su=
re the
> settings registers are written to before, so like:
>
>        writel_relaxed(txd->src_addr, phy->base + DISRC);
>        writel_relaxed(txd->disrcc, phy->base + DISRCC);
>        writel_relaxed(txd->dst_addr, phy->base + DIDST);
>        writel_relaxed(txd->didstc, phy->base + DIDSTC);
>        writel_relaxed(dcon, phy->base + DCON);
>
>        val =3D readl_relaxed(phy->base + DMASKTRIG);
>        val &=3D ~DMASKTRIG_STOP;
>        val |=3D DMASKTRIG_ON;
>        writel(val, phy->base + DMASKTRIG);

Yep. That will drain write buffers etc and make sure all outstanding wr=
ites hit
the hardware.

Yours,
Linus Walleij
