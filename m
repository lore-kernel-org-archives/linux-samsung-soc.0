Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8262E8B6C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Aug 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755967854; cv=none; b=oxqfnXbuf6a5yNqtCV4urhQAozYKcx4IGkT/+b12otjRgAJFSoyq5okeh5Toil3XxM7lvknR3TDEt59VAgRXsbJ2LzH2jItrQu2l7uBVU90Yztnxefzfq1wUoDxRCMCQJ19Luk0JkcoC4FlZ/cf3eQziXiXqjEyuk5ZoiPLTt7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755967854; c=relaxed/simple;
	bh=ll4kgop1oU/2MiH1wKMG9HwPL4Ffv5IU0KbLcPeRX0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nRwkWdJNc2s/x7PVNaYoZNtMM9oMRn1uIw2J2bfJTmF4eVkPow6piPXKlUBYtT+nelm17iqX08hoXUWTg/zX4oSL25JZg7X6KgnzDhNqRqDV90DtjWdO6gu9w/R8iaVV0TVTId/Ul6Xx4eN/Yl5pOKBaWKdpQhv5pmiZTFXFF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGDVYWhB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGDVYWhB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6188b7895e9so473148a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Aug 2025 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755967850; x=1756572650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
        b=oGDVYWhBwVsCp4cNmgu01bBTD+4L+zo2PM5C9UJcBtUqELEXyXEuS4IZ4yS2WrT9Q+
         pnHCkG1JbKGVD+OmLNPp9fybkFEm10iMo5fzLIpfs8hn9PIaVL7j/lBpGhDWtHT1gQKa
         Uawi+jgN0QGXFI0WNcLsSwUbaqTupEnsDPme8UKLmt2bf4ljbxpeZxDCWq03at0lqWPl
         qQaWzDwBqINxq/Fj8wRRkFHubQMJlch3Lhqg0Mazx6CN2GEEpz4vDXVckSQBmhkl1cL3
         QYSo3z754V/9OldgP8FJKJjlMymNr1ncLCKDMO1LhAa+Ko3eWBW0N8BNHJak80TpIQz5
         3ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755967850; x=1756572650;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
        b=Otd+PjckQaFmuHN+MOwuJuduK8ivOBXmP2GzjJy5lsfXksIa9G2xy8VFMOGZh4QtNz
         M5TEjy9S784o9nsQzsgkrJGPuFnKIiOyYmUrE/7mqSzkFAT8EU/bakcKkoHTaGBJY9dt
         izqIxmABo8w8Sqk+QtPcxFTkhe0oZGZakRo+fa8mhi5y2dujmp52eqac4wMDazyP9pR9
         qC7wypFyIH1RB0bhzxURs404Kd02R5GnZoJJ8soyBCVbwpNsRI7AELzdt3N6bSQzAqWR
         XzUxmsuRwLGuAfwX0iuKe3pwvYASPuAJSd4ScuazrfaoxOBHki+RsrBQzY9v5HQY94PZ
         +9vw==
X-Forwarded-Encrypted: i=1; AJvYcCVpgHDbxdNmEiBLv0MosWoI/PDFQ4vo2OtSZtcFYf7CcjATEPpERteGKVNSSGZQzzgYeV60ca9UmtVGT+iRoBPr/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+i96Hbo9PhLBEIbT1mUMp4PTcwpZ2nUDRLDLnoOWvFZeYnyu
	esjf/jR1ZGMViSn1TT17k/BhIlU4ahav0BeTCEt4PiQPFR1+FSey2jjIDuYdpy6MP/Q=
X-Gm-Gg: ASbGncvjPTBigII7mkiT5GqOLr3a1JRwoNWaA5SZGTs1iydRumuSdfGmwC3Pt/GbjU+
	Rcg5ks5k4/HDU+hps8oi58++gV9BJq0K3joW3OHNUv1NwUhW/Q2YvySr/anZN92z9s7yxEtg9lS
	IfGXi53BeCvaxxGaLtAlfe/j0rAhMjCiLMAfC0SE2DwlJ069WsAD5wTAOPWzKUspc5RFDTkgp1K
	M9RyotSEI9Zn/cHTVdtP1I4l456iVYvtRWPptwvSU84x0RLCV7oWhr6ga3l5b3m8zFFgH0VqLUz
	uFuBbWWyd9tG9FXiSSlLZ89+Ko6mwFDdw8zQ8Em6DVOtYyMUVq+J/Bsa3A8EuUreo5qG45uaP/l
	MckXJhPtoJ66zTiFXwofx2Zuu2q3StFgSBF4uA2E=
X-Google-Smtp-Source: AGHT+IHjBstjuzxQsJVLkeGYHgOE3wWdKaHmumAPQvcdN50PYZzwBsMeGzXzhJUjnQCkGBQZZA30xg==
X-Received: by 2002:a05:6402:274e:b0:61a:927b:a79c with SMTP id 4fb4d7f45d1cf-61c1b703ddfmr2766014a12.8.1755967850448;
        Sat, 23 Aug 2025 09:50:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c312c4cdesm1797880a12.23.2025.08.23.09.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:50:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
Subject: Re: (subset) [PATCH 099/114] clk: samsung: pll: convert from
 round_rate() to determine_rate()
Message-Id: <175596784601.52468.3851559862193091574.b4-ty@linaro.org>
Date: Sat, 23 Aug 2025 18:50:46 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 11 Aug 2025 11:19:31 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> 

Applied, thanks!

[099/114] clk: samsung: pll: convert from round_rate() to determine_rate()
          https://git.kernel.org/krzk/linux/c/e278e39b014d789fb670695d422ff33c3ef56040

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

