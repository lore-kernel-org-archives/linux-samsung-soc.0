Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB824562B7
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Sep 2026 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247227; cv=none; b=AaxuzT9JtdHhqlVUbKPnVAQHCNZFFxi/otYHp5aXv/WzJGqrzap3xu/DtYK+tWYAjkwLBy7pVFncOZTC3uHALIznR26LlYxVxWprJm2B61nIlDvHs8p99oHW2mX1PO4ji7dWDZ1YHatwofLcuH9hWhT7gUnkqFwcQmFu3nOx0Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247227; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=at4mpgOVNonF3D442V7i2Xp8kgdGQu/mk0G3vL2k3WUfb7Z+ypf25BokRPdu9BNkf2UN/zJynenJ3EJKXR11kYWR/Wvpm6Sj7ooPwf/nc7MXIuVrSFD9WhvxXIHsblS4qav2quZlOzD33YNSfgmMco8t795K2P9+OY2D2yZdyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90ce08834feso60983896d6.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2026 00:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247224; x=1788852024;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=QTSqx4Nqy/E57i8egfGAHka7PK5TyH/6CapPsYlUMYOYlHeLpobgIAJr9baTjFvhXf
         a0pAo6q0hF8RwxR/JXlYt5DFUOU5hFJqfbKvsRYkJD30PC6YmXUa1h5goubvtYT6OZws
         Jfi3tV0YzPSZOGT59bZU3we1I59d7L+sU94ifEq8KjFLHXa/rPYcoO/aUrE2pHwC/3mZ
         iWR+k30onpqOIv2aHNNj7L27KDxSxCDlGxTBRSiVJ+mbqrGH2uwxRUIWAN91Y0nZ0NMX
         5JfPZWodp4YThcuvJwBB1mweZhYA2/Ymx17V/oXulRDvct2BwACz/h6yyQaIdlk+dvpj
         bqxw==
X-Forwarded-Encrypted: i=1; AKwUvBzCFnrEYykX8qhaIx4Gq1+DzFhXQzDe0duxheZZJIw+Sb4YbpbOfBgWvU6DYjRUosYXk9sYvGG47uFN/1an0S/yUg==@vger.kernel.org
X-Gm-Message-State: AFuF++k2V/IR4Qhl7MuM52tmSC6ErOXRbg3bxn0yR3G8JMina/3JC4UF
	GEC+p3gGZwxYLk3M4KDqqVePqVL77gUqXaeXqZE49C/VkVnKbcyySQiaYI6mIQOt
X-Gm-Gg: AYBFou3HMjl9sMNI9LxoaC/6YrB+QsVKFbpXa2FpPbsQoAYFdQBq+ghbQs11iEe8zpo
	rJqi9knLArFMHV/jKDWsCMBsTKcQtCTdIgKq4gQN1LPT3WVD4eWlkdndpX7Zvl/pS0Hp608gdui
	/hbWRBxY0i7UAKWsCW1tl1fya6D4KFOEW9R1XiiMo1qBhdClmRZZKV/gFiW5BsguV2GgN0yxppp
	yZtJhrht755l4JwmAxKLG1Hn9jMMOEGhJzmPr9omEMj9M4ld9Eq+feudtZ61DOWEYZpYzB+vp8P
	lcsQhLPuOFtl6ca6d92DdsC8amo3SY2qHeZsr0Wl058D28+VbmxUgeftjV+2cIl6UyoEaYdfAig
	9Ar49RYiTrUIHc6rpicY1x64dH7zdaZoyZiDJPG+d7cP8qyaIqdz+WQMpYD+IozL0vX+j8WIoZ3
	1MU3i/E7xTq3zeLBZr2g3E3C8JMVV9OEWn9BV6vxgywnVZjX59VvlrP1KW/hxx9kT2NEyiDxTJD
	8tLDIKYWI+hUP5UPstjRTBMAyzjmQ==
X-Received: by 2002:a05:6214:4883:b0:90d:3322:4e1a with SMTP id 6a1803df08f44-90d33224f33mr393808346d6.4.1788247224155;
        Tue, 01 Sep 2026 00:20:24 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9426378dsm16231636d6.11.2026.09.01.00.20.23
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:20:24 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9382fbb1208so464529985a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2026 00:20:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqTJ3oOWHm4EbHa4bwiEfsapmIisQnItXYPi8GbhgBcKzpYy0XtpuPjy3LYfdylROO87TXFgnDfKxVf/6hlV5H6iw==@vger.kernel.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
