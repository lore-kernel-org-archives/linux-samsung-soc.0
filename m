Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB601547E7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 00:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760314961; cv=none; b=bta/1NGDcrUNg0OeBN45doDze7aBKprmSTh9mMQO9e6Xb8nAuDqPFCUV+KWkZ+uqg0jGhwCN8HfEFabh/J9bmirW+Xv41YJxEeQYpmy2+DRFqoFEK8UsTC3xce8ytryOY5X201OS14mYzmo5/HsdJ51vHO5Bf9oTObGTbs1pDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760314961; c=relaxed/simple;
	bh=+dTERHXHwlz9Q3on1s7pnMr9sQk3vgyQfbNftxESlcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=slpSS1BQkk/SgXTLuQCDzPFvxvI3TYdE1Uv41nbbLm9bIKIM6OIQBnjPKnoiSpBtXVfVhasEbiUCDfUQNEX1A5vUyOGotVJUxlN70w6rCqRSdaZbetoBZzC2ESPinvvTC0mQnpBVBQqbYM/8HqrLLONLTJmaJDFUvkC9YGQE3OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rOjzvtUw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rOjzvtUw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-269ba651d06so5752995ad.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 17:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760314959; x=1760919759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVqRhIZigralax4KbuXiwcZcRbWu9Ae0Ahc/RkKiB+M=;
        b=rOjzvtUwp/yh9Kh5vxsDTCOVN1ux7BeMhZj/iu2ZIEnG2yKMWynzfeKQxi2boBYZfo
         iP2Pf1lS60xMi8jpDyGch6iZwU9MEF44nvhQfNGgfA0G/Dwp3ttyk3EDLU+acZ6exYtH
         4aVdXAeCAmtF0lxf9aByTpE9GktHtboLp9G+sm8Kv8bwhpBU28rX2W/DbnEtjugt6Quv
         63sMOKRUEWSP+fekAEhzeMk4TD8gUZ3qMPo8pNBfc+pZV62k9cmtEF0mbuy8Qm6CcZbP
         2oh/hvaInb/P+yP99xor92f38GTeiLu9588d/tvNTrl09qY19pbRy0eWaKfLk7JIIw9B
         I4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760314959; x=1760919759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVqRhIZigralax4KbuXiwcZcRbWu9Ae0Ahc/RkKiB+M=;
        b=EKrWd3FN3krt433ivZjt77SG5YWZvbQrlvc5FH21rKDWLsWamw/nkTVRuzDLufwF5I
         w3nuHs7Qy3+Si7qh86XlkbQS5Q7G+bieQdBfg2TJg9RE7GEGJtmwkzqrblIMax2MhnUr
         1KOeJWKPepK7OG97I8uBv+NqTYr6e1tN3Fp6op+Ne8bhy1ObMQWqMiEqL9FCZ35FXQqi
         DzzxiEUB8rRrWHryJ1ZGKVrUSYjETj8B/aR5AVyubIs19l/d7MUQlh13xnPZ1DSz60CD
         YWGH6aSn9DoV5Ps05ORAN1vj4Bp0biFdsb4sVdGc2fszFZ6RvDieZpCCbO1ZIOlApWpy
         htDQ==
X-Gm-Message-State: AOJu0YwbWckHhtamiPa4Q8yF99HzE4INIDFFZ7lyhTTVWrNO5kxSB0iJ
	QDF3vb2OSHR8dTlsglNwd5pZlGDtcXvSeRM6xNWdjpbbZ0PCjSw6yRhagh5wGkR3ViQ=
X-Gm-Gg: ASbGnctdiN+i+bA6KAcK7OxEgFOwyOdyA9x9pwX2Su/NUjj5wpjWZXb8/nkrWFuTx8P
	x4Y7VqxzBIyTiPvX8mslWmxxJcMWXkRWqhi7lINE0C8Ic8ZbsKUQG0RpSc1LyEqCC1QtP9SV9IJ
	ZKLcgM2el/kQ5XWYfdahUjAhKYWj6UAkUXyIels9J6bAv1FIoY5Z4ufqefIRcRwAT4AWblt4Nap
	d05xwU0JOFje5NKHpGRr/sZnw2ycusKzVhwktPZ5DAt6N15R04vazPRUH30hlqPpMjj0o6WTjaB
	aGz6MvZHzcyOZGTs7w/sdjksRCjFKzaiGHuJeYFoJHFWFZVp+cV68sjbPqvq4Wr9NGBCf8g+o8l
	GLe9z1fWpVOfERjAHenYTjufWuoqU8SdNTu+nCGcgYePdO/2StuBVANN7DtyagE/DtQaoH/E=
X-Google-Smtp-Source: AGHT+IFK4ci2TGNbmqypL/3bygm/UTzER4LfBfP1yAru/4qRR98/cUW50Jp7i5jycMDRBEjIp5poiQ==
X-Received: by 2002:a17:902:c404:b0:277:c230:bfca with SMTP id d9443c01a7336-290273e17bfmr142190255ad.4.1760314959008;
        Sun, 12 Oct 2025 17:22:39 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f05bcasm115840285ad.84.2025.10.12.17.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:22:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: samsung: add exynos8890 SoC pinctrl
Message-Id: <176031495194.9871.10054397457165667570.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:22:31 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 14 Sep 2025 14:44:54 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds pinctrl support for the exynos8890 SoC.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos8890 compatible
      https://git.kernel.org/pinctrl/samsung/c/9be3b7bb7ddd4e8ed466f41c6f43de34424aeb8c
[2/3] dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/f416d35e6522f0c08d4e866e5d6930bfd504e645
[3/3] pinctrl: samsung: add exynos8890 SoC pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/5b6b7d39cee69373dc61ca22164d616e4faf60c6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

