Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8469522A;
	Mon,  6 Jan 2025 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736144662; cv=none; b=mVTXX3G34MCfPBn+PjHybfw41/Rw17qV1KmiYK7MCp5Gnut+3qnDu6moeS9dj6aHfRuaWU2Gl59FIjaAZR3PpI/IIS1ZdpKUwAlK6ezi+2mNPbS68ZUnHhEvFrF8rHuAWLET/hRPcc3zgkPn/lKBdt+YO7SEyEu+NcyMNlyjOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736144662; c=relaxed/simple;
	bh=YkgbAC5CRsMi0k47cxKMsJvrVQ6LTAH+bVM+P7Q90K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INHvJAg5lFgxawIXLg2+gMYWrZta9zlu8Qi7R1buur2udUulS+XPUryxKky+o4gQT8Auk/SklAhh7S/oNRVOZclU7tBTeWU8CT9wPVm32WJciJKY/lfgaOFcu1Nh8jsq0Vn54eUnFl9JPpZLZ02Jaq3RwS2FNJiknUyNluQJs3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYJCC9mV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYJCC9mV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA98C4CED2;
	Mon,  6 Jan 2025 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736144662;
	bh=YkgbAC5CRsMi0k47cxKMsJvrVQ6LTAH+bVM+P7Q90K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYJCC9mV/w1jdAb4p8E+RnPI0HLFJcyAN3GpVx9fCGmRbko/qfjKmJI5vivIrJHEs
	 ioyaM6rnpgtuDdGBgtQtsg7KANdPKUp/+LcGYgj15i47wMMC0LJUGTMqjoe4RKyVu9
	 KBvgGHZ0pyr02dGSRW+K3++rs5R8KmR6/XXZiIxoOHgKqFtprhl1pbhzJ6RasjylR0
	 UabTP5SrELU5qWwa0ZRUuTdlNzbOcM6Dn8GHFCfpijrrhsZADxVjgzNKk1Xw1AVgGg
	 3e0HCRYhLUKTZ7WucurRxIJcCMEAQOaTecjtmQEMdZcXsa2Fd/g8nB5fTN3+WSrNFY
	 2Nj3AaCXx6qVg==
Date: Mon, 6 Jan 2025 07:24:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
Message-ID: <lvi72dmucagm6cxotqxmvc2yjdin3dvumivrfxjcsth2djaf54@n3i36ul3zkvl>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>

On Sun, Jan 05, 2025 at 06:03:43PM +0200, Ivaylo Ivanov wrote:
> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
> index a01af169d..b7c1406f3 100644
> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
> @@ -9,9 +9,9 @@
>  #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>  #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>  
> -#define USI_V2_NONE		0
> -#define USI_V2_UART		1
> -#define USI_V2_SPI		2
> -#define USI_V2_I2C		3
> +#define USI_MODE_NONE		0
> +#define USI_MODE_UART		1
> +#define USI_MODE_SPI		2
> +#define USI_MODE_I2C		3

This breaks ABI and does not build. You still need also:
	#define USI_V2_NONE 		USI_MODE_NONE
and same for the rest.

Best regards,
Krzysztof

