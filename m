Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A218A6CC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723110523; cv=none; b=oXrqSIzkbwdRTdw6bB84UQvble8Yd9xKglKAZIP9jgqmve8MbiNu2XV3DZHGhVtdI6M5NUQAU2f6r4KIBCHG/D6G6pI4UfDXVdhG35WEC4KwpN83fxnP0LvvTBPRrBWBbEyN1P2a9dMvi6VFZ+0VbSNTUT8O7GOJ+PyPZ9EF3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723110523; c=relaxed/simple;
	bh=T+zH2BgTs6Nf9Od4NpzImwUSRTMC/ptukpQbdQB4pis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETqp2JVSGatbbYU3q9f48BG8h9w7Gqd/SdDB6aBID7P57AX2BLDizhR05WzHeEkRfgg8cHCrBW//RtugvkUvflhsA7bbuVMfn8BTr1hFoOyi8v+fY5B0mQgZLO5UkglGrnDCv+uVb4umDaToXPcY8kbvUhErIMM8cPxB6uSIVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVE3oVBC; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVE3oVBC"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5afa207b8bfso771888a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723110519; x=1723715319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5ZPOCd2ys4aq2QG+W66XIhWJ3hLTGW0abklTxDzsPk=;
        b=eVE3oVBCedTbPFsDAx0PtxVRDkNHRDzNdu2ARfckCDjAleuMG8wv+f+KRmrbr7rcGK
         91ATy2PGEc0tr7SD0Q+1IMA6QRZqaaptY7bGAjgka9rAKucao/0ZsOhFDweoajW3aJJo
         Izw21jKdCRwqQZYnzu0YmVpu0FQo492y5fcU7OXZPxt31Vl2unIRYl4pkWsa3BaEXzZP
         HIjGhm/8Wtqf//SXLybI2ZAHcTrKN9X/5/om9vixkoPff7sGbysd3FS0ysGgaAs9apD9
         LzQlUXjCht6X2nj1qaDaywFb6xZIEpIZhJqplmdOKDTRrPt9xmewG1EVMeAp53HaeZf9
         HLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723110519; x=1723715319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5ZPOCd2ys4aq2QG+W66XIhWJ3hLTGW0abklTxDzsPk=;
        b=jiCWkcTXVurA9k8bfIbhz9dxACZZM6fpNsKqjxzz99UdO/OeIqH2mAlvOk5nXYBOdU
         3ak081IlwYRD8J2s4koUSwfKLmxkHouVeonr/Pzs4hz+sjbm9YQcnp4Lw4A6HDUqJKX5
         daws6yiO/WHtAopeV2yKKqgHBcIeuvyJDzL9GQ+Uc+tjIYYQ7NGJkBxaAr+yMVHTF4jC
         smx9dm0EaxQzGPDJIHpCQ/zeRweMZYSDOW441dbwq18AdRExhIqZh8eqY4n4MKeZsr5y
         h9OZDGdmcL6et7r4nBAAFnhw2ihszw1wVX63M/20qQbVLSY9cuBVHYNtHKiTmA05VxhI
         wQtw==
X-Forwarded-Encrypted: i=1; AJvYcCXNJVk8gHsCDWB2V90TxRc9umHlWmyUcipU5fcKfEK7mAESMklNMt4Ab7IrSifUMlDVKajQAWY9LA/oVKj6PL7DGN+mdVR5uSWAjiayo1DoWNU=
X-Gm-Message-State: AOJu0YxDuXlUiY+CI8t4XjlAlE+dzBiimRFaODKqTYjLDPlJG+NL0dZY
	GepqBxS/yxU2aDkcL/D2X3mF1ln47ejPvs6m6HPU7XQvlJDtpljO4ltGFIDEGUA=
X-Google-Smtp-Source: AGHT+IHIAfemOxK3Z14hz1PDOFK8L359QZw/rvItiO3sxRls0UpGZVwKzIX8CSey6QGV/gcesGqHtw==
X-Received: by 2002:a17:907:5c7:b0:a72:8c15:c73e with SMTP id a640c23a62f3a-a8090eac7a2mr93527566b.55.1723110519508;
        Thu, 08 Aug 2024 02:48:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e849a0sm719911966b.186.2024.08.08.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:48:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Virag <virag.david003@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 4/7] clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
Date: Thu,  8 Aug 2024 11:48:28 +0200
Message-ID: <172311048731.12963.13183436852631483399.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806121157.479212-5-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com> <20240806121157.479212-5-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 14:11:47 +0200, David Virag wrote:
> Update CLKS_NR_FSYS to the proper value after a fix in DT bindings.
> This should always be the last clock in a CMU + 1.
> 
> 

Applied, thanks!

[4/7] clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
      https://git.kernel.org/krzk/linux/c/217a5f23c290c349ceaa37a6f2c014ad4c2d5759

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
