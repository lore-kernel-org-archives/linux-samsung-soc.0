Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DA257452
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079386; cv=pass; b=B1gs0k18p6OtyVcGS50iLFcTgsbNy3NANFRb/d6ZLJe3d6Wvk3tbSaOl+aL4E3iqjR6Uazvag1zW5xacB1h2JCWsBoeNWKaCuCPKv0hhZSaxhAbIQ+EhmhpA15t5TV5CVi0X9M/MeD8tLtX1bon6bDswS1ON7AycnpsN6fmY4y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079386; c=relaxed/simple;
	bh=/rsvtot1H8oonankc8I/0lOyn+rcfdNAR9xvGxSRQNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9gQGz4DeI3YAG8ht1tGSXT0RmU8LVHAhgE8wO1tkd9Tcb1jl911XJWdDuVozjBcyWjO9ySuXlb7qEKaGds2pXb58EmIeC/zHkVED4JaB0usLr5AZcYV92RtYicMIHxIN8bHQ4TSHOhBbxoxAfrj7h6ePFi6e3ecY/v7bbUJtK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVFdvUIa; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVFdvUIa"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so12707262a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 01:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781079384; cv=none;
        d=google.com; s=arc-20240605;
        b=ckXZ93emjVqnaxKUyyYewNNm/paGzFqUfJAa4PAAgnT0kL2ZNwIH1A+hlUslyervZD
         gWnuIw5QcHQaX0kWn1UrN3zu2dXiYp5S4+LpNRBpGcC5rTKW332pbVHSYQRvc/PDMEqx
         7EvT2MWpqr0GHdobSmmhgSXsB0jSvvilweO0T+N8nl/WIQwE+ZKtazpQ3DA+9gloF1lE
         pLEt0kF3pFo16780SmFza5a47lUtyQX0Qwxd+/ygLW+nfDldbDWsWdE25cG3bwpz8tke
         CZ+Y+TSpV+pQOlIQE2K9m4MlKklX3ppVzqfHDHtunVhSMmcXtdruaJNJA/nUX8WFct2/
         PcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tHoPJkb7g+dCqec0zDKH8l5x9cBJqpDBFECmITAhpgs=;
        fh=RXPyUHFGoetJa1aO82hPTQEiDsF1C70AQe6laci73nY=;
        b=M0zzMGmTqiP1XeFMDv40frb2Q92Ibc0ibwxAiTEog6+2TC8ib/fiXT9B4Coela4kVv
         +ncP3msc+wHXq5ceDqY77BWcu33Fq3pCY51xDvwAlR5VlPDUhQqSowaOkJ2CYLk8Ejeu
         WOBKrEgpz0rsrK6Rnf0vNOmdTs6aDQw5SoWJYyGO8VfXQdQOVNm9gaPmhISAvixPqnzV
         trim8/OLDLvcEpX8QNb3yACFHDyKqVKOCX+SnFfCjJXbHObDoDc0bs+8SHlIgxi5Tx0G
         JgcFRduLkelXOpoW3JgPEAsC344SdPev6GFz4Lq49+FsUHgeMDx81nEO5ENQ+4Z9ITgp
         7vDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781079384; x=1781684184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tHoPJkb7g+dCqec0zDKH8l5x9cBJqpDBFECmITAhpgs=;
        b=HVFdvUIa6iq6mss3vnSp1pft3ZK4pOPJtG4J8UkvdD3/fJxiFB+D77sEu0kHm3V0WA
         LR9dgEhgDEKL9/dMk4F6RmqUUgIIMkpRo7wB7RoOKByhfVjZfkLU3B48T3qqd75amsQl
         avHZmtoHQEvqQKaO1ltitazhhiUpGufYzgKajiUVh37DLJKriGZOCBTkiaj9YP5km1Fu
         WKU5B5z7SCACZZzEFsyvpioAcZo2wRYuMffrrce/BdT77fSkaZQmKYOPkr/Reh7SlKvc
         q8F+5LTVe/JGCUKMjgKNyuDhdKAjL9DjBxBIP5cN9Ond7sfdPYF3UJK6r/Mwp9ffe5cB
         J4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079384; x=1781684184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHoPJkb7g+dCqec0zDKH8l5x9cBJqpDBFECmITAhpgs=;
        b=SdTBEAUyGMe2vRpeiJPSzxJ6ksYDYqP5fpxMDlzmf+h2E17tQEpdI8NjidlhSvc2op
         ehBIrlSOV5Lx/yafPX95I7yZURQJGgcGO7Yfp1vcloHN8LRHe8nWVJnXGXdbvHPjsrZ9
         5xIMYaK1+Z0+ZeUJt6w4KMyzfl0NlRjgzF5NYFeqfJeR2SCqXpukol1nZc/NdpYVfFXI
         kl8OUi0VkgQO8b5ydhVHKJC4CPmaCh6dC3XSWSernIGmNYqaFDZt3ysl+ubYDFIWxiF4
         lo46yKc+vWI0A3CxrmGvmx88JE+Bxy3W4+gdcOuRepS9CuK1YzBRFc0PAcVQT0iO949C
         aeCw==
X-Forwarded-Encrypted: i=1; AFNElJ8qH/c1tJCKdQzDTFykKOXuxB9RuePqoWKjhWN3OXY3dcxGjsgW0+USq02CajqAdLqM0mDP/A6kAc5t24OMsv+cZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDOsnF7ZRT+Ym/JZDcU9x3HElyVrb9i4vwVn0PgxFod+7at+wi
	iWv6b8RAl9+FecR6JuPIrNz+RZIBUHIs1f3iajnK802LnUhheDGC+H0uL7W1riYpaIgkTS1JH1Z
	1DZN96GaGtWqRiC7RKY26PVm9cpFi/WYpY8xLP30fOw==
X-Gm-Gg: Acq92OGvvadR6IaubXqBL+DKKUY7z+nBvhRgqWTjl+ix1NMuAHO3SjenJnk9xxtDcze
	AzPGXR0UwxYPWXCd6VrgEYNyuX9pw4dNmlEtkrkcN7VJpgHkE+CUaXEAqMajQblLuw9uc0nSH1S
	uv9k/uHo8mFUcSfsztuKpBXJRtb4rdcrKQ2ekSaNZEmy/zscVIIHB4PFCIHc2Qx8rAhSJr5dMPf
	/G+o4rZchVu8nIIldY2fazDGvG76wu+pv4AFukx5MTkC/Y1OLoCZ1XQT1IHFLETiXpKOK58BCK0
	yspKk6RedngHFPRJZJ7l5BuPSH5NN9bAATW1MwbAvNST7S25Gmkh9I5zq53ULtc=
X-Received: by 2002:a05:6402:364a:b0:691:52e1:646 with SMTP id
 4fb4d7f45d1cf-69152e108b3mr6650804a12.18.1781079383954; Wed, 10 Jun 2026
 01:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260610050337epcas2p1f6d27933f30ac063454fd25acbde327f@epcas2p1.samsung.com>
 <20260610050326.2903402-1-sh86.bae@samsung.com> <20260610050326.2903402-3-sh86.bae@samsung.com>
In-Reply-To: <20260610050326.2903402-3-sh86.bae@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 09:16:12 +0100
X-Gm-Features: AVVi8Cdmggek5VJwntYPdwBeIDAOFuLirE2SfZ_uo_NZy2DfGsDe0iwZglsDAY0
Message-ID: <CADrjBPqwJhhb5qRvrxyw0Y1mmf9AhaaJFJe9Tzuo+H1aBJ1zNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynosautov920: Add hsi0 syscon node
 for PCIe PHY
To: Sanghoon Bae <sh86.bae@samsung.com>
Cc: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, sowon.na@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 at 06:03, Sanghoon Bae <sh86.bae@samsung.com> wrote:
>
> Add the syscon-hsi0 node to control PCIe PHY power, PLL settings,
> and device direction (RC/EP mode) on ExynosAutov920.
>
> Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index 0bf7c4cb9846..cc3ed5c52ffe 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> @@ -1382,6 +1382,12 @@ cmu_hsi0: clock-controller@16000000 {
>                                       "noc";
>                 };
>
> +               syscon_hsi0: syscon@16030000 {
> +                       compatible = "samsung,exynosautov920-hsi0-sysreg",
> +                                    "syscon";
> +                       reg = <0x16030000 0x1000>;
> +               };
> +
>                 pinctrl_hsi0: pinctrl@16040000 {
>                         compatible = "samsung,exynosautov920-pinctrl";
>                         reg = <0x16040000 0x10000>;
> --
> 2.45.2
>
>
