Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7112D94A8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Aug 2025 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898963; cv=none; b=WrKDBS65vIQTnaKOjPSbwIvy1eluCgeS8OqIjPNQ4XWhMMT49ORtP4F1s3+T/slwglW+fTF0+Mrv88XMUPUnBg+rkT6hv4ZUhs5RgzgFE4slLg/Ba8HLSd+x4w48PPL5SHsInNjexE7IoJiP0WZDPA0E5IKPmAR232izQlb/erc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898963; c=relaxed/simple;
	bh=pHEHeCvx6mHDiIUFL+6VywN7wHOrPWrKHo+ygnf0eI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=alQH9k51xuxFr2PQ+r1j0MSn0ZikTrjcjFY6o0iLkaMxrCw8P7jkD7Bxa1pr1IcOuchktPQSC6y5cct8uLro/pZa20oBfrsdxo7Fe4NS2JhQamM0H4QnAfkW6INT94DazOaR4aMsnmXRiaP+8t3E0BuTsA8ZNV+EpUH5bT9KdTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDjh9fFh; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDjh9fFh"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-615234e9d3aso481140a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Aug 2025 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754898960; x=1755503760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B+PdwnV07kNbcJNhPLT1/ZZi6u4wFzi0KY+3/EKxhc=;
        b=sDjh9fFh77a2dJQGXo6ySdV+tJYEJaUYC0I/5Vq5FDKAP/c2LCAKK+xJeA/rVfGGTj
         HPW5IdYD54SWlYXfMM+sJJ+qphckvEPPra3os6PgDbr5x67tyxoSqyYmsyfHJXgpw0gb
         jpkW6ZjFs4jxmf+uz4Tcp7RqElaw/RXjSjm3+d9/+q1Oi3hM7Z2c9jr0wzLg1W37t8vQ
         KpGBPwMA1mCKMuyIUCxkKpXmw3hEVpFDF0NlUrB/wpciYhtnFXQJ7dV+j3g/XOgd0EvI
         mfe40PLrQf5wouATskqL6nSkcJHmvTYo6+fdhrtb70HOBNqrgkLQKvuSEhMPbIigl+kf
         jymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898960; x=1755503760;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2B+PdwnV07kNbcJNhPLT1/ZZi6u4wFzi0KY+3/EKxhc=;
        b=r2mfOVm7k/BTjQf/dOxWqvifKrn0azTaXUBlptnIPX2GMT26lJExgZN16ByXEOjVL5
         2/ayGX/K/GDwAyPUcDk9KTnT0VsH6dGhawZ7ZTDDtVPOROTMme45CLoiSxrZsFh6Ej98
         pw7mrEzHUxZoXcPh2gDfvsY+NepE6TFoqoxVfbA316fmdsU7F5g0RiPlGD9mwJwrNrBZ
         TnoB1RxFEyaSrcbMhAx7L70tL6N3kBHAndeaAtKjIW4KVED9JDXSV1pJSE5rKKnfllsi
         jkNVZQsbYfR3QcjlyZNqXeozsvju6ucKcTWnJkL0SHWHFKfQMRd3NGGI0IkKsD41SpbB
         i4YQ==
X-Gm-Message-State: AOJu0YyG9b/PfLT73drqCyTawZTsyoCyEJHIooDyEHUBJG5wajUVmT98
	hWcaX6PPPbHfLgiTD9OKNwAw3o4MIrAjRdKxSUAowwYjTODxgOrZ6BoFbWH7Y3XXjZo=
X-Gm-Gg: ASbGncsHhq9FKT9xcRYr4+pSGp1Cl4bAY1ADY9vDtRKD3/HBjgLnazayb3tx89/zYUY
	5u8YLV55tq9w4J+Ql7ZXgz6a29WMRyNd93utWasuqiSa5RXBgtJLVqug1Rxbub9ar1K9QOWUM8w
	Kfcnoh3iRUL6Qrej9iiNRhTbHeC+N5jr3K0pV9qj8Y+f31/Sg3JaGQg19iHKw6tAMIrEIR/LoQO
	rzogQYH4Md9LOdJTaEkU21KPTuJHA4L4UrFB2W82oeBM7T+POsR0xaLkteQO1lSA1mKA2DDhUkU
	74PiejXDWRronlHXI8ys/W+pbkqDJOIsnGbOXgwhYkeASsG04VfGFAGIkp/G6+s24cK9QpgTfS6
	HGhuopyXIh7AbiLnoM1y3FT4DxdRCwiY77kzlpSs=
X-Google-Smtp-Source: AGHT+IGNmkXLXrR7zQMQNPjPvO6Wbeyt1MjIJrWklNZfntMizipUD1DSUNe0TAxm0XQdiwqXZymfhw==
X-Received: by 2002:a17:907:720f:b0:af8:fc60:5008 with SMTP id a640c23a62f3a-af9de994749mr316980766b.4.1754898960200;
        Mon, 11 Aug 2025 00:56:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23fec4sm1979741466b.121.2025.08.11.00.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:55:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250730072730.1882549-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730072730.1882549-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: soc: samsung: usi: add
 samsung,exynos2200-usi compatible
Message-Id: <175489895870.26398.4695794885978749604.b4-ty@linaro.org>
Date: Mon, 11 Aug 2025 09:55:58 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 30 Jul 2025 10:27:30 +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos2200-usi dedicated compatible for representing the USI
> of Samsung Exynos 2200 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible
      https://git.kernel.org/krzk/linux/c/187a3426a664737381a70a3fca3b8108f2300de9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

