Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB0187330;
	Tue,  7 May 2024 20:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715114604; cv=none; b=n6FLm3LG3gf5yvtbUTTZavNuoow19EBOTKSdFnlFO/HKTR6jrQeFIemG/j6Hetef75oD7qRjtu8Zqq6Y8BJvN3IZuFxJp7ZcOb8smSCcOU4L1PRjZV526FgpneTn9j3vKUBHzA8m45zj6g5JudhGpkv1D53VFCbcM4diz5asiV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715114604; c=relaxed/simple;
	bh=HXRsZkxS+ayWCNvb2KUtd+RjbkcIYEhK6dtv1mcsY7U=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=A9eT9H9VFxdSF+bEULdzORxnEi0WmhoLBEhWACQRdSGYcbK+xF2JFDq6dIfCawkbxSCDWq6iLaQUmw7dVTUvG12At9s7MJkVNhr0rv1E0LBmuaecdH/ierwbpf8cYgiLMyccJNujG/DolrVctTUn4ALWEWaAunoFGW3G5ALqtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MT8jwcyT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MT8jwcyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880F6C2BBFC;
	Tue,  7 May 2024 20:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715114603;
	bh=HXRsZkxS+ayWCNvb2KUtd+RjbkcIYEhK6dtv1mcsY7U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MT8jwcyTzSKWbb+y2Camk4Jqm6WK5lJDfWK//yqNx0NxtIdvOgU6UyiiIeBzo0uSN
	 SA8EJv3VAlxiAhS0zMrOLqpA5OwWD7RC/Ym4Vc+90vbU1reOgzeCXZXvelJfS4/8RW
	 e2VQzttr+cSVsqX0nw3Wc9t246ng+u19syJjOrKaKaJtYIYi0+K/rWChJgv/7QhQhR
	 8b+Djf9IkECGAkwW6nHyWmvpsQJuop2Z5BWX+bHZ2rxtagjBLZ3hjNy96B7T76wy1o
	 zHRFpkVViVP7+5Y1DBH7ieN2LM200vyEc+1UCfMCWJR9yvpbpe062LgCG1Fyu36HzW
	 3DONOBu8HdW2A==
Message-ID: <b3e320ecb16320f88d7db566be51b1e9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b1fd9806-3e33-488a-a5a9-a156a2c735d2@kernel.org>
References: <20240504120624.6574-1-krzysztof.kozlowski@linaro.org> <8bf65df598680f0785c3d6db70acfb9a.sboyd@kernel.org> <b1fd9806-3e33-488a-a5a9-a156a2c735d2@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.10
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 07 May 2024 13:43:21 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-05-06 22:54:10)
> On 07/05/2024 01:44, Stephen Boyd wrote:
> > Quoting Krzysztof Kozlowski (2024-05-04 05:06:22)
> >> The following changes since commit 4cece764965020c22cff7665b18a0120063=
59095:
> >>
> >>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/=
samsung-clk-6.10
> >=20
> > I'm getting compile warnings. Is there a pending fix? Also, why is GS101
>=20
> I don't see any of these warnings. Neither local (W=3D1), nor on my CI,
> nor reported by LKP (which reported build successes for this branch).
> How can I reproduce it?

I ran this command

 make W=3D1 ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- drivers/clk/samsu=
ng/clk-gs101.o

and I see the warnings. They're actually upgraded to errors.

>=20
>=20
> > describing clk parents with strings instead of using clk_parent_data?
>=20
> GS101 uses existing Samsuung clock framework, so that's how it is done
> there. There is nothing odd here, comparing to other Samsung clocks.

Ok. Is anyone working on migrating Samsung clk drivers to the non-string
way?

>=20
> >=20
> > In file included from drivers/clk/samsung/clk-gs101.c:16:
> > drivers/clk/samsung/clk-gs101.c:2616:7: error: =E2=80=98mout_hsi2_mmc_c=
ard_p=E2=80=99
> > defined but not used [-Werror=3Dunused-const-variable=3D]
> >  2616 | PNAME(mout_hsi2_mmc_card_p)     =3D { "fout_shared2_pll", "fout=
_shared3_pll",
>=20
> I see indeed some unused variables and I will drop them but your
> warnings are not reproducible.

Weird! I use gcc-12.2 if that helps. I've been meaning to upgrade but I
also don't see much urgency.

I'll wait for the next PR.
