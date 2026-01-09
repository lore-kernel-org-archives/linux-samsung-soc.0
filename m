Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762A2DAFD5
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Jan 2026 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950200; cv=none; b=jZQEV3YwsR9So/W4GdlnNWgJcNcJavB7vDtTUiC+pXQjadom1xy0Lm7kOhkLMGJ1U3WGOmh9qyrPl9jE9Sy5FnnwV1GECihgGKk90QGYZ5ciRIeIuo9XBo0hPBb5WKn5g3IHjYlH0LRrNU3/uINUw1Bm4wJJ4i0Blr4uk4cW4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950200; c=relaxed/simple;
	bh=E0edNL5B3rP6w3+T0Ub2/VKHaC3rr+HLeEDX8RHsn8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7asYaoeFzpDK/yYJwfzvid29gZTDLu0ZGn9FmonLgzqy+EUN/Bd0D/5487bLl6XJh11uGrFyqOE7LXnhXGXzfxc55UCWlSr8aJYviUhgQup+ftiyVnsltWSB7HF4qXDKWSVN2jqEyUwm/W+/js2izL8dq7CxBqQmTEYTMhfFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-888bd3bd639so33173636d6.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Jan 2026 01:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950198; x=1768554998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiQ5XxZuQA23XgqzTfwN/M3quzujtTsdQBOQmuJCqAs=;
        b=O9HX207fxUtCtHgywCNWnZ4GSvO+Znwr/4tGJfK4c8OLWm/d04LrR28WhkvSkdG6r6
         m8Moax83EtgSVoxFYlDeal0sPk6RRSZ5N8A/gvStNehyQN+jL96eDMngL+ieSilos1/c
         FiZzGvazHHQls5npNuyI8SiI17HcpZ0mS+MYUzmDTYAK7n3ZsZ/4ITbftMNh53X/l+p2
         CcjpqjNnNC4l3S4yYajdW+SNtkBOJW7/ZnsOtT1d4HGvyKneBGIrd2qGSQrvM+Fgu1EA
         d7IG655okaiBX+OYkOJZOfJYjt9wUE4jPb9p4Q36THcOheTZrTfuIMEKoUDoPfp0bdr2
         fpTw==
X-Forwarded-Encrypted: i=1; AJvYcCVOt+wvvnVZkPjmE5I5npVrnMy3XWsWnb/UVt05/UzFcHVnBGRxWOlz23Th9Sum+Gwnc6plsBxp8yQUR/X6j/B13w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYsn5vjH8eZXtgf7IOvO12NeZamd681nKvWxAmu6YoPAzn3Bzj
	j9FxCjfqyGAJZiYEukvC5/tahBXmK/qy5MeWpb6HcL9w2ukfAnkkxWH6j62xO2+jIV8=
X-Gm-Gg: AY/fxX7n5ukeB1mZBMKxbN2BMjujKGTQxO0IGVpcsEZc0YjxO/pi0kUv3iqXLhUE3nI
	OETdzUaIsnng1Z09FVROlKVOf3oBTok15HTW//si4D3ktSMPt0pGWuS1cbiNy8Pd2pXlhm9xAaG
	K2WAcIS/KbqxH1Dm4sjc3lwRHHjTRZUmw5RSdbmyKBCBw2tAvIwDAHvIw2kKB1EsMtMHHzVZIT5
	E1nEs/whB9+xBkZYU9LzV+LoOa4aGZeu34ER7GB9ZacVSU3W5gzMJ0iQagVP1LdtyG/dw3Uuz9u
	rK/qFAnb5fJa5uT3f0Gx0ADni2/JWO1NJMhY5E6EDr/pxOmQCVm2HuRhWIznIMnDo50IR/f4SOF
	6oKdutXf0OR187w8ZgAmqYj4UxqqQWO10O/Wr23GEnPCAXd72tTb4rqbzFnyELyBvCOxeMfGX9z
	SqcqyXTkPLfqNKZ3bc86X8ChmDLKFoJqWarn3VwO3C8JgOKsq+
X-Google-Smtp-Source: AGHT+IEhDZQg1ua17I4bziRV7XkEXKCEigfbYYsU8mHFAGPWscdZxpXN+k6F92CYF3n1MSDkL59u7g==
X-Received: by 2002:a05:6214:4281:b0:888:5a84:b5e3 with SMTP id 6a1803df08f44-89083c493b3mr137932246d6.8.1767950197793;
        Fri, 09 Jan 2026 01:16:37 -0800 (PST)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772346f8sm71401546d6.35.2026.01.09.01.16.37
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:16:37 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-888310b91c5so21447366d6.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Jan 2026 01:16:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAesdACihr7vG6KngHGmyKVc+7j3fcov+3HtNEq+86sCOxk+XRlYyiG43SNZi38fxjzgyjO4w69oQSntpJBCl1lw==@vger.kernel.org
X-Received: by 2002:a05:6102:2b92:b0:5dd:a0bf:8c89 with SMTP id
 ada2fe7eead31-5ec755c2d49mr4919224137.7.1767949880413; Fri, 09 Jan 2026
 01:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 10:11:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2B9sRmy-k5ucmo6WukvNFq3QqxM0BkB-qS=+-AP4M3Q@mail.gmail.com>
X-Gm-Features: AZwV_QjXHpmtcr0h8pnp_-HCv95C85A8pbrG70DRu5Hp0BWpB8DvCNd7K_eVFa4
Message-ID: <CAMuHMdV2B9sRmy-k5ucmo6WukvNFq3QqxM0BkB-qS=+-AP4M3Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, 
	Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
	CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, 
	Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
	Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
	Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, 
	Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, 
	Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
	Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 21:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/spi/spi-rspi.c               | 1 -
>  drivers/spi/spi-sh-hspi.c            | 1 -
>  drivers/spi/spi-sh-msiof.c           | 1 -

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
