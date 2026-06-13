Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2C262A6;
	Sat, 13 Jun 2026 23:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781392360; cv=none; b=rjkmlzKIaSJVMJQEIe8aTLlKYhzgovdgoGFqj5YAUKkr2Gp6Q68qRKqcnWuXtoAEV0bWFwV25GgnB3xb153d4C15BKCT9M2Waz6PhfmcKYFIq7hWMaEdpBLSP30iSpziLFIhNOJF0Lq+8FngS1wDWcqlt7I08lF8H4+noKclxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781392360; c=relaxed/simple;
	bh=tSZFM29KLKrvYVoY/t9UgZxSvJhEo2Sk++9eqH//J8k=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LQ5pCGZSuHWCFvkOyEGf8bhWTa4GCwywEJweb11qARqrb/ajOTmB0WtT2k+gQ/26Wz1wWs1SEP6jEGRtgH2A3/BmkMpi39SqN8nQQylQFSoXQBKbyRlhaTx8ly1b4RWxZIwfQrokS1Bip3yFMv21cAhQn3POjLxqcwL2UPiR1V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/wUsrNo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/wUsrNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4C41F000E9;
	Sat, 13 Jun 2026 23:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781392359;
	bh=IY+WHHGsAnJN/4eY+iYURE+KdmDKPrPGJmVfcTioUBA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=S/wUsrNoxzrGp4EZRaGJAg2tNTOL2JXSB+ZUA42KKQJfBEXkPGbEqkd1+LVfStFTq
	 9rQ0JUcBUGVTX87cPIuJntEGLMupTB307UtnBHVRlEAzxc0BeCjux6hdwW/n1Mwdlf
	 XflDamQwfQsa+8CPaPq2Lv2vOKWMOXX4ghlBE4w8AIwa6ayWtUJZmRD7t+2wl1CA7C
	 fIA3+L2Sspkj2Pb8lFdzsWqO6XL3jZaKJpXcaFp/udgyO6dJLIzfwWUi2cmiFnbmph
	 mk/hZRwBaGUafiukCqlaL8hZFB6C+l4MVg5Vd3t5PamvZw+doFYJ9ry7Hc+Q+Le51L
	 Lgw/4Z8+Rtv2g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260604164729.83284-2-krzk@kernel.org>
References: <20260604164729.83284-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 13 Jun 2026 16:12:37 -0700
Message-ID: <178139235762.819343.11900802215889516024@lazor>
User-Agent: alot/0.12

Quoting Krzysztof Kozlowski (2026-06-04 09:47:25)
> Hi Stephen and Michael,
>=20
> Notable change outside of this pull: Peter Griffin was added as co-mainta=
iner
> to Samsung SoC and Samsung SoC clocks.  See also commit 20550601bf4 in
> linux-next and
> https://lore.kernel.org/all/178015858043.36212.8088079079471293822.b4-ty@=
b4/
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-7.2
>=20
> for you to fetch changes up to e11560b050ce867bd7d3ccea138231db54e2250a:
>=20
>   clk: samsung: exynos990: Fix PERIC0/1 USI clock types (2026-05-30 18:50=
:36 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
