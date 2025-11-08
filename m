Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F271A9FB4
	for <linux-samsung-soc@vger.kernel.org>; Sat,  8 Nov 2025 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762609687; cv=none; b=J79yi2c3EOO8xlS3RzruYqiPdQzm/7SzWE+ZyYVOzk/V9WCgrZGZ+afc7dIjhSTZ5uXk/FhMF/DLAJXU6+cKD+Q3MWFzYOz725OTvdm5EBQixMat6BMwVfz9ur3HHoVB2Hj0Jm3qJcEO7sDC6h/WJRCbsVD6RbTicJ14eF038OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762609687; c=relaxed/simple;
	bh=gpkOgQREkGfFyXdfZjUNhEXJXx0pJOMzthb8JAxDkkI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QkWg8fz4rfn3V5t2ZQtx7Cfko5EfQcBxEEkJpkSiQ2LDeMr65Ghy0eTM6BETtbmGWHtu2M/dvzmVS6bWYWoehcpMq6OQw3fomD94UG3aunr9gIUvgcR9brD/3tpr9hm2ce2sCb0afyMOYd95yQdwVcouOaX5rlvUwdaGBV6fdDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1cpfLKH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1cpfLKH"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b72db05e50fso203367866b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Nov 2025 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762609684; x=1763214484; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gpkOgQREkGfFyXdfZjUNhEXJXx0pJOMzthb8JAxDkkI=;
        b=I1cpfLKHP3n2H9I+dmfH2mk3W5X6Cvp93Ea8cY7gpCsacEWv4095ZU+ZT57CRAQCnI
         wBgNdRxVu2Q5nbZ1lWQzlAbRYvsFmzl8xEmwsSnU1aBiE8osfP5xTRqS7JZw84bGNAAN
         CNojY6UxqYIintgQY3xC5FmfvKBcvGu2nIpmYOCwqA5GPvK/BnHVSVpu2AQApJELQLm+
         eJ0h/9dJQ/SnbZKk4rLJLywRkxyQJ7/EV4GIgs9kt2vcWNxV8eBKEbZXK19XGRkGYFd0
         sngcOjFTHGc4BaC44nLcg+oHdBtovmngThsnn3khqSpzn3vBRrrRVUBy/1n+/b4p2D98
         qmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762609684; x=1763214484;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpkOgQREkGfFyXdfZjUNhEXJXx0pJOMzthb8JAxDkkI=;
        b=cqMenTDtD1Sq+2/JJkO9IrztWB1f4TfEXcaB7HaDsLCgupPNAROEp11fNtgAXugxJs
         RhTlymz8exivcGj7m58lm+w44yO2hdo7+7rEwcDb9VWWZvIefAevtLGzqaFOkyvIjgQk
         HosXkXpVm2pY7MBbcUDBfKe7KidzEkvcMNI8jdtH1HJX3MxVms5woFeWhqKXBRx6v2ND
         n3cmN95pDtEUO4mwcSzE+YKpLzk4wH2a88EwYypwYviqAHvna+yrkDABod5wDD5aGWtu
         TpSi4fPBK3KIt8gFPGbiHdtbnM73HpnNnxgYPi+hVC9g+7ejXJFSivwH1iTtz6ThhaS3
         kK/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTVSQL8inGoaRGolmNQfEfPnFA6+HL5ePWunkJIICqxEG/l/1Z/GCt2/wiTRVm4J/ZUvB+JjJPJ83RUwZfh/05Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZurPsxlS9+uV7ID0foRFHvPGXIIc/eoU5KDx/JZUHTzjPivtt
	2Ocik0pR+8THA6W6UjxEb82gCqd1PLFr5OITLSZEqhFpz89ijWMUzkuiRj46M/2SAJs=
X-Gm-Gg: ASbGncsP4pxJy936CEYNNZLK0klzmlGjBHvPymOKJZlfeE9B1NzP4HqnBTlzqFgz7Kl
	Yz+SEyss+W172mPQ8c036Yk2c3vOxct98/+pdtZi2PjwZFXf96wErXndc9kbi3LFIUj5tU/T45L
	WVKHqnugzpEJd+1zo1O7LBSTRtpsdeZ2NmC/a24912e/uOGY+WMM2NEKF1u9a50Qg4omw4Xvec3
	uqaN7drrSO+jmet3B7v+IvlcrEr8JUHoLQoJjioeKyxkECj8B/G6VXc/HATqmTNggUYOkbxQN+X
	INBmUB3Y4LBo9mK7ijSqCYKE2Vk/fWhigCgGgbBuA0RjdiKDZ/hGfjKWRYswU9y12gfS7wHJ/Eq
	x4ojVhFx/Y0Umwmmt3mDMgfYkUardD4ZXhWGnUXxgeOuR9Ohc78hNAulpKKlGWeG2IHe7rYQxNs
	P7Ni7y0RFoWuM=
X-Google-Smtp-Source: AGHT+IFBX/o+kgDdCkIA2bNZvHnORYARWl0wDAKEM8n2ULi1LZxfY2oyiaBV3uC93IjX5zqlQAABOg==
X-Received: by 2002:a17:907:2d2c:b0:b04:274a:fc87 with SMTP id a640c23a62f3a-b72e02ca22amr246594766b.4.1762609683650;
        Sat, 08 Nov 2025 05:48:03 -0800 (PST)
Received: from [10.41.228.128] ([77.241.232.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9be2eesm537562466b.63.2025.11.08.05.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 05:48:03 -0800 (PST)
Message-ID: <74eda972e038b901b237f2d54f82866b31c5a3c7.camel@linaro.org>
Subject: Re: [PATCH v3 05/20] dt-bindings: mfd: samsung,s2mpg10: Link
 s2mpg10-pmic to its regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Sat, 08 Nov 2025 13:48:02 +0000
In-Reply-To: <20251104-elegant-imposing-boa-6279ca@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-5-b8b96b79e058@linaro.org>
	 <20251104-elegant-imposing-boa-6279ca@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks Krzysztof for your review!

On Tue, 2025-11-04 at 09:28 +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 03, 2025 at 07:14:44PM +0000, Andr=C3=A9 Draszik wrote:
> > =C2=A0required:
> > =C2=A0=C2=A0 - compatible
> > =C2=A0=C2=A0 - interrupts
> > =C2=A0=C2=A0 - regulators
> > =C2=A0
> > =C2=A0additionalProperties: false
> > +
> > +allOf:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st: samsung,s2mpg10-pmic
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
>=20
> This is not correct now. You do not have other variants here and ref
> should be directly in top level "regulators" part of schema.

The commit message explains why, and with your comment on patch 6 I have ch=
anged
this now as you suggest.

Thank you,
Andre
