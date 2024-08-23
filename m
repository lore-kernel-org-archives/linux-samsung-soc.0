Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E731A13CA8D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2024 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398973; cv=none; b=RXjLKq5KfDCRk1Gt7cgiX54hAZIPHT4qq+hKS7djU1uM5X2CgFPLJJf/frHdv34axAmAgTNpcTr0cih86Eej9GF9yr7CleLWoFH10IfjCXCcDA5SwD7hVEBurK4sr9DwdjGJ2Mw/b1utRYUvVCnFnN4qM4g3rRR35L0cX2+aXTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398973; c=relaxed/simple;
	bh=YGXtqEXLuxTj4L3nv5xoL1tlsMlz54zSjodhYy2ZDYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uVAbYngKu8/6v0FT3rvPIKkwrU8UiS30Cmc5/ok2GpQsQvrSDauFvK32sT+kPiaNbJ5w9MS93aZbit2DA6UcFST4iqRR2Vrg/8XDbsSOlgAm+nd/lgY3Qn44QEIGEdgDQb1ou9amynXQdrfY/soS5/H9sAMPz3o1aFDChr2DNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8wNaoWa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8wNaoWa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280921baa2so1554815e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2024 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724398970; x=1725003770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWGduNs2rm5qHwk5ddptW98pyWVss8YO6iqSSyBnt4g=;
        b=B8wNaoWaChJZqjZs6iIfk0GfkKdl4ey+3gV5rzJmztnF2NPSMqnHXcGNs+qUYFCz6b
         /RClRLwQ96MJqklUXpX7SfLEsxAvFARJ2XN/wulzVOjHT4ryyL/7lmXPKtYbe4vHQpdo
         JMXwqglPt/oO6d0mkDKZiIRoem0kkjvdT/7q9r5EcjMV30ASK+6QQjjAPVPU+EdK4CcE
         AnRl1s3QGs2VphwDNT1mNvhcaCtE0WmmOqFOr8FgbWN8728HGBmXtsJDbRMu/loY7Z8m
         UzZCcW9MdfJdubSVmkA0BCyJ5ZYN4IURggTtqqKcDdRw18voUf5iI8FYNLxUwATydPEP
         LsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724398970; x=1725003770;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWGduNs2rm5qHwk5ddptW98pyWVss8YO6iqSSyBnt4g=;
        b=QH3LA7PUCdYRpKvNvz+ynDdoJDH/54hAmG1iyb3OMErw8hLmSUJOJymS2FV8u9D5KY
         BdIgoly0Xa+CVzmVCNIzvhi0ZzGyZwI6Ntauv9i+qYGHIm9h6kKiLXDq9hoeuFzmj5Uw
         4SPQOj1AWooZq+CbLj1+QBIA6h/quQGHWT2E2/Vvu++qkCxonargQOieGluyEClborjK
         KW53e/NR9SM4f9Hz2T+ZiTRA6O9eXQFF38oGR+M4EQq9ApoMwO/przOISmi7b2RqJvpi
         9DnX1XIOmXmYZoUl9qCyOlYY2k8TGWFiOScvPQp48lSayT2lqY2p0BCp9d0hKihasPUK
         11pQ==
X-Gm-Message-State: AOJu0YwGPzkwhnnXx+kf+WFRoAeg8jNbwCo3MMEDfRo/YOd97XotDdTc
	C4K66szrtl3H1E4cRT+WNNlLdhCQFrEW/FX5A7gYckwsZLV3CAxY4tASvhvTDDQ=
X-Google-Smtp-Source: AGHT+IEJ93sKDaOo1SXjMAhBtHW9HFDHMZTFcxKf9M1sLtwwW1Yaqmgrgefwkq+7vfKzhnmdv6BhWw==
X-Received: by 2002:a5d:6daf:0:b0:362:4aac:8697 with SMTP id ffacd0b85a97d-373117c3298mr510253f8f.0.1724398970151;
        Fri, 23 Aug 2024 00:42:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff63esm3485541f8f.87.2024.08.23.00.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 00:42:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240821232652.1077701-2-sunyeal.hong@samsung.com>
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
 <CGME20240821232656epcas2p3c59f98d2bd185b8258096bf1597d75eb@epcas2p3.samsung.com>
 <20240821232652.1077701-2-sunyeal.hong@samsung.com>
Subject: Re: (subset) [PATCH v9 1/4] dt-bindings: clock: add ExynosAuto
 v920 SoC CMU bindings
Message-Id: <172439896878.16898.16710163487615295552.b4-ty@linaro.org>
Date: Fri, 23 Aug 2024 09:42:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 22 Aug 2024 08:26:49 +0900, Sunyeal Hong wrote:
> Add dt-schema for ExynosAuto v920 SoC clock controller.
> Add device tree clock binding definitions for below CMU blocks.
> 
> - CMU_TOP
> - CMU_PERIC0/1
> - CMU_MISC
> - CMU_HSI0/1
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
      https://git.kernel.org/krzk/linux/c/997daa8de64ccbb4dc68d250510893597d485de4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

