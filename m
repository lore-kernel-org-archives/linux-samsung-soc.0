Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE930257858
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808013; cv=none; b=DLXtlKShIsPGFmLY8LFxHAPKHwIvIXcte/jCo4AYxw++KIl7elh8KU4CjRvQAMNtxOAiOM6mbjl0oaA/no0O9KFG/P/+PIYj6fY0578UD2g3m3jD3o2lXZaevDJRjWchPGGxmr/h+o5yASc3++hGjJEIbV7jBugiaHMpDT30S8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808013; c=relaxed/simple;
	bh=Nr2KfNngiIlvNlLFYS/VgNPZ1obDnQoBFlUmS5D3U7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UOYq8A9YQi/b7u+NyzYSY/Rjg6CYSqpsdlLPmMtkya7BPIE0ClSzQd+IiHY/spT5Rma3Zn1tHT+ETiZbOzhPxE0UShsn1t4m/Z9iDXjdY4YZgyNhoMu8oG0s9Fp6CK4MSRndPuweToMt0v8E8n2D9FM5dzxibBvzLT0I0JPzxWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z5XGF59D; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z5XGF59D"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b55a8841b2aso50103966b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760808010; x=1761412810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTMTmXdQcRic/7O3wI4ilcIkNahM7H+SFceh2d7cSug=;
        b=z5XGF59D5KNdezqryeaGxo27kG7jlhBasO41io17nGj1VyvZRmrFBhD38NQ/4wN2oD
         GPHcb3avJGo5ZR9ynGj02NaMjvpGrWO/GOM+foWKZ5TqYpspg8b/b2DwQPKWhaDFI3QF
         l3YFCzThuclcRgyhSHOaYenBmUl9rnQh/nwRonnY3QuVfP1MgQEDoFEhi/fDEtTTx0Eo
         mEY0c9unpD/pSyVEEQXN/GikG+Z5vH9e9tqeUUcuiLlQCFn8zsm1UFo7tjV2pLahb1o+
         Oo292yG8fFc/yL7ksoNkGMBI8IU7y2Tr+rpGZeOxb4IWe4K8D/fERjzQfxTlnH7ZkEY+
         hovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808010; x=1761412810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTMTmXdQcRic/7O3wI4ilcIkNahM7H+SFceh2d7cSug=;
        b=FtP95PKlaXI60bVyiTy/czz2yRvPL1dEwK92WsZwXBgIGF6L/X1ORLe/GkJdQqASqo
         +GR+ejfTMa+Wj1glpgaJ1U0YJgJk3LdDmTVx3A5GTVzERigXuY3cmszqxs66+aEd4Mn7
         bHyJBU681DOjLEV/X0n+swiUJxb7mGOQtFKi3mLC3mIaBgEUIZk9ANrhT77hLjsXjwEi
         f1ENlAmx2jKEGa8iWRu7VGjwXuIeBwI4weNiljJrT4ZvWwcOs6tySN6IKxmh7MReHnaL
         bxkweKMVELoaVoEeCsYJq29RJqPFezRcOC/7JgkTpOkQba7n3tFdugQPeN5OWnCj/7Cf
         iLPw==
X-Forwarded-Encrypted: i=1; AJvYcCUShHi/2OlPRN41wPCCKiz3PUJ53NisqCvU4jW1OC0Q/XZZny/Nlct9ZxTqejRL/vQsSs2r5Ps0P0hpMQZEg5SGiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3VD3se07+ghusbApwGZ+4bHQJL+KXQn701JhHYDZ6H9HfOSY
	tEZl5RRyNy8SrY14phE/FS35oi87oS2aVul67D6NZ7oathCpWAPblK3VxXexX5YDXRc=
X-Gm-Gg: ASbGncuEaytIanFs71KrjcqvA+d1hdWp4nwFIN8zn8BZJcq6AJuq+6CE/63rzlAvc2i
	f/jaUk8hC8c0ti8gVKF1N9p9Yeq5EiXpUruoREyLYlXrHkxUrY5YV4+niC3Y56dB1krhsO3MQj4
	jTSmgPZ6vm6KZVD6YdZBrucWykhaFi6gYqFNO9J5MNH1VkYK/wTuEqih2Cj7j5FZ4hijxQn0STg
	jkU4RHPopQRmiGKlap9vWVvyRjHQIyhB68n2LnfXoilq9/3XjQhnnF7VXKUwnGAfQ4n0AGl16Io
	tD0RY44Us+ywfpvcm82zGI2pv2qdOmlJ2BVLzimUom0dd0Hbv4llIzY7MlBHxXP1z0KvSPA6+ex
	zFJU3JhhySs1oznpPniroY6TEXVlS5OLqz0bdM86zBkYxRXfJ9+Ke6Lb9opbQZLKw3gEvkpKTaW
	OuW6xJZQ6DpbF7/AClttB+TxEUtPA=
X-Google-Smtp-Source: AGHT+IFbTirHyIN+XM2fk1IJ2nHqbjUwUwjp9X1pcQvNQEQRFLlqsHZZnLK9IZT+t3DpLgig2ZlJ/Q==
X-Received: by 2002:a17:907:3da9:b0:b2b:c145:ab8a with SMTP id a640c23a62f3a-b6472352847mr489805466b.3.1760808010183;
        Sat, 18 Oct 2025 10:20:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm280666466b.16.2025.10.18.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:20:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250928-exynos7870-drm-dts-v3-1-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
 <20250928-exynos7870-drm-dts-v3-1-bb7d8e570860@disroot.org>
Subject: Re: (subset) [PATCH v3 1/6] dt-bindings: samsung: exynos-sysreg:
 add exynos7870 sysregs
Message-Id: <176080800894.47136.16568266339840675495.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 19:20:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 28 Sep 2025 23:26:35 +0530, Kaustabh Chakraborty wrote:
> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
> 
> 

Applied, thanks!

[1/6] dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      https://git.kernel.org/krzk/linux/c/3abd9b087a4cd7430cec2080c67e7a94fd7a44b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

