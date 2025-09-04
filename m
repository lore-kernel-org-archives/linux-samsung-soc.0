Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E7C306D36
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993580; cv=none; b=QYNqzLFQqRwJY544dHIKQItwP0DbZ8DtZiT0E0i3RYXwxwCffa5VMlGiIbT6+vW3tO4jQCVf2ovLwxH4YNAQDe9RqJzo6rpj/foRtNbJBCNDqMH3eM+RHGYQ9FwkwUWmEVc5/ny7zXV4LSJT3mZykib6n5VA2jJwh7oCPwdMuEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993580; c=relaxed/simple;
	bh=exbALax/KRnxM/htU8cfFCENh4IpreCWgJhwJJBmuts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t7FBhVbTcOYGISJc8XPBCfElMhLBO/TjJ6HkB6XqNKCRQqqyWqX1Wq3iFr1fF1+8Q+Qt4ltNSoaczl6ToIic8HgDhu+u1y7q0fC/uUoiaMPYnAQtK5vjeyWPcafqtRiAfvXMx/N/ZylIynTdhudONJqZTrQcijRbdCKB9SwuT0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XllKDlSw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XllKDlSw"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0446e57a18so12317566b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Sep 2025 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993576; x=1757598376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWzUXsK84owgqc3mGwjxow+K46mQbNDiKZu7L/mwO3w=;
        b=XllKDlSwVYM4Dm4Eyfg6UnPT9NGYHhowMX4kzz7IeWlSwsiCSzBy66y1nfjR2iROfs
         KZ74/ywLobRVkbXPbBJNd2jAx/XM+T/tZbRg1W6f8kwWw1IDBhMydMM6m9XXN/rEXXY7
         mRJ/r5x3pMlF0ipbplmE6ad7ym53WYpeSuXPH9HmH2FF03bZ5kOG6rJK46teDxxyrh69
         RD4FFDxSsYdRZsF0JWGceHkOT2qjObiJJXhykEJ7sAvn22Wa8qV+cnZvtWdpeENARRJF
         6DmU9ST+6yT1x/1S1qqCwKD6mhbALNoC1pVg5ONceldmh4tkWV50hFFIF5mY8LLBqoYu
         56aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993576; x=1757598376;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWzUXsK84owgqc3mGwjxow+K46mQbNDiKZu7L/mwO3w=;
        b=tAk7t1ukDITHNZ7wLdgD9xhfqPIp97esk2RQ524Z/qSWesOxhp0UaUnv3fzf4asuj8
         E+7etMrMbApwtIVYNXBBwl/50+l82uIF5dZ0ozqV9LQ7lhhMXEVh8TIVAOq1lp5nLcVz
         13OnG53iYt3+zAQDdrmdmEuKfukLISr2qdSKPOatY9JT3zGjVvIjGpHDGUnberZ8KRBm
         2+G38VG3IfdYR4D78l1H20b4cuDH4oVZgjcy1X6FhJEYa4QIAN+Hl1FKf49bvy4ZPetp
         qZvpPwUiTDBjTS/e6XXdTXpvlMhfpUnK3dOFJbwDXrarzxoySx/29D+S/xht5gpOmpFB
         9cZA==
X-Forwarded-Encrypted: i=1; AJvYcCWBrxvZOsgxrfFVjzzMhb/bVAuiopCiIOhSNGUal1yOEch5RizdP/2ebrHqq/8boUifGKyI7aWWzM5YIlZRnNvONQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQFLxibeuTSb1u4nWOsQP+XCXC2LKziQ71GvcqTGsOsTPGqXgN
	7TkMWRfI5JvHbATMJFuIA0+ezAxlPRNuNIYV0vH33C3M3H3ucaDqmmwmESQ3UX4FUsA=
X-Gm-Gg: ASbGncvYSM9PD5xTzhP7/FwYALdadqRFT2H2I+0XHVgTKaG1rQGN0WpcuGgNot+Pzwq
	bBGHMpmPicUoe190yvDrhWj/GGCnz9y8bpRSoIjA5c3RzbLygvFzPSHrAZd6f0N8AtWxiaBDD32
	xFLJt/l5Hc6uApBvM1qDzoo0cYjqQZE0lDCd3yESAWZwkz3IS6ysTwfNJxh9fGxgVCJkbzhRUPz
	elcsloL7dHhVJtxwpYiTdAiqIpSpOVudyT6opWyBMSMTjVvhxl3FYh80hzaH4J3vUOgJYZZhfiy
	rGM8hfRH2qib+JQOY0wZWAVVx8APEXV5pc+VGkirfmFDYLkNtBNh3JE5ssh7HUn8AC+QGn1PAXo
	41cScaJhqOHlqb1UQjrPh2ODoxJInbt1rfBJHJy/+HKaVmv11aA==
X-Google-Smtp-Source: AGHT+IFRjqi0rL8OiC4NZXNOIG4FcZYbVhKsdzHVKskJZtLsw0JBOE11012YrpNCw1Y7RX8De6y4QA==
X-Received: by 2002:a17:906:4785:b0:af9:5a1c:fee5 with SMTP id a640c23a62f3a-aff0e28e4e5mr1209123966b.0.1756993575559;
        Thu, 04 Sep 2025 06:46:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
 swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
 hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250901051926.59970-7-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054303epcas5p3d8079b7806d995bfaf3004cbb4f95e41@epcas5p3.samsung.com>
 <20250901051926.59970-7-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 6/6] arm64: defconfig: Enable Axis ARTPEC
 SoC
Message-Id: <175699357327.171312.14592323274121562181.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:13 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:26 +0530, Ravi Patel wrote:
> Enable the Axis ARTPEC-8 SoC in arm64 defconfig.
> 
> 

Applied, thanks!

[6/6] arm64: defconfig: Enable Axis ARTPEC SoC
      https://git.kernel.org/krzk/linux/c/eca86a61aedaa40310135c8799b28187afbc677e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

