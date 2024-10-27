Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065BE17E019
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2024 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730059203; cv=none; b=r1WhRF7d6LK+nTSRaAMc7nln6LfEOMh09JDTVCgSfn4bzqfOAzkY3jXOuIO4aKoAHreMW+54AyFI0tK2kOSA4rwOwCRWMq/7ouekGjefi2SbnDiqq4tFZBHZUIQ9gIuRchPuK0RC+QAnc8jq7fcBhirAWQ79wn3jc04am8z7ZsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730059203; c=relaxed/simple;
	bh=9s3yMqRsMxrS3UyNUyToM/wiZEFhYCYjakLtmGXN9Do=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ulAAENZAROuKoAhZ7VBMh/JGVXhTaLTytjsRtIPxJLDz3j3QdOpU2hW6h/fWAMRchui7ZvazVVXkK9ASH7oIShTl+mQYjrKDQbOu/sOS2q5njk3fz9fk5IXvk6KnNILaeHY1RerymWJW8gdmzCW+nQDOymRIqaS6J/OL9DcmfZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pkfvRVx5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pkfvRVx5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d6716e200so594817f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2024 13:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059199; x=1730663999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXQ3JFixqQMniZyy7iOMgm7iy+AnZBSfPUlWOom5ehI=;
        b=pkfvRVx5WiDXz7yETk+TIAA4oFfQdKWSSb9i41RtKBgZE/BG1Twv1sH8R9/6KjF9QM
         78ZRmee44XJgvZkzhhr9lp+9KvPv9jTcOBZNNlkC/5op3gevcWWHM5my2nUHKRxRKehf
         eDoT0U3iELJHhJ0HtFzEWSrSAfc7HS7xPobROOnPf74hcofoCSLaxpgw3vIDygg/qJBB
         /nShko8w2b7Y3Kt/rLHXu46UzX/fLTv/Gcd0mjy6DU22I3MA6II26u8w4Jjl7/pNpJ5o
         oTOUnORk7JJZCiPncn1FzoLPnbwG6J6f8LbXVZiDY1JdzMTNPNBvIH7BnESYO/5qJGCi
         v1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059199; x=1730663999;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXQ3JFixqQMniZyy7iOMgm7iy+AnZBSfPUlWOom5ehI=;
        b=KUCiaYqKSJxT96IqC7ACM9eGzS+RW43XKQFQiL+XfCd+pIfpWbRVHKVcn1hU1EQp1d
         xx9neqj0SJrxXz+K9Ob8jtmBK6CfG5xJR/MhuPdrEYrJgFVEYM7kAALbUx30d17yP/yt
         7B5OL5kaV2q2EDuK75HYCs+H/wKGBKKC/f4yvwTMn+9sUDNH3lC04aEAAllnMU1973MV
         xd4O3L1nR+D1YtY3DLRgDZy0QA1V1agNxLFOAp78Be0X2UEA+dBuk2lBCPOwivZLe2wU
         BfP+eEX9NVGIw/f/hCG6s1c6L0eQjvxDUb1tsp77pb8CWiAFgZ8p/fpuKUSF6YSxnbdI
         3DlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKByL1+QGzIFiSF66TAm4BIrZPDHVbv8OBUi/KTaLW2X5eFdTmJRccYadIyrHNUI71jL/cs/E/HPxcz52PqsBu8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4qMmn7N/IBhd/sztILPweP7LjZtZ9GAv+SGoWbmv9EWYfG16
	OOjSmKmyE1s5QS4gVzcA9pWmi+hvnqSuOlPgo3n9Y1J+QFt+RywY9+znkzKaWBM=
X-Google-Smtp-Source: AGHT+IHWYMRh8cuVfVF8iwP9DVlk7+oEketklRl5w2ZHB8KKIObI7IinPzRRTCdSjTV6SVsaYECqNQ==
X-Received: by 2002:a5d:5f48:0:b0:37c:df55:c1a5 with SMTP id ffacd0b85a97d-3806114314emr2142135f8f.6.1730059199317;
        Sun, 27 Oct 2024 12:59:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.12.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:59:58 -0700 (PDT)
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
In-Reply-To: <20241026-exynos9810-v3-5-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-5-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 05/10] dt-bindings: soc: samsung:
 exynos-pmu: Add exynos9810 compatible
Message-Id: <173005919680.11546.9848851651562833256.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:59:56 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 26 Oct 2024 23:32:36 +0300, Markuss Broks wrote:
> Add compatible for Samsung Exynos9810 PMU to the schema.
> Like on other devices, it contains various registers related
> to power management and other vital to SoC functions.
> 
> 

Applied, thanks!

[05/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos9810 compatible
        https://git.kernel.org/krzk/linux/c/4c745ade9f2ba0e2ce273b75293d0e9b995dbd74

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

