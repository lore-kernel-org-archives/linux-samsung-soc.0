Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D20186E38
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2024 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730059211; cv=none; b=psNrhvI96uiUHxuDRhGFChfRMVl44cvOFE4tHLoPhoP9eFkl4TzO9ieloZWybBEvKbILGM8xXcKFBeO2zJUVPx5FkKkX5nV3Q0WV9322N3VDJbaYhyd+GU/kOspQ0Wng91HIU3KNw7Rk5J5ZCJDxhZBBFRuwfyX26TlUuj1cvCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730059211; c=relaxed/simple;
	bh=7r4lUdgWtrljUsn0D4B4TgWrqztK0jELsrteGPPSmP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mlmPPixWs/Fl5/J9vHgGwurJn3QI87P1eSZV40RlUOl/NOku0YsjOUEm6JNUQPAmFQenLRXS2WiVDy3keunkTJAFi8K6swEzU+35QvfUi/UUz0jWi2nc+uwgwh36s3bF6iTmU/rk79nntTYOpYmyLO8NZMvA+R/XcIOpekZzUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Afu21NHv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Afu21NHv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4314c006fa4so2928105e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2024 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059206; x=1730664006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mobaSIAoCTzFS8IdkU952cZj7+uyOxNJc709mhx9JSw=;
        b=Afu21NHvIPG3Q8Rx7HPgNm64f7RzAwATDdSHa2HNn5XrxTlw6/LH1B8QjnLvIh8THC
         AMBzXx1dtv0GoAkZjfgUjEYPRjM/S/msExmOqwVENHgNop29GgcSz3b8B6URjL0n9JMx
         1pE7eU50+NAlxU2sZUS4caiI2oaZ/h2w4sTS3Dzt9GIX2NiUZlM6ZMCSed/LUFqavktY
         2cdv4RHJFCi9HT138wDBanHSwbG24cpz+2ipT5PWWvV/JrF2YcHou5YmN8mChEuVLuFL
         fUDy/b++y6xEcq1eP/A8UEPsjoKBunf1aJeS+c7G8/6XZh7PyI1HU/+YuHQfpKi6z5E1
         +M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059206; x=1730664006;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mobaSIAoCTzFS8IdkU952cZj7+uyOxNJc709mhx9JSw=;
        b=TQdAkziS//R0maJ4QRgvexr0mnTQ8a1vo/nt14soy7Sacy2dITyUdi6p6TrUS0pn/E
         y+6LStiF8izvgFob3fzIQGTNF8sNzM1x9E0dQdOL52pz0xwcvRVOtLW9WY/zd9gOEGJq
         nVrLbOoTq9S2EXWX1X8TF1eCXzX1avQ1I+4DQaFF0wBRRz5XeDIHPLtBoBTZ1X4CuEYm
         l8AUbswH45B7O3pUmOENsJZbMfqXIqJIB30Jer0Yd3YWnGs7+i4LEYX1oKS0jqe8qQUd
         cTCLP91JwYFqYEUmEnDiA4pfaEBMcIm8mTSF/CmEPDdTIDXfOrt7eggzDSNwB68N3HkW
         2ZnA==
X-Forwarded-Encrypted: i=1; AJvYcCWz/fuNRDzCwsoSgTFOtTiah5NwdgO6SJwXWIdHUXrQ69GO2WUowUhZNy2YJLRuVlcbwNmxuFAydLSiGOnDJHWAaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwasdgK0KU9Svqmd56AStZikGxtHT67eKshzkk/VeDdb7UPzq6X
	vKm0qLgqmX3j75oPe9lhMRmmEUWG/W4LiOqGOyexOpDDu5sqpcJpk/yHnvqMWog=
X-Google-Smtp-Source: AGHT+IEPzymzHIjiOc4zVdkC5xXbX8anEIX0QF8UPHvqXkly7pCIAWv4SBr/ppPEUQlnckjyhxDKQg==
X-Received: by 2002:a05:600c:4455:b0:431:40ca:ce51 with SMTP id 5b1f17b1804b1-4319ad280e9mr20127915e9.5.1730059205991;
        Sun, 27 Oct 2024 13:00:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:00:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-9-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-9-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 09/10] arm64: dts: exynos: Add Exynos9810
 SoC support
Message-Id: <173005920218.11546.3963593817214010231.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 21:00:02 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 26 Oct 2024 23:32:40 +0300, Markuss Broks wrote:
> Exynos 9810 is an ARMv8 mobile SoC found in various Samsung devices,
> such as Samsung Galaxy S9 (starlte), S9 Plus (star2lte),
> Note 9 (crownlte) and perhaps others.
> 
> Add minimal support for this SoC, including basic stuff like:
> - PSCI for bringing up secondary cores
> - ARMv8 generic timer
> - GPIO and pinctrl.
> 
> [...]

Applied, thanks!

[09/10] arm64: dts: exynos: Add Exynos9810 SoC support
        https://git.kernel.org/krzk/linux/c/6c1fe47df5a79f1efc2d5c73e506c8d34692527a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

