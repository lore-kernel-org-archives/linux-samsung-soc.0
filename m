Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A182F0C48
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Jan 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353212; cv=none; b=YtFIGC5ZxyzfOqfQ91Rg5viGCCRqamgx6hb0KKiAgQhXKEXYaJWDcTLrXTFxuWLz1mcFV3vJwxnfRVbatyNp0PmQgy/aQpPhQHP52DgmSX7mfdyDxj5FLWX2yOXp+fZvsbeSVf0Hk67+h3uBtMu2DQhTQrmUOt8SMbNJXJlEO5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353212; c=relaxed/simple;
	bh=wZCrrZeNgczJ32sMkjccG8DxRkRnphvQU666PCRG8sM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JZUNTIQGeAa/dhKhAaAfnUNRRMwBVcJXSelFmsbTdxbssy5Un7H7tqA56Un3T7PAn9LOEqqf+FU7G2bmgUck4VopVicRZATBoYq0YYcvtKzt8ItLcPAzz2ZyDsUMx9iuamLkVJNp7RbkxFMhSuxlY8Rjx0He5eQ6Oh6NSA6CAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cc772S5a; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cc772S5a"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b76b5afdf04so1829785066b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Jan 2026 03:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767353209; x=1767958009; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wZCrrZeNgczJ32sMkjccG8DxRkRnphvQU666PCRG8sM=;
        b=cc772S5a4VMMUdVSNVwm41kkCgYEgXMQr6YIlJKkgaP4LQvrMPOpAi/v0v+JeM8XD2
         W/8Bh5km53LMoX8TOcrXNvtU93GWDJNk6Ll005AtHiw1rjohlik6X2EKzUpGFWBh9SIV
         CEpo4mo8H1YBusC3JR+rW5CN/yqvnim3TjoHleMXyORMq0GrzXYwUsasqN8ycpQ0WWFG
         P/CmA86qaS1CQ6UelBIAWMtW4+V5JPO8diHsyMo+paDrq8S5NIm8J4EcBTwS47SssA5r
         pGntSTkoAqaeHHVIjQi3fYUbGKUvbWMnTz0dxdf0+XVxRWdzJFonIXUTnWYs5EUMDcfo
         HMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353209; x=1767958009;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZCrrZeNgczJ32sMkjccG8DxRkRnphvQU666PCRG8sM=;
        b=rsNR31q2vGHCLiDk0m7SnrNPEbTrqEiuUwhZdPEu/qk/Cqc2Lt/e7E5UFjInofECFC
         LGdPigD1otWyrzuYZuHAcxlwW+nJYt8qWzcKLTQqdru33R/84SxThG9/qM02lra5wno9
         FXwcrXGyx90ar8Lo6gHUoLBpCXTsw6qFyuvZx9xuJe2FldFMQ74pzCwaBA2OtScTtH5l
         49BkcLv/s6K+OMe7HyWUrHXJE/DpGvu4RbYPpQA/wzDwpQhgadNR5IDYS4hSHpOyIcmK
         36Ed6l3z7+95uiL2p/blq2ABcTXswRaU25o/Hrb7gaesW6HWm98JZ+yiKdlFQ42aA/fV
         GYdA==
X-Forwarded-Encrypted: i=1; AJvYcCUnBKUXttR1hrjtLdDI6UEIUpuM7yN6m9WRJB2LP2IUP2US6qFLJsknX4Bhi3CmIm7IaYLx4Q+UOBgMAn2yv8oFkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7NHVKcDRnGOhvLAHWXPtEsebs4379x8KNxYpKxPhDxlyHLvz
	NzC54D7xatLcQwFzS8fFurz1Dde3QnfQ8PHg2PTK7XSVzdDJ8NMSt817fXDV0C+R1Ig=
X-Gm-Gg: AY/fxX5BOxi3sq0UESw8kS2dRPZ58DnpeUjDSUYBIP/6hewJvUN+4Jnc7tPhC57b4xI
	3OzufdCW4qJ0DT/aT6wGea4fq3HyEwiKQO1AcBUJ1JDB3nbor0NFP2yuBkdYdOSd8mYOKw8cQvd
	VV1zKEVyuH5vCb1z117hEVt0qiorFT29Le+dzJEXHSQ8Cwn7pqcsd4ZQJ6F3LTHiVg3vi7moAX6
	gaF/X90EO/j/AFct7mbvtzzZ/e7Qbt2S+W3yx/cPVu8zNyM1oY6c15SWqJAOXYSDzOZIDTEmOJj
	OiwSPGR8uGixwm+YikTXnK3f1U/b4ix+G7b19uatcVFr7fLyC/ADPXMM0Kis5JG2DndB6hAy3d3
	0+oZhne3da0YVQhGiDIPG5O+5TJEhVn4SVJMQ2O/RJNOKiusB6v5zIEg/HDlpG45NfILxuucKRa
	ViT7lbtTMmnTeRFY2jt7FciNN4bw==
X-Google-Smtp-Source: AGHT+IFb1cSu9KLCyJKAobmw+k0POeGJfgr/xC7uOSmUiVHIv6vit6M7ROfPJPxEhme+Gx1mdZY0qg==
X-Received: by 2002:a17:907:7e84:b0:b79:fc57:b598 with SMTP id a640c23a62f3a-b8037153443mr3708113166b.36.1767353208658;
        Fri, 02 Jan 2026 03:26:48 -0800 (PST)
Received: from salami.lan ([212.129.80.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f7bsm4468179566b.18.2026.01.02.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:26:48 -0800 (PST)
Message-ID: <4bfcb1420b9684f67bd4b8f583313c1a08a1616d.camel@linaro.org>
Subject: Re: [PATCH v5 21/21] regulator: s2mps11: enable-gpios is optional
 on s2mpg1x
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Will
 McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Fri, 02 Jan 2026 11:26:42 +0000
In-Reply-To: <CAMRc=Meu6-5569rMcV0zf2V+Sz_QZgShoEhmhw41k6fczULcoA@mail.gmail.com>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
	 <20251227-s2mpg1x-regulators-v5-21-0c04b360b4c9@linaro.org>
	 <CAMRc=Meu6-5569rMcV0zf2V+Sz_QZgShoEhmhw41k6fczULcoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-01-02 at 11:19 +0100, Bartosz Golaszewski wrote:
> On Sat, Dec 27, 2025 at 1:24=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
> >=20
> > For s2mpg1x, enable-gpios is optional, but when not given, the driver
> > is complaining quite verbosely about the missing property.
> >=20
> > Refactor the code slightly to avoid printing those messages to the
> > kernel log in that case.
> >=20
>=20
> I don't get the point of this - you added this function in the same
> series, why can't it be done right the first time it's implemented?

Sure, I can merge this patch into the refactoring patch 15 - the intention
was to have incremental changes to simplify review.

Cheers,
Andre
