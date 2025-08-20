Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A447D284670;
	Wed, 20 Aug 2025 19:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755718153; cv=none; b=Zce824tFhf2C2UQXonFkZlByZkML6uYz0hG3tveTOYiJlgIHFmwRYX/4c/T+GSAC+rJRzz8/sOeAErlJfQ5M+Q+lwP1SfYWEJwnbq2+lzycm5LHmdP0HH1/jFshGw8jGpKF+52lrQZICNDoED+k3oFDn5tkP1d7EnBQj/fXPdrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755718153; c=relaxed/simple;
	bh=62vU8ilKaL5wsgXTzF19fFgYXyl0Lr33PmPL5Y9P+KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVnb36YCKKehC4AaIsxKNUVezvC/Qw6YFh4AxcyRWZ7z8joBUzE6ID84ApMdd8f60JJ029EiKOJfAqgh9ktatD0lmni0JBErXxInSHYj4tSX4IWvOGkQfmvsOVfbgocAcXE36XxQ8KJRsLa4WHZKUTy10MBs0UOZx9c0Ni3jRSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHy1PKyy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHy1PKyy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5EDC113CF;
	Wed, 20 Aug 2025 19:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755718153;
	bh=62vU8ilKaL5wsgXTzF19fFgYXyl0Lr33PmPL5Y9P+KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHy1PKyyEmAftGaOfX6w479yzXwJNnQ6GF3aS1orl1Pg23L3mekd95C67GTmmg1yL
	 MoeVt6g2iUxyLEjNh59p+7vn5AEiPG0rKlnai0og68XbqfOlAbgoSBJbRiY1LjIMUI
	 XJEVbXRx3DbiFzwkAp4P9nnZh3psAO82T8R3KmASOF+58tZ4pJCK//mB/+lAMOBBTu
	 gmF7vEiywWCA9gh8kD9l44F++mcD3MdCQE97Ye+1qqjl9JTsbxz3YvrtwyYWdV+ENh
	 zGe7o9EvKV+1UtpNAkz6rfq3FNVI/KDR3I4biCGWUjdGIBWl8Bt8X6UmYWzPRwJjBT
	 nxJV4oaVhzTsQ==
Date: Wed, 20 Aug 2025 20:29:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: exynos990: Reorder IDs clocks
 and extend
Message-ID: <20250820-diffused-impaired-ba776d39692f@spud>
References: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
 <20250820-2-v2-2-bd45e196d4c4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bnr8dC5IV+SmTfxS"
Content-Disposition: inline
In-Reply-To: <20250820-2-v2-2-bd45e196d4c4@gmail.com>


--bnr8dC5IV+SmTfxS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 09:57:23AM -0500, Denzeel Oliva wrote:
> Reorganize CMU_TOP clock definitions
> and add missing clock definitions for DPU and CMUREF.
>=20
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>

This looks like a massive ABI break, where is the justification for
doing it?

Cheers,
Conor.

> ---
>  include/dt-bindings/clock/samsung,exynos990.h | 402 ++++++++++++++++++++=
++++++++++++--------------------------------
>  1 file changed, 203 insertions(+), 199 deletions(-)
>=20
> diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-b=
indings/clock/samsung,exynos990.h
> index 6b9df09d2822f1c8e5086a2fc0bda783ca224812..b384e271bf276a375f67659fc=
84e53350ea73c0e 100644
> --- a/include/dt-bindings/clock/samsung,exynos990.h
> +++ b/include/dt-bindings/clock/samsung,exynos990.h
> @@ -9,205 +9,209 @@
>  #define _DT_BINDINGS_CLOCK_EXYNOS_990_H
> =20
>  /* CMU_TOP */
> -#define CLK_FOUT_SHARED0_PLL		1
> -#define CLK_FOUT_SHARED1_PLL		2
> -#define CLK_FOUT_SHARED2_PLL		3
> -#define CLK_FOUT_SHARED3_PLL		4
> -#define CLK_FOUT_SHARED4_PLL		5
> -#define CLK_FOUT_G3D_PLL		6
> -#define CLK_FOUT_MMC_PLL		7
> -#define CLK_MOUT_PLL_SHARED0		8
> -#define CLK_MOUT_PLL_SHARED1		9
> -#define CLK_MOUT_PLL_SHARED2		10
> -#define CLK_MOUT_PLL_SHARED3		11
> -#define CLK_MOUT_PLL_SHARED4		12
> -#define CLK_MOUT_PLL_MMC		13
> -#define CLK_MOUT_PLL_G3D		14
> -#define CLK_MOUT_CMU_APM_BUS		15
> -#define CLK_MOUT_CMU_AUD_CPU		16
> -#define CLK_MOUT_CMU_BUS0_BUS		17
> -#define CLK_MOUT_CMU_BUS1_BUS		18
> -#define CLK_MOUT_CMU_BUS1_SSS		19
> -#define CLK_MOUT_CMU_CIS_CLK0		20
> -#define CLK_MOUT_CMU_CIS_CLK1		21
> -#define CLK_MOUT_CMU_CIS_CLK2		22
> -#define CLK_MOUT_CMU_CIS_CLK3		23
> -#define CLK_MOUT_CMU_CIS_CLK4		24
> -#define CLK_MOUT_CMU_CIS_CLK5		25
> -#define CLK_MOUT_CMU_CMU_BOOST		26
> -#define CLK_MOUT_CMU_CORE_BUS		27
> -#define CLK_MOUT_CMU_CPUCL0_DBG_BUS	28
> -#define CLK_MOUT_CMU_CPUCL0_SWITCH	29
> -#define CLK_MOUT_CMU_CPUCL1_SWITCH	30
> -#define CLK_MOUT_CMU_CPUCL2_BUSP	31
> -#define CLK_MOUT_CMU_CPUCL2_SWITCH	32
> -#define CLK_MOUT_CMU_CSIS_BUS		33
> -#define CLK_MOUT_CMU_CSIS_OIS_MCU	34
> -#define CLK_MOUT_CMU_DNC_BUS		35
> -#define CLK_MOUT_CMU_DNC_BUSM		36
> -#define CLK_MOUT_CMU_DNS_BUS		37
> -#define CLK_MOUT_CMU_DPU		38
> -#define CLK_MOUT_CMU_DPU_ALT		39
> -#define CLK_MOUT_CMU_DSP_BUS		40
> -#define CLK_MOUT_CMU_G2D_G2D		41
> -#define CLK_MOUT_CMU_G2D_MSCL		42
> -#define CLK_MOUT_CMU_HPM		43
> -#define CLK_MOUT_CMU_HSI0_BUS		44
> -#define CLK_MOUT_CMU_HSI0_DPGTC		45
> -#define CLK_MOUT_CMU_HSI0_USB31DRD	46
> -#define CLK_MOUT_CMU_HSI0_USBDP_DEBUG	47
> -#define CLK_MOUT_CMU_HSI1_BUS		48
> -#define CLK_MOUT_CMU_HSI1_MMC_CARD	49
> -#define CLK_MOUT_CMU_HSI1_PCIE		50
> -#define CLK_MOUT_CMU_HSI1_UFS_CARD	51
> -#define CLK_MOUT_CMU_HSI1_UFS_EMBD	52
> -#define CLK_MOUT_CMU_HSI2_BUS		53
> -#define CLK_MOUT_CMU_HSI2_PCIE		54
> -#define CLK_MOUT_CMU_IPP_BUS		55
> -#define CLK_MOUT_CMU_ITP_BUS		56
> -#define CLK_MOUT_CMU_MCSC_BUS		57
> -#define CLK_MOUT_CMU_MCSC_GDC		58
> -#define CLK_MOUT_CMU_CMU_BOOST_CPU	59
> -#define CLK_MOUT_CMU_MFC0_MFC0		60
> -#define CLK_MOUT_CMU_MFC0_WFD		61
> -#define CLK_MOUT_CMU_MIF_BUSP		62
> -#define CLK_MOUT_CMU_MIF_SWITCH		63
> -#define CLK_MOUT_CMU_NPU_BUS		64
> -#define CLK_MOUT_CMU_PERIC0_BUS		65
> -#define CLK_MOUT_CMU_PERIC0_IP		66
> -#define CLK_MOUT_CMU_PERIC1_BUS		67
> -#define CLK_MOUT_CMU_PERIC1_IP		68
> -#define CLK_MOUT_CMU_PERIS_BUS		69
> -#define CLK_MOUT_CMU_SSP_BUS		70
> -#define CLK_MOUT_CMU_TNR_BUS		71
> -#define CLK_MOUT_CMU_VRA_BUS		72
> -#define CLK_DOUT_CMU_APM_BUS		73
> -#define CLK_DOUT_CMU_AUD_CPU		74
> -#define CLK_DOUT_CMU_BUS0_BUS		75
> -#define CLK_DOUT_CMU_BUS1_BUS		76
> -#define CLK_DOUT_CMU_BUS1_SSS		77
> -#define CLK_DOUT_CMU_CIS_CLK0		78
> -#define CLK_DOUT_CMU_CIS_CLK1		79
> -#define CLK_DOUT_CMU_CIS_CLK2		80
> -#define CLK_DOUT_CMU_CIS_CLK3		81
> -#define CLK_DOUT_CMU_CIS_CLK4		82
> -#define CLK_DOUT_CMU_CIS_CLK5		83
> -#define CLK_DOUT_CMU_CMU_BOOST		84
> -#define CLK_DOUT_CMU_CORE_BUS		85
> -#define CLK_DOUT_CMU_CPUCL0_DBG_BUS	86
> -#define CLK_DOUT_CMU_CPUCL0_SWITCH	87
> -#define CLK_DOUT_CMU_CPUCL1_SWITCH	88
> -#define CLK_DOUT_CMU_CPUCL2_BUSP	89
> -#define CLK_DOUT_CMU_CPUCL2_SWITCH	90
> -#define CLK_DOUT_CMU_CSIS_BUS		91
> -#define CLK_DOUT_CMU_CSIS_OIS_MCU	92
> -#define CLK_DOUT_CMU_DNC_BUS		93
> -#define CLK_DOUT_CMU_DNC_BUSM		94
> -#define CLK_DOUT_CMU_DNS_BUS		95
> -#define CLK_DOUT_CMU_DSP_BUS		96
> -#define CLK_DOUT_CMU_G2D_G2D		97
> -#define CLK_DOUT_CMU_G2D_MSCL		98
> -#define CLK_DOUT_CMU_G3D_SWITCH		99
> -#define CLK_DOUT_CMU_HPM		100
> -#define CLK_DOUT_CMU_HSI0_BUS		101
> -#define CLK_DOUT_CMU_HSI0_DPGTC		102
> -#define CLK_DOUT_CMU_HSI0_USB31DRD	103
> -#define CLK_DOUT_CMU_HSI0_USBDP_DEBUG	104
> -#define CLK_DOUT_CMU_HSI1_BUS		105
> -#define CLK_DOUT_CMU_HSI1_MMC_CARD	106
> -#define CLK_DOUT_CMU_HSI1_PCIE		107
> -#define CLK_DOUT_CMU_HSI1_UFS_CARD	108
> -#define CLK_DOUT_CMU_HSI1_UFS_EMBD	109
> -#define CLK_DOUT_CMU_HSI2_BUS		110
> -#define CLK_DOUT_CMU_HSI2_PCIE		111
> -#define CLK_DOUT_CMU_IPP_BUS		112
> -#define CLK_DOUT_CMU_ITP_BUS		113
> -#define CLK_DOUT_CMU_MCSC_BUS		114
> -#define CLK_DOUT_CMU_MCSC_GDC		115
> -#define CLK_DOUT_CMU_CMU_BOOST_CPU	116
> -#define CLK_DOUT_CMU_MFC0_MFC0		117
> -#define CLK_DOUT_CMU_MFC0_WFD		118
> -#define CLK_DOUT_CMU_MIF_BUSP		119
> -#define CLK_DOUT_CMU_NPU_BUS		120
> -#define CLK_DOUT_CMU_OTP		121
> -#define CLK_DOUT_CMU_PERIC0_BUS		122
> -#define CLK_DOUT_CMU_PERIC0_IP		123
> -#define CLK_DOUT_CMU_PERIC1_BUS		124
> -#define CLK_DOUT_CMU_PERIC1_IP		125
> -#define CLK_DOUT_CMU_PERIS_BUS		126
> -#define CLK_DOUT_CMU_SSP_BUS		127
> -#define CLK_DOUT_CMU_TNR_BUS		128
> -#define CLK_DOUT_CMU_VRA_BUS		129
> -#define CLK_DOUT_CMU_DPU		130
> -#define CLK_DOUT_CMU_DPU_ALT		131
> -#define CLK_DOUT_CMU_SHARED0_DIV2	132
> -#define CLK_DOUT_CMU_SHARED0_DIV3	133
> -#define CLK_DOUT_CMU_SHARED0_DIV4	134
> -#define CLK_DOUT_CMU_SHARED1_DIV2	135
> -#define CLK_DOUT_CMU_SHARED1_DIV3	136
> -#define CLK_DOUT_CMU_SHARED1_DIV4	137
> -#define CLK_DOUT_CMU_SHARED2_DIV2	138
> -#define CLK_DOUT_CMU_SHARED4_DIV2	139
> -#define CLK_DOUT_CMU_SHARED4_DIV3	140
> -#define CLK_DOUT_CMU_SHARED4_DIV4	141
> -#define CLK_GOUT_CMU_G3D_BUS		142
> -#define CLK_GOUT_CMU_MIF_SWITCH		143
> -#define CLK_GOUT_CMU_APM_BUS		144
> -#define CLK_GOUT_CMU_AUD_CPU		145
> -#define CLK_GOUT_CMU_BUS0_BUS		146
> -#define CLK_GOUT_CMU_BUS1_BUS		147
> -#define CLK_GOUT_CMU_BUS1_SSS		148
> -#define CLK_GOUT_CMU_CIS_CLK0		149
> -#define CLK_GOUT_CMU_CIS_CLK1		150
> -#define CLK_GOUT_CMU_CIS_CLK2		151
> -#define CLK_GOUT_CMU_CIS_CLK3		152
> -#define CLK_GOUT_CMU_CIS_CLK4		153
> -#define CLK_GOUT_CMU_CIS_CLK5		154
> -#define CLK_GOUT_CMU_CORE_BUS		155
> -#define CLK_GOUT_CMU_CPUCL0_DBG_BUS	156
> -#define CLK_GOUT_CMU_CPUCL0_SWITCH	157
> -#define CLK_GOUT_CMU_CPUCL1_SWITCH	158
> -#define CLK_GOUT_CMU_CPUCL2_BUSP	159
> -#define CLK_GOUT_CMU_CPUCL2_SWITCH	160
> -#define CLK_GOUT_CMU_CSIS_BUS		161
> -#define CLK_GOUT_CMU_CSIS_OIS_MCU	162
> -#define CLK_GOUT_CMU_DNC_BUS		163
> -#define CLK_GOUT_CMU_DNC_BUSM		164
> -#define CLK_GOUT_CMU_DNS_BUS		165
> -#define CLK_GOUT_CMU_DPU		166
> -#define CLK_GOUT_CMU_DPU_BUS		167
> -#define CLK_GOUT_CMU_DSP_BUS		168
> -#define CLK_GOUT_CMU_G2D_G2D		169
> -#define CLK_GOUT_CMU_G2D_MSCL		170
> -#define CLK_GOUT_CMU_G3D_SWITCH		171
> -#define CLK_GOUT_CMU_HPM		172
> -#define CLK_GOUT_CMU_HSI0_BUS		173
> -#define CLK_GOUT_CMU_HSI0_DPGTC		174
> -#define CLK_GOUT_CMU_HSI0_USB31DRD	175
> -#define CLK_GOUT_CMU_HSI0_USBDP_DEBUG	176
> -#define CLK_GOUT_CMU_HSI1_BUS		177
> -#define CLK_GOUT_CMU_HSI1_MMC_CARD	178
> -#define CLK_GOUT_CMU_HSI1_PCIE		179
> -#define CLK_GOUT_CMU_HSI1_UFS_CARD	180
> -#define CLK_GOUT_CMU_HSI1_UFS_EMBD	181
> -#define CLK_GOUT_CMU_HSI2_BUS		182
> -#define CLK_GOUT_CMU_HSI2_PCIE		183
> -#define CLK_GOUT_CMU_IPP_BUS		184
> -#define CLK_GOUT_CMU_ITP_BUS		185
> -#define CLK_GOUT_CMU_MCSC_BUS		186
> -#define CLK_GOUT_CMU_MCSC_GDC		187
> -#define CLK_GOUT_CMU_MFC0_MFC0		188
> -#define CLK_GOUT_CMU_MFC0_WFD		189
> -#define CLK_GOUT_CMU_MIF_BUSP		190
> -#define CLK_GOUT_CMU_NPU_BUS		191
> -#define CLK_GOUT_CMU_PERIC0_BUS		192
> -#define CLK_GOUT_CMU_PERIC0_IP		193
> -#define CLK_GOUT_CMU_PERIC1_BUS		194
> -#define CLK_GOUT_CMU_PERIC1_IP		195
> -#define CLK_GOUT_CMU_PERIS_BUS		196
> -#define CLK_GOUT_CMU_SSP_BUS		197
> -#define CLK_GOUT_CMU_TNR_BUS		198
> -#define CLK_GOUT_CMU_VRA_BUS		199
> +#define CLK_FOUT_G3D_PLL		1
> +#define CLK_FOUT_MMC_PLL		2
> +#define CLK_FOUT_SHARED0_PLL		3
> +#define CLK_FOUT_SHARED1_PLL		4
> +#define CLK_FOUT_SHARED2_PLL		5
> +#define CLK_FOUT_SHARED3_PLL		6
> +#define CLK_FOUT_SHARED4_PLL		7
> +#define CLK_MOUT_PLL_G3D		8
> +#define CLK_MOUT_PLL_MMC		9
> +#define CLK_MOUT_PLL_SHARED0		10
> +#define CLK_MOUT_PLL_SHARED1		11
> +#define CLK_MOUT_PLL_SHARED2		12
> +#define CLK_MOUT_PLL_SHARED3		13
> +#define CLK_MOUT_PLL_SHARED4		14
> +#define CLK_MOUT_CMU_DPU_BUS		15
> +#define CLK_MOUT_CMU_APM_BUS		16
> +#define CLK_MOUT_CMU_AUD_CPU		17
> +#define CLK_MOUT_CMU_BUS0_BUS		18
> +#define CLK_MOUT_CMU_BUS1_BUS		19
> +#define CLK_MOUT_CMU_BUS1_SSS		20
> +#define CLK_MOUT_CMU_CIS_CLK0		21
> +#define CLK_MOUT_CMU_CIS_CLK1		22
> +#define CLK_MOUT_CMU_CIS_CLK2		23
> +#define CLK_MOUT_CMU_CIS_CLK3		24
> +#define CLK_MOUT_CMU_CIS_CLK4		25
> +#define CLK_MOUT_CMU_CIS_CLK5		26
> +#define CLK_MOUT_CMU_CMU_BOOST		27
> +#define CLK_MOUT_CMU_CORE_BUS		28
> +#define CLK_MOUT_CMU_CPUCL0_DBG_BUS	29
> +#define CLK_MOUT_CMU_CPUCL0_SWITCH	30
> +#define CLK_MOUT_CMU_CPUCL1_SWITCH	31
> +#define CLK_MOUT_CMU_CPUCL2_BUSP	32
> +#define CLK_MOUT_CMU_CPUCL2_SWITCH	33
> +#define CLK_MOUT_CMU_CSIS_BUS		34
> +#define CLK_MOUT_CMU_CSIS_OIS_MCU	35
> +#define CLK_MOUT_CMU_DNC_BUS		36
> +#define CLK_MOUT_CMU_DNC_BUSM		37
> +#define CLK_MOUT_CMU_DNS_BUS		38
> +#define CLK_MOUT_CMU_DPU		39
> +#define CLK_MOUT_CMU_DPU_ALT		40
> +#define CLK_MOUT_CMU_DSP_BUS		41
> +#define CLK_MOUT_CMU_G2D_G2D		42
> +#define CLK_MOUT_CMU_G2D_MSCL		43
> +#define CLK_MOUT_CMU_HPM		44
> +#define CLK_MOUT_CMU_HSI0_BUS		45
> +#define CLK_MOUT_CMU_HSI0_DPGTC		46
> +#define CLK_MOUT_CMU_HSI0_USB31DRD	47
> +#define CLK_MOUT_CMU_HSI0_USBDP_DEBUG	48
> +#define CLK_MOUT_CMU_HSI1_BUS		49
> +#define CLK_MOUT_CMU_HSI1_MMC_CARD	50
> +#define CLK_MOUT_CMU_HSI1_PCIE		51
> +#define CLK_MOUT_CMU_HSI1_UFS_CARD	52
> +#define CLK_MOUT_CMU_HSI1_UFS_EMBD	53
> +#define CLK_MOUT_CMU_HSI2_BUS		54
> +#define CLK_MOUT_CMU_HSI2_PCIE		55
> +#define CLK_MOUT_CMU_IPP_BUS		56
> +#define CLK_MOUT_CMU_ITP_BUS		57
> +#define CLK_MOUT_CMU_MCSC_BUS		58
> +#define CLK_MOUT_CMU_MCSC_GDC		59
> +#define CLK_MOUT_CMU_CMU_BOOST_CPU	60
> +#define CLK_MOUT_CMU_MFC0_MFC0		61
> +#define CLK_MOUT_CMU_MFC0_WFD		62
> +#define CLK_MOUT_CMU_MIF_BUSP		63
> +#define CLK_MOUT_CMU_MIF_SWITCH		64
> +#define CLK_MOUT_CMU_NPU_BUS		65
> +#define CLK_MOUT_CMU_PERIC0_BUS		66
> +#define CLK_MOUT_CMU_PERIC0_IP		67
> +#define CLK_MOUT_CMU_PERIC1_BUS		68
> +#define CLK_MOUT_CMU_PERIC1_IP		69
> +#define CLK_MOUT_CMU_PERIS_BUS		70
> +#define CLK_MOUT_CMU_SSP_BUS		71
> +#define CLK_MOUT_CMU_TNR_BUS		72
> +#define CLK_MOUT_CMU_VRA_BUS		73
> +#define CLK_MOUT_CMU_CMUREF		74
> +#define CLK_MOUT_CMU_CLK_CMUREF		75
> +#define CLK_DOUT_CMU_APM_BUS		76
> +#define CLK_DOUT_CMU_AUD_CPU		77
> +#define CLK_DOUT_CMU_BUS0_BUS		78
> +#define CLK_DOUT_CMU_BUS1_BUS		79
> +#define CLK_DOUT_CMU_BUS1_SSS		80
> +#define CLK_DOUT_CMU_CIS_CLK0		81
> +#define CLK_DOUT_CMU_CIS_CLK1		82
> +#define CLK_DOUT_CMU_CIS_CLK2		83
> +#define CLK_DOUT_CMU_CIS_CLK3		84
> +#define CLK_DOUT_CMU_CIS_CLK4		85
> +#define CLK_DOUT_CMU_CIS_CLK5		86
> +#define CLK_DOUT_CMU_CMU_BOOST		87
> +#define CLK_DOUT_CMU_CORE_BUS		88
> +#define CLK_DOUT_CMU_CPUCL0_DBG_BUS	89
> +#define CLK_DOUT_CMU_CPUCL0_SWITCH	90
> +#define CLK_DOUT_CMU_CPUCL1_SWITCH	91
> +#define CLK_DOUT_CMU_CPUCL2_BUSP	92
> +#define CLK_DOUT_CMU_CPUCL2_SWITCH	93
> +#define CLK_DOUT_CMU_CSIS_BUS		94
> +#define CLK_DOUT_CMU_CSIS_OIS_MCU	95
> +#define CLK_DOUT_CMU_DNC_BUS		96
> +#define CLK_DOUT_CMU_DNC_BUSM		97
> +#define CLK_DOUT_CMU_DNS_BUS		98
> +#define CLK_DOUT_CMU_DSP_BUS		99
> +#define CLK_DOUT_CMU_G2D_G2D		100
> +#define CLK_DOUT_CMU_G2D_MSCL		101
> +#define CLK_DOUT_CMU_G3D_SWITCH		102
> +#define CLK_DOUT_CMU_HPM		103
> +#define CLK_DOUT_CMU_HSI0_BUS		104
> +#define CLK_DOUT_CMU_HSI0_DPGTC		105
> +#define CLK_DOUT_CMU_HSI0_USB31DRD	106
> +#define CLK_DOUT_CMU_HSI0_USBDP_DEBUG	107
> +#define CLK_DOUT_CMU_HSI1_BUS		108
> +#define CLK_DOUT_CMU_HSI1_MMC_CARD	109
> +#define CLK_DOUT_CMU_HSI1_PCIE		110
> +#define CLK_DOUT_CMU_HSI1_UFS_CARD	111
> +#define CLK_DOUT_CMU_HSI1_UFS_EMBD	112
> +#define CLK_DOUT_CMU_HSI2_BUS		113
> +#define CLK_DOUT_CMU_HSI2_PCIE		114
> +#define CLK_DOUT_CMU_IPP_BUS		115
> +#define CLK_DOUT_CMU_ITP_BUS		116
> +#define CLK_DOUT_CMU_MCSC_BUS		117
> +#define CLK_DOUT_CMU_MCSC_GDC		118
> +#define CLK_DOUT_CMU_CMU_BOOST_CPU	119
> +#define CLK_DOUT_CMU_MFC0_MFC0		120
> +#define CLK_DOUT_CMU_MFC0_WFD		121
> +#define CLK_DOUT_CMU_MIF_BUSP		122
> +#define CLK_DOUT_CMU_NPU_BUS		123
> +#define CLK_DOUT_CMU_OTP		124
> +#define CLK_DOUT_CMU_PERIC0_BUS		125
> +#define CLK_DOUT_CMU_PERIC0_IP		126
> +#define CLK_DOUT_CMU_PERIC1_BUS		127
> +#define CLK_DOUT_CMU_PERIC1_IP		128
> +#define CLK_DOUT_CMU_PERIS_BUS		129
> +#define CLK_DOUT_CMU_SSP_BUS		130
> +#define CLK_DOUT_CMU_TNR_BUS		131
> +#define CLK_DOUT_CMU_VRA_BUS		132
> +#define CLK_DOUT_CMU_DPU		133
> +#define CLK_DOUT_CMU_DPU_ALT		134
> +#define CLK_DOUT_CMU_CLK_CMUREF		135
> +#define CLK_DOUT_CMU_SHARED0_DIV2	136
> +#define CLK_DOUT_CMU_SHARED0_DIV3	137
> +#define CLK_DOUT_CMU_SHARED0_DIV4	138
> +#define CLK_DOUT_CMU_SHARED1_DIV2	139
> +#define CLK_DOUT_CMU_SHARED1_DIV3	140
> +#define CLK_DOUT_CMU_SHARED1_DIV4	141
> +#define CLK_DOUT_CMU_SHARED2_DIV2	142
> +#define CLK_DOUT_CMU_SHARED4_DIV2	145
> +#define CLK_DOUT_CMU_SHARED4_DIV3	146
> +#define CLK_DOUT_CMU_SHARED4_DIV4	147
> +#define CLK_GOUT_CMU_G3D_BUS		148
> +#define CLK_GOUT_CMU_MIF_SWITCH		149
> +#define CLK_GOUT_CMU_APM_BUS		150
> +#define CLK_GOUT_CMU_AUD_CPU		151
> +#define CLK_GOUT_CMU_BUS0_BUS		152
> +#define CLK_GOUT_CMU_BUS1_BUS		153
> +#define CLK_GOUT_CMU_BUS1_SSS		154
> +#define CLK_GOUT_CMU_CIS_CLK0		155
> +#define CLK_GOUT_CMU_CIS_CLK1		156
> +#define CLK_GOUT_CMU_CIS_CLK2		157
> +#define CLK_GOUT_CMU_CIS_CLK3		158
> +#define CLK_GOUT_CMU_CIS_CLK4		159
> +#define CLK_GOUT_CMU_CIS_CLK5		160
> +#define CLK_GOUT_CMU_CORE_BUS		161
> +#define CLK_GOUT_CMU_CPUCL0_DBG_BUS	162
> +#define CLK_GOUT_CMU_CPUCL0_SWITCH	163
> +#define CLK_GOUT_CMU_CPUCL1_SWITCH	164
> +#define CLK_GOUT_CMU_CPUCL2_BUSP	165
> +#define CLK_GOUT_CMU_CPUCL2_SWITCH	166
> +#define CLK_GOUT_CMU_CSIS_BUS		167
> +#define CLK_GOUT_CMU_CSIS_OIS_MCU	168
> +#define CLK_GOUT_CMU_DNC_BUS		169
> +#define CLK_GOUT_CMU_DNC_BUSM		170
> +#define CLK_GOUT_CMU_DNS_BUS		171
> +#define CLK_GOUT_CMU_DPU		172
> +#define CLK_GOUT_CMU_DPU_BUS		173
> +#define CLK_GOUT_CMU_DSP_BUS		174
> +#define CLK_GOUT_CMU_G2D_G2D		175
> +#define CLK_GOUT_CMU_G2D_MSCL		176
> +#define CLK_GOUT_CMU_G3D_SWITCH		177
> +#define CLK_GOUT_CMU_HPM		178
> +#define CLK_GOUT_CMU_HSI0_BUS		179
> +#define CLK_GOUT_CMU_HSI0_DPGTC		180
> +#define CLK_GOUT_CMU_HSI0_USB31DRD	181
> +#define CLK_GOUT_CMU_HSI0_USBDP_DEBUG	182
> +#define CLK_GOUT_CMU_HSI1_BUS		183
> +#define CLK_GOUT_CMU_HSI1_MMC_CARD	184
> +#define CLK_GOUT_CMU_HSI1_PCIE		185
> +#define CLK_GOUT_CMU_HSI1_UFS_CARD	186
> +#define CLK_GOUT_CMU_HSI1_UFS_EMBD	187
> +#define CLK_GOUT_CMU_HSI2_BUS		188
> +#define CLK_GOUT_CMU_HSI2_PCIE		189
> +#define CLK_GOUT_CMU_IPP_BUS		190
> +#define CLK_GOUT_CMU_ITP_BUS		191
> +#define CLK_GOUT_CMU_MCSC_BUS		192
> +#define CLK_GOUT_CMU_MCSC_GDC		193
> +#define CLK_GOUT_CMU_MFC0_MFC0		194
> +#define CLK_GOUT_CMU_MFC0_WFD		195
> +#define CLK_GOUT_CMU_MIF_BUSP		196
> +#define CLK_GOUT_CMU_NPU_BUS		197
> +#define CLK_GOUT_CMU_PERIC0_BUS		198
> +#define CLK_GOUT_CMU_PERIC0_IP		199
> +#define CLK_GOUT_CMU_PERIC1_BUS		200
> +#define CLK_GOUT_CMU_PERIC1_IP		201
> +#define CLK_GOUT_CMU_PERIS_BUS		202
> +#define CLK_GOUT_CMU_SSP_BUS		203
> +#define CLK_GOUT_CMU_TNR_BUS		204
> +#define CLK_GOUT_CMU_VRA_BUS		205
> =20
>  /* CMU_HSI0 */
>  #define CLK_MOUT_HSI0_BUS_USER				1
>=20
> --=20
> 2.49.0
>=20

--bnr8dC5IV+SmTfxS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYiBAAKCRB4tDGHoIJi
0o2PAQCH6LolsLhX7oqaS5is4/JSBOMmnqz9fvWsyTMyI9G5DwEAjEnHAIp6l9KK
OgbThI8zc3FNefN3dIhdaL4BMxWOSwc=
=7jJV
-----END PGP SIGNATURE-----

--bnr8dC5IV+SmTfxS--
