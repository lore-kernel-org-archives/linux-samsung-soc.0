Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0F2DFF18
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943365; cv=none; b=PbQHk8tY0ONLcJqE8NQYhe1f2YCysdpAC2XZlfTGYo0JtsrLBJ7ezOr/WN22stp4H6oYVrFQFjdZ/bjTGgBC1rij5x70McXVlJB+qyVpVZBJcGWOcygpcK2JaOu784q5BZtf35Y5hyr4yMH4NYfUnsxL58ilW9rKWYvJ6kKePCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943365; c=relaxed/simple;
	bh=z/nKAyPM8Gl3KMi0qkV4zPK4PT1ivqYkvCn2i3d2YbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DhNobcbnSvJYrM8bKlBFXNM67FGRUDZcjW8xG0WHhSxRVdLUlYy97YTpuBgh1q2Ppu8YkoSpEi6HvR4bZ+hEO6bEKHxqNh4Srn5kjApnNb6YbrsuC9hjXiP2k90Lv/wgtkNjSjCIt2gwjMHO2p7N20xx55cJFKY9H62BZ8XpRCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qwco39ka; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qwco39ka"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3df81b1486so76216466b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Oct 2025 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943361; x=1761548161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0DnThhMkOfv9YGDKUQ7VwqLvt/fY4Aetr2LPisH1YU=;
        b=Qwco39kavjz9il7ru8MtW5CXU9oQtMYm3H1N/9YBxgXD/W4XxEhLGKfOUf43SgT1i/
         RhfavRnP0oMO2Y20DDLK3bAdyoIJfjf5TUhitKoRcTSDsdb7VXHZerZNdfZw/tahdEFQ
         QnVltwZOLNuNigZKJUIaODhua8QhjydxVTnra6CIUiZDQpHARxZbzB7UiIYWeLkPixdo
         HCsuzc9+2ZUtfB+XaQsMgfB05FUZ+j+3NYzL2/HniY3xK6FXNwubNxQH0ToORTIWHr2v
         JpAgrTrbY0CcDqhZtd+Bhcpkm81szB96F80Jctt4G2TV/+1VIGFXsCBWDlOeWDIH0WfA
         PSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943361; x=1761548161;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0DnThhMkOfv9YGDKUQ7VwqLvt/fY4Aetr2LPisH1YU=;
        b=XpuPbZ+hwNONtEKGQJnnii54akLt83Y7KHCa+w/KTDMgnC2I+jE2YJx8PS3jV4tNpm
         VnCmlY07GQA9uqr65QH0NZf7Lc5zA8y0QEilzlNxJ0rbaATs2ZpULqSXk0xBSmmNnuUP
         WbFdIZoqCLqMmPBkI3V5++kA+V8/bBexKo7nWi6C9J58jJmk/MGS1EKypzZFI0kDFKXj
         UGxryQJVPFRPx+q6kAu/Sc4jeFQmO8faIrDSpJ6ClZ9w7PXhjdi/fnjvIQCLQkrHl2uH
         4ZSSvJexuP8ddqLQv+rdnWVb9ZGCnR8jiRLLHP/iELvOEDH/wg/zavVr5PuBLmhQbSw8
         sYWg==
X-Forwarded-Encrypted: i=1; AJvYcCWBt8G8K3Swvr4MC9eyorzO0iaAWQoTEhK/xZJvOHYwi6mwdmeOaF2y+WnUqcIL2DNATaX21xfb/Oa5fluiD75JvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAVPkySbgQWCGCriEsUo13uRhSibkleNofX3EEFSJBZPYPlXKB
	IOku6nI1Rh5Lja4khAbDTNS2FKJOfeqqBgnpdjzicyXwWCpdVrmTwbXPIC6VuNtLZ7w=
X-Gm-Gg: ASbGncunl5dTcoAsozxIBuGbgtwaRFM5D6zfnUIOIIFxaehKvPFdL3HGcufRxi0cI58
	zMu1CTgS4ZWBqwH0HpflVrUMN0aQfmbbpTmPE27UunUVQT9y18Jp9Nm75Inme93PiF7JwPDSK+u
	jVtapD1lo+RPtQlryknCfv2dJXS/cps7ozxFIGiHURu8YBRRoXnckGFipBnBBzWaPQyUElQtnh+
	uPsxVNrkm36F9gPpT4fylMxpeINJKLKg0ZWV0ZmWdBJ8iufPlmLw9GIPtLYVZA+jNOSLzaiQq8g
	gMHde+is9wtimYEuuRlftt/R6YYDVmGcmUWWH9JJKzGPkZfTsb8Q+Bw/OwaTYjPwBs3hlW3lkgi
	LGR5l/SpnJwaKBlV6hXVWegHmn8SCuKilr82cOWOTfBghy185g+PjWEKq2AryEdIJFt7pSUU89F
	m+b70R/Nqc+5Y8y8GX
X-Google-Smtp-Source: AGHT+IFB6Ey5I5GEPVDKYwQBF2ZBDxVATO0+MlEz4wW7uv+BJczKh6T6QMgfi5LUYg/EAYYZmtjQvg==
X-Received: by 2002:a17:906:9f86:b0:b3d:5088:2140 with SMTP id a640c23a62f3a-b6472353d0emr732095566b.3.1760943361476;
        Sun, 19 Oct 2025 23:56:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:56:00 -0700 (PDT)
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
In-Reply-To: <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 6/6] MAINTAINERS: add ACPM clock bindings
 and driver
Message-Id: <176094335955.18498.10975479866423717961.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:36 +0000, Tudor Ambarus wrote:
> Extend the Google Tensor SoC support list of files to include the
> GS101 ACPM clock bindings. Add the ACPM clock driver under the
> Samsung Exynos ACPM Protocol entry.
> 
> 

Applied, thanks!

[6/6] MAINTAINERS: add ACPM clock bindings and driver
      https://git.kernel.org/krzk/linux/c/ad97aba3e64f8e474ecbce0c4e08486023ce8ab2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

