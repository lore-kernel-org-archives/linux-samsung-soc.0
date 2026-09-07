Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE854749CD;
	Mon,  7 Sep 2026 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780562; cv=none; b=aUQEjcwa3P+mMg6NPOUE1bnHeEyWPjZRbbuHCdMIbK1KrVOXxhz0J7407Rtzmle4ThbR2SiSuNQADmJtkiBrPxlfrvlCC5s+22VP2fbtoGHf1yTwLBpNmKZmuH/ZJ+FHnyozXFiNuxSdlV82HXsp9rdme5kbpyA74+jZxZ1JZsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780562; c=relaxed/simple;
	bh=7kPWix+VaF4poh7BpAMhNhq0brLqKbyp9SLhP3V9jTg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JL98AaMsYxmNT9zS1bzV51he45iOs5792JpP0RvilJkC/9ps63wKvKjdNcu8b+6N7AeqmE8T7crSWhMGNj5nSSozSeWQzGa0DYkJSfMdq/pV1ew9tPhULO/ij9Rn1ZL9uwz1MpVTFPX9PeJ2xyufVifW0xIYeEV1qfHsE/69yJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=NccGulBJ; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NccGulBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788780552; x=1789039752;
	bh=7kPWix+VaF4poh7BpAMhNhq0brLqKbyp9SLhP3V9jTg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NccGulBJmA9yxm4tPEM5Zsk0ALt0JS4ENEHYrGqti698nE4mRX16x/JQKLmMWuXcZ
	 yZGKU5Av+ng42tNyYxHvpNzZijiIyY+XsClW98tLDzD5X7YLegge2Q+wgbjCJf6Yyv
	 0PkyNML6yOO4jfQmMUhtSvi/8o2bYdtrKcQFGdgXJUNoLN0GmubFcqD3vbY9hjw58J
	 UXK9ndz6mGpAcpweXE7GvDrlJVKS+gKwCU7Iv0y2WpWQ8TSqbJDlgd/ZvWH+k9WunS
	 xD02sqga0WLCWeZpPwrBmF/0mVLKAzgScacboIPtBt9KUrGt1i3aNoqTAWVc8B1Zxg
	 0DtuvoyYl0nKg==
Date: Mon, 07 Sep 2026 11:29:08 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Aiden Isik <aidenisik+git@member.fsf.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: samsung: Introduce Exynos5515 clock driver
Message-ID: <m3ip9ZfBNKnGPEYZflZKfrqFZWZrEiwuRzsbwnztko-nw6wYzySsj6ksAWMG7qZRqGMH2a07a0xDtZkyz1FJT4kAVArsP4SUAm_jEYBFvKs=@protonmail.com>
In-Reply-To: <69f1c866-a4cb-4b9a-8958-f56391655bac@kernel.org>
References: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org> <20260818-for-next-lucky7-clock-v2-3-cda0cc80f158@member.fsf.org> <69f1c866-a4cb-4b9a-8958-f56391655bac@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: d8fe420d46301c8e4dfb20e788485ea4e69c9316
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> You have checkpatch warning.

> CHECK: Blank lines aren't necessary after an open brace '{'
> #494: FILE: drivers/clk/samsung/clk-exynos5515.c:457:
> +static const struct samsung_div_clock top_div_clks[] __initconst =3D {

> Be sure you address all of them before posting patches.

> Fixed it up.

Sorry about that, I will make sure to triple check
that I fixed any checkpatch warnings in the future.

Thanks.

> Best regards,
> Krzysztof

Kind regards,
- Aiden Isik
