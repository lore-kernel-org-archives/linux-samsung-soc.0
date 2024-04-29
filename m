Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744DA1411E3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421207; cv=none; b=TnqRYDCMVttH6IB8nRJSx+ySkBEv93Pk/F9rerAzC0mGtFmJy9Fy+8cBSXRu3rSMCvYpT0bfbb+sy45KZJjXBhb/60Uu2ru1033NVFA/PnMcYSi0tq2tB9otjoKZtVD2TLb8IWUd466slpJ7eFHubKpo6aLhgcNFU56D1M8k6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421207; c=relaxed/simple;
	bh=8jUOgi1XXZrbwIAYkNr9gAmLVkhI5hRZK/P2iEf8yFY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O/7/jeikxWuvtmFyhPnNZEMlDh7gZJHesU3p0RFk7ISVPXjnsr3xxJmeyZ5qRi3r06vP6UCl9Ph7vODC7rxUCYJACS5dKBJ9lfi1HNi5KQh04WHfqxKNtyYpCJmiiJi1rD2C+CmMLiLPqJHwxXGe4QqoblYfnnHZjBe2J3hjoDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IH0tPWo7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IH0tPWo7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41b782405d5so38448955e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 13:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714421204; x=1715026004; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8jUOgi1XXZrbwIAYkNr9gAmLVkhI5hRZK/P2iEf8yFY=;
        b=IH0tPWo7ar8LriYX/sf9mw4BjARP1yv1gRmiiyCucXTP3pX6TRx9BaOYRJSoC7N5gK
         3KaGqCb70J7d7ftVT2T9fOzhjnMGDSKOzwf5+sPzP4ZPaL5grNj4pTGBgTxb1R+wwGNK
         5JaGSyPUFruHWPgQP33tvK7jHW4D6rJmj6XFqzWnAY+QV20rHS3+B4ufR2rCiF7INgTp
         8VgjPqqg3zF//W5QCyQrAJcWcDriRmnquwLiWzhO5x7qvREP30oAFityuNAfIxltU7mh
         dhcAh27QJ/kGjfpr2CTW4SNVObT/jAO86zrju8ndGXbex1TGohmiM5bGZ6QhGoA23q2l
         OicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421204; x=1715026004;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jUOgi1XXZrbwIAYkNr9gAmLVkhI5hRZK/P2iEf8yFY=;
        b=exRZHqydB8IEk2yVNxKdDH75533ZlfGUr9H5oLRd1leko7GmN8Dz4WTBjtrc8+qBeO
         GtrwxmAmzrDM5dsVVtROJkIp5VdZRhNZF4XBZ/jKjtcZN7X746UcNLB8QcBG6SmZV57b
         uiRfzpvqKoZmM9sigd2hrc0Eg8XirsXP3Z+ecpiT6gOmwskyZnVRR+r04JhtVtiX0Agw
         x4rcOpP9tU0Rk3/MDqRUoyRoZ8s41+JrbzpRCUWgMvoe/vuLuuq5HhVGHIlESZhb3Iok
         PMcfa1AbPGF5XZfgIQuNb0L0w5l3KFb8ipirjzNLs6RdSt9rVpVqo3/4J9HGnXbhBewO
         9CgA==
X-Forwarded-Encrypted: i=1; AJvYcCVuB76qW2b5mmusHUcoEdBOR2i1iA2jYYVQqWdAGqyWqLV9xXvilTTgYV6fEcm2icPCExbx0dJVQHTB4SzpECbVvaPtqkxv0MnHcZ5uRUqPeSc=
X-Gm-Message-State: AOJu0YzOAUHdyS6DfB28ieZw3OpJEOA1aizo19nbnON+bDcn8N78lna+
	BA1EV8rcmLJ3+9GPgSlhPzXNREyDPFZ8hyWxz+J7rj7cmZJd9JsJR5ULpm2Ot28=
X-Google-Smtp-Source: AGHT+IG/JkC3NmGrBVKnO/crSew2RZ93tKu5q64K7Be/fwVJ6UWNWK9tDLgS4WLRBO92OWd/6DjpYQ==
X-Received: by 2002:a05:600c:198c:b0:415:540e:74e3 with SMTP id t12-20020a05600c198c00b00415540e74e3mr10044316wmq.40.1714421203786;
        Mon, 29 Apr 2024 13:06:43 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id s20-20020adfa294000000b003455e5d2569sm9432577wra.0.2024.04.29.13.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:06:43 -0700 (PDT)
Message-ID: <8309a9a8906d3b910f775c6d55d9f75681b03802.camel@linaro.org>
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
Date: Mon, 29 Apr 2024 21:06:41 +0100
In-Reply-To: <479aeb87-ddc1-421a-a451-d9e62893eef5@linaro.org>
References: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
	 <171441172281.306662.17546797534297489946.b4-ty@linaro.org>
	 <479aeb87-ddc1-421a-a451-d9e62893eef5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Mon, 2024-04-29 at 19:45 +0200, Krzysztof Kozlowski wrote:
> On 29/04/2024 19:28, Krzysztof Kozlowski wrote:
> >=20
> > On Fri, 26 Apr 2024 14:25:13 +0100, Andr=C3=A9 Draszik wrote:
> > > This series enables clock support on the Samsung Exynos pin controlle=
r
> > > driver.
> > >=20
> > > This is required on Socs like Google Tensor gs101, which implement
> > > fine-grained clock control / gating, and as such a running bus clock =
is
> > > required for register access to work.
> > >=20
>=20
> Where's the DTS?

Here: https://lore.kernel.org/r/20240429-samsung-pinctrl-busclock-dts-v1-0-=
5e935179f3ca@linaro.org

(I was waiting to see how the HSI2 patches pan out)


Thanks,
Andre
