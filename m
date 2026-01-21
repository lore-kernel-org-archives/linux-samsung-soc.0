Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A4928152A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jan 2026 23:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036777; cv=pass; b=dq7X+XrpLVY3Fd+X8i9UiKDVypD7rH6DduzfeXhTYpXQL0a5aJG1vNi3948B9fIO3zCIjxQbrqw/j3tUV+Efcgj1Ez0NbXi80rJYRIlzoLfzC/dCDmc+ClF0QfALngGthtfH1tX5kFBLDRLwGJgJ/Sz/TsA661gKWNJLyx8rx4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036777; c=relaxed/simple;
	bh=qbIlkTTCCX0HIfW0/ndHWAbTS2OGbgA3ydonvMe4tQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUg9Hn5NxdASj44cMevdLojS1EQJfvGlpoaU/NXDlwl8bKf0Dv4C7MWTPy1wivZMQNqxg952TPKHyZlN9TVoBkK0mAsQbp6Dds1Wx7J5yl1Vtb5Gi7L+l/rRaBnLZT9jEQXvBHYU2msKa1PHYw8+dKyrMg+tz6P/zjRTM4AzjPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvXZX6Wk; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvXZX6Wk"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5f530da3a07so357535137.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jan 2026 15:06:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769036775; cv=none;
        d=google.com; s=arc-20240605;
        b=VrCd6faZ0GiHIqrn+GxLJpvhoCBLBrQDjyxggzZuOyeXx3Vf/xVwkZs9fXCmfF32+x
         k3xPMdHMxNGEOqa8MiDxztrc50dciYFUDuJJL0dbmRtCxQ6darTWzR4qFVWLA/GPtVs4
         6kIibY+RBxowD7lGYQj5fT2I4tLPCsCu0OujFqHW/rhNnzDrV14gknEvMWHWL4IZAEyq
         jIU7mVmnWw99bfcN3JiUY0+4pqI2qj9zIPH3RBaXVa0ANwaVfl+84cP3yqpC+sx3KlpK
         AirmTw6qMBfgoVaOjYH/IPuS72DzVZlFFTHD+6MUxrjLpMPIFERAxKEEuoNB+iu2LBsH
         +5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tCZIOzDe3Q3k/SrYrYvkP+nvqTXceKLMx7SE81CvD3A=;
        fh=svOSG8dvs2rTlQl5m3Q6dbVljAQLB7LOwOXOseW+68E=;
        b=d/VsjtYQOQ+raBge2jrZBIjYcLkldALOx2pC8nOiGUGdEzJZUK5tkLEWSFe5XTqehb
         FCfurQlOBdB9o/831x2hDEpV8p4i363xtlClCkfDnLnsY1m08doVTNrUQQGW5chSIst9
         oT7Cmk0nqU1Pe2dHZeOpHMxRLuXruM7wZ6/dHoAfIrEAl7Ro6z8mSFtfSjh0sAwSXRuZ
         hwyo+WKjnEf+lY2WZWhi/Ck0tWZkmip2cYmilFijenlHhM7Eb1okh3yyL2Jtv4SsykeW
         E3THmqcBGVd1k0nHJ48Ltor9Th1V0kVqIWULuZWAQtVCdPPBmyR7B3pQyMiQ6W5WYIyK
         Nz9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769036775; x=1769641575; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tCZIOzDe3Q3k/SrYrYvkP+nvqTXceKLMx7SE81CvD3A=;
        b=CvXZX6Wk0D66R2GCQV2BhMcxAeeaJPbBHcULMSmcPqVzBQ/hDnonQ/TwwW2KNOM6HG
         UQRFn6N7ZlSaT/mjrwyke2FrAnyaGypfFBsMuygKyHu7TiQVLSepw1E6XB6gg8fLQo1N
         wcoP8IIDbhUAFKBtPIxXZ1YWTCNgUtJ7IqnJyB5gz1EqJfllz4BBFNPWUPZlvso4yDbH
         a+j+V1WGbl3yCmn+OccgMYYvMbbBcBlxa1Da7eKcCuy6T9JLuvmTWblP8VntsL03hiDF
         j129VOt21BBocneRJ20j4on0ZP8whua47mZkExwlrvU7D/7NCS3ckh8rbAHNGfS6lVNz
         wLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036775; x=1769641575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCZIOzDe3Q3k/SrYrYvkP+nvqTXceKLMx7SE81CvD3A=;
        b=ZhOKpSmyq8VKTWz0Ms9FBtvS3YJzEIejq+16fiVOliZAcUZkDX206EYOi9KrT+MYC7
         l6CYlOmhLZQcYr51z2Heh86wMMG/038ES5awshIA+9NCSqxQkc5Vql6ityLq1KZ0UHCz
         HtBrNfgsek45dgsNqdhzQ6730cw7I6BrJidk210kS32fxzeUGhZo/RU045Euu48BPMaz
         7BJ5wSVP4GmJkiJ529qoVV9HqdeNF7TfSk3wtq+8d2xD9ZGl+rtWg4jCJ+MB/THxCOl5
         c37kL7NBbBVyFHwulsXoZbgOprELCVJvVaCAiZ9hoBo0LBSsa5hnm6uO9IhbmHT43oXz
         siCA==
X-Forwarded-Encrypted: i=1; AJvYcCW8wYYln+F+KU6K6CLUFGxr6Xo3cM0BAX+++3sZIA5pnGX9ADcaWpx8QOQCHTWA3tfN0vHe0xmWrGTb/hyeS5zOcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzioetguUUtNwnEPbpBUdIXqO/pLN842jxzrT4kHaHW/qOSn/zT
	AxZOF/GI8rDYeUClM0v1qeM7GmhVVEM1YBzhj6hcI7hPymwtFLOl8+LAZDMEKcl6QqNNi9r+cVD
	qQ+j/X0igTFdrRRUOdHXrYQ0VhiFerjwgGjF9M26X7A==
X-Gm-Gg: AZuq6aIY+k1bci9Df7l1Vter6x/BcruNJXfw4eD6RKNSkD6Nli6kXeXq+xNhiK3GXuQ
	PsJIZfEK9Lj+cmlM1/lZKbjHgPOdJD+DRBQkJxjsjb0cFvcywKrvv7yCUPfqDEVxRbwbx8pKULr
	w+I73r4jsYB1H1LputwR6pqT6x3oM9RfNRsm1fddUOsn9qR3x3rjJfFszZDpktigQQIp+3J5z5S
	y5CpbrnSju3ttt+7hQPwd05rMZ7f56VvezZvwDRzT5r+PF/3FRm3nzYV7t6jfX+UMSIJxLUmPFS
	bDjRk0hQsNij8Fqy+Vr8M8INbxwgBg==
X-Received: by 2002:a05:6102:5094:b0:5df:c33d:6e3f with SMTP id
 ada2fe7eead31-5f50a859a68mr2453508137.13.1769036775040; Wed, 21 Jan 2026
 15:06:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com>
In-Reply-To: <20260121-next-v1-1-c18068b091b9@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 21 Jan 2026 23:06:02 +0000
X-Gm-Features: AZwV_Qg1KISvM-ClVEpBsc4G9GUZQ6ApbOpoJthKvEVHb234AdgfKajgJQDM_Oo
Message-ID: <CADrjBPqj=j84PHf3HYR8dtxDkAVRC=2tBdTQvZaq4wHY05_M6A@mail.gmail.com>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google Tensor
 USB PHY
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jan 2026 at 22:21, Roy Luo <royluo@google.com> wrote:
>
> The Google Tensor USB PHY driver uses the Type-C switch framework to
> handle orientation changes. However, the Kconfig did not specify a
> dependency on the TYPEC framework, leading to undefined reference
> errors when building for architectures or configurations where
> CONFIG_TYPEC is disabled or configured as a module.
>
> Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> required symbols are available during linking.
>
> Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@intel.com/
> Signed-off-by: Roy Luo <royluo@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


>  drivers/phy/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32e3e52d4a57b26a62d8d 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
>
>  config PHY_GOOGLE_USB
>         tristate "Google Tensor SoC USB PHY driver"
> +       depends on TYPEC
>         select GENERIC_PHY
>         help
>           Enable support for the USB PHY on Google Tensor SoCs, starting with
>
> ---
> base-commit: 8bb92fd7a04077925c8330f46a6ab44c80ca59f4
> change-id: 20260121-next-b949189cacf4
>
> Best regards,
> --
> Roy Luo <royluo@google.com>
>
