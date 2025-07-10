Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426FC289835
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133273; cv=none; b=ekfhREqnkXGi8ET4w9uzyiT8ZLbhOQy9a3SL8D4pJqoxV4UBOaqJezOmrZJP6Hf/VZqlkVG/vgbnpE5WqglyVELrffii+pgz6ciR0RJK7J93KwGj3NuMcKP3LcTl/EBNG6K030KbuHrDLAZJNVRoUOmuxr9xhobqh9uK96EmEpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133273; c=relaxed/simple;
	bh=GYNoVdAKRWVmE1F4lpwjJnXn6AMF9TT383wPE3kxNxc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VvY1r0IgxtA+35/6lqr/iPPoaptHfFLeXPToe20nUTzUFQgK3rcbmZ5MiPZYx9GTWxWTdVmp+JZlKDCGZfpGRue7gs26jedXusIgowv7SW+zLZ0JEVAG3IOtNHX8dmrFgevs+c9e0S+hQwrYRMFnfcABftMug3/CK3RiuIgCNXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tWh1GAoz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWh1GAoz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so4511515e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 00:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752133269; x=1752738069; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYNoVdAKRWVmE1F4lpwjJnXn6AMF9TT383wPE3kxNxc=;
        b=tWh1GAozGBaBEaktfzI0TSxeCkQCh2GdRNftwCT5NiVsgJXNE4ujW677GNFn5h47HC
         IZOeaS/DqSzF1oe6Ba9xQ8B/rrJ2Vzfo3MkCaEOD2755ttnpdcX1SjtQTlrf1oaychwl
         CpfGKLq4nEqEJO4vX40C0wCda0fK9m6pO+vMf9b47tlSUta+n0b1Glu7zdkm17i8azn0
         pLF+Y+o0Bw3ZiLIvDoNjrZQEjv4pmZM2BQgt7tKVfHpxTjQ2W4vWa7Ai1ZhpDM4MWBbj
         nznqIlC2So11ApZYfV8iHvu22eJjESCxXDiRSOTUhGOGkaKrc5AmGh2pFXeryqHwYz1k
         zbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752133269; x=1752738069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GYNoVdAKRWVmE1F4lpwjJnXn6AMF9TT383wPE3kxNxc=;
        b=JquWZRETepi6yRwdpkBdtQE9et/H34k6EwB6DEWkrMADktKJ+97zKrsuKxLWj9E64n
         KsklbcKNYnkbFh1wAyOJs+ZmXiNX7V6uoZxl+WOoJZ5E7fmiF3hr+ayzQgfLMiarN5rS
         G67Nw+8H2ho5C6FhktDlHRmkm/3Hap3j0KVCMQZ5MeK3RJgDhq24FcSECWjm0M0EpR0X
         EmRN39bBSJcrrkJevWX0UH1CLjhBRldpGLGwOUpFijeW/EyP+YFMqfGskoD3jEKdui0f
         O5bXzFJdR2Nf/H/m4tqVBXuiXnY6WayJuMVxaclT8sl7PhAlmVDTFQlfeQXdG2W+FmRZ
         FfKA==
X-Forwarded-Encrypted: i=1; AJvYcCX/JuGbtcBVfkwwORuktYKYkB1QILehbZ/VLRoQSK0WoI8kWia78S3zrJH2oYtGeqng4tCLmsG6eqt1neVcxpPznw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4LfXR77DTaiBR0qlBHLYACE4k/D922afJdy+07Tj1WTNDP96Q
	Sw8We68EsDCysIKv+680zCcn87VyxMrPPwrnj2wZBk0jZpXPGX7VhJwxW8EcPiVd3uc=
X-Gm-Gg: ASbGnctBoRO2ISJuo1lDfxWVVti2ds/GtFOCUSO6jBeQNJD2VJD7v7pTQuaOrAurwWZ
	exkPcaN/uj2HlRCWHs0FsOi8wXz3EhYBMVGRnJnTu/Upd8i1pit4OjJ5e+YqNFicm8rC9E02MjZ
	DhvO9GYWDkNA0JuX5AexKP2yhRHwhBmtkdZ7Lg3AZw7d+UMGg4PaJe5TLTuGEcyyaNj03fzCpYD
	oPxQDSnG7VPJK3U6XIKbSoHcDz2NC39aFTFSIOXOPTHXUtueOGJQGIlVBG0gZLBljyB43bqI1JI
	sm7BpfoTkoDeJny42KQFZ0S4JKFX4h4XjzjBJTPhKGzwPzx/vm1n+PDSLWBQmwQiMCk3RCVqFfk
	T
X-Google-Smtp-Source: AGHT+IHAKWHAz0ARt1BvQlaWFcq4y9BAt+xbNRCyzxhCMv47nKYFLDZpuaCU2IxFuVRakMsMLi6B1w==
X-Received: by 2002:a05:600c:1546:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-454d53a0186mr65715925e9.17.1752133269645;
        Thu, 10 Jul 2025 00:41:09 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd474a9csm11086495e9.16.2025.07.10.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:41:08 -0700 (PDT)
Message-ID: <fe445967514bbbb5bbbcc806f98dd6bbac9e032a.camel@linaro.org>
Subject: Re: [PATCH 2/2] arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to
 Exynos entry
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 10 Jul 2025 08:41:07 +0100
In-Reply-To: <20250710073443.13788-4-krzysztof.kozlowski@linaro.org>
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
	 <20250710073443.13788-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-07-10 at 09:34 +0200, Krzysztof Kozlowski wrote:
> Effectively all Tesla FSD DTS patches go via Samsung Exynos SoC
> maintainer, so add the pattern to make it obvious and reduce the chances
> patches won't reach these maintainers.
>=20
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0MAINTAINERS | 1 +
> =C2=A01 file changed, 1 insertion(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
