Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2B3F9C6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550123; cv=none; b=r7lpAXcVoGeRIpLNW/yU8m8PCi4EHLysTfNqXZdiItLkB4k3kanECJmV9Cr8Wk9MSt9xBoMkMLEfGRJmjghXudh0nN5uA3uuklcl3/HiCIMed79eIwzyPsoM6MdHKHiruuNVudg6nYH3y4b7ZWSrIrELdA8RQGy9/A2jpxUgn48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550123; c=relaxed/simple;
	bh=9Zx3aXA18R94SWzrgSUtc4EnGCzDqdY9//c/8FHjsGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8iBP/s3Bd9yRp7JU83dzKzymgGCqwaRY9T4VvfIkftCH+mFMCHrtPq2sYpSRFuSXGJpsGBvFYVKjhY0hVYWm6HqPxrYVF57BzrybTQnffKFtEUamuij+yyflg0B07hJqQ3+mn8/Buvu91uqXmFVzHRT9ufoVkuwkAnJPxBFMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WnYZn8QK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WnYZn8QK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a35e0532900so117315766b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550120; x=1707154920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pRPrglOzwRqa+H7Y4VRUrVxomNsbjEqwuGbyydOpG0o=;
        b=WnYZn8QK5RDqk0hn/Hkems0BFoTduw2sY23Ylk5SnxSDWXHYswQ+XMTplV7mwwJQPr
         kBKyDTO14vNJrglbZcWP1kIQXwnjygmwIisQ47eFJ0xeC8y/VCe0q6ba/2Yu/gecgJRI
         otTZRdKusVquMIGMIQoa6H3Z8ICa5spflBmXjo0Jj7D1kVwjOzTAX/TFkFIVPhGtPfZ0
         tkbkql9hro4emtiJ0Zlir0/TwA//cAkfWAQjw56Fe0HpJhQL0D0eDMF+CRjxlFzH/8CE
         674hP5Ja5raVspH99TvnujEdP4nTuXrNnz8d2iTGe8yWO2slpLB2+8QzciZNF/0iyd37
         SUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550120; x=1707154920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRPrglOzwRqa+H7Y4VRUrVxomNsbjEqwuGbyydOpG0o=;
        b=MSpaujo1YWcBR88mOe5Lofdy3N9cXBg128WP4lLw99Us0cl9k6oTdnbvvwPsOYT298
         7QSVZkQ0XciXqwZeHzII4qd4Ggz15D09r2iidHCJY4UDgNOQPMbvcS32edlTq2sMcibh
         YQCW8P71xmfruap91MhegPwajb3FwS6lgvppnOW8J5iv6XO6xFuklzNtbDt1JoQpew6n
         ym49LKdyny5XIRZklyoHvFsH6yb2HxWAemm7xcmF9LtVrsZMRRnwf9AKTnEXA+CGJZQ5
         anbgguptUPCzz9mcXSZyiPqvcqipcrDkxLJdaXXCDlmUf2erNOB2yZmx/V6pOMaWtNyF
         ij9A==
X-Gm-Message-State: AOJu0YwjRzqq+EzUrmSesDD+xj39fHQuOV9rKUrmlFSbTcMx4JVJkq6s
	TBRuZubjFqBQ4KOYDw+kbDg3XVSBAh+Kwc765KtH6it4ucF4riYmO177KAlF1To=
X-Google-Smtp-Source: AGHT+IH7SnCVkKpDcbSdNp0DbMhNvvyF+vX+c9HHkogBjefDuaYJ7t+c82tOi7AZ9KE+TzdqrxqPSA==
X-Received: by 2002:a17:906:450:b0:a35:ad38:35e with SMTP id e16-20020a170906045000b00a35ad38035emr2735029eja.69.1706550119715;
        Mon, 29 Jan 2024 09:41:59 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170906fcd900b00a311a360433sm4237765ejb.143.2024.01.29.09.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:41:59 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	inux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] gs101 oriole: peripheral block 1 (peric1) and i2c12 support
Date: Mon, 29 Jan 2024 17:40:03 +0000
Message-ID: <20240129174151.1174248-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series implements support for the 2nd connectivity
peripheral block on gs101.
This block contains an additional 6 USI, 1 I3C and 1 PWM
interfaces/busses.

i2cdetect shows all expected devices on the one i2c bus that this patch
series enables.
Everything that's in scope in this series works also without the
clk_ignore_unused kernel command line argument.

While working on this, I noticed the existing peric0 support for gs101
has a couple issues. That explains why there are differences compared
to it and a separate patch series has been sent to fix up peric0
support.

Cheers,
Andre'

Changes in v2:
- squash original patches #3+#9 (Krzysztof)
- move original patch #7 to new #4
- squash original patches #4+#8 and make it #5 (Krzysztof)
- add short summary of devices attached to i2c bus 12 & add TODO (Sam & Peter)
- collect Reviewed-by: tags
- I kept Reviewed-by: tags for the squashed patches. Please shout if
  that wasn't expected

 .../bindings/clock/google,gs101-clock.yaml    |   9 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml    |   1 +
 .../boot/dts/exynos/google/gs101-oriole.dts   |  10 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  41 ++
 drivers/clk/samsung/clk-gs101.c               | 347 ++++++++++++++++-
 include/dt-bindings/clock/google,gs101.h      |  48 +++
 6 files changed, 452 insertions(+), 4 deletions(-)

