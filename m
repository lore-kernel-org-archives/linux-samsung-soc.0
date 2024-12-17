Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623441CD214;
	Tue, 17 Dec 2024 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421194; cv=none; b=sNTvJU7zK3bSZicnB7UnYtnDvUn+4r2CN3kmzBpcqmt5BcCpF/cR/tiyPkBBfaxomM9NS/EnCM396hwjMC94Xu3Y+Y4bfcXS75cLxBKAvQt8YFeqmGGmc+6b4e/ZvsT3FxzQVHMdz6702O0SsrrRB48HH/Vj8m4YD3HO0LbYBak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421194; c=relaxed/simple;
	bh=f7Df3D2mYSw4EuQDLRDjYSEZXbF66N6eFGfuaboyFb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYQPdLEn1StVF8EW4PK7iWYaNjeG/NtqtWxfmZoU2HXUtq6i8zI2jYyzhhthWixvWU0tFLP1FXOjxi3AZPEpjBF4uzOpvyKXUjt9n/cH5KdzX7KiqVTl/uwGG2IsgJjtvF6VOB47uJgA1Mmtphw5v7G3NCMnKOK/0phQ/3BEl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzSxKRGu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzSxKRGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D862C4CED3;
	Tue, 17 Dec 2024 07:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421193;
	bh=f7Df3D2mYSw4EuQDLRDjYSEZXbF66N6eFGfuaboyFb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzSxKRGumOzngVx8WU5ajJQJw3ytC8wVC5afCVitEYN1FSmnlzVvAp4Zy+67Kc/63
	 nPYBgpKCpHytRPZbb4naVy4pGsyTBAUGhoUQ6Q1XwAOrbBNtXYSrTpLvYWyTAhOyaT
	 gEA1mPKGnHzFpGcVlLpFvozjDhd8jRqNVXjN9n1q4s59+gBtO8tFqY/mEVjDs3m0h6
	 K6Oxyg3oPABTAUKfktuJug8D+GfWa7Ps0Jh2y0IIB6niDEPPPCEoNRqF/3H56Cn3je
	 Kr2bTYvyd3RS6rdUrlahRFTZHBjcX8qeSqJLaWI6nEVRKboRUl4V8EMz/fBQp5HA0D
	 lW2/QDGYI91cg==
Date: Tue, 17 Dec 2024 08:39:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: exynos: gs101-raven: add new board file
Message-ID: <2wyjctwn443oxl633qwxsxmyzqhinssrkoafgqhcc34tqgwnh5@ymrr57jxdnl6>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
 <20241216-gs101-simplefb-v1-4-8ccad1830281@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241216-gs101-simplefb-v1-4-8ccad1830281@linaro.org>

On Mon, Dec 16, 2024 at 01:06:29PM +0000, Andr=C3=A9 Draszik wrote:
> Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
> (Oriole), this is also based around its Tensor gs101 SoC.
>=20
> For now, the relevant difference here is the display resolution:
> 1440 x 3120 instead of 1080 x 2400.
>=20
> Create a new board file to reflect this difference.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> Note: MAINTAINERS doesn't need updating, it covers this whole directory
> ---
>  arch/arm64/boot/dts/exynos/google/Makefile        |  1 +
>  arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 27 +++++++++++++++++=
++++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot=
/dts/exynos/google/Makefile
> index 0a6d5e1fe4ee..7385f82b03c9 100644
> --- a/arch/arm64/boot/dts/exynos/google/Makefile
> +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> @@ -2,3 +2,4 @@
> =20
>  dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
>  	gs101-oriole.dtb \
> +	gs101-raven.dtb
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm=
64/boot/dts/exynos/google/gs101-raven.dts
> new file mode 100644
> index 000000000000..75fd34797fa9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Raven Device Tree
> + *
> + * Copyright 2021-2023 Google LLC
> + * Copyright 2023-2024 Linaro Ltd
> + */
> +
> +/dts-v1/;
> +
> +#include "gs101-raviole.dtsi"
> +
> +/ {
> +	model =3D "Raven";
> +	compatible =3D "google,gs101-raven", "google,gs101";
> +};
> +
> +&framebuffer0 {
> +	reg =3D <0x0 0xfac00000 (1440 * 3120 * 4)>;
> +	width =3D <1440>;
> +	height =3D <3120>;
> +	stride =3D <(1440 * 4)>;
> +};
> +
> +&cont_splash_mem {

Keep overriding/extending nodes ordered by label name.

Best regards,
Krzysztof

