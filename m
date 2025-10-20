Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168812DECA3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943363; cv=none; b=hujWTWdjhmgx0LfPelUkJU77YNH4UCga54pOktzfOVVhy7FJnCGtXI+bDYlZM9ornNOfg9pNmVhr7W6mLQSu3ohYsCu3gkqO3A73CCLvCcIIhxTlBho6osKOQkEwZL20zMNIGT5jBm5h4WqhoqGD63iFu4h8+zSHogpZzsIgEec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943363; c=relaxed/simple;
	bh=IuhePpDwW9vcsRvZZXVskNe/TnkA6rORionZyn8mAx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ch6glDc9EAcS55BphK/kuPJ4DacLF0+JpUe+fgVws/vl4dmf/tfMAQIkBJAbTaQpDD8FIB59y+RGh8WDg8WMVdxObw7DnWvuXVomCwBnwPXhKOtESRQq6MSsVdnaCypwbaILQxu3GfKox4YPk/vtbg0g4V77r/yRUEvQrgUaMTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zKBlNSmA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zKBlNSmA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b47a5a17303so64486466b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Oct 2025 23:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943359; x=1761548159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Czacv4czTyoltt/AnMN+6IUHG+NujxotRkdbKUYJy0Y=;
        b=zKBlNSmAII4Ekas7fQzlbz97M24xN5Qzz+W6cv1LVd+tIuXDoTC8a6LXfZ/quMtXRf
         Gx1Ke8hBAcStlXb9dHUcDApsfQInPb1BmZP8fz/whZ3unlwnBItFdB2/ZL66EruVnZkX
         d+5dvVZ0V5U96iOQob6Ac45qpqu+ESoERYNDwwMJX9/WlL1DL0SwMyY2DlfnL3I74tIj
         KJ1fPslyPq7UlXqDYqv4mziYi82BWK1s0ysKdm1Pd6KeKRCW+lej/2kHoDHrx8j6Vgjg
         5Pr79ZdidFQBcjQvVXpF1afDLOps3YUjAOm6I/e7AL6TQzPJEDnej5Q5JB0iFomLmTee
         aodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943359; x=1761548159;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Czacv4czTyoltt/AnMN+6IUHG+NujxotRkdbKUYJy0Y=;
        b=D2uZHUfD13pgeSidPXBLb5pUeKaBJ1CPnFYgjYFR82DlP2/US54Ijw70zefzu0jfv6
         ldDsjOd6PhZraT0ZzNe3Z6EVwA3I325XqKe+swoNxrjohAYwNqZAE/PewEcM2SzhHouA
         DDzZBF2cSFsYiR0cDdUTgYwsPaJB+9YqOT/zZlWWEITdbTX8yWFncAZis3Zb+tzBAYqZ
         zFK52zZ14q1HNMeLu7Mgq9iW5xFhSId6I3RaKcBPpvJCf4YJfYlU2uExAA3++STEMeAr
         UOizRhLcVftHCUJBXTnPsnuSdPj8gxqNJmgd6WGyywNg0WuCkuHJjewqnmlazjZur16T
         0vHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeXoWx7msfg7lB7T3ge6w5daCu2lD7WT/ozlriPHuDLOzAGF3PNDDUDU04Cbz74kJhdi+7JKr6wd/bVpg8B/3qeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrpbovxlq2GTRAPP3ImZf1fissBC8wSgezgOpw9blipSN6HaeG
	t38uTOlX5FviDhu7hiU0+8wc+604FYKcoZ62XTQjYP+v6Il/RSR2fyjEEvKRhk7uLag=
X-Gm-Gg: ASbGncs0/x8jzEM37MkSdaQ7GD1mL2If1bg+P4B0zwND32Bc3mjqDv+WbU7BiCJ/bcR
	xH59YWKYLMrDXOgkBW3P6g9SAP1QSJUVP5PCVtYykkUA9irnOvCphp4Qu8pSiUXUQulnEWp5pG+
	EMu0p5AxQJd1ugz3l8e4MVnncMVdOgdBNlDaQd/2VBUiAlMWoM5E09rlCrA8z1MDkC+NL4FnIfL
	2eYhjWazGtlHao3hJJVr6tyoWXpsFquJae51j0JObmhtcOdjv8YS68ZVm2RsEYpXVsiZ9aEQDlc
	yhgfQRM7elTzy7F3QcFRteWCpp8pvSEsPsxf6E7C+nacoDxy+rj015ISd4DCVjOF2QJ1buLJmUd
	lp2HgdxS3VnsXEKmzF9Agw3cXbB9+IwpWQLthBUr3wAmHeYB1CbMF6YHvLLf5v+PU9zwEcuyRql
	GVCaABREzyP0t+DA63ZhpzCXKJ8Z8=
X-Google-Smtp-Source: AGHT+IElilp8owkCzZnU/XdgVG40znc7ITwT4r+CN9LxeRdB7kJwCrsiR6HU18MteHFSt74cs5hlHw==
X-Received: by 2002:a17:906:9c83:b0:b3e:c7d5:4cb9 with SMTP id a640c23a62f3a-b647395aab0mr764832166b.5.1760943359427;
        Sun, 19 Oct 2025 23:55:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 5/6] arm64: defconfig: enable Exynos ACPM
 clocks
Message-Id: <176094335744.18498.3151941406927244021.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:57 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:35 +0000, Tudor Ambarus wrote:
> Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
> implement ACPM to provide support for clock configuration, PMIC
> and temperature sensors.
> 
> 

Applied, thanks!

[5/6] arm64: defconfig: enable Exynos ACPM clocks
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

