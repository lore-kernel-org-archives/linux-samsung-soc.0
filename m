Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777F1552EE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711364262; cv=none; b=QCcDP23EZHZ+fSWUoxo5fRVlxnUs5O00QGu07KfZNykkLeTCubD5r32SaR3MBzYgF2YLEraKbAa2+Ygmno6gTaoeWWnVgGhnsa9cMVQepelENUvDqRIlYzou0AzzyznumwVtzZaKJTnyJlAsRs7QhTSm7SYFcDWLycV9fTWj2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711364262; c=relaxed/simple;
	bh=ZNmvTSM9WskoV9jkCverTdK2gmPZbqJ5s1SufnKoohM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gUZ0CCcmpFDJAbEvQm2JmdPKI80AmyPVd1jt5CJANtfC3F2N6yqACNJtheey37bzUlTSBP7RjjCBtkB8qNDgQX0lyZmcmPQqa3t98iWBWKTXaZ+e9lGOVsOc4VI+xaW9wFGOUpA2wUkf/Gv+jrybwe05qn4kmQp3Ir/HOpxe2i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BMqgy39u; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BMqgy39u"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56c01c2e124so1695832a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711364259; x=1711969059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiFPmka/p26FoyLkWS6C+JqzFKTgiIjCyRSd6+v/el4=;
        b=BMqgy39uEh7sUnGf02iT9JL5KwF185CTHioAgmxxmWUwSLFHiVEYF3vrapPRd2xvun
         O9u7GCLJ4iHma50ZwPWkFeGc4P+OF0NMALELljbGWwtlYo7lhZ+0q47FqEINnpyWhWHq
         c+rU6h6aBWJLvb8nWnp0U8fCPHcPflGnhewG3oySoJm5Bd/3rXAh/1k32ohieRFqqapS
         QgkovsCAjUJXY/ulWQyaYFmX8e88KG5vuntQLS+I9VHFnZnePVJV6aG/VUjZ/Ra1hteR
         sI/TyKWXRORaJn1c4GhpE7FaPl5wir20j+VISCBbtMbwkXeQz/hKOk2rt4Kb2rQWL4Xt
         jjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364259; x=1711969059;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiFPmka/p26FoyLkWS6C+JqzFKTgiIjCyRSd6+v/el4=;
        b=MatVXOhtmHAtZF3qiKmiuQOpR7MVlOMk1bNIiiRB5XIvSIj+D/uFUFixlm+TZQ6625
         5koW9h3I3H3igeY4ANg/cJUgZVV0oQthYfLBEIwfKqMNoAdFIFECLaRRgxOUOwgDp/VT
         NE4qBBgLnMFAMUgNZnYhSUklM1ikt30tfVih7XcvZX7ROAW1JTqXHqDu8PoLSzJcdAU6
         hJbhaXbl4n1Z69nE7vDpXOnn/Z5BKCr1ITmxrSOZxfd702zcpqMMrlFENr3ADvJRjdgW
         egqw+bqhS6nKJ00jh2ax6yPB80rqHnqxA5cQhD0kP2FLXKeajR8wGMMM58OmYuwYowbv
         mE1g==
X-Forwarded-Encrypted: i=1; AJvYcCWMKL1L0YUuPyvg8tUuw0iRYtEml8V/FyBrEvgbOPWVNzqu0It83i3KgIXiCvm6/G/UDqqIWbEB+lPGyA3JtNIYU6SYBkSM45U5oJNu4N9flcQ=
X-Gm-Message-State: AOJu0YwLG+pZX0y2qA4XzEhsAJdSaHtE/IBkyEbROa6PY61AYHO1lDUn
	Ysia5fjEQBUBJVVuq4LfOgFR3zrZffyk9REKyVf79d2cl75aLPwvkUIjIczCVMU=
X-Google-Smtp-Source: AGHT+IHrOea5cReywJ8Vx0WsqRFwU3TXjuY4dSN6EjmPcL/LGoqFHz6R2NYo+nog5F/IjCKcIF4ggA==
X-Received: by 2002:a17:906:4e92:b0:a4d:8481:5ea8 with SMTP id v18-20020a1709064e9200b00a4d84815ea8mr266415eju.73.1711364259238;
        Mon, 25 Mar 2024 03:57:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id c19-20020a1709060fd300b00a45ff5a30cesm2940522ejk.183.2024.03.25.03.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:57:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240313183011.14253-1-krzysztof.kozlowski@linaro.org>
References: <20240313183011.14253-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: samsung: exynos5800-peach-pi: switch to
 undeprecated DP HPD GPIOs
Message-Id: <171136425808.35431.8311696844753821107.b4-ty@linaro.org>
Date: Mon, 25 Mar 2024 11:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 13 Mar 2024 19:30:11 +0100, Krzysztof Kozlowski wrote:
> 'samsung,hpd-gpio' property is deprecated and uses also deprecated
> 'gpio' suffix which is not matched by dtbs_check:
> 
>   exynos5800-peach-pi.dtb: dp-controller@145b0000: 'samsung,hpd-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Switch to hpd-gpios property.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: samsung: exynos5800-peach-pi: switch to undeprecated DP HPD GPIOs
      https://git.kernel.org/krzk/linux/c/75d7fa24772d0d7f78aff9eff013b3e2bcce3335

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

