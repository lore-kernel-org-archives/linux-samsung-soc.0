Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7332C1B040C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524258; cv=none; b=fGUxWGRCCQsUkXonnixw3insrml4CCC2XwMJ2OYn+T0A8yB5xKqpuUqW6AYFuWAYMrK0UgFS2gy3OvEv9QePvygxw34YLZrICECkksmi5vo3nI1EUfprEx51qk+rYtrzaWxmk29CwhuUCNhT6rT/JNd89kpUnBr5vo3Z07gqz7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524258; c=relaxed/simple;
	bh=utk/X6JnLeKqbQF2r9hM41s5ZSPb6bu5oZ1ZGKH0t4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4sKvR9ye50cNr9+S2ZXUn6p0mdPN9c99HPrvmry2R9Cxn9Eq/FINv8ZR/MTdUcAw8iuIl+MbBHUo4jeT4OxoP4VUqnNWFUxJTMUWHalyIzdw1yYI3voZgkMX946znmbWXh2/NWBudIunvpwNhcJqcm0IaMiiV3lPXFk3ig+kHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXJmc7+X; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXJmc7+X"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71e3005916aso1150324a34.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 04:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524254; x=1735129054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2vh/xwZF5apT8bu19SqSmXzYYa1+FrHmeqyI4yFkWo=;
        b=dXJmc7+XHbiggIlTCm6XyqBPoHQGCnNgWG1jfg2zU2JEdIKAnSwB/nYPrBhqYcnIV1
         atYp8eVzZ1k3hM2Zng0zHrBEMEsn29xErgFyybNCNCPqhoyP7Gg20UZFXlXCB6I6HD4J
         /9v5xeUc7WhDIB/PBtz/CBWRLRstlacDKVZj1CJuk8tEpJRbRTJHHVMOLEyMrDDNaL+s
         CBafeK46LitFPOAy78Y3iEt0noDxMWFLRz3A4B+rvcC6oLfn9Oy5wRUnND7NtRs+dvMu
         QpNtgFlbrrVufTuAIOqjzW/HAKjC7lykADqrdsNwNrUJPXLOepJtUcK2QgJPCCsVOu+9
         ivlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524254; x=1735129054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2vh/xwZF5apT8bu19SqSmXzYYa1+FrHmeqyI4yFkWo=;
        b=dFR0lxs5PB31H5AMWZxj+YqHZLJidTCAEffyxKzB6PYuMXnnpnONZchThPpAiLsDgf
         QvPiTmcNPJg3gXckXj0QOYMm91NkfVIp0TEctUPyfcbwZAV7twkM5e1WvroKmY3/kxGw
         vYOqfy3S0vexqzdK1zBXC0rgV15J65ab9pa/dFnoh/Iobe58rCQUI7EUQpUp4sW5KpiM
         WC7dDm619nk7N0sBaG8mwgZUV6HOyp5hUQ5KqosVpNyOVpi2oSO4tpjU3oqemFFJ676h
         /4LGb/5GS/M/rkXpkG8pPLtR4WxLxuCvURZAscUbbz8tAIBLKrAjjga3kXZW8blQpfV6
         qwiw==
X-Forwarded-Encrypted: i=1; AJvYcCVB6dkqbC5w5sUAdLLMfj337kniHRO5uhMtmnCawLQLFkMi9RZmfXNMULrEKA2k2B30KyzHkbghekNj70oW4hPi8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jSlIMla35/EAaJmJjrY5JzpfEqA+47vaXdw9F2nY+VsnrFvP
	reivKhl6jjYo9dsmVoWICkeDGB3nc/1zgN1gWkC+PjQW8DXiAGPF5DwysSsDQS920tWwuR8JmTC
	SVafX2fqDvYcKNkyOCjLF/WAt5e373B5gpT4Sfg==
X-Gm-Gg: ASbGncvOQufAQw7USxU0pL9KWdxY2MBO2Wx35NKcN4A5cwCLeleNURz0OALIT6aCHje
	Iuj9JkMJwVVl7l4crys4Hykqd9caN6EOOjs5ufjo=
X-Google-Smtp-Source: AGHT+IEojA6LnlTVG9PHZZVxfH/TlVwW+tBtuepHbLJd8n0q39aSKwMleaTiWWO3skHqftkc2ID9Y5fPiPCYVBpN7G4=
X-Received: by 2002:a05:6830:6e83:b0:718:7c3:f86a with SMTP id
 46e09a7af769-71fb75731acmr1512698a34.6.1734524254625; Wed, 18 Dec 2024
 04:17:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org> <20241216-gs101-simplefb-v1-2-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-2-8ccad1830281@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 12:17:23 +0000
Message-ID: <CADrjBPq4hH+kiuObXCkJXf6Ft-zEDnSVM5HuYNd=xMvaLicryg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre

On Mon, 16 Dec 2024 at 13:06, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The bootloader configures the display hardware for a framebuffer at the
> given address, let's add a simple-framebuffer node here until we get a
> proper DRM driver.
>
> This has several benefits since it's an OLED display:
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested on Oriole device, with latest initramfs and framebuffer was function=
al.

regards,

Peter
