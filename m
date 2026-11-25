Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605269;
	b=eMhmkTG4lCECcGB8RrQDEvpTwd9dnJSizDTyW1LKaDjheTMVrcQuOVMKc4LwSg/B6Gt6
	 vaURyBnnlNJ2aZpjB+JuYUZ8E1X9EJYBP1bXj3fRUs0cjYr9BfT6cNqoPOgghZFmZ6iW/
	 uPrKQFdjvoxICAccLsFgIiejhJyawoYm5xQ/awPLChENCdUkCKPa2StbX5+Wj8IVsj8qf
	 ShgUfcEv0IMNMoL2LbIpURHJBmS0wB+nyQJS1WmlCAqrSirg49FyvjCnPsb/ChYr20b1Y
	 WVca5X0i56yFcRlPGXo1Qgm5cr9xDQPk5nKGFqh/KSaWuXvhk2KMC6ue1PN27d/3NiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605269;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=SBxkDNXNuYodrKJLEyjfUFDeq77Q5w3VUGlkFkAzqI8=;
	b=k6CP3sI/zhoNToyvX8StAAD4g/gUmTS/Y46FTAIoFTuxPpEL3yVdlfHe+gcZEKOk0tto
	 cJeUKPxQ1yx+zTAJ5vnMu7PSXuiHj2WmqN0bIpAmmgsHmYPFX5EeDwTzYlz/XAYTn57Ic
	 ygV+ySNozpNfiAU7xkhwRbJcO4cVds5cnCCr9eUTgHlj7RaCLKZmHrRkGh1KRSd3tUtPS
	 YM6OxoH7ts7+9sJQxlCGAv4loJGxML+9oFYal9oq7Z77C/t9VOwwhcSoUfShJTKNQ65Lc
	 O3jkD3Z4j7yszW6AADhpbONuNiy7bI6HsaAd8cW2TZYGt9oFUhkypPB70wwd6U/F9HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4Z48lEf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AAF606A323;
	Wed, 25 Nov 2026 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4Z48lEf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE321F000D2;
	Wed, 25 Nov 2026 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605268;
	bh=SBxkDNXNuYodrKJLEyjfUFDeq77Q5w3VUGlkFkAzqI8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=G4Z48lEf9cZhUGntAjKt720l8jpsIX6ms8JPyGAoGH23mV+PAb/r9oWKU3rOsKYjK
	 DXQeOgRJ525YNRqCxmQ/YbnaqgPsF6QA/SlxbuGj0s/mL6Rxja6NpmLE+UWw1vEIUd
	 R2l9Fl8ZaXbFASoClpO3spjNbz9VEojCj/bWCWRbpbhvYYYK1YYj7dyYHjf2yqsnkc
	 W96kylHnLqBZ33+g8775+NRM40fmAj8/GYr63W5MXt7vijwEJBIlgsD/lRX/PBTQcE
	 kWmbr8JtgSb8Hp5sZJiWt4HJ7AWf2exlA0jSwp3PwhVe5GIHtjdo9B7ZjjX/r3TIvs
	 yHjZXtJoAX21w==
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add
 Exynos7885 support
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Virag <virag.david003@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20261123092244.1792040-3-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
 <20261123092244.1792040-3-virag.david003@gmail.com>
Date: Wed, 25 Nov 2026 12:14:23 +0100
Message-Id: <179560526391.84329.2026344704407829230.b4-review@b4>
X-Mailer: b4 0.17-dev

> Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
> existing Exynos glue layer. It is also compatible with the Exynos850
> variant. Document Exynos7885 compatible.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>

Just FYI, tested-by tag does not apply here.


> ---
> Changes in v2:
>  - Use samsung,exynos850-dwusb3 fallback compatible
> 
>  Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> index 8af0143c3e47..f62e3ed82257 100644
> --- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> @@ -24,6 +24,9 @@ properties:
>        - items:
>            - const: samsung,exynos8890-dwusb3
>            - const: samsung,exynos7-dwusb3
> +      - items:
> +          - const: samsung,exynos7885-dwusb3

Why isn't this enum with the other entry?

> +          - const: samsung,exynos850-dwusb3
>        - items:
>            - const: samsung,exynos990-dwusb3
>            - const: samsung,exynos850-dwusb3


Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
