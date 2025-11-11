Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C7DDAB;
	Tue, 11 Nov 2025 01:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825172; cv=none; b=Lr/Xhd1GpdZ/tCLt4jRV4pdGxhjwPLgZA0rbKocVznzwKMFu4fJANykD0pFEpGjHbbwG8xdTjfSQiHVdTkTZQL4gbsRnHHmjSCUwVmvEFsFciDmTpGuNSQhQnpX8vUjCRoSQY2FfGTtd6FIxtZWc30lbN7MSZOfxt9KXSP8tWUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825172; c=relaxed/simple;
	bh=/hQhWs6fIWq4LVxZQYUO5IFlDz6QLmh4TLjAbavYSeo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mldEp7dBnA5A5z3OMNHBu7Nx0G7VSQncsttSZrgINuXz1gRKK/pgq5lS0wQJI73vhp2z4T4BFOO+/WV13qUhyo//9OsS2iYkpFt81RVEuSNXvh90dafRMXtIK7jg0Yy5VjZM0E0r2dcwBap9bku9kk0tSz2O6OuSWMtKQWsjyDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAvMRy35; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAvMRy35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBA8C4CEF5;
	Tue, 11 Nov 2025 01:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762825172;
	bh=/hQhWs6fIWq4LVxZQYUO5IFlDz6QLmh4TLjAbavYSeo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cAvMRy35HQERZPOVzojVm2TlYCAXBcctFxoIXTcorOoTfHhvEszBVwiGaW4gq9sPg
	 K54ZxzmczCK6gDw3qHe8OLHe9nRHasdiZOsDEtJ37UbUk9xOdUC+8F1YNIyjUNCmd0
	 I04rD7EV4VNWJxhwUbFAdRCf3A5VA194KT7VVk45J2Kn4fSjcBgJJc9aQMfWMsQyBW
	 jJB38dVKnn97s0AFhIqGXOADW1OoqnKgG4Y/N8m389F7NC2U99v4HzIO4vJK+5ES1b
	 as9LbCb9N3fMafkzcQ6f3dbcqsiX8RQKdQuYbMXqXz/AaRo4/K7oxyM7eL1JzTaNfD
	 JgzrJ/BuVi+yQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org> <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org> <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org> <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
To: Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will Deacon <will@kernel.org>
Date: Mon, 10 Nov 2025 17:39:30 -0800
Message-ID: <176282517011.11952.1566372681481575091@lazor>
User-Agent: alot/0.11

Quoting Tudor Ambarus (2025-10-20 00:45:58)
>=20
>=20
> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
> >> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> >> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8f=
f95e029c52436e5c7f 100644
> >> --- a/drivers/clk/samsung/Kconfig
> >> +++ b/drivers/clk/samsung/Kconfig
> >> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
> >>        status of the certains clocks from SoC, but it could also be ti=
ed to
> >>        other devices as an input clock.
> >> =20
> >> +config EXYNOS_ACPM_CLK
> >> +    tristate "Clock driver controlled via ACPM interface"
> >> +    depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_=
PROTOCOL)
> >=20
> > I merged the patches but I don't get why we are not enabling it by
> > default, just like every other clock driver. What is so special here?
>=20
> Thanks! Are you referring to the depends on line? I needed it otherwise
> on randconfigs where COMPILE_TEST=3Dy and EXYNOS_ACPM_PROTOCOL=3Dn I get:
>=20
> ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko]=
 undefined!
>=20

I don't understand that part. The depends on statement "COMPILE_TEST &&
!EXYNOS_ACPM_PROTOCOL" is equivalent to COMPILE_TEST=3Dy and
EXYNOS_ACPM_PROTOCOL=3Dn, so are you trying to avoid
EXYNOS_ACPM_PROTOCOL=3Dy when COMPILE_TEST=3Dy?
