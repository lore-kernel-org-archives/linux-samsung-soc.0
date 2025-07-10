Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCCF226D11
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 06:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752128010; cv=none; b=h6sB369jezorCVfBMBhaQXgquEjyhifP302QTRTlt+a8DIMP5o7wAwBuyuW//vF+fsccUPfJ7TkwZo6wnf+FWGkIQsJKRHvOiKZnb127PEyaOHBfChDi+GAyQt7R+zfoIdrXFVeX11yRj4eUGnhgnEYfvFI+cJkORKvuYlo0ABw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752128010; c=relaxed/simple;
	bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S6+NcuwxcrztDx2hSfeWbCgQjtGDR8gmObjJbxO9VhAKBkqfvJOp0s1j2hugsInCyJ4acy8ec/yZGImxd8IyhJMKblelFJhqDQBJUBuNgyg3Q18pTtokw13Suay2FLaJkiMJwljnge8WQ8GBHOyJgMP1ylh0n0Yk42HfzC1ltTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkU2IP7u; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkU2IP7u"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-454cc6e987dso2293915e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 23:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752128007; x=1752732807; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=;
        b=zkU2IP7ujYqTyGGOEW3gmH5SnilvbRve8qYvn3zZuWyRFLoCp5r16oqHfTezj9RUKv
         eaBQHBxucWJ691nq6t1XjB618YgEzZgsb3R3GgBmoI0VpHQwL8JY3coW3F5Td43x0NDs
         LkZplLhz4oDR9SyW0DSMmEN8ShddZ+cSR1E49p8tT2p3oPpEloCx+AUYxR3wFmDKNqhJ
         9VmSzjIppD2gIZ1LHomX+CyTD1Ug7kntwFqN+DP1J4W5nghXPcx8a5wNPryWoBbfJ/oo
         TQGdLOtz3y0TtkF9eT7Tm9V2dQjol6TF02lOrzH5NYVT737tEDq/bNIs/v/KSJc4fZk9
         /QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752128007; x=1752732807;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=;
        b=NEZhsF92UIikoRgTNQD+C1TGR9F5jCSOmYtomVCNqhpGNzVCDBBi0TDAhURRO69FyR
         sFmEgybZC4utA+b8VOIH5+GAuJ+f2TM3KiAD7h76WNwezFDK9s2c5+r7hzQri9cuowOt
         pEQQH7QEimbCZ7gTbRcXQvMfHA6HEq68q9/TnVqDYNtyMqBdV9Cmp+4g2uOIVufAGw0N
         YKoowYSxW6vZK7Ip/9BSqAUMWIHFMcBznEMKXca60Jt+0K5g4Dbh1PuB4Dcz3gfzBPZm
         8ZFUxPjxa+ddIX3OXUSYGxHhJut7FNaWXe9jxe2m6gYcjIzRMi/A/jlH7K6x4fA9Dd0d
         S98Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzNhd7iemvAMOmGAaM8izOdA6XbQcEXEJ6En/RB9IY7v5u3Ej3PWNlSU75FCASvyUxKglXGW7iXWniIKmzSdjKsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOBkfYKtACisRHKu79jPa7q0ix+hzvOIUNpcReeWaKY2lv/cI
	c+cx/6LXZWxCnt/QyW2pVU0CKp940d+tF+vK085gP1rXZvV2gVpzy6rTtAF93RmBg/4=
X-Gm-Gg: ASbGncvB/gOlmSQK/zqsnVTOxXIiO+DkmzxrVP89mvGTXG6f4I936mdBJ+jkLWdmhs5
	tvp4TJrO0vpNYqDQtegoiMOSwe4OY6UqeR2iKY3V2sANVPbVmZNvYR/SEEclqelzgkDaiF3KEMU
	wcot2KJWKFLxQQa1Gn77xgSm0Z5SRhWNMW22nT/WgSBoajrv5F5VkqAKmjXuHeaHsqGTX0JX9WX
	Ura+IwyBCQnm304B5p/eSPAzy1qAtppH8XcD6a/aBOGb2YzhUCN7tJJimsGvIEmOd1e4+1nhlsp
	X/JW9172muBog46V4de2lVJb4L8sTamH889vkdmBcslqjIYED56nx3Z2BX3LZi0Q0g==
X-Google-Smtp-Source: AGHT+IHg4xHnynLCiIdYwfhLH1O40xn1jbcOOUbuZ4D3/9/bt4jhqFWxA6m1cGXDr1jP9UbGzQIkuQ==
X-Received: by 2002:a05:600d:7:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-454db8d8cd6mr16068235e9.15.1752128006691;
        Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd466154sm8854885e9.12.2025.07.09.23.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
Message-ID: <176473e3012018e7c6e584314fc68679ad44197c.camel@linaro.org>
Subject: Re: [PATCH v4 24/32] clk: s2mps11: add support for S2MPG10 PMIC
 clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Thu, 10 Jul 2025 07:13:24 +0100
In-Reply-To: <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
> existing PMIC clocks supported by this driver.
>=20
> S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this patch be merged please?

Cheers,
Andre'
