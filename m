Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5C3EA83
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462965; cv=none; b=GgSggdvDDYZqrbMdX9/RLZNyASOsGVj0pL5iOmSlj4qlw4rh4xLP7hi7RbBWT/pj2YS/ZcH+msJKJ5Z2xTabql8aDEisBqvte3sjhISjc6NLvekCHUcld1w1/V9QiniR0riPvPOUEZu2Y8r32yAF8m/qxxxMZY8LSJ55m2onfok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462965; c=relaxed/simple;
	bh=6rOSQeWbEhAv8MCLaqz4msA0/THApX/ROztnBEcH/ZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=auHKjPqw9COJpJpZKhej5HiQeUcoYCAbxyWcsygewVuh0q3kPIDXIF7peAmFqtfUxOKcvDGJKoHriLrLyTUnQptSvKptD/RSkWtDjJI3majTlxSPuHNk5gt7KFiQuGXfdkd9g6LvS1YceFjQXEUGMoLSLX3bm6kcNI1FcQiaSSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdXxaxXs; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdXxaxXs"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-572669fd9f9so4295885a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714462962; x=1715067762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5p+Hhe5o0oz9SnrKznY0Fc+JFHlQEV01P0MQ+lMur0=;
        b=TdXxaxXsJ00JCbd4wmYYur+0wi5UWdEXowlZwsXZJTVUhOmLJbm4DchDvOG1A4e449
         ldyDHYDL33k3hVJPInivhD9pYDQ6dgoxmux0Ofsoga8pXHkTrDKgAVuNvL0SIc9jYxc/
         NNg2p6JNO2BL2z5lVkoVqfJ1ex2Y+fhxiULsy22sr1KMAObAxsrYwBq3tt2AxopMDB9w
         xF1fGQ8RdCPl5F7PzeqSKCMUu7T5WWUsTEwIXyfhwYIa8dGfAj0EnsiTbeI++Uw/OJEs
         21aZX2UCCjkD4jD6dKO8PNvwBAQ7fUqNE/qtRomTH1Nz1ArqwhNfvyIxCd43qu2NqECl
         4hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714462962; x=1715067762;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5p+Hhe5o0oz9SnrKznY0Fc+JFHlQEV01P0MQ+lMur0=;
        b=w8q5gWCUUMn7K4I9tYriyCeQ3aGmIXlh5D+j4reP3zr+TSMPm7r7FcJSkvcEQpcHIV
         IgEBAwRstinGtLN2vXHikCQ01eFFCHYSPECCLFcXOc8K3Pi7wdEhdZGqMCGYi0S0x8Zm
         GFTwAKZMg6wHjwlLkivx94Dkgg3BXWdZZk0tsWqxkdaBc89/P9/DD9PbsokzFXu1B2Bd
         jJXLvNfrM2o75ge2Tr2/cohF6rgNvxT2Tc8wkFNsjQzpU34W+exmvPxGKBQdpnh+jEF9
         Ej2RUjD0RVDN9sSJvxY+AI/xMeD933yPtwIS+mfQ5vCCoy3coRC3OCW2yAYVv2H57AHk
         4gow==
X-Forwarded-Encrypted: i=1; AJvYcCUS5IIP7ybXRw3QdYHFC45J61xnf6qKkCYMPV6HZlYuKa1Hewuk6mOEJ+p+CpnAstqogEhMOaxD+ZG76Rw9dATQCg6Zvs/NPnbjKAAOtcMulZ4=
X-Gm-Message-State: AOJu0YwaZOieBmOjcxV+HzhMjqelqDzgmqfYod1G/LppMmyyd0uT2dEp
	Z1l4RmJo7vE/2lA3D8YOQSk0KXDcVoece5nw/1XsdpCKWyYNHpOSuHK9pqGf2Xs=
X-Google-Smtp-Source: AGHT+IGBMuRm0U6K3jNaqA1YmMlR1gvfu8aRSrgUg/G0JYE7jjhY0WN5zoh6hbRFgw5euhqtv+xtKw==
X-Received: by 2002:a17:906:378d:b0:a52:1770:965 with SMTP id n13-20020a170906378d00b00a5217700965mr7467711ejc.42.1714462961803;
        Tue, 30 Apr 2024 00:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id p11-20020a170906a00b00b00a55892e840bsm13175844ejy.205.2024.04.30.00.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:42:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20240430060304.12332-1-krzysztof.kozlowski@linaro.org>
References: <20240430060304.12332-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: drop redundant drvdata assignment
Message-Id: <171446296047.37280.9740688458228801878.b4-ty@linaro.org>
Date: Tue, 30 Apr 2024 09:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Tue, 30 Apr 2024 08:03:04 +0200, Krzysztof Kozlowski wrote:
> Fix W=1 warning:
> 
>   drivers/pinctrl/samsung/pinctrl-samsung.c: In function ‘samsung_gpio_set_direction’:
>   drivers/pinctrl/samsung/pinctrl-samsung.c:633:42: warning: variable ‘drvdata’ set but not used [-Wunused-but-set-variable]
> 
> 

Applied, thanks!

[1/1] pinctrl: samsung: drop redundant drvdata assignment
      https://git.kernel.org/pinctrl/samsung/c/e5b3732a9654f26d21647d9e7b4fec846f6d4810

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

