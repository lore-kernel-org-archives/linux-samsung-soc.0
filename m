Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DCC280008
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544752; cv=none; b=aHIOZR+NCEjNlNDGrWdZvYk0cp3RtfJk1R694FH6JCTEMhUaXt8+E/Hp8xDs6JEeeN5vECtNtqymkt++A4VDhkpsufUtBLg2pR+WJvCMHmOx5ABOkZ/ZZRsPn/Xiwnwec603d6WmPtk9MXJv4P6gBf2hgWa7U7Hbv6uHZj4fIR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544752; c=relaxed/simple;
	bh=Yl4VK5rapXeTeoJSO8TtkOTrZLDEqTO12ZY4/dzcD+U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H5dC1Rv48/Yvf0MwBQW33CTyU1xyNyRU7TS0/JdTyc8wbiAnZ5sLdofYoYBJd55Mwomd+sd6hUSkOIjpPsSuMRAJHssvvWGyAWbseilTaOFhe16EH60jeuH2pYsOBQZ3BckA47ZbidnfbkcbHaBBjFu9Vpb7onV2GCufhrSENiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjdNqlvb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjdNqlvb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a54700a463so1252165f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2025 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749544749; x=1750149549; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yl4VK5rapXeTeoJSO8TtkOTrZLDEqTO12ZY4/dzcD+U=;
        b=QjdNqlvbVtV/1IHx2p5MIEVmfvFmv7GtiPiU8legWaocfKjNdHysysQo4h6cNUqZ+e
         OTMf2Mism+kkeKvq11TzU3s+St3N+sAfCqE7EDwUp7Hbapa5HIP2Vbk64egX9HISYu7b
         Y4Lpp/74+8OCyr5YjFFfpTGNSzzlxS1XL9jzrntxB082g80t7AMHan/BWflkZChTk6RQ
         a4dIkvke1p8eJdaEoHaTAHfus7EiV+7xANQYuS+N52QlBLjPYpcF8FVqR70oYZZMLWEL
         t7YRu/EqnVU54W3SaEMegVOCbP67hv6lZsKQLEA4iFRRh1TLYve+DN9eZrcVgv3QhjoW
         o1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544749; x=1750149549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yl4VK5rapXeTeoJSO8TtkOTrZLDEqTO12ZY4/dzcD+U=;
        b=DG8CtXrSed3+nkeTDzhfGjJFCdk/Fy2NNY7wOiNk//YuDF/qcm6WeK4/GH7FG6yFut
         484FYxKGdOTvoI3nsSOZzAG4LtjgAGGldSD5igxe7MdWDPemBpFAYpDyGPZC5qHt1y+Y
         K7MX9U6msaIQmf2PsuYoLVRIdPMwE2GEvYqmbu8tmZl5IPKdhI0zVCgSI4LRLfQPbZui
         BAXRLkr56q05X21sc/B5PIT9GqGdBVfuLLn/iCC8NAQ1+HV0LA7b6Nd6NIq1QQMbjgEs
         wOk0bBRX9rz+nC9fAZSkAUuJT19ZoVU+rPohU0cyQ8LF3TZbLGLhsh0VRFFmuC9gw4ZI
         nWZA==
X-Forwarded-Encrypted: i=1; AJvYcCVHCrDTXnjn1p1V89wCOas41ruLPBBcqzjebb43FbCTZQ4ZYDqyr7S2u6bFkUZ28UcBGLtfnMPGPQyHlGl0zGilUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTX639PxFvea8L02U39qZzIrxus7Gft61Br5fvKEdqiwGCAhO
	iVQreJOA0B7CbG7BXQOn9R7wsw3DS71WvUzxKcf8gsuYWPnDe65zZ3PicyqoSZ628oE=
X-Gm-Gg: ASbGnct/FAO06W3jcB1Ax0PY0FB/Nrp462zZjrfclY5Bt2wpkom5LrZCPHK4uEzVR3S
	x27yKCvMO3JmFaxq6EMjfhbDSep5posgd3mMSs1jUmYy1vC429qE8vzQ4XtBeMAK+Aw2BEJ9Njq
	PX+d7GLOuUH712x38g+l8/2OYIghDfWFpfP2IfsGv8hVs1eGMA6r9xHSMipF5yGlhvJxN8vlMwj
	Q2GoL+7QnqsABbrRajBlstcb0lLzz0QqukX5fxSJci5IrHN39Ccakx1kT68FODoR6o+7SE4Vk/o
	psNaZD3cHpv8yckcBmXHVy8ZZJEueV5Bq4Ntxx8X0nnoGuJN6GGj3WphWN1gDAL8fd5KNgrPFaG
	QjQ==
X-Google-Smtp-Source: AGHT+IEgnzAuPZxC9PK7wFrxzn2rTCPjmEyvknSgU3kvtfzCGxGRajpBv/Wk8P5qBxM/ob8j0SfRdA==
X-Received: by 2002:a5d:5f94:0:b0:3a4:ebfc:8c7 with SMTP id ffacd0b85a97d-3a5513ed8dfmr2108902f8f.8.1749544749195;
        Tue, 10 Jun 2025 01:39:09 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322ae43fsm11467552f8f.25.2025.06.10.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:39:08 -0700 (PDT)
Message-ID: <f44579e51082cd2d77dec514c1d2128981f6b3dc.camel@linaro.org>
Subject: Re: [PATCH v2 06/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Tue, 10 Jun 2025 09:39:07 +0100
In-Reply-To: <20250606-s2mpg1x-regulators-v2-6-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-6-b03feffd2621@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Copying my comment below from v1 of this series to make sure it doesn't get=
 lost.

On Fri, 2025-06-06 at 16:03 +0100, Andr=C3=A9 Draszik wrote:
> In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
> as a sub-PMIC.
>=20
> The interface for both is the ACPM firmware protocol, so update the
> example here to describe the connection for both.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0.../bindings/firmware/google,gs101-acpm-ipc.yaml=C2=A0=C2=A0 | 40 +=
+++++++++++++++++++--
> =C2=A01 file changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml
> b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> index 62a3a7dac5bd250a7f216c72f3315cd9632d93e1..408cf84e426b80b6c06e69fda=
87d0f8bfc61498d 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -36,6 +36,15 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: samsung,s2mpg10-p=
mic
> =C2=A0
> +=C2=A0 pmic2:
> +=C2=A0=C2=A0=C2=A0 description: Child node describing the sub PMIC.
> +=C2=A0=C2=A0=C2=A0 type: object
> +=C2=A0=C2=A0=C2=A0 additionalProperties: true
> +
> +=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: samsung,s2mpg11-pmic
> +

Since we have two PMICs here, but can not use the 'reg' property (as the
addressing is based on software, i.e. the ACPM firmware), I've opted
for 'pmic' (existing) and 'pmic2' (new) as nodenames.

Maybe 'pmic-main' and 'pmic-sub' would be more appropriate, but 'pmic' is a
bit more standard I believe. I'm open for better suggestions :-)

Cheers,
Andre'
