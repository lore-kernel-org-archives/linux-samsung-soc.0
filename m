Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE11231AF24;
	Fri, 24 Jul 2026 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882324; cv=none; b=Ak6pFy2Pd9LRiCmsS8/SpCHmoKGX6UeNxEK8JhEZ/0Eagq/wDzj7SFajU17hJmh4LRQO3SzQEgTkoLMO611gA2Ig8tk8I6StiKPdB6oMrfRRfx5Bcjwwv68pw8ve3wZFgSpX9x7cqNkszSa5d+k4+wVer9oeijrQxlMRQxiCzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882324; c=relaxed/simple;
	bh=SZVhwNiEH1CuwV2Vs85aU3/mtsY5VfQNN2eR7Ldc7jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRXiytFgHNkVk1j7Pwc00ePFjKPekP7Nn3ZbsdgOK+NqJokLg97YstOJbKAfZuTmwowQhxgEkZfpY6nMh1qqIkvm3dhKvgHpMu0nqXgk46Ei3b8xcV6/MNBDUDd67WimtKoWdMTz4XrjcWvGJZ69aBaqa4le3qwcrvl5403RqJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gY/+jLHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gY/+jLHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFE81F000E9;
	Fri, 24 Jul 2026 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784882323;
	bh=uVePKTwmG/uGjReu3xLyTw+dzVY3ouI5ECuA8DRmP0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gY/+jLHsqKvcL4uPdwUutWf9iBATCxcgKiFSFolbYz3840vjoORZtVwzL6CaIjvvq
	 PXPneYEEnT0LT+sDtIuAqtFgZtbcl/6OF3qa4W4uK0Pmkcb070e78ilgg2LVLLLyGT
	 CksZ9exNK+kVnuV60ZfBHygyKD6hZ1FOfcjYjgs6Kh4cRm+mVYNkn9qSGC0vvg+n/P
	 XRsxd6N3il3XTmYUL/44rKC8ZrEf18kjGoZ0/b1RRy/OgPM6bgWzPeUU1+fld7x/Gm
	 FTiDP2iGmTdDBmbm0mVQGypZ8wzGMTrHa1T6IhMTHXCOlpZ7br7eYzd0QViCfCktjA
	 0TGiDDITMC9Ew==
Date: Fri, 24 Jul 2026 10:38:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos850: Add acpm SRAM node
Message-ID: <20260724-hissing-fascinating-terrier-6b754f@quoll>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
 <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>

On Thu, Jul 23, 2026 at 04:29:47PM +0100, Alexey Klimov wrote:
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 3881f573ec08..9a8d92aae9a8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -917,6 +917,11 @@ spi_2: spi@11d20000 {
>  			};
>  		};
>  	};
> +
> +	apm_sram: sram@2039000 {

Looks oddly placed, suggesting this is not part of SoC, but all MMIO
nodes must be part of the SoC if this is SoC. Compatible says this is
SoC.

Best regards,
Krzysztof

