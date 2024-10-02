Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9050F194151
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855763; cv=none; b=t8MSHl/Jf1Bga17eI406BkVrrUPzyayrHf3GXuzzlvqC/gH/54MWqTd0PlKsCmYaZzkx/ZuBB5nNK6YZB+sJKW/AFTYuorFY8BJbNYLL4onAHtOKwH+VGWMjsjqexeZuGkgZp4VOh+azdtavr1SQtrdKZNnOkIU/IMdAHIcnmuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855763; c=relaxed/simple;
	bh=kU6RM+ooIXXcM9c/jbqH0Uw85/XTZ3Xgd+5hv0PQbhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zz8dwpa3rQSvBzeIlzp6lfV9Y6KJpZTGrvSRRjedJM24LtSKclj6F7ZWXChzkpitATwvW5MqnGpHovo7/GslmCv/PiOwmT7a9yg18MOIQUALXQThgs0cwe5oA3mUPcClt//jSlwTOTh7HT+JuOBRMuXgfNTLRsL3rFXhDvZ5648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kq6MHxQB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kq6MHxQB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42e6dbc8c7dso8725565e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Oct 2024 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727855760; x=1728460560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdUrO5/+wLUDv1vGiyhZonnC5/peZ4QYzj75J80RoD8=;
        b=kq6MHxQB4jOG1cxD5GjjNvU+5EfKOK2jUEUkGTqnoLvQ0BZAyn61I4FqV1QVclKdhi
         asz5qQKuvs9e3tVp53z6F3f5LpGWqWF/XXCQeuGeU0xMAf3pq61rHbIjkkWBUSS5iENQ
         o47VHfzE1V+3eRkHsphvHT27pwJh7/9VAWiqdE8RHN1A6FiAmkmu+31W19zyPD6MRrRo
         M0XKG/a0uLz8PrU9Rl/TJWL942CMdfVV3EXFiMpUH4iQ9Sbd8sOhueLgQQK2cq+Q/2MB
         peAOteEqaD/s5f8rZuCdeULwXsA/OKWDbymQHu6rMoh1k+klEwLF9SRMnH18Pk9VqVyB
         dSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855760; x=1728460560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdUrO5/+wLUDv1vGiyhZonnC5/peZ4QYzj75J80RoD8=;
        b=Go4H+//MoYneZV5r0ExMPb6orQ+pUYp6LEtTdI8bKqUqGkB3whlfP4WGY/x3LowREC
         A3zGK3HV8W1sgV6onzOqQ0EAQP3zuVuufdWUNHNTEpJb4XcBtmD75jG395CeRV9FLaW/
         M2KxLaI37X2OJ6/8/PY4zYn5UWCR1FmwwbgZFU1wWgabiTrfJt4YZI6i7P5okyjkNqj1
         bBIfoydZYoasoX+SKY1y/b+d7PJIUUOniteQhYxDI3EVOPhFypA1NJYCmhP3ucjjwZil
         Nqi/V3iMvX6+g0SNM4XJ/OBSeWtnvq0zBJV1xLQBuq8LlPCSKo+FYelJgsea9LTnAU+L
         m7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWhYTZWQpphnmrXovwQCF+UslI4FPCbR3IHHfjinKeT+sHSiGB023qpcLDvUlVjtfV9bOyTCh5vXtu7OrKCn3/Viw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi0nsNS/CIobf6q/czJXDV/Lf3NEbaGtkzWNK2DFbru1mhJqsp
	nRL3vlFmJRLJxIGDJtbdrwc5VXAGrKUIzdgVNnX7lL8XUQ6OVqxo3ilQR+5HH69EJ5CViXgT0BJ
	I
X-Google-Smtp-Source: AGHT+IFXXwUeZK6UR2BLcwewuQ+H5PGWRWeXcyQ+J4runoR7VA00QSHe7mz0Sn9gV/K8lWTsFr7udg==
X-Received: by 2002:a05:600c:458a:b0:42c:aeee:da87 with SMTP id 5b1f17b1804b1-42f77900776mr6649195e9.9.1727855759948;
        Wed, 02 Oct 2024 00:55:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a01f52csm11176545e9.37.2024.10.02.00.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:55:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
Date: Wed,  2 Oct 2024 09:55:52 +0200
Message-ID: <172785575195.22593.4753948681084660914.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920154508.1618410-5-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com> <20240920154508.1618410-5-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Sep 2024 18:45:02 +0300, Ivaylo Ivanov wrote:
> Add compatible for Exynos8895 SoC.
> 
> 

Applied, thanks!

[04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
        https://git.kernel.org/pinctrl/samsung/c/724d52a3cd33774570c43cff06403b4cdda00abe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
