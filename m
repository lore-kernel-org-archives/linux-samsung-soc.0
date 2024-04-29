Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696AB1119B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 20:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421494; cv=none; b=DX5civ4rOWOYolBvAUk8TgZn7w75DKulgSUmMMvzypJWyLdwhdTbWCj9WnYi84Hv5GHKNtw4BIO6bPaywnlBpuO0eT+5WxBrRzBxqhvNsDVl17c0WBAFoxoTUZB1Lzg4zVGPJ2YocQSE8IGH70OWa4FqbnfLRATFkGQnYbJScpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421494; c=relaxed/simple;
	bh=Gk9Q9uO+A4X6+2/odyrhEeYvregRg2NlQ6Np9vWKc+A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M0HPe1F0nVbiKuaUswy2M2QfjPpiskv7nICktzaDTXI1lMIxuRvEItyCgRobb1kYng5sS5vr+LduXrCaHayL/xgJ/qgKFhwgVPf8RbstH2CMjlfZqnJ1CNoQyRa3EsKUnsSZxrlSLKKvIk1FoCOY2EHJTcYpAlX1hNWnakBW4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzUI6NKn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzUI6NKn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34cc606b1b1so1916081f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714421492; x=1715026292; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gk9Q9uO+A4X6+2/odyrhEeYvregRg2NlQ6Np9vWKc+A=;
        b=AzUI6NKnQWJg4cn9x7g4Ojimv9H8JvqCAOJPoarG1nsV1HirNYI7MVUJLiVvoOuYh5
         XhVqW1zDzwpyr1mqFRr6FeseflASXv4vNksEehFvcudUk+tExf6bFl4Ie7c7pMKjNHac
         /KUhsT7A2q6P/sAtQ7xJG376JXSqAS2mxHm0g6U33/LhAU1/8oSHj7orcu/sTY0XKVQB
         2n3GHxS/9ATlP3ffjOL3ZyRUJkT7GbRcgaj5MBlkzLEGINBNUJyKayuUGMnSsNcZvanK
         npSW4M/oiwJI+f2Ca5SBWq0ZfX1SMe6bDz8LU2kqEB+WDPB0nweXw3Vtaemf1gtJ0S5D
         VLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421492; x=1715026292;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gk9Q9uO+A4X6+2/odyrhEeYvregRg2NlQ6Np9vWKc+A=;
        b=NjMnfDuDot7oogRQpYYVUoXM1aA8Rv8vvqm+rw6qVCWCqHDF0dljg9tsgqmU4RNUCp
         uG4ve2QxxsCtCMPy6FXOfbJtwzhd4crjalSfKHtRCI6nVbtNXbaS627MUMQtOnRKGi8C
         3+NGQgri8caUjNmSKScav5maNN+ejomVLcQZpm8JkqNldMs2jnu9gA/YC6wPklq/i+U4
         TwYzMCfsLFKujSDO5yIsniGs797NtXcl5S7eAAY0xrfNQG5V3xL5gLr4N/NrcHUNogY6
         0lqPzCFxtuIwbudL2dpfmQW0I4Em1eU7PsC9KAtrGwtjcoACvOpClmvd7eNqMZUW02LS
         xvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs82rWVpm2UBWiK0zRzUzENm8o3Icor4/mPn/URmD7IqINfnVXBkpOkMThWMX9qedeyc/dK2oE70iabG9wbXqYJ7u9eL6ObO2PKw8YlJyfrAQ=
X-Gm-Message-State: AOJu0YxGxwI9Jy+HnMsniczIT4Way8X7ILu04zIahEp4rmRgwtBbGC9z
	WcJuT8PivaSeqZfcIFzdhvpM5giEjwSrPU4+Fy87eYbiQsJc0b3+YbbOSj1j1qs=
X-Google-Smtp-Source: AGHT+IED0nGy3qbIPeoHBT0UXTPEa8PBvuPeW8v6yBecZqwOZZ3M+oI31X4uRqOMy8lVpuzoahiqVQ==
X-Received: by 2002:adf:a457:0:b0:34a:4f1c:3269 with SMTP id e23-20020adfa457000000b0034a4f1c3269mr9488780wra.0.1714421491886;
        Mon, 29 Apr 2024 13:11:31 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id bf7-20020a0560001cc700b003439d2a5f99sm30300260wrb.55.2024.04.29.13.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:11:31 -0700 (PDT)
Message-ID: <560140f9b402e86b4d0e54f0eaa96a5cb57cfa22.camel@linaro.org>
Subject: Re: [PATCH v3 0/2] clock support for Samsung Exynos pin controller
 (Google Tensor gs101)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,  Peter Griffin
 <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 29 Apr 2024 21:11:28 +0100
In-Reply-To: <8309a9a8906d3b910f775c6d55d9f75681b03802.camel@linaro.org>
References: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
	 <171441172281.306662.17546797534297489946.b4-ty@linaro.org>
	 <479aeb87-ddc1-421a-a451-d9e62893eef5@linaro.org>
	 <8309a9a8906d3b910f775c6d55d9f75681b03802.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-04-29 at 21:06 +0100, Andr=C3=A9 Draszik wrote:
> Hi Krzysztof,
>=20
> On Mon, 2024-04-29 at 19:45 +0200, Krzysztof Kozlowski wrote:
> > On 29/04/2024 19:28, Krzysztof Kozlowski wrote:
> > >=20
> > > On Fri, 26 Apr 2024 14:25:13 +0100, Andr=C3=A9 Draszik wrote:
> > > > This series enables clock support on the Samsung Exynos pin control=
ler
> > > > driver.
> > > >=20
> > > > This is required on Socs like Google Tensor gs101, which implement
> > > > fine-grained clock control / gating, and as such a running bus cloc=
k is
> > > > required for register access to work.
> > > >=20
> >=20
> > Where's the DTS?
>=20
> Here: https://lore.kernel.org/r/20240429-samsung-pinctrl-busclock-dts-v1-=
0-5e935179f3ca@linaro.org
>=20
> (I was waiting to see how the HSI2 patches pan out)

... and potential binding feedback of course :-)


