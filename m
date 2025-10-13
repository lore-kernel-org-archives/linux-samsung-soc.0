Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4565E22069E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317330; cv=none; b=fuuTiENKSk8Fa9Uei1SQIHtsPuqJxxJvgpOfa7iHyoZwgmc9b3Ev47PKSCq75y/4LTeeThIvmMY2r8Rijg01iQTaG2gPIHFmYDHB4PWdV0Zv6tB9vCo9MU6VQ+E8flKkW8mdmmtCR4mOJhX8mTzvO8hC+AVq2cP4kZSh2oTVNR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317330; c=relaxed/simple;
	bh=6M7PF3xNLpktje0EOKWg4z9Nu9yKC8jqvoHS+dTKYjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K6Bc+pWr+RCCLZni6DYJrJpQpYq6WmQIkuPYzH48vZ6ZRYbrDzncETqb/r/TQKRx2O8rQU8HswrkcKHZoF02WSbpZhf2J5C7RE1aB13U+hsldP7rnwBgvP/95FnC1XEKQaglMcZqNVFgBcyKMZGLQd7pMVWdp3WZBMWvu5h15Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pAPvZrGf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pAPvZrGf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781254d146eso236836b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317327; x=1760922127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h7DDrA7j+9540Tqy/6NV+bqJw0DCMI3GYZXvoLWyYk=;
        b=pAPvZrGf06WxIkf+1gAxdUEmVjrAS2lXR5mK7jR+EGRi289foPcqoJ6GpuDLidDMKW
         wo2cF6M/mnn3kj9sEVwlNH7apR4oIf+Fg1gDr8WCPnpuPHiWZIIFd/eb84fTPMjDmR6z
         njyKzztl32ZwWymDbBzDtfe68aw3sCMVlV5NUJhTwp5sn/BQTgULijqNlAsVyo2L2ZhG
         UK+mFnW1go12VzJUFUpx1PjlyVqu8ckiQfT1wje+V6hThVOPbjiCYZ2/QFSYAUrktrgv
         kQqLy89UsSHcrQhE7o+gp8MkhcQjcCKumn/4U5NBasXwaEaqAtJY8z6acT/GFL+9HYK5
         P0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317327; x=1760922127;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8h7DDrA7j+9540Tqy/6NV+bqJw0DCMI3GYZXvoLWyYk=;
        b=bEMvdbpplHjjzPC5D/JNIKCysUTWd8wRfx6dbPMaYhAbPIEDuo1l44YKZ5lEu3C1MA
         u+IE5ohrI62AQO6x7yjyb7/Gd4D65/F0HL9bIjxNnyHC7wHxDFEmsB164j67BVo0HSCc
         N9xclwqCq/VM/cf97fDGgiV8a9ECo4xv+5ajnq6Zc5sWKFX9NLFOE7RsL1UMpeNJtUXd
         lLLMztZXOfugVemIR/Ir+yM/967S62copb/0Adc1Itu0y4DVWbkF2Ipl545V9cHzLUj2
         vzFxhz7ZnEBxn+t2beg0cIMHUP2LIqRY16x0rOEUL2Ftf27Uwh1Gz+4sP85yQ+G7Sxdn
         y3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXE645n2dUkrgohXvKwdAXtSxlFd+XkAMT5DzQmZpplvcPbMsHG+6LsVCDmc+mgPFwlH4adaFnpGkIz8CXDsg8bVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyclch9iYifPf1kvniyyPMKfSiYFBG48pDmxGWEFG+OlU7f/gAJ
	pWyH1v52piHP3eGSG6n2AvJY8hYuAQu3z8QVELxyTdlu1dpuC1cRf86qHvF52DP6gwI=
X-Gm-Gg: ASbGncuQfuNAVDdD58JIc43hsdq7LpFy9E9YOSigcU+Zc+4NGexnVBBIBscgB1BrtZr
	As5kCCJYfhf4RjGwMCBwKELvVUS75sjEHUl6sivrGZLvzrO1ONdVOgD3Sc0mTcyJCxeyba6yJdm
	l2WGCHmmoH86t9AB4ao0ZZsuFG9LA9y8WvKlLbug1GHxeJlUdO8ToTUoowIYRRyhHWK1jgPgb0e
	fWbbnhGFyPVxTH0lY8kTyU6rMnW54X8KjD1T1/Qbyt30+i3K5P4W2d2bybCJxcPRG70QQcE1EYB
	5YJ+Z3mBNqhRh94ItdqfAZo7AbO15ri6+tzLCqGiCvVvQOREmW/ZhTje6gPMZWEqv4FVWs6r/9f
	GqVF31Jjkq4U6JF7jco/8Yh9gG2q2Yl7JnLQVTKigmLn8w6cL75xalZEnM9dx7YeL9ipDBAI=
X-Google-Smtp-Source: AGHT+IGnD/2S9vnckWUYx+lQefO8k9+6JLQFNxeCb9U29jbHzHiJy1UtLcBAdXedqp1xT25g8Y9crw==
X-Received: by 2002:a05:6a00:1705:b0:781:229b:cf82 with SMTP id d2e1a72fcca58-7938762f1fdmr11941331b3a.3.1760317327480;
        Sun, 12 Oct 2025 18:02:07 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
Subject: Re: (subset) [PATCH v3 1/7] dt-bindings: soc: samsung:
 exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
Message-Id: <176031732291.32330.1246219208832468083.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 17 Sep 2025 21:04:21 +0000, Denzeel Oliva wrote:
> Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
> controllers.
> 
> 

Applied, thanks!

[1/7] dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      https://git.kernel.org/krzk/linux/c/ca4bd675ec459bb7bb008f15f5d866c9ce35f4e2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

