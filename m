Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBF8150997;
	Fri, 21 Nov 2025 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715886; cv=none; b=obUxbyZuv7zgp64WzCcxKrjSR8yQpWAQNn7175RdLASIP/qvFrHiDRH0AX46Us3HlxJmuXPwIZ7oeUsIHerB3VpAOb6WzpIz54JCS1bYWFG8UnXeBj1/yDIhKBJ/Ni24gUJ9oCAyqq4R/tlp58ovjMqn9lDc42aTXuntVFAlZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715886; c=relaxed/simple;
	bh=mdWTS0w+dAGnTqUEF31kZZjQuTijMBMD7hWA2qO2TI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFAcyoFfYvKll5OvAIgKt4+wpBVYUWj5bP6ml/nbR5KxIvSs2jsy2AWHVbp0an1c8evXN6vnsvR9sh+MnwD5Yq6kXBkCe1pRTz7vvZ5SrFD4egKlbEcetr16x9J/T+CTu+gEHKZuK+bbpk5MGeOuYX0eaSfRNH80t+hg/gsb6es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIK2C9bo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIK2C9bo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A1BC4CEF1;
	Fri, 21 Nov 2025 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763715886;
	bh=mdWTS0w+dAGnTqUEF31kZZjQuTijMBMD7hWA2qO2TI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIK2C9boupkzyp68FmyqtvUkEKe/Ewi0ktOCPLMi9UbgxO/K//IfYTREufWaHfGsv
	 iZF0+9eSbAnzORngPUNCSbA3QR9pIJterlw/LsSUQgADlXbSEYKsh5fsbke2ELyfhq
	 n1gmmFUpe30NvteBju0YUTkCsemAKUQcyfyNGaVwiB189bB5xkdvxx/4IxI61MWW3z
	 PeO/PQZq0xoulqPJxM0KFGvhxj+3/4HfFnC6vmq7oAQOxquBOBWgMBA/pOH9VaU4RP
	 1lH3v5vZvPQrmaqp2urqxe8OqMFWnH4rM4J7KKH1TIzr4bU0XDaX4V2PMDcZn9OO8R
	 pljPZAVfHWAdg==
Date: Fri, 21 Nov 2025 10:04:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ARM: samsung: Add Samsung Manta (Google
 Nexus 10)
Message-ID: <20251121-convivial-wren-of-wind-cefe21@kuoka>
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-2-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120144018.961604-2-linux@timmermann.space>

On Thu, Nov 20, 2025 at 03:40:14PM +0100, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
> 
> Add the Google Nexus 10 board to documentation.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index f8e20e602c20..97a5a678f43c 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -120,6 +120,7 @@ properties:
>                - google,snow-rev5                # Google Snow Rev 5+
>                - google,spring                   # Google Spring
>                - insignal,arndale                # Insignal Arndale
> +              - samsung,nexus10-manta           # Samsung Manta (Google Nexus 10)

Google Nexus or Samsung Nexus or Samsung Manta? I am sorry, but I am
100% sure that Samsung and Google are two different companies. Google
products use only google prefixes, see all other Google devices.

Best regards,
Krzysztof

