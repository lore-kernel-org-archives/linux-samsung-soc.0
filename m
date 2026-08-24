Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174CC404BD5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575748; cv=none; b=IvwlEhvRkOkime87O6TxGzpCYwDNhriBTetNmdADw5FOzOeUMFnKUvSAtWTQghQf9EA1OeTz9TcVt1mmJZY4oZGdYJfl+iRuW0WPs2Gw5fGPjOipemkq5YBlaWscnBldk8cBtvWPHkw4FHh7S7k4J40iQOv4nHnHZ2LSO6TF72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575748; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezCENO/NCWPrWrmqruDa0Ahkkz4GnhEOFW1XcggN8l4z8syPIjHTx/TnZrlpExjqbOkQnmCRl5uzRP9NlsGubaCkGTWc5Oz4UtN5gEYVEiVKfa1jZONL5DX/LZMYUmcdOcwPW8ooZA146+uGEAR40+ODUvSptUNVNKtEhl8dVDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66ce00575dcso4636016d50.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575746; x=1788180546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=me8OvEY6ebfRawKT4TgdX2/01T6xSV3E5kaDzopeMSH1tDowx3G5/B+FczZ2+7h/gM
         bW0wRiuJy2Jt5LwPNmbP3YEXzeLc8SjPRsnVh16znIzisv/TIgoFmZoNrI//8SqKTINj
         lYf9rYBWBWKvTgilkcddw66fue65k82BZzFWcneapl0RDsa7R9MZrXdxnsHZpZdQCCPz
         642ugJH5jvWB1V0X1loLeLEtv2b8J2W54EmubtCbMjFJ/5LMvN0rSg2sYARJ3jXvVp9R
         S3sLIKFc0jRtlxkKwmVItJJZ8u+kFlcrGBiZlWnj0HgvUuSxfMy1GfqotBzchOlfFJiX
         5c0A==
X-Forwarded-Encrypted: i=1; AHgh+RpVY+nxP9Qo3V9j8bCY1KwNDXE+6WXmAtXVedtxQvL9LYfNaUI5MtwAHWpx1Sz5rtP/1W3rihK4HfxDIQa05VbrgA==@vger.kernel.org
X-Gm-Message-State: AFuF++l8h3JMlICUk5hxKHWs9U3M68YIekLE8XRPXoWCG9qHe1mxMJ/I
	i/0ZkiwfOfF0mg6CVrN0qXMdZuwoVmzCRNZuQLevdXCTve4fN0bnY0J0oswp+/P/
X-Gm-Gg: AR+sD13QT0SnnsaNUB9tTT7q85CJKcVmlp3hZml2Mg9yBSNNofWDcUFxlxwkSQjGl9y
	DeYpjr16A7ck7smeUugPAxxKCxJ5xOiBXIPlzGljQGb1Zf1jHxeMQ9HYBAUP2fXhj47bfOO4F4o
	3k8ovhs+W3IeqnMWg6LeVlHlgRUa9XYTuSrIeQAa1L/u/H54qrRtVwJ3DujCKbQtcpc8f43jWac
	3F10UVBAMcWwbC3WnJ5rjY/R6p+RuOPK6mz1BieKh2Vq5/Bg+Nqzw98YKhYbmJyaBrnNfHGbf4z
	avuR7vG4SGYLbL9FZpjZ4Bnwwwk+J64xgtLd1PQsDG1SMMMxs1K3Cq+OQ3KutjF+zOxQUu0oDn1
	qWfp3a3Khk68RUnngO1p5vyNQe0GsEWru+TYhXjyY9oTSjSpDkMUwyVE+4Z3hfkHkdtLAvrh5RO
	heCHpFO5wklF09+8X/fRquVPgQ8b87BOUCaH/KUehmDWsVKlRXM51B2D3+uJcy73fmn9u2ZGgLq
	ceXLkMEj1j2MhkVy3Al4Hf8eg==
X-Received: by 2002:a53:b804:0:b0:66c:7aec:7d12 with SMTP id 956f58d0204a3-66ce4b4ab11mr6150317d50.47.1787575745780;
        Mon, 24 Aug 2026 05:49:05 -0700 (PDT)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com. [74.125.224.51])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66d0b2d68a4sm910540d50.20.2026.08.24.05.49.05
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:49:05 -0700 (PDT)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66ce00575dcso4635976d50.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:49:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr3CMt1XgKD827UF3X6qToAPDAGYa8bTH8b6WFyl+wYJG9ymwDO0Vg3s/B64uuI5U4gBTJ+i14sYQ0+E4IJ0masxg==@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
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

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
