Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7EA5F852
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014499; cv=none; b=FZxcdTftCsjjAXCAKZVkHTvTN3GBNHhpy2K9BKupZHtuqkz4FdJS5hio2afcL92cuJLW2sOBuY5MMsOtHd7WpPUFBs+JSOqdkWXLwUw3DAIw04ivAgzOC6a3JH0s4sdWP8rA8Mferhd6DvOcklGNroZCLmx42AplbiafzVbmlnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014499; c=relaxed/simple;
	bh=pHJfpsGIA6DNYeLhapyaBucCSPrJ0XTjSqkBSTj1Kwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k0Yle8hjCMioEGE/hDL7omWN22BkyFJaMfSEd87YdHe81WYwht4e00xYGReRoIQWFn2iWoZqMkR5rH37TlvdlObvEOqDaaN/xbs6OdqYxLjQvfstu3SojUYTXTYkfQEBGDRcatvDCetKxPN42llhiHBlO8VzYv6Zy05k23T6bw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nj4Z+Mdr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nj4Z+Mdr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so3932783f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706014496; x=1706619296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79NZc0AP2mciPTr3QytFCn5kAzjJNvksJU9gtoVk85w=;
        b=Nj4Z+MdrTLzJg0NI2zbDzsx20oNmgU1JuCbg7TK3jApmQQkGBceDEvUJhhzpvzue4h
         I5U0KL36C6wD26iIS9redlpRGHxhJ9wrZbYaN882kCLp79UwZJ6nGEAg/FZNmJBap6AI
         7Q8+F5vl5JqWzIk+HEjDc/OMyGq4coPk7Uhyld8WvDAZ5OZN8UkaHkv+/9B6pt46cI3I
         xEwoicknWRIfGGbgVAG6Ujb1zqZf0CzOps/0S3XM0+bQEmovhsaNQ9gyx2eIWr43kQ5c
         P6T30YMsu4+tj5mBnMVcrbWF8OOS8C0HmhqjhKpIFDs8KUQzSEwwLwDFATiUDIMcBEkX
         EaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014496; x=1706619296;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79NZc0AP2mciPTr3QytFCn5kAzjJNvksJU9gtoVk85w=;
        b=bUoIAgCfeh1KrLQm6BWGFt6/sGi8FiEgz4T899/xMqM/dzXqVi7IjOXF/0zBLDPxmw
         mMQkcI2gmsqIx350VEjMa9n6Oikhv8UIB3FNoquhCQcG4C6f/ogl4artHvYcRMaRSzcr
         dCFYJUh5udGrdWybICo0q+FmCbR5UrjWfJC28kpS3ySPA3LztW0Sptw3JTmF4o5TJQ0g
         pqv+fzG1D9KHFsCpceER7O4YMrU8+eshGMPrMY3LznDm/oxtG50qLHpieNSNzMRZmMio
         szI7HX7Rt8WJiilvk/XRUBXh1e//eM6fx7hmONk75jyYersATnV8hh37vF9IQtinJyst
         Ib4Q==
X-Gm-Message-State: AOJu0Yz9y3s6nmR4m5E4tm8zg2B+UZg3qj80L7wM5ZB73khWtQpRG3G9
	bQukY2//5t6RkJQR44/4j2Ce7leP0gsbwDjUOTVj38DA5GyZqdLoX3ovF02Z+NQ=
X-Google-Smtp-Source: AGHT+IEzKIWC8YDnKYIuEjTcOpsBjrizfe0GD6ciUhggMbQXrUPMqM2FDKz0t5iQ+Ntt4wjoZOm4Rg==
X-Received: by 2002:a05:6000:402c:b0:339:358b:b857 with SMTP id cp44-20020a056000402c00b00339358bb857mr2232259wrb.94.1706014496785;
        Tue, 23 Jan 2024 04:54:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id d6-20020adff846000000b0033725783839sm16173587wrq.110.2024.01.23.04.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:54:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20240120012948.8836-4-semen.protsenko@linaro.org>
References: <20240120012948.8836-1-semen.protsenko@linaro.org>
 <20240120012948.8836-4-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH 3/7] clk: samsung: exynos850: Add PDMA clocks
Message-Id: <170601449519.48954.8617211132364348262.b4-ty@linaro.org>
Date: Tue, 23 Jan 2024 13:54:55 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 19:29:44 -0600, Sam Protsenko wrote:
> Add Peripheral DMA (PDMA) clocks in CMU_CORE controller:
>   - PDMA_ACLK: clock for PDMA0 (regular DMA)
>   - SPDMA_ACLK: clock for PDMA1 (secure DMA)
> 
> 

Applied, thanks!

[3/7] clk: samsung: exynos850: Add PDMA clocks
      https://git.kernel.org/krzk/linux/c/00e532cd023ccee170239360978c65eced06125a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

