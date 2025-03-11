Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F622641D6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Mar 2025 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741721927; cv=none; b=WVQOXGp0XVxP1cQH7vUdst+r2SBLubSfL4ks+Oiw9nrE1zPdMOl8Q0ZPrezD+purNXu/T1yWewOnxhwN/hKH3VBCvgBeGPARsltYaXjFAK0/dGXAc0KyE6Q8tjI2NkaGa+4Npg0W6NvHIyIVg1Om1sny8mJs4fBwp1A7PCHvYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741721927; c=relaxed/simple;
	bh=B1uh6rYksykV9cmassOV5zLeR8dCezQN4Xwwx+1rMT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urcg7fOOCokhV5zOEAZKilT66GXi1hu6x04SPgKWCs/HZnDmFcCU+te5tpMrg2LEuDxdIV0Erwo+WsHNuDKavErrP+1Cd/fnuSYJWgJIPT/d+sowuelnYNQRYtqNr6kRVvTZes1tR/LxqlkJDX67QIvAZPz63F5SVn9647r9jMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQG9Xq9E; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQG9Xq9E"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf861f936so2892905e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Mar 2025 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741721923; x=1742326723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hk8/jRHxFdOn9j6NilUq3fYq1U2KDGu3FX6e3aC3Pvk=;
        b=fQG9Xq9Ec3q3EaxbKAjirOsEhIOKcVuAn5acIoCjjGiTx+Y8KSrJipiaMMHh9M0+eK
         o6GH/s7IYsroeALZLhWzVpr0idJz2+Y2nQgsl05OoHgTIlPVD9c1I/d8GK3ZGu9YZFOd
         SPj9o1g3b1UubQpe05ysJN2Y2G7koucdyf3pPmDf7MR33LMHEdiUtElRb24GfMcwrmXE
         OM0LtjMwPErWkSAeevEDusdBLro8LRFlXJJ6XLC+TI4l8s+FLPvOfWFK7FeXvcFpftzC
         1jJoInrUv2PTnU6bIcbz6EW22l1OUIE/LZnFjW3ilqxfCpISG+TocmYh8DXB+hhZ0Iab
         lSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741721923; x=1742326723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hk8/jRHxFdOn9j6NilUq3fYq1U2KDGu3FX6e3aC3Pvk=;
        b=uf1xpDd1BA+XH4smqzReu1h95cpOALoXPPVJ8ZrTldULPzX1HDVEEYrCL9FUjTvjS3
         ChU+KY7HIpZmycqWhWH7kiLRBqQ961NB/pPRZen5jxI8iclTQaVoX7ZxTs04CxRe5m4l
         UEwFBDk/cjBmYWeFOIEzmCKRw+IrN2ZE6OhIxKYuEDbUXtryzNIMUCu8f1TmHc6DCzHT
         zP7s/690UhqtXzez2e6qahYDjtgNyrHd3y0r27+TqFcUq4ffc9mAig3Ri4aOkblBz6qV
         +HRMd30Hg+fAzmSVfV+ixjwUep+UUYFLOTApgVAM+qM5aRq/8Lqft4EvubgGDWROGdAT
         SW0w==
X-Forwarded-Encrypted: i=1; AJvYcCULFFRG4r9SN9FduVx83q3+VJAM5t3+JIryyigoxwjLofevNAcq0VZJuf6wZOd7XblD4iZoTH1fF5yqy3v5ypf6yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFpHtUFLK5SA5YXsB+1HxzJny/7bw0AGTxCYZ2Gyi48zf2Bw3c
	6YzLhwH+O25VNDIoMWvs2pXQq6IOCWYw6TXyToRyJP62p6ygi89LAE6uhOV4HPc=
X-Gm-Gg: ASbGncsIDv4+zb2sfwe9QJFRQcf1LkqQ6hI3qI3Eo5dZNGyGHmJwP3/TXO9BR4BM3yy
	IfTZ9XyTSmMzjRvTT8n9xSVGeMwiwWCPk+rdGdTsecKZLnui7xxVTIyOiJWINwP5GgmQmUlwii9
	d51KmaAZEZU4om40xnGtOUPUZHObkzvssGGGxEZPYp7m0zTAY6+ueDSZrnYbf91Cja2pFqiQwSS
	L+MaGllJgLk8XXHZ7jqYtLJbt3ovbb7OZwOKKhPxPWS0zO7jQFWbggcf+zoqdavYs8FwT01YqTL
	so5mmujcp3e5TxDax7fBcgMGLIxhNTun4JpmyNbx3NMEtcQXnuwBbNirwQ==
X-Google-Smtp-Source: AGHT+IEEGrtv+WVqplhsyAIOJvjlmuBCpHGGUDzZq6EETtMUE4CHGK002+5IMzV1Oj/aRdFt9ZT1FA==
X-Received: by 2002:a05:600c:548c:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-43d01c2b40bmr22475345e9.8.1741721922987;
        Tue, 11 Mar 2025 12:38:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf892d380sm81727225e9.24.2025.03.11.12.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:38:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	jaewon02.kim@samsung.com,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/4] pinctrl: samsung: add support for eint_fltcon_offset
Date: Tue, 11 Mar 2025 20:38:38 +0100
Message-ID: <174172189759.119514.8325135286672051459.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307-pinctrl-fltcon-suspend-v4-1-2d775e486036@linaro.org>
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org> <20250307-pinctrl-fltcon-suspend-v4-1-2d775e486036@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Mar 2025 10:29:05 +0000, Peter Griffin wrote:
> On gs101 SoC the fltcon0 (filter configuration 0) offset
> isn't at a fixed offset like previous SoCs as the fltcon1
> register only exists when there are more than 4 pins in the
> bank.
> 
> Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
> macros that take an additional fltcon_offs variable.
> 
> [...]


Re-wrapped commit msg to match wrapping style.

Applied, thanks!

[1/4] pinctrl: samsung: add support for eint_fltcon_offset
      https://git.kernel.org/pinctrl/samsung/c/701d0e910955627734917c3587258aa7e73068bb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
