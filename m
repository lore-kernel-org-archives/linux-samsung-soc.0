Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2188C22D4D3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759868407; cv=none; b=rMiaZxOkB79fdHp1DUo/7xes6AIn11vaje77dxFK6WIjFZrc5cee/01A0HGxYPvB8T2yIodD0Qwsk8I2Hpj0nkVMCcUU1EprLtD6vrUjWVW2Uz6hnX/adkvhsm6dJENMJDRtamClKalfCzqskxtDbP6b2CAQQkbDVa8/1wktIbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759868407; c=relaxed/simple;
	bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUa7NdMQgqBRh6s+igRsmEw7QImfZ0rnTEvHsiwiG7T2e5zFT9jYIYx/iqOOGlFKKFDzmBbDETIQshAspPO741eS6vEOSr4pFOuSlCbf8LtcdTlxGLoFCswV1YIpkFojr6elo/d31DK+NBcTsJGgpG3l/MTllitgKb3SVYFNsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMwxbj+0; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMwxbj+0"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-43f494764a2so3451705b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868405; x=1760473205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=;
        b=sMwxbj+0yZEIWst+fxNSOKU16i7Hi2P1EAHSYTXd/hMaBD8hy/mKcLKjyDrjssPHRk
         g1xAssGwgV37uT+qwXZ5ursK5Q3KCnpkLrqZ94JAmlKQKge/Q0SdgWEEkCd8xklTSBwG
         YkwXFFITj9jR68nMy+Pv0ZkjvrzBmsJ0H49t6Hb+ZxVWbTp4SX8n5G6XFI1XADB5QLuO
         9mhktUWBZvmnDRpyJu32/tEamJ6meEdhBNVCErOmO8A2zeB1V/z0PrMCAy32K2H9KLES
         Nb/fljhmshuSnQN9JpzVaVCkewqm/2iAO9qXnuLoQLHn/frCehIb7UiIe5In0Zh57NOY
         9KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868405; x=1760473205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=;
        b=wVj+4WkgY/+MK2JkN+B6/p45/iWGPT5EFI5e1pNi8VUXz0/riUwTsIQZS2XSSu5BJ4
         /vJdkGIAvDVQiWcXtKzBF8zRjFyJ5eSoVNTSEaBUObJoj+18CZFriAfvDBtOm6wEaDPf
         FB3V2OGblrml0ZK9m+UKgz63ecKbz83F1TEmXK+xYwYk5yJk6BxQ1EzMglnZrsPLC1DV
         enqzZgZhLF7I866MW2xWe6KG8J85dbROpGd/z7h2KgK+piUVyUPgMWVLgmvDQplp65Pt
         340nqRQo+k2bokMFC4KvWcpeQl6NuEhulP6xo4vWPlY5nGisvOwhPzFGoIwFkVaujGJt
         TWkA==
X-Forwarded-Encrypted: i=1; AJvYcCWkZ6UKbSN+ZpYBCexBIkxg2LGhOCwyGrNc9mxHdOmYCBCrU3xbDKe4BnqC0pJ1VpIJRJCo6uAnkHlX85vKOpBSGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBq1V+JKensbQpDNm0b2YaRfEJJDDks4s2ey0gnKse839QDp8u
	Vak38fmmwac/768qj7rQMQ8tKtW10NA9sycFyh6FI9m4NSJhTnY6f0hlhc32oSd81OHVZagznmh
	GuxThx7SBMpjJGr1Mqc/ZKASOdrka/xCVWoEUXQAasA==
X-Gm-Gg: ASbGncuhDhONIEsG92bUcFGseyiQ/iGtgXMQgT+M/fZuB/8z1gSNcKTXsaVfOEUM1gR
	MHTZTwQ39oD57LYhAHBRs/5mEjgmmiGnOWKrrIFEEyGSvrXlVQfJUa0z3dD2iRnHPixsYxEFup+
	zBQe4DRmPkvi/pSjyMZBVouf+EPeeOEno46uNYLn4FmTtQ3maBJEIiPOIlI82X+Dozg64HRQt1K
	qlCjhousPw3X6PymXrIFOIoJZc2Fnn9Wb78h4mPEIYdoE+M
X-Google-Smtp-Source: AGHT+IEHI8U1dVlqnhrsS6fP0FmSa3idf/Em/3CBdgaLIh3/qrBErYExCYpSsQBQQgzXfSMxAukwo27BHqZsQjbeUds=
X-Received: by 2002:a05:6808:18a7:b0:43f:5b28:f0a6 with SMTP id
 5614622812f47-4417b2c48f6mr450890b6e.1.1759868405185; Tue, 07 Oct 2025
 13:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
In-Reply-To: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:19:54 +0100
X-Gm-Features: AS18NWB4avL22wQ3_NUeMTQbUpbAXczc7-BwaaCDEfZe2LaYa7fnIVbjvyZG6LA
Message-ID: <CADrjBPqeucFJw5kH7YKK=PEOOYFJkQbmZ_CORu62FoFwqySsTg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: add power-domains
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Oct 2025 at 16:55, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The DWC3 can be part of a power domain, so we need to allow the
> relevant property 'power-domains'.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
