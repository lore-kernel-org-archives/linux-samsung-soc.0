Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1275638DC61
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2026 20:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603980; cv=none; b=XJCUUyAlI7jRaVutnQtsEtDztDfqSwdrBEoIzJFGeyyh0GCJCatUqGYzCC/eNw+9Fw46Hkd50h5WRzBU6oLTUH7X5DwVljD267MrOvAjgYnXcQGnMMewkRDhrO0eh872OFEhEFs3Ul/xh5Aip02ZVbPXhOWLdcV9QmKSocW0fpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603980; c=relaxed/simple;
	bh=EVUwDkr+aRcYVofgEibvAtJX7CxRusSErPl1ti71pZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0t7sv3C7zUUXe+jZa6LIyYucVwCHObip8qgU/PwhLJRZgMlwTgrDUfYcvSNwPo6qiL1feALL7LS9oVDs3V6idpC0CDur0tQ7VKtoSBIxWf+AVVb5xMDmAJDH6Ve+GKtoVp+pzsPvHVIhwHbsX5aHA1dbTGvsOiIA29CLH6JaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op1PqS0Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="op1PqS0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4067B1F00A3F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2026 20:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787603977;
	bh=LEMIXlW7UB4hHdDf5XWpYKY9mKhf7DDvl0I5DYYVcWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=op1PqS0ZcwJX9065pz+7n7Mhcirj6eX3k7xLqlZ+ppKs9SUQjaRYatOf7zFET/tfn
	 ul80C8GWnGTALvbcy587qsJUwsDqASYiSFMYfHcPITUgCg3TZF48GkIuTKGWZKFR9M
	 4KN8Sznl1jMlE46rBL1TjVyK3aAD3CngSTThQG0+P9d0RdhdZTKci8rg+oXU2+Knhy
	 NbhSdxhVqpnJaSio1FP0K7pN0IwaOCStdR+sCf1wtsi2SseznQCBLMUxP19S9nO/9Q
	 MUef/TEDW6ujepu5thZa0JHNFheaGU558HmIHS4lCPCIS/Hkxb7SN9fJwNlrWxn60U
	 rLdy0en7BtOBg==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-45eddb6fdccso2196936fac.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2026 13:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqXax8OHNg/0jJlrJ0zd7KqdxtEtt9dyu949GbCXLrG7Cg4oBz1+cL6bFW5rdMUhwzWMLLLSJIFp+PK9RUSfqNwFw==@vger.kernel.org
X-Gm-Message-State: AFuF++nl2lUYOEESQza1HVPQOitk1KRFPJSUAXOAx3NVF5Kl+gYIkVJQ
	iDt/IEKYsHI8CIxYaBDPOYC96Zmfw6AjQSogdFP1cCdHemYygnp+XWn7ifOHhxqXpDZFn45yGMM
	qzdK7F0E+RfR6uilYCQLL8ntkgQAvCEU=
X-Received: by 2002:a05:6871:331c:b0:457:ed1a:9da3 with SMTP id
 586e51a60fabf-4644af0a69cmr1563335fac.17.1787603975698; Mon, 24 Aug 2026
 13:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <33f8a87834a75b6677894f1993c90f00eb6a2547.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <33f8a87834a75b6677894f1993c90f00eb6a2547.1787239813.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 24 Aug 2026 22:39:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLnWF5Y+=Dz4XxFyHqrxuOtGucvYLaqMGDNH4XoR1S+rrQ@mail.gmail.com>
X-Gm-Features: AcwNN1XmhR7K3AKRJKXT4Sd3qYlnwrUuNbhbfYVIv-485OoNG4okiQZloSgYvOE
Message-ID: <CAD++jLnWF5Y+=Dz4XxFyHqrxuOtGucvYLaqMGDNH4XoR1S+rrQ@mail.gmail.com>
Subject: Re: [PATCH 10/45] clk: gemini: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
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
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 10:53=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
