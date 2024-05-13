Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C7D81AAA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 May 2024 20:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715633498; cv=none; b=p59Zh4ray4QAcwHzMUUhlBXhJ8DLRKiN2kP9V4EGDYXEAxQh4jvjjwy2ahTHa3G4DeLSUN3c4LQPh4KW80Ejeunem+oKCgNigzEZ0wsbt4u3d7KMlm6OLZzts042s9kDECT4LGSg75J5DUnYWxCh8p5ixCm4+VbfKL0t3CWyCHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715633498; c=relaxed/simple;
	bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvJouICZQCtnzVgkXC3mwZ0twXXWBJZS/UwBpxiXVq5Lsyz+8sXSPr48AnI+FIWQwpwOmpTtx2+dBwrY2pFgy9b9d5W6fnCokmmrHpN0i+Z0z7jFEaDelhxYe87j9tzqVmAd+j1/Y7oq5Rbz5+jJzn50UBsSeyMvKSgcoX5T5yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SITGYBZc; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SITGYBZc"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6203f553e5fso50993207b3.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 May 2024 13:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715633494; x=1716238294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
        b=SITGYBZcGRltvTYKUw+xwPT3Qppw4Qwcf5qKHQoVeqBbdG/b5riNKV+SNKraBdZJm1
         SB1g7154H7STgV+k+FtLPO84psOs4roLrlEJz+6kBSYjH2TItTYjfgQeQ5Y8MypBNmh0
         sqlU9X+Gylc1bEuPK7s+XN4X7/tKpP25j0A+Q4gewtbkvAo9Xr3l3+LvjUIGcDm6olVZ
         O6/lrSNySBm495BniGMYQ+81Hg3fqXsOUzw08gw4MoZm9l96MVYiPWiLAv//cAjo2JzO
         +XK+3rd5sM8xI03g7ujqkafQdm68HVqPG3O+B+qy18PgS1rpcvD2a4CzdLdvKl/CRURa
         ALwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715633494; x=1716238294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
        b=HT76kd68raHUjy0j6HllhFcD0vgT28eI4hrv0RgcoCS/7JMphwFf6pMWAhHiL1Iwjz
         hI/K8tfyEv4zp2tF2cCw915zrL9tO12PZRyuYXR23OIjYYksifgK32Ehpj6jyUntJS3A
         4WwKBB87oZoyOLXWvy2vaA+p8isY0dVcGtAy1GxPOJkgXT7yIKhP2nS+eF/5+NGK7uKU
         qBx1Al/c1QDJX99LAKGtEtCgAd3LGzBjVzZR4Qnnv6nZ0HkNwTxaA97Z8UzF4lCEL/24
         OZC3cCK2+Dwtt288GM1JYUiqU16cc935COy97fKiXOTZg9slcF+dRPgHgYuFHmgck/w8
         92vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKapUplm16kaqFfPVd0+DpNRVqkYqj+ZB84MScshH0+JLXlnyp1ooOGF3D/dIOiy55dyCDIbM6Q7z8omr5KcCkK5FKIEmspnUZdzY4bomydIQ=
X-Gm-Message-State: AOJu0YxXhcKmPAaisFpLl7EapEetFjqGt6my1xgd6dtticlJdcctwK7d
	8GNp15t6m/cJdQNObq+9YBW3G96m+wYLDzY9cwRWclhvw/iVJ6fAak9sWG/b+KXM5Wh+hOzpY8l
	z8kTKl8ehXx09IGT21Q8cpimV3/rx0Hk2bWSoSw==
X-Google-Smtp-Source: AGHT+IHIMCINiS4Rm3W7vEHXnxoinnBVVMUXT21CaUFl/K9jprbEih1fz56tIA0O4ev2Ijok+dKJMkYRTsYw4QOpIww=
X-Received: by 2002:a05:690c:ed4:b0:61a:e9f6:2b1b with SMTP id
 00721157ae682-622aff774d9mr145019207b3.8.1715633492884; Mon, 13 May 2024
 13:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:51:21 +0200
Message-ID: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use scope based of_node_put() cleanup to simplify code.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Does this go into the Renesas patch stack?

I think the patch stands fine without the rest of the series.

Yours,
Linus Walleij
