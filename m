Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7319005A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130690; cv=none; b=QAec9ls32u8BusevZKRvgK/i9x8MBLF8tXF75ltc3ppM+OVQFS1STqdbJFaECi+CNwnYp57jQRAhi3WcKsUflU4/FUv/DMCF9NcMRcuLvC6DrsEMP9tsRGP2eamC/rr2jr9iJOTXscyljn3jqyGRvHhiST34CO/hqnRiexW7zbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130690; c=relaxed/simple;
	bh=aad38w9Iu56pb97dPIj1WoScz5gfWcOaLe//8FVdD38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iBKJxL24uBzS59VudX5xxpt3Tr9/PxOxfeBnbARo2ZnziossGnBpo7hYL4vxxmOlyXBOEDr4vuAQqaP9XcjomexVE1d23MPtLH6MaXOHUUqPWDdT0K9cuIOH3ZtCiZibftTd77nnBlTLfTVKdOVpvqPAIqIppVRDE3mkK/wSHHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inrIY4UI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inrIY4UI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428e3129851so7984565e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723130686; x=1723735486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyqdbFiadiU8CwcQUl3AMf5EkBUw48qbdDcF4qR+yxY=;
        b=inrIY4UIhUAJIaZiaiMRyk1Q7y0sqbxjx4L9IgWvnS2vYyjMTIl4Fr3z/PybadczbD
         sPKEBaxBXUahLbx2tsDbkBpQ4tH2I78DDKoMUFnBE995kJFm6x/gpiY15PyO2yB+6224
         +XDZd1TxB1IJE1m7VJzgNkGkpxUYO8/g0ZN2DpOSDQd6pmsghMzOG8og/0cbTolgnGv3
         dEtbFjlK659Ij/3O2i9C1wCyTjhXkjWUGkqTvnX4CDP4jbfBhMrHThCMk50t0oU/B1SN
         h2VWS5boAr2/YbA8+ZhcdjJdrouiZDYPynlQF70/aEHbfKaLvOE0TGScAeqpu8p0limA
         BAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130686; x=1723735486;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyqdbFiadiU8CwcQUl3AMf5EkBUw48qbdDcF4qR+yxY=;
        b=kQOgUdXclGD1PTlU6vE47kfo64tEhXAW5PN/PiCWHdiRRDENrTXfNUY0c8tWl4uSe9
         PsXxYJ2hQT+O6RXOfu9NU4034tjQcJ92KVHifye856LSWwzbdZqzhkIoZGngrvtxWAyM
         m9FkbdkoVFhOM8KrcWjr+y1BFjuNF+DftaW+hOSTvPDhEFDB2fl/pwr/A+79aVGwysKH
         Om2hru2FgKn/EeQExK1J0Ub43N9Ke37NkQLdoKzaLTmYw3wylzPDEQyo1UWpLKNi2Cor
         CQMC+L+6WWkH2JoSkD7SzlsDnGgBN5qsxqyTJJVtCvMNq7SjbETlfsyLi1S+DT8C9w01
         xL/A==
X-Forwarded-Encrypted: i=1; AJvYcCUVQEnEMX6pHMux+6SB0ji4gaddl38RJvUHM7W6dL4p86LQu0ao5DTGGhjjc1CTddMRQ4BY4Tm2pa+jGTdCT5c2z0XYlxQBprXnJ7X7Q0Nf6J8=
X-Gm-Message-State: AOJu0YzWiL9qRwCqYNGR6u43fuvlvzMaWcegI4Oy0cC++iPA3Mc+fzbX
	moYT1PKDM9sHezBi+6ZWdVOh17qoj6FI+yuuhMCI2dyaySmUoroEc7bTr023TRE=
X-Google-Smtp-Source: AGHT+IHQJx0c53pQAgMhwNBTq83Gpjecl7qyGcjwnz+MeFwZUlqabeZsX5w1jGdplOCgk5tp25lSbg==
X-Received: by 2002:a05:600c:3c91:b0:426:62c5:473e with SMTP id 5b1f17b1804b1-4290af19256mr18982765e9.26.1723130685797;
        Thu, 08 Aug 2024 08:24:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716caf1sm2227775f8f.34.2024.08.08.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:24:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, Vishnu Reddy <vishnu.reddy@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
In-Reply-To: <20240729153631.24536-1-vishnu.reddy@samsung.com>
References: <CGME20240729154736epcas5p111a53e297c7f8c3122bf491cabaf74b8@epcas5p1.samsung.com>
 <20240729153631.24536-1-vishnu.reddy@samsung.com>
Subject: Re: [PATCH v4] pinctrl: samsung: Add support for pull-up and
 pull-down
Message-Id: <172313068449.39928.8459952266160240525.b4-ty@linaro.org>
Date: Thu, 08 Aug 2024 17:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 29 Jul 2024 21:06:31 +0530, Vishnu Reddy wrote:
> Gpiolib framework has the implementation of setting up the
> PUD configuration for GPIO pins but there is no driver support.
> 
> Add support to handle the PUD configuration request from the
> userspace in samsung pinctrl driver.
> 
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Add support for pull-up and pull-down
      https://git.kernel.org/pinctrl/samsung/c/e61f1a729da850cca2c2d7e045b27c3fd4830d7c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

