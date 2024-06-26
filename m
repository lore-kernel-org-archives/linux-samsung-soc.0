Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8BA178387
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719397344; cv=none; b=SquBAgX4A5nqdhc31NP4uDREqJFmdIgAMKvcG3n4r/i9W4M0FD9jT/whKYhUpcfTU1IpHjyffxVP/srE2Cwfc8Hwkc3MLMHmohfzMORh090TjIu11kvxsKjwN71CQ3+kFanSmQX9wLFdjB+u2oi33qDQzf6enVGjY7mUQkjJfns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719397344; c=relaxed/simple;
	bh=Gb6GkB0E2bOBZHPXzucf1AgqftAhJz2niE865GOBzqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C8ZucO+60eZweXM+mckfVzMOwAduz4AFyCE/UkrHGjmhF+D/V/mQtVUs3lYJl9whJH3IHe/warA6hDyGvwJC5GcU5YOToRuhwvxHv4uvgj17njwaYHlPNyxxaX9EPtJG8lTOhX4ScCl/LINSeokqZRncYyFrF1DVc2lRYG08Gvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qhAj6opC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qhAj6opC"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec52fbb50aso50370021fa.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719397340; x=1720002140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=;
        b=qhAj6opCTXIbTmipQKSqhmb288FxS9I80PEbTvkBC9rtNNHmUwTBzVRMEW3iIbJ2Dx
         WunP63fQbXp81ceWYbZbfIgPlZYGjjBYSi+LPgyPtdDvxc//hQpvtl+10nrBQOGRkYiv
         VPA/BsE1P6IcFKybQ+IFqlR3KodcuHTO5d25eVdjQXCkb7WHqetahyS38J6Dh7CpJTPN
         5zWN0AzZxVHCuNDnGtynxD6SfPJ0JQzwMwEC53S0aLa+WJMqHp7TwJuq06V4yChR+Dhv
         CiPrOGnlw7eaet4vcwtIETxso6mwxUBwHF7nX8N+ANajsMqsaR7u/LlyS8/XSOoAjaah
         oTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397340; x=1720002140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=;
        b=xS5aqHI9PfrZ4feqSTMefWmi5vKEVA5qmOm4A6Ej1BWFTjNT7Fp6bpe3HlwbLLJON0
         PFHjoI5NBjAB5XXZ5oNOPMKI9W7/BlmRHneMnTeb4Aprn0aLZNPQgGdLGLLKFuSoX3o9
         1vkjFNSfsgoxb+Jmz130GJ18DGCUwJk/l4gfJ/vfwvZPw+0naVZug4xQ69B/B/JY3Pb5
         DrwlH0vWNCjeSJLKbnyUucsEFynSyTSXWJNyki7S2sdhxMMSyC2CbC6L5R3wwj0G9QfP
         ZskVCFfAeHlkHPHO7atgGyZLAEURDwcZqHD3/hMDo/wKLaUc1BDWkBLf5MaHVjkIdxXO
         X1AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuRgHI9eA3yNWiHJeTE0nbU/92LpSHCAHzQp74T0B9Sb4eh+h7o8mjWT5g3NkEqNE82v5GF/8zCLjaaQ8weBkFfJeEd6F88YS0kmUz6P0jXks=
X-Gm-Message-State: AOJu0Yyxg6QzFJmpSbB1YW2URcJl+wakt37g9tK3JtJawPSXbiqAEyJ7
	q95a5ZrUYeclD9RCAC6mOIJwU7F4duMsRYHtn3IVbseH4TjbiWhjs+h65FcBcY0=
X-Google-Smtp-Source: AGHT+IF66geCJ+IDyk7DWlk8gVgabzMqbrOvnz5dxF4G+PQuP7P1Yu2mU/puCcrZCVWhA+b+phfFGg==
X-Received: by 2002:a19:6b03:0:b0:52c:dba6:b4c8 with SMTP id 2adb3069b0e04-52ce183265emr8209671e87.13.1719397340267;
        Wed, 26 Jun 2024 03:22:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245e87sm20498075e9.9.2024.06.26.03.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:22:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Tony Lindgren <tony@atomide.com>, 
 Stephen Warren <swarren@wwwdotorg.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
Subject: Re: (subset) [PATCH v2 20/20] pinctrl: samsung: Use scope based
 of_node_put() cleanups
Message-Id: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 12:22:17 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sat, 04 May 2024 21:20:18 +0800, Peng Fan (OSS) wrote:
> Use scope based of_node_put() cleanup to simplify code.
> 
> 

Applied, thanks!

[20/20] pinctrl: samsung: Use scope based of_node_put() cleanups
        https://git.kernel.org/pinctrl/samsung/c/707807f4c1128e39442519e849e4ce0b7c29b110

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

