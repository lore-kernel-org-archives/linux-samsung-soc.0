Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F811EA8F;
	Thu, 18 Jul 2024 20:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721335585; cv=none; b=T4K+jogDxPd1ekZTjqhJmcsDlbE7tChk8xtofQ2xSI8IxbHSrM5ZAazvAmJ6AQW4KoNOh4gkv5YQppwe699j71hEZ4cw8DNG92tg0s4h8h9QBOluUr4XMfIOY88QPWKQio9sdlMP632MxmZdytmy3ji3IWDkKnlp1HVL2zC8XsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721335585; c=relaxed/simple;
	bh=9yimQRHRUTPo2oZcwm9RTNo3cYpIuKrEb/auYSKVsJU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=DbRw1ir3taKs6AIueOXeLL8Y/vtJIKy1r1aDsbKI5/ERlmP9osT9ur3+zHvjLeF9GoXk6cwQ67gpnKLUbpWGiIVDebp30SajTn/u/UZglCQGSedu8zfgunXH1A8a33Fl+VwF92tzwSpjmXXRw0F58+FOBCEk1RK1ZuQWdW1xbHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+zGk8fS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+zGk8fS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96B7C116B1;
	Thu, 18 Jul 2024 20:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721335584;
	bh=9yimQRHRUTPo2oZcwm9RTNo3cYpIuKrEb/auYSKVsJU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K+zGk8fSmoM7nion9JC3a7+euRmb5k0cEHLRSfOWE/YdSctUF1/p2fLIY1LCd+kZ+
	 XaQ7lSWrSrUYcx9L4VZU8g3WztiBELOnzA2u7VriDwyJrB9thigQ7iY1Ijyta5c49R
	 67K3vqO4A18W8xRSj1oae2nURewdvT+4afTzKw+r2UwJTkHy1J6iEOLiGLCFl7UqGl
	 rRCG2RmU4qoyuR9WoJdawPIYi1gobVNdiDthIwCNQBNSlNGQqOOoafClNKBcUBshoP
	 VqXrovTVNHKqJ7G09TC9tQ6OYpLOQS0dSwAkwdS3H2cRoMIRFM+Xg+Q0mP0g/zNZmg
	 +IIVVkhhg1AGA==
Message-ID: <c2c2b51d30f551bf8a9c1fb6507301bb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240712-gs101-non-essential-clocks-2-v4-1-310aee0de46e@linaro.org>
References: <20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org> <20240712-gs101-non-essential-clocks-2-v4-1-310aee0de46e@linaro.org>
Subject: Re: [PATCH v4 1/2] clk: samsung: gs101: allow earlycon to work unconditionally
From: Stephen Boyd <sboyd@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter Griffin <peter.griffin@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 18 Jul 2024 13:46:22 -0700
User-Agent: alot/0.10

Quoting Andr=C3=A9 Draszik (2024-07-12 10:09:43)
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index 85098c61c15e..429690757923 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -4381,6 +4386,99 @@ static const struct samsung_cmu_info peric1_cmu_in=
fo __initconst =3D {
> =20
>  /* ---- platform_driver ------------------------------------------------=
----- */
> =20
> +static struct {
> +       struct mutex lock;
> +
> +       bool bump_refs;
> +
> +       struct clk **clks;
> +       size_t n_clks;
> +} gs101_stdout_clks __initdata =3D {
> +       .lock =3D __MUTEX_INITIALIZER(gs101_stdout_clks.lock),
> +};
> +
> +static int __init gs101_keep_uart_clocks_param(char *str)
> +{
> +       gs101_stdout_clks.bump_refs =3D true;
> +       return 0;
> +}
> +early_param("earlycon", gs101_keep_uart_clocks_param);
> +
> +static void __init gs101_bump_uart_clock_references(void)
> +{
> +       size_t n_clks;
> +
> +       /* We only support device trees - do nothing if not available. */
> +       if (!IS_ENABLED(CONFIG_OF))
> +               return;
> +
> +       n_clks =3D of_clk_get_parent_count(of_stdout);
> +       if (!n_clks || !of_stdout)
> +               return;

I don't see anything in here that's driver specific. Please move this to
the clk framework, hook something like of_clk_add_provider() similar to
how of_clk_set_defaults(), and have it look at the of_stdout node for
'clocks' to munge the clks in the core framework for the serial console.
