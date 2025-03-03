Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7BF1EE7B6
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Mar 2025 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740992935; cv=none; b=lSRvZxN8gGgEDjyIJEZ9XpftovbPvo8vokkt5SlYAYOnT6K0ZFpxPMiKTmLUyL/o2rlsFPjUUTZch5CiYqjvd+ORh4Jnp3+9wJRvXgRDgTMV3Nl0X4Y6Cky6MXruipgcJqvaPsUDeFFNfqW7Qi0Yq6JJapqbHF3nTrfxfn5bbLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740992935; c=relaxed/simple;
	bh=KwdK1hh0pwYXDznk8CbHQleQFb+lcYppkzN3ytWbS68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nny9EBIkEucaJmopVlbBDT555Sry8k/ij+q7mJ9srgZ8dMWJqGSaKnXvIqT+oq3OCPIL/fn5AWzUtvVcI3zaGm526yikGOt83okhY5pPKgrM0onvgbZB8xUVVfFCCuvbMZjbyIUYZ3Gfu6eVu9EjFoQ1mQRcqKHbaNv7dbaylbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHNc38pM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHNc38pM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bc526c7c8so136985e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Mar 2025 01:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740992932; x=1741597732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NArLzMGeHWTWmPFGPl0UFGh/ozAvnT/Ug9Z5Z8/7zE=;
        b=HHNc38pMimubHaZpr+UKZS3T0okpzMFBJmnCIQ2bmWOS69L+TMJ9xt8WLw1gmzvQaI
         kXuEhoZFN4kX9728RUxJ5b0ycwNDWYvayEvCKqenQJzBTXpka+1lk6/Njlc3r3Svvb/h
         ayVJ+XbPC9T9OBg8yXa0tQtLCntt5scikVg+xwrVENXGEzshooBRhCCeJ7KNYNozrRre
         9AOzvlgYLL1p8SJ7eZkNlXVHnb3jQ7joY0KDhIfhoXWz9v7FTebmEDPzkCjuIAzS1DmF
         8Gk9Dd7MwgPMKSJZOFwT0DwCyIycwtmV8S2MLi+rU/mF/UCJu1wy/KDW2ArVcBVKj2xw
         vUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740992932; x=1741597732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NArLzMGeHWTWmPFGPl0UFGh/ozAvnT/Ug9Z5Z8/7zE=;
        b=cZ6G3NUagCSi+HPMf45hc4Dm0Ytw2JglE6msL5t+zLv9LOKUkWrdqYXrrM0oHuZGq8
         gvkxP7JPiopHFBCciIO8ocfbIYhcMj0jC0NbBr0lWhbi/+0Pr881GVg+bD3oQ2V4IrPA
         LLgmKluTj+TrNmB0H2ISjn4S9q1OOOuj3OMrkMeWjsNI0cnNvOdPxpENI61YAV3l1uhn
         ikBTlmo3gKzUgzQ3TU1+Mfn3vBMzWromH6AzPHDcR8MM/eHlHenLoiblIs7FShqS5yAc
         6VWLMVTnZG23PW6fU6WnVx+MMC/UjGzqjmvNL0ohl4AullCn+49WEog4LQTB8jOFIDjN
         3CHg==
X-Forwarded-Encrypted: i=1; AJvYcCXboN3abMbCJ3gs6tdlhwxf2M+X4MfgHSbRnO4pB0l4UbnLOefnwqJ+KBaaYMMVbXE0XvHzmmJuxtbxumJsfslY5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/IgGrPoxY+AeiiidqjMRRlhAlF4e2FNG/Df2SlqpOMVHgwsun
	QieNg/D5GWenBDYzbW5rKAM0mJ1vxHYsFt5+LZ36MYXuEhWXLdqAX7pXgbhOhsk=
X-Gm-Gg: ASbGncv9bKtjdTuvNrfhBrI7TEZexyk928NFhBTYlrLAJb/P9m4+gJAow0wTTjqLqxC
	yurlEGSH6RIu8ob/CfSWeOl1dlpq3NfOiSO9WD5kDQSBvgrPf1qQ7A8Bu1SmnUXF8YdA+bOzn8B
	bN9ymdaMBg3tkzuUTv7T8AAcV4IpyWcD9rJDpUmctT9M9mdGpqTXhRcqaUGcujbBoX4IC16wzQS
	OUgoIhmwQ7YIqoNwUHhZ7MguTgUs5QzHINabfoNWypmPCU7ujUshNeUJIO3AitZrTCzlq09Wyd9
	R5J9Czo8pxg5Wh2dAbWb6TGNeebVkmYpSYPtXkFcTRCdTQEaPz3R7rlIfFE=
X-Google-Smtp-Source: AGHT+IEFwQNruNu5mTaT+/YMJCqOub6ua/xucOR8SE1iPMFTevfv7HuPeLZAAmqrMseXFFEcLiiaaQ==
X-Received: by 2002:a05:6000:1f82:b0:38a:8784:9137 with SMTP id ffacd0b85a97d-390eca88f78mr4072087f8f.9.1740992932006;
        Mon, 03 Mar 2025 01:08:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796051sm14058418f8f.12.2025.03.03.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:08:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Introduce pin controller support for Exynos7870
Date: Mon,  3 Mar 2025 10:08:47 +0100
Message-ID: <174099291728.28792.4499836839323841404.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
References: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Mar 2025 01:05:16 +0530, Kaustabh Chakraborty wrote:
> Add support for exynos7870 in the pinctrl driver. Also, document the
> ALIVE pin controller's wakeup interrupt compatible.
> 
> This patch series is a part of Exynos7870 upstreaming.
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      https://git.kernel.org/pinctrl/samsung/c/129bdbd05650f4c11fb8995f8b6e63589ce4cb33
[2/3] dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/c1ab2297bc746b07b96205dddc45979feac22f4d
[3/3] pinctrl: samsung: add support for exynos7870 pinctrl
      https://git.kernel.org/pinctrl/samsung/c/eb76dc973cef741f74ce17d3bba8a7c9f2cc6113

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
