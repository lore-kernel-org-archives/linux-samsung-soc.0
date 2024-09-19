Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98233D8;
	Thu, 19 Sep 2024 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726741264; cv=none; b=SIqamRuq7RWjcQRXG/N9soTmLbk5IPpUTUUXj9YiToeMvZ32CGB7FF39DnurVQzt8QZH3eMNhBU/Cxv8gysGYN1QXdU8QSfcyzCYPZMHM7G07Ry2A/28oTsjQI9w+6zzMd2Pab6yBgNUyIgx9r6AWOTCcxSn7nkfElvI3OzCEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726741264; c=relaxed/simple;
	bh=7yVbot+N/CeVkiDlQIKv8CrioNBnIRJgLn3YppEiVBg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=qEZLtDyZuHN3TN7Z85QJQnWFEtY9XPqyffvZsaXx4KywfJSTSdykJW/+SpRpgaypr6dV1r4WjeIxZZTuXZgp/zPbijTH1K7FCq8p84cZut9NJrS7VKqJBfwbj5WTZTn9BIvs5HAIG+jVIl/ZRPIVHixfm60x9XeyHVmi/MMtKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlJeoNSQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlJeoNSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667C1C4CEC4;
	Thu, 19 Sep 2024 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726741264;
	bh=7yVbot+N/CeVkiDlQIKv8CrioNBnIRJgLn3YppEiVBg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qlJeoNSQ59Vg3rRloBWA2IJdP5+o6EilofG92u3vVkgFWmRhLjUgiPNczv91WghqM
	 pykkRQGSdPwTd0QeLKqbqX/FsF5wBizJZevZ2cxGd+JG3M8/HLeu40w9jDmD0YRlYw
	 1vzvrZEQiz5nguJzeJSCUVzsPVZHww5ggi28ICpPydS2K2x3RHm5+uT1Je46cHs3o9
	 kGdyvPtNJdSCCnBDw3r7sDq4PTv+7AtVvmtk9rLd9YzlOAZ2r0NdTfqTxwHM0kLHg9
	 rETCpPevrVM5XZvR0bzcR8lyPjedIiDkETycZpltCsLFpF2vPXHjayw+kYu0tCIqvF
	 aT/doqJzq6iUw==
Message-ID: <0d43a00985a815c1869ebc6c441a2aed.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240917101016.23238-1-inbaraj.e@samsung.com>
References: <CGME20240917101102epcas5p3b17d2774cb74fd4cf61ea52fde85c300@epcas5p3.samsung.com> <20240917101016.23238-1-inbaraj.e@samsung.com>
Subject: Re: [PATCH] clk: samsung: fsd: Mark PLL_CAM_CSI as critical
From: Stephen Boyd <sboyd@kernel.org>
Cc: pankaj.dubey@samsung.com, gost.dev@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
To: Inbaraj E <inbaraj.e@samsung.com>, alim.akhtar@samsung.com, cw00.choi@samsung.com, krzk@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, s.nawrocki@samsung.com
Date: Thu, 19 Sep 2024 03:21:02 -0700
User-Agent: alot/0.10

Quoting Inbaraj E (2024-09-17 03:10:16)
> PLL_CAM_CSI is the parent clock for the ACLK and PCLK in the CMU_CAM_CSI
> block. When we gate ACLK or PCLK, the clock framework will subsequently
> disables the parent clocks(PLL_CAM_CSI). Disabling PLL_CAM_CSI is causing
> sytem level halt.
>=20
> It was observed on FSD SoC, when we gate the ACLK and PCLK during CSI stop
> streaming through pm_runtime_put system is getting halted. So marking
> PLL_CAM_CSI as critical to prevent disabling.
>=20
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---

Please add a fixes tag. Although this is likely a band-aid fix because
marking something critical leaves it enabled forever.

>  drivers/clk/samsung/clk-fsd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
> index 6f984cfcd33c..b1764aab9429 100644
> --- a/drivers/clk/samsung/clk-fsd.c
> +++ b/drivers/clk/samsung/clk-fsd.c
> @@ -1637,8 +1637,9 @@ static const struct samsung_pll_rate_table pll_cam_=
csi_rate_table[] __initconst
>  };
> =20
>  static const struct samsung_pll_clock cam_csi_pll_clks[] __initconst =3D=
 {
> -       PLL(pll_142xx, 0, "fout_pll_cam_csi", "fin_pll",
> -           PLL_LOCKTIME_PLL_CAM_CSI, PLL_CON0_PLL_CAM_CSI, pll_cam_csi_r=
ate_table),
> +       __PLL(pll_142xx, 0, "fout_pll_cam_csi", "fin_pll",
> +               CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL, PLL_LOCKTIME_PLL_=
CAM_CSI,

Please add a comment indicating that this clk can never turn off because
<insert reason here>.
