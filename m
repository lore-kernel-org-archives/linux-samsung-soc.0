Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829846;
	b=NpQSXU+g4fb1ObKJ7zv2jxs6T/LQ6nb/gOmH+2A04dbY5iiAhKNCGG47trae3y21Rrsy
	 zu971kMn07vCqoMPLEHcoDj7EGNrMjv3loFueGN+HhM84gdTTRPK0qcsFhPHiyf8w3o03
	 ge7guNijygiEtl+2pr1yauY+hd7c2i350iJBZbpCo6UKWy9QmQK99COick5xLpETBidjm
	 80RFA89n+Ke38ON5OEh2VObjNEWTEjX996xT/jdkiYrZhKdPJmtn9rXYZAkzRoUi7EcGn
	 pbr1P3HmzCtPYiJxdo7yb0NDY8rJdOJARiXLZnIcimo/Dp+DSXxmQM2u70nOxx0g9zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
	b=k4wL10TMPx8979ShcxMuE4it3CrtfDEpV1KjZmcMun/i77CjnodWnyqhyhcyuCZJZhM0
	 4D+dNSo9ar0jkBaIIBVZ6VmCeOoTtJ3qlyv1u+Avks+UI9TwCDfcLRNyUgCTL1kxlhRRz
	 iCcD+PsYMFZAoS/VWJFwZ6vkzVD6PxHveCRQ7GybRGGXMAO/JsGi+oF55og93QRyaZysY
	 6P9G6P52GL1khJYIsz7gzlk6REFkcB5JEcP5xT0R1zy/xr4njHTl9yZB42i6/3Wn6ud9c
	 67G0rG0sG1VeL9vtN/gSKht1Fa31jnqIKU0Ujs3c52kphgb7ravf5CQAwgVd8knnAgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB0606A325
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDAB0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1937466a91.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 01:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829845; cv=none;
        d=google.com; s=arc-20260327;
        b=AZPizddOs6zZWdApOke0iXOOgbGjzDj5hgMSXA16g3lpypjfiHYv0afByw5F61BrMc
         DH8NOJXIaVAckTurrRqeDCo+gqMrgfkSgaw48xlxSItvSUPsZ+F0h1yVZuMPfbuMVuuU
         +8XeYUT8YjWJgd3x1faWQ+mhV3wToKp605+rZ3jkDykTj6i+mmzALRsPXVbYaWIrxZQ0
         tf0WGiCilehIbIa/95k6lgWEtAgdPtw3sH0wno+yWBEWh4GM5PE6/O4au7zUXxrZdCh+
         nhJyabJBtygZunMShq5tn9Rtaf7gznLLn8GQ8Wl+WhAD/Qd0soS78pU+O8ZY9CVo9/aj
         hB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        fh=clQE0a5MLZQW9X27QKpMg2FAAL9qbzDb7s6WDorclKY=;
        b=nqEYInpWqgOhV3lzWrgkH2nEi6dxhD7ysefcR7Nsv3Zvtc36bA6oee3FoIdR6cA+6O
         SxIE9dnSFaKV8OLfofluDeYd9Li9G3eNC4sKc4vtpEJnc/MOSXywrlbQFjo6T4p6ex5s
         Jc+UR+b7rznak8UdYjdw8FgHeknC7jPPw3FQerpE/4HYLBntbOPybyH7bPFnaiY5XjN5
         y1dlVaVbcq1cfdSXHCpcYCGf7iC7P83ncjx8uXHkpvPXO+n/zwMyQ0C78Mcv7bK1l2NF
         AGaelpgo5xsrJ2mkDOcgX4cd9vncy4iTDaWuBkzH6LGPgyc4U9r4PD/fwWJv/uXM7xze
         49kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829845; x=1793434645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=W+scGDokeW8IVUlPw1qaHOR19xQPyTOtn+x7HYHtCqXqHaqa9rlnDqjOM+2Ceue7fL
         Aju4fOv9xr3yNjCoA1fmjYX1vQStbRNTO4lyjJ+X0ScdnOQnU3gmpoLqAC4vffWd2TMB
         smWVx5HbLNJaVGD3+OBLLSqtnKQQ46IxDRMvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829845; x=1793434645;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=QSYr5rTMYsYT5uBUDlWOByQ3Jgap7QJZA/WBtTbO6+VbQFgvCfGPCrhXzZxjvEkKHf
         Z/O0IEEghHExaoTtEbwcv8MqzD/E03k2cSH8B7spuf4ZATAbd4j7APbiFPFpOd8p4U1M
         zD7LwUfV4LbjAVlrGw6p6W6QvokuO31Pe7E2pF++XeBgADlxz3BRug7krouslvsPxNGt
         jeeuz1dgOc+YTH9fEY83HFR0EkKELUjz/Q/l2C10aULW7USsGdaw33xTwnBN8j/kczns
         VEj/u4VjB5AKcPLZY9r2l+It6qy5Ha2pYhaTTbNn+X5RR0lBUm0lEhB0tqny5pSEb4w+
         F8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBw7E47SbDYnQtH7OBQBEkxVfOh8wR7K7Flq+g+9znz+ZW3sPpt4OXchVjuVSUjBcCn5LstYrfOqHsLcuSgh4IvLzw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLoUnUBNGUrNRpQ0WM2W+MHCMmwO3XKn6mqJRpU9+XGbz2LY4T
	DOOBMP1x1W9hu/P8SYjJvWG1fRDW/sFNjpy+XF50ilIR5IcE9WpqjBa514Hu/qEaG93mKfXMbRS
	3Q/W1dIj6d9s0IyOaPJO/l1+Ft2sJefkqtEG7VEkk
X-Gm-Gg: AYBFou2722eKZ4gyqV8Y+gOoLnftmEett2uIOtbM/n0UqG1BhfgPXv70WG1610aQeEq
	iE0WRN7RlvqvV5X/gM/NO86OSnLyQRgTvt2g9/hYXF/RNTqgq1/aU7AzlqnYp4B6z2qniVCv4XJ
	LZAXNSrlOY9ylvrnS6qcEvmBa6/vcRsprVVLZdkunBP1avaBgg+w255KYppW3hxm7PqLzI+mFSV
	E6xBi49/F+ZjriNKKlLpHhIPFGlC2BvghU9eO1dJUqGewRsac8WpP2VeufmOasVhIQenvbK3wYW
	zBI4fNd9ofuvsst/Vx5B8esffZiOsYciJ0GNz4aoI7ZaJ/LlBUqNrhU63Sau6ZNTA8XKBo7QXoO
	t8RvxLuBFkrd9AvYYJ/09H+pINUEhbjofGH0=
X-Received: by 2002:a17:90b:4d09:b0:3ab:31e6:12fc with SMTP id
 98e67ed59e1d1-3ade9475f03mr1281929a91.0.1792829845190; Sat, 24 Oct 2026
 01:17:25 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:19 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:14:33 -0700
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:19 -0700
X-Gm-Features: AclHuK9OzNbsUxoUq8dndEPiTUrFf9OR8thbHVNZoTYdjjGKeFC-1VE0qwrhJ4E
Message-ID: <CAFLszThr=rPCTxQxst2_Br6MWwaRFe_rHamzLXY=ua4Qr8mAeA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: google: lga: Add lga.its FIT image script
>
> Add an Image Tree Source (`lga.its`) describing the FIT image for Google
> Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
> `lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
> metadata in the configuration descriptions, allowing the LGA FIT image
> to be built with:
>
>   make \
>     FIT_ITS=google/lga.its \
>     FIT_FACTOR_DTBS=1 \
>     FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
>     image.fit
>
> NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
> image. However, packaging scripts will be able to take an image as
> built above and convert it into a format that the bootloader can
> handle.
>
> It should also be noted that the "description" of the various
> [...]
>
>  arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		fdt-1 {
> +			description = "lga-blazer.dtb";
> +			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};

Just to check, does fdtfactor recalculate hash-1 when it rewrites the
fdt-N data? With FIT_FACTOR_DTBS=1 (as used in the commit message),
mkimage computes the sha1 over the full lga-blazer.dtb and then the
data is replaced by the base or overlay. If the hash is not updated,
anything that verifies it will reject the image. I'm also not sure why
the FDTs get a hash but kernel-1 does not. If the hashes are only
there because the trogdor script has them, it might be simpler to drop
them here, since the packaging scripts repack everything anyway.

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		conf-1 {
> +			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";

Since tools are expected to parse this string, please can you add a
comment at the top of the file describing the format? For example: are
the keys required or optional, can they come in any order, are the
numbers always hex, and does the width matter (6 digits for board_id
but 4 for soc_id)? Otherwise the format is whatever the first
packaging script happens to accept, and anyone adding a board or
revision has to copy the existing lines and hope. But I think we
should get this into the FIT spec - will mention that on the cover
letter.

Regards,
Simon
