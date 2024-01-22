Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2A3FE43
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922111; cv=none; b=KFXqIU/L3aTJyD+WGTAOIxCuCXkN/vsXSxi+sBYWTloDUwhzfJYypX1vjtMh+LCAUBPN1Gs5k/rVw/wkIDZTNLL2wvF1jxvV6ydPyiVNy1rHNb2bzHqDTV5qIyET0tVHvyPsWr0oWwn0hxtCXq7d8Qb67fUCkqxLokPKP7Ijw7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922111; c=relaxed/simple;
	bh=r8Nk1nx6WxSIMVymXyEYbaNTmlQxretGrAviShA+EBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LhbodWBaNrsxsXQ6GaK1w3+F4sskE/avQ7msEcR7pgYpWnHeppHeYy23IzImBPh+f/5SBEkdpV2MY5eovVSQjc0zXwbj7oDrbMMieSDoMa5xM0Ka6UDwzL3vQEsxgdMlYc4tOMvzjSPN/M7gVNPIljcASABipO7V4xRLWID5jQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FAj2Vecy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FAj2Vecy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50f11e3ba3aso4171028e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922107; x=1706526907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNov5U8xwt5sXc4zpQlR2bDbhB2WJGrcQShsm6KSU98=;
        b=FAj2Vecymga4EtujHYU+w8hWUSUX6xMHvVxynewoxu+nQSQDqcYrIZo8YAFLxsFo+r
         tstfVGrRpSWkvYJqm2fOFu+E7pV9Ga/FxdSCQfkjDANZ6wJX8CqJO169OqhivnhrCb+I
         cwj11fFqCJsq9Zyw9s0wdNZ0F9Nz9vGbB1TrpbW4eqNZdNF7RbWNZ4ydoe2pnver8BpS
         yNTRR20QtO6nboBMDMJ+Wz0HDqmaMGhGiopd94FHyBgJcpVgBC5BkPDZEChoVLEpheoD
         963TC2uKybIzCvUb532jy4P/DnlE4AV6n+zmCWrvlasT40YC8psVCoAemWkG6h5LlBbx
         VHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922107; x=1706526907;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNov5U8xwt5sXc4zpQlR2bDbhB2WJGrcQShsm6KSU98=;
        b=XvpBu1aZ0/y3+2MSJeVllse6wrDTzXznRHeDMuWKfDpjz7Jg9KRa847xsVikhRaeW/
         0axX7DKg7laianWSnccfb6H6uwEyyHMK9r9YEJl4hbsiC40cuGu30xYSlrxy5fqqDuli
         jqfQL4xe1XaQkwasBcmaJJvrxsbCG0D6i1dlHs62M3JNmO8dejNKgYdE0ELeuMzwOHK2
         Pp8G+TcwpmvZU9ek8absIXyrG5AP3omeu8Y1YNo3O+SwKJfBCh18x0GOHZdtwbIuTVFZ
         DtLqA5aKTdKbsdWHPSZU87CCMP53SpTkEIWpNEKW6Ys6KOZ+rT9+SyR6QBvU7RGFBeV+
         2log==
X-Gm-Message-State: AOJu0YwPaLp+wWxI6hMJ0q0E4ctGI9LaaH06SoiS/rz4H5du64LZgWhT
	ODkHExeIFTCzjL3cWxq1m+X1bbzOQvrxYRw8GiH/zPGNDOYg/mS1+JZRMRldYVxz//F2gGMMOrt
	RFOo=
X-Google-Smtp-Source: AGHT+IFgx632zKE2RrfuyNYoFBwMDaIkfXdub3lk9XW5AkcMqYmr9BQPIRXB0qcwQPwG3mp6Xa8pAQ==
X-Received: by 2002:a19:770c:0:b0:50e:7f88:d34e with SMTP id s12-20020a19770c000000b0050e7f88d34emr1578498lfc.33.1705922107286;
        Mon, 22 Jan 2024 03:15:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mateusz Majewski <m.majewski2@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240116140839.1029395-1-m.majewski2@samsung.com>
References: <CGME20240116140859eucas1p138fd10cf371ed1e1681a5bdd7e26e74d@eucas1p1.samsung.com>
 <20240116140839.1029395-1-m.majewski2@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: disable polling in Odroid
 XU3-related devices
Message-Id: <170592210599.45273.13462998358002591317.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:05 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Tue, 16 Jan 2024 15:08:39 +0100, Mateusz Majewski wrote:
> After having switched to dynamic trip points, we no longer have a
> hardware limit for trip point count and can support as many as we want
> without polling.
> 
> 

Applied, thanks!

[1/1] ARM: dts: exynos: disable polling in Odroid XU3-related devices
      https://git.kernel.org/krzk/linux/c/ccbc2b02c22e79f08edb3d7e1584910c0f38e213

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

