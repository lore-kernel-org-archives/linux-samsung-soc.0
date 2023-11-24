Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQO7ltMg"
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FA5D5E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2023 23:43:15 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ffb5a4f622so222748966b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2023 23:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700811793; x=1701416593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8USyps01Bs0RMOktp2jS8yeOD+5EniV5d5DZJZTRAE=;
        b=hQO7ltMg7t38iTi6raWGtXc6FmTaJLHeJb/H7hJLJNaHXmK38fFIuMFm2+erBeT+pa
         TaL4ttZZDqu7bdPvMabzd6+O6DyOQal15q2Ymr6EKoJW2FBKfglIYJoZY2AAXHIuDveT
         lR2pWzv2r5Dm9Qhr0GAh+SALUeMGKUPsWankVa2XEX0Gq7sYxkrwpld4RHoFCyIOpIgr
         yDVR1CwBPd9kc9juoam13lo3J+CI5H5D2n/xZKqkEqeLUNx0wC0nNLWH4EBgKniHs4Q/
         NdvysTLVEIzc0AAab1DfJQRvxQRLz8QpoFuxOY8mRWfi6QlxSEUT1z8paLRi/XnK2QCt
         5nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700811793; x=1701416593;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8USyps01Bs0RMOktp2jS8yeOD+5EniV5d5DZJZTRAE=;
        b=Sd6EWYYzYeKOb0r+4Nzgmo65vRgU/1rcr7bTD0xYjFUFlnFxkn8rKgJCWkt53rLlVT
         xr0JRwtvgkfUX+QVvy1dNh1au8unCRwnmG/O8yO+4rsgcp7Ky3kD8+3Nxxu0LZa8Hf4W
         3ok1LgOEKemexW1aHRXEy+GMCbJdUh/R51Y0G3mW0m/sYkYzB/4sjI4nQZ5vP+DBrORN
         TWEiMPWTi56jUTxIcgsLuO7yMKl2FMXvQWAjs9scBFkvoMCyFBqCL5tjylD+mekJcfCk
         kVvieZEV+/ACFzL7AXyhO3llTcFtfAJs3qwWy1UJUUywGVjJpMMaFWAO2nHX6t1aCH5B
         gaGw==
X-Gm-Message-State: AOJu0YwTeDWNjtb2j9Mq1cWa1QomsN0ZJdwqL61wxRZvugBZ5p9vohV9
	zhULD4yeGBgA0LyFxS0sL7USkw==
X-Google-Smtp-Source: AGHT+IGEVS0y2/Nwpy7G5jBsUFDMqGo4VL8WuWu9tGcBMl3m91yZOqXpotRuP3hZx7jgQFTjLL/w9g==
X-Received: by 2002:a17:906:693:b0:9fc:9b28:7ff7 with SMTP id u19-20020a170906069300b009fc9b287ff7mr1424964ejb.60.1700811793654;
        Thu, 23 Nov 2023 23:43:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id q13-20020a1709060e4d00b009fe16be6a65sm1739448eji.63.2023.11.23.23.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:43:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, semen.protsenko@linaro.org, 
 Jaewon Kim <jaewon02.kim@samsung.com>
In-Reply-To: <20231122200407.423264-3-krzysztof.kozlowski@linaro.org>
References: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
 <20231122200407.423264-3-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 3/3] arm64: dts: exynosautov9: use Exynos7
 fallbacks for pin wake-up controllers
Message-Id: <170081179217.5541.15219253404799513117.b4-ty@linaro.org>
Date: Fri, 24 Nov 2023 08:43:12 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 22 Nov 2023 21:04:07 +0100, Krzysztof Kozlowski wrote:
> ExynosAutov9 pin controller capable of wake-ups is still compatible with
> Exynos7, however it does not mux interrupts. Add Exynos7 compatible
> fallback to annotate that compatibility and match the bindings.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov9: use Exynos7 fallbacks for pin wake-up controllers
      https://git.kernel.org/krzk/linux/c/7c1156d8a719d5fca39e0e40e4465e4cbd765e89

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

