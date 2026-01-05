Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAE33D6EF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630880; cv=none; b=qT01xAIIst9U37uulESxuIRx8eP0L88qr3E/Dy5BTofxPBe6kVi5upyoCLvcS5r5E4fVtcp3SK7rGkXXnwFKxZF0w5LGqHkbj0t7+JWCwdwpF3JlcGQhD/n8j8hwKGaZLS6y9mP/5JiP8RQnvj8cw6oYOIhwgub4o8wkNoYZcmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630880; c=relaxed/simple;
	bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jufqm8QI6B+uK0i+B6pqwB0E3E4bUl4wRtSPyqQFMliLPqliBR7Gdr5h3sqLQBKdn3appqFrHAsADgzgcXWJwgmbuA5EOFgL6Jumv0CFAMoqretYJrwiPc4AjpDqSv29jbH9VZlKRIqC5U8JVtkAh/RMKVRPzVILfnOFOP5TAXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kzkj8ilV; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kzkj8ilV"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b79ea617f55so25407366b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 08:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767630876; x=1768235676; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=;
        b=Kzkj8ilVNzMJFRW1nbm2QkX1jFeSKl5WkENFpQPkTe6EfrRyB4/2A5M3hGGHB8uyNm
         RVnxTbxgCEXDZthOXFVd/ohUQ8eH/gvIbNkjERHjJgVCBoEoLZrfj8SH4U9/2OuUBiHG
         lycvPdYAIjkB4nBjVEUMDHuD/wQMijclKtxYmSHkIbWPYRKGichS5cMGSmeCGMiHA4jS
         GyDuZXVdd6ZzjRVHA4VqYbib0xmmABB3FDdbgKEG24kM3ewUXFg+Ui+LC3XhztVQsjOy
         fY5YNig0nJEtLyuFN24S0aFYzIM2sCIccS1E1qxCtCL4iy+OYMI53Y9nB6h3K83FLqUM
         t6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630876; x=1768235676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=;
        b=fNzKnXp9/vMznevb9AasFXakjZpo43CdmJKRT+/vW4SEEGk+dc/AVei//FwgB2hh6P
         mNscGrTmYZUnV52dlJ5WRMblIJwJIIcAzvLYHgWf0lb31G6SPXz34yqvGirptRevmfyF
         2ZEZ5olR2DtLqERrmlWqV/jn1Rzulgv4ulOFoG8PgRxjxqh4cL9vdy32Btm9gdSg6qsw
         qW6FyZKoCHVSWktbUssPHaY15cjdLmzI7coYNc40Hh09C/0a0/2ANjhJwaXYkk+rW2hT
         caB7P6RSLPmZUTgb7XRgHMinLvNZVXgnHgnTyCLO/2ocWwrdGy5ZE5/Nb1JSUHRdoD68
         8SLA==
X-Forwarded-Encrypted: i=1; AJvYcCXdxfsPaW7V/R5V2kgtcSsMqKuQTXIQtdUmQKyc2OglRZC2wpMI4blJ/JDGa6IopYjOXfv6TZa4dvP91t/dhJMkgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzzoFWo2RGMuHPl4XvJZ/Qoa+57gnzb3tjExPUSURb0hFDd3z8
	oQBRxOduJE7MEnJalQSjcL7Am8GS4pybNDkSiEEnb9+ciLENXYEEGTGTKzETllIBsOo=
X-Gm-Gg: AY/fxX6bHYftD06RjK149DXDNA85BSV5O1kekKt3UXuQxo4UoqbvZRfJidpbKuN+/26
	W+fToIuxZASE4m7iOXrzWmFYmbFkRwjNaLKWCU1m/+0xKeSbXHbSq6nXKbbTgZTVG7RPFTNOm7w
	rnEXZjJ4+bvrq5XFpHI0wtEoF55RQyijkp4ElAAYSTMzMgaZOfiYl3Cpu0+XzCcAIo9zHfKF6Ak
	J9T5U28g5OP5oM6tgky7WVk7/43N0yASBoi8Ec4f2gln6TxQ8DG4z/eUj5981SkYgUtZuDCv84d
	9DbPEvrXsEQVusC+1piMDY6zfHyBtmK1b7EAcd8bToDAor5cb1eER/OaEKNeM5DkkSJbgd5D3I4
	ZiUESiYD1tJ0DirB3zDczBDf7aToUoP6mdyb6pvo00YelKdyMoB6YMrldjn2AHVUgf26S+BNzJq
	1dFv2i7xgpwaB3RLiD4w==
X-Google-Smtp-Source: AGHT+IHIyW6EL5Qeds3ppqsne/ep5l8vVI6WL/+6EbkwC3Ri0haHzlrCKUwNVD3J8FuYeN4YtG8RdA==
X-Received: by 2002:a17:907:a43:b0:b76:74b6:dbf8 with SMTP id a640c23a62f3a-b8426a67855mr36978666b.14.1767630875838;
        Mon, 05 Jan 2026 08:34:35 -0800 (PST)
Received: from draszik.lan ([212.129.74.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84265ac3ecsm40253166b.11.2026.01.05.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:34:35 -0800 (PST)
Message-ID: <6eb57ad14908ae894f090ce83c756e4cbc834aba.camel@linaro.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: mfd: maxim,max77759: reference
 power-supply schema and add regulator property
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 05 Jan 2026 16:35:09 +0000
In-Reply-To: <20251227-max77759-charger-v3-1-54e664f5ca92@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-1-54e664f5ca92@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Extend the max77759 binding to reference power-supply schema, so that
> PMIC node can reference its supplier. Also, add regulator property to
> control CHGIN (OTG) voltage.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0.../devicetree/bindings/mfd/maxim,max77759.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++++++-
> =C2=A01 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
