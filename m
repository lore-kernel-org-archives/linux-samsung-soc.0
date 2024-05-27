Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE3616C84B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 May 2024 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814627; cv=none; b=si9ciVRi64/iyVn0X5tnKbtL2g1R7oQyCvQvLQZuGzk/ChG7V2cCL7BNf+fxrNMZtFnGjB/MCXSvS647qkYSsiuQrDd2htaX7Nwq9WfxFN2F+8Ckl7omk4+AGeMhLcoLdmLEletLj8acADJyq9WSqI4Wv1D9P7cykWEZvasjuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814627; c=relaxed/simple;
	bh=pJJyP+9frURhdd/ZV2qsiiwzKPVnn0nUZRG4Ztdu5Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SG7oRUEix8JIIq9k4mEjH4/v4uv9zEPNcpbRXB7AjyAjDSkbmo8ncOSf0X4+jVxlyNfThpzHPQtq1WFM+0F6AqRDBcjDrI3BANPoKa46ztNFhZ1yjgSRsw5Ha3en5RSmXlmhJ9HdmWpl7QIKWqsan81OV8hh4RTeF3wLmQVWEz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXCrQXK4; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXCrQXK4"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df7607785e9so3463625276.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 May 2024 05:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814624; x=1717419424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJJyP+9frURhdd/ZV2qsiiwzKPVnn0nUZRG4Ztdu5Ds=;
        b=jXCrQXK4vKKG3HNR2A3yrhA0N89JXaALNJNJZFifU5IcPmNHSV9/2cOI458EcoPwSp
         MS8tiPvxGlUeIzWn77Wc+B97UCTfQyJpY3/Wq7Y+34n5758vEvKc5NsGlqkOD4UM3jY2
         j3++z8nTL32t1NMfJR77W9ZbGD6s8Ho9b8sXjoTkCTBfwJ/X7deVNRLnfC7v8N2lDZfK
         R5D27pTTRyLCkRYZGQvBaVoczAp5THTkjy6iFgn2g3IuWau9JlRxwsw7wsJ3kdoSqueg
         WkEa+oKqAPIYXL2aQkmLYoo9zelMDkvpzcwN3Rf4Wgs1p32CJpmnoUP+Ahrw8+LQJdR0
         nDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814624; x=1717419424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJJyP+9frURhdd/ZV2qsiiwzKPVnn0nUZRG4Ztdu5Ds=;
        b=rThvtiFAUajkkT45NhhB68jAPmVIgI5FovKxpZcSVuSZdOMe7nEsq77AaK8zUo68Dd
         duRPCP7mRACYy40boY1Fz9Wbd8+h43kd+zkVF0e3cem0nNlVsvvILHqQeVmbMHIlcv2U
         VZgAfGMyhTEtkO+U/P4xE0PiX2uZqHs6osy4HM18928xSjZV365srFAS3CpPDFUtJJ2g
         AzzqodjbkDheeUpVqO9OtaIgnpPGxQXdxkQdMyu+iSRN89Mj8dEgZwB5YidZn43ADiME
         hZ0deWpOspoCwjFQsYR0TawE00efP2q8P8wrITykWFJiZzNNJKwivTd0XbrFMuA0xtPw
         FG4A==
X-Forwarded-Encrypted: i=1; AJvYcCXFWpH/QqJGSPCQRmcIBzPPwAPehyAf/ChmJUqBTKeEEEI+b5TwpnwsrYrGqXiXuC1jfattTO1I7REa3bmMy8hgG7m9eH7lf+ol29l6krwwP+0=
X-Gm-Message-State: AOJu0Yxb1eqiOgfj3rIpQKUpiGRvDumQ7XT5UrhMehtVdjx56oLhkzCP
	KqfAIQFPkhu+RhCVHBMQA/oUCa3RJxLUrwOM0TK3/2Kl3g9eZ7b3i6yqlNjS2/aSjkGx3iB+Uqg
	TZGficWluBQ9ULJ6o9MUC9V0vwLe1KjnD8cNO0A==
X-Google-Smtp-Source: AGHT+IHtuitKU1in514NtpJEfJGREAKzOXikcv6xhBvHaqSAyXXF4vYDUv/B437jXNYfH7CNGKFQFe5YOvThvoGTSqk=
X-Received: by 2002:a25:7486:0:b0:dc2:3f75:1f79 with SMTP id
 3f1490d57ef6-df772184c54mr8792593276.23.1716814624064; Mon, 27 May 2024
 05:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:56:53 +0200
Message-ID: <CACRpkdZ+YPAXTNU-kaA8ywBLW0RpGJBpXJqPD7aJ+B1V=axPrg@mail.gmail.com>
Subject: Re: [PATCH v2 03/20] pinctrl: stm32: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
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

On Sat, May 4, 2024 at 3:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Patch applied.

Yours,
Linus Walleij
