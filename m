Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C725AD2C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720460013; cv=none; b=lxR9V6/v/B/aY0MgFKQmAdLMdJLb0uCRJ5PfH3nhF6F8AQTvf6WuY/+HaLn9869hLTFkrC/9AC6ymVv20q5oTLAPK/GJdw196HYSvl/JqdRIkiIiD5I+grk7cmBL9Shm06u9/flF6dWBQR4p53JwYYBzXutzt1D4YptK/y2yCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720460013; c=relaxed/simple;
	bh=xMgVMxuVJ+4mDxDIZpv60LWECy5vBRGinidcROVywxQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BEojPKKUAY6oNkKOuTHqWtQQiqrLPeOa3l2QdHoNfPL/mI9kbk2p75vKi/XJ7HNQHPSi9tfz6v91vOqEvWUKr2xd9+hlJcF9eRebbxdv04q7jch3Dvqsa/Af4QK5mV1w0EoygELpDeA46q5Nhx/S1gbZV4D+Oq4BVM1nQqqVfTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y50tGogI; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y50tGogI"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ee8911b451so52344131fa.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720460010; x=1721064810; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xMgVMxuVJ+4mDxDIZpv60LWECy5vBRGinidcROVywxQ=;
        b=Y50tGogIngiclh4Gts5xkP4pOWNro5ruF/OZolpDwLqRsNTA+OxfK0DtSOyKzzALe8
         OVKL3i4CpYcP4Nw6lYb0nfdhnKnrGCIR7T8t70gVVsI44HIpmtlofEaQJ7VZiPolsOn+
         f8oKytFIs7qqBmvnvOz/7XiPTT0kCMfvXKSK4hHsihxFH1QroOx7ByPSJhBvRrlN2OBQ
         HHCbi6iN1EA4jTBdC2owSX7quGRalPXVfsO/p2EtzGdUQI7zpwJqeoZ5B/RBk+ZejVeu
         Dxa9zCLntjXk/8y5NQCFO0oA/zKUgHm7SWYSeGGBjF7oYWtrqhG+0eFfPVs6+QoyFjqd
         Q5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720460010; x=1721064810;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMgVMxuVJ+4mDxDIZpv60LWECy5vBRGinidcROVywxQ=;
        b=e/WYew/oPPMPvGZC3zavbfnsY1PuNrEVZwyMQOItkc7U0xdpYewQeXobNBRjgAJX6D
         1WMqlQHmRgq90yBBOjlAU/caJSCzWDklxERfkKoZmEM1TnEDYCOF04vzSrCPs0YDb/HO
         f+kIoc2E7/9mgR2gQEueURpFjp5JhdOIaVPDWzlxUOgqEJ6hzZKe+dCcvYXpw2gYhcp6
         /JDJnjFS/ROtVLhga8OS2mJCCXADN6fkLpsG2wdi98gfv5kXf2rQ+P3N1AQz7zCQ7V79
         fiw/nQkcYHovojGmPvKtUxv3dLbnxrnhSl8WriKx5c9zG9Zg9DdtmUHhp0OFbeOQKvse
         wGvA==
X-Forwarded-Encrypted: i=1; AJvYcCXOY2aUUCIWF9uIPx5GybZaFuG2Ynvof6DOmEv5N18MKBM0bA9+Wft9/if/Swj5cJoFiKOmcXGdWTBBONylnH7YryTzaxOyVy1gl6/4Yc9KUsg=
X-Gm-Message-State: AOJu0YwAk0AhQ9Gdf0gs3Y2OfbOhaLl37kiityJ7jHThzt9LrEME70tv
	LABdnxFtYDuu0taVkeFMizMs/TanDx4X2LFp1Fbe6o30uiAGg1nH6TrIieszcwY=
X-Google-Smtp-Source: AGHT+IHqm74O9XrXu8Sp/c9nwIkpH2JvcIAs+C9RT3fJBrhdSnfh3Hhhnky9bRB/8pAITn8lkJu/iQ==
X-Received: by 2002:a2e:9a92:0:b0:2ed:136b:755b with SMTP id 38308e7fff4ca-2eeb318b5e9mr2863341fa.53.1720460010540;
        Mon, 08 Jul 2024 10:33:30 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741553sm5885805e9.40.2024.07.08.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:33:30 -0700 (PDT)
Message-ID: <77711848a7e7242a7445a4bccf5c93675239b838.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Sam
 Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
Date: Mon, 08 Jul 2024 18:33:29 +0100
In-Reply-To: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
References: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-07-08 at 12:04 -0500, Dan Carpenter wrote:
> Return negative -ENOMEM instead of positive ENOMEM.
>=20
> Fixes: 497ddafe915e ("phy: exynos5-usbdrd: convert Vbus supplies to regul=
ator_bulk")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

