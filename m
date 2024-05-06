Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A71E492;
	Mon,  6 May 2024 23:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715039094; cv=none; b=FskzDTkNPME2LwwJiIpVzSgXrvmZqUJFhxEoETBtwkmHUqow+mrGeuGiNyKL2qhGCFeAOW2CC2x3+2Tk2PMZN7+VXJkS3MlHmf5m6MVID/MvyyI22BhQM8uJVlZs3oWDFmrxTlDcblmLiopJ9qXsvw4x2AKDiDnIqccAVVoD1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715039094; c=relaxed/simple;
	bh=fjAM7qOrHG85nKhg8vYht4srwds7liybG2IP0RNQ1CI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=nSfE+Ww3aQQ10Kw/6k2S0qWETaNOA/o1JIgtGp5M0h1KkRcmp6vQn2WViY27KIMami4CgmbbzFQvZSbC4Qu/ZPX3sKZozDk848NG0QafzE+DnN7ATgEr/YkH0Yn8ABVwTc0Uw8pFVn3fkJMd4nvfLijWlIsfevkwLLpmmDb+IWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ucfcd1mH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ucfcd1mH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00023C116B1;
	Mon,  6 May 2024 23:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715039094;
	bh=fjAM7qOrHG85nKhg8vYht4srwds7liybG2IP0RNQ1CI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ucfcd1mHw7hYOVBbxoC1BAMvpjYe6ulbzGtYztswW1/QQN/QZtm70SFrNaYJ2JIwo
	 nbo91RQw95MjSzmYT5/jiJ+7T2AvisCdjZTEm+Oo9M5YQgW7zYW2NdiBeRwpgsXyqx
	 hPVEhWG9THBOPjoeRwzEOITEVnQMvRekilQQjzo9BjPWcZQAlju4FOxglGeWgK0hK5
	 PBkPMIacIQYKX0mr3O5izv11x7wGvw1bfSPeCXXRkEhdlHurdu19VjQP0FC36tyAVZ
	 RrUFkauBQxUXMqm+aLc5a5CtJFSyq9dK7oLvPWK+nLDbTmtPDve0mAAxvMXgHgsL4R
	 NTrIVOS19SOkw==
Message-ID: <8bf65df598680f0785c3d6db70acfb9a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240504120624.6574-1-krzysztof.kozlowski@linaro.org>
References: <20240504120624.6574-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.10
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 06 May 2024 16:44:51 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-05-04 05:06:22)
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.10

I'm getting compile warnings. Is there a pending fix? Also, why is GS101
describing clk parents with strings instead of using clk_parent_data?

In file included from drivers/clk/samsung/clk-gs101.c:16:
drivers/clk/samsung/clk-gs101.c:2616:7: error: =E2=80=98mout_hsi2_mmc_card_=
p=E2=80=99
defined but not used [-Werror=3Dunused-const-variable=3D]
 2616 | PNAME(mout_hsi2_mmc_card_p)     =3D { "fout_shared2_pll", "fout_sha=
red3_pll",
      |       ^~~~~~~~~~~~~~~~~~~~
drivers/clk/samsung/clk.h:236:44: note: in definition of macro =E2=80=98PNA=
ME=E2=80=99
  236 | #define PNAME(x) static const char * const x[] __initconst
      |                                            ^
drivers/clk/samsung/clk-gs101.c:2609:7: error: =E2=80=98mout_hsi2_bus_p=E2=
=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
 2609 | PNAME(mout_hsi2_bus_p)          =3D { "dout_cmu_shared0_div4",
      |       ^~~~~~~~~~~~~~~
drivers/clk/samsung/clk.h:236:44: note: in definition of macro =E2=80=98PNA=
ME=E2=80=99
  236 | #define PNAME(x) static const char * const x[] __initconst
      |                                            ^
drivers/clk/samsung/clk-gs101.c:2607:7: error: =E2=80=98mout_hsi2_pcie_p=E2=
=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
 2607 | PNAME(mout_hsi2_pcie_p)         =3D { "oscclk", "dout_cmu_shared2_d=
iv2" };
      |       ^~~~~~~~~~~~~~~~
drivers/clk/samsung/clk.h:236:44: note: in definition of macro =E2=80=98PNA=
ME=E2=80=99
  236 | #define PNAME(x) static const char * const x[] __initconst
      |                                            ^
drivers/clk/samsung/clk-gs101.c:2604:7: error: =E2=80=98mout_hsi2_ufs_embd_=
p=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
 2604 | PNAME(mout_hsi2_ufs_embd_p)     =3D { "oscclk", "dout_cmu_shared0_d=
iv4",
      |       ^~~~~~~~~~~~~~~~~~~~
drivers/clk/samsung/clk.h:236:44: note: in definition of macro =E2=80=98PNA=
ME=E2=80=99
  236 | #define PNAME(x) static const char * const x[] __initconst
