Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757373A960C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911391; cv=none; b=HIrNAfKnDhUCsmcEPcVKIdQ/7FsTENuFcZ1ceqGBMwTm6h5BmzHCjlr3t2YSbFVHmI306J6OasSooLk1OP36MpepelRpD2LZGhnzFu3e4OZbqZm/bzz2ZfzEb5XpOXUmjce8F87NlsRSOVEuQJldKrxbRHNXbeN1U2XxDBURF6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911391; c=relaxed/simple;
	bh=9vuH11vqZu29gsum/hoeAJ7Zy2fpKXOeqC/I7bxBlA8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YzVf5+RB7BJOYRj8OWL+SYnlIpAeWEErZBuzw7pCyTGtKleaJsStU29iX2hEo+7R4iHqLBaAFEZBSjawFLQbcHKvdmqt6MHnLHq4MFSfYXLPfx37MRac6WHbmuTXm6IMJKn1lySqNzX9ypMSDSi8328tWA/6Pg0U9zJI4TvyrbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTJ59fvI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTJ59fvI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so2714338b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768911390; x=1769516190; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9vuH11vqZu29gsum/hoeAJ7Zy2fpKXOeqC/I7bxBlA8=;
        b=fTJ59fvI+29697Q7JKksBkmBnL6vcEIJhQkhOxh3sCKGnxFknP7k03dUf6LEd0f6tN
         SVYteULHF4zNEplJarwkzdtOhzkthlQv4aVgg2M/KywS7G1ERppCC1M/P4n8x+UmqGvU
         IzeRfC7o5oZXsjn1fPRCrEHO1cFYDvvKxGwhcsdrTViaMe73ajyaaxij1N5AxZg/VYco
         FIvWeVeUXLkKvZre0h8sTrmCXNzU7a5iHN+/LhgFn3XIosFR3Tykq5dbEuoH1HU5ol/B
         Rq8OyGO5IWmesTA+yZueUl0NpoQw4ZigQVpFmeMpjNT6DkdUnGOQOE7/rypOFa+khZ6+
         VagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911390; x=1769516190;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vuH11vqZu29gsum/hoeAJ7Zy2fpKXOeqC/I7bxBlA8=;
        b=uHxdlP81k/rhednFxxMMqS2tRgBJi83DlTPjVqyPyK6JSFuHBzC8GCtexj4bkAKmzF
         ZxE82fnhfd2wYbjjGyEOa0OCB7Q6DTPsm9QyX3Hxk4Xog29HPYVav9005XgHXLs/a8hJ
         OagdxdU8N5fPXj1CHhOwzDSrr/Jnnt1Bm0n5RZi2eT6pfhajRu1n9AacpWyzcYVFBvZ1
         O+GqPoincg+HjyRQ51jUkej0jf7nFzMJj3nXceKNi6yN17ezRJnSf4oMA157Y6edrUlX
         wDf4xmXSf1qHM6p8zyZGl4v0U4L2fc2tHC3KDnzM8Ctzxyx1mDMMTcdNsNj4qqhFr1SA
         7wFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMbUSO1XuB3D4NeT4k4FydH5cVq9rm3WcZ0SWAyBpKbGJ00Yfgf0dX8V8WKSIx6sxZtsZHvCz/Ui28m8yymtCtuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAGcGWI2SS8Jd24KPw4jffptHXG+TT2YP5zXVpxoPw9wobPrwU
	QODBqK/MInA5ZAFr5X0Aqc1OKETEwh0k34t8jQjhtOClEIIsH8Ji6A8xb8jfeuh3s/U=
X-Gm-Gg: AY/fxX5hQffaIHOcwt01Gf5ng6y8uhmsJmPiKdpd4X9IW7+ffo2KsaRhJiH38uzmsN2
	EVHeYWb0QGj0bIpmyoIfeidX7rWtcakNEjc+CRbgjeojEccmMEfIT9GuYJhD9dPsGsFQ98PEZ9t
	RXRFqT6AYxyMP+RZr+jBC22Z3DDTecCVFGKp3ARHAcnXiMXCjt2lEkUHt+/yfjTBljyA/C4uVOT
	0o+pY+7XrRFe10mvbUnl0xUvPAGUeGm4rKMMwc8ahPoSYxuLeci3MV/gevoLZO5P8bK2CXQrRLx
	rS1F/gO71P22iabmkrSH2FS4aTBBmJONrvc7SFEBRLklPF9T1XSvBvXoG232UTJbc4wOLYQbyeg
	IfriX1vjRPmD52o/qPxROLtWiuVcaicgnP+VNEedpxXQrNUm2UoyoSlLg9zjKZTm38RFbHmIN+A
	w/y7FHhDZVLhvflCC+
X-Received: by 2002:a05:6a21:6f07:b0:33f:4e3d:afff with SMTP id adf61e73a8af0-38e45d0eb85mr1912793637.14.1768911389547;
        Tue, 20 Jan 2026 04:16:29 -0800 (PST)
Received: from draszik.lan ([212.129.80.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352da1eb6a5sm897758a91.0.2026.01.20.04.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:16:29 -0800 (PST)
Message-ID: <17cb0fffa7531e75b8cbe11252deaca1bf377a39.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij	
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@oss.qualcomm.com>, Mark Brown
 <broonie@kernel.org>
Date: Tue, 20 Jan 2026 12:16:22 +0000
In-Reply-To: <b9df01e9-c4ba-4e2c-b458-bc93663ab78e@sirena.org.uk>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
	 <20260113112244.GE1902656@google.com>
	 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
	 <20260114155011.GC2842980@google.com>
	 <b9df01e9-c4ba-4e2c-b458-bc93663ab78e@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Wed, 2026-01-14 at 16:02 +0000, Mark Brown wrote:
> On Wed, Jan 14, 2026 at 03:50:11PM +0000, Lee Jones wrote:
> > On Tue, 13 Jan 2026, Mark Brown wrote:
>=20
> > > Given that the bulk of the series is regulator changes I'd been
> > > expecting to take it?
>=20
> > I have no issues with that, providing you offer a succinct immutable
> > branch containing just this set for me to pull from.
>=20
> > Failing that, I have the machinery in place to offer you the same.
>=20
> Yeah, given what Andr=C3=A9 said about dependencies if you could apply th=
e
> MFD commits and send a PR that'd be great.

Friendly ping. Is there anything else required to get this going please?


Thanks,
Andre'
