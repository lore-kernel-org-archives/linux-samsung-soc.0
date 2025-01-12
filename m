Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4030215278E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jan 2025 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736705335; cv=none; b=WigtCT1KPD0jNHHAaoJfgs5dAepL7G43mdpLjJ7vwlEr0CROyLv0Tfsz4teJ1u5HjwvUmJ/7nD1jacDs3894JJKE/k0SSS4V8b5tLXudDep8PAqsCl7EN4aXBWEbxj8I/HFMHG5XYQECXGLggDpYUMsXzr/0e/eGX/0DAwE4CyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736705335; c=relaxed/simple;
	bh=vKgh4/4ly4YbuP8jjRasn91Qk9F/6j1o9Pie62I04u8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOCxEyhUyZeKKxywSAroJBtIC/ro15CwCMC7F6F95FsgJi3BO1gsNOu6Kb2Ls2q+6olO4wF2R0bJ9iNDGGYeIqkK7ZedKaBi27PLNdnJ3P8kXTstIy2BeqO0vZ+duBAtyJNg8T4uP7IV4OADqJ+PhfzZ2dQL/k/8HrYiHSz8bQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQbKStXP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQbKStXP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso4787195e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jan 2025 10:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736705330; x=1737310130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ+KKaJmXPxzxDNxe6MA06Q8Nc2be0rN6nRzuoDVTD0=;
        b=JQbKStXPiFS+WO0UOvw0LqEJ6ftvqhFV02FaCuEXknvrJszF/LLPX0m62sZ2SGo+or
         8ZICICsUnSDEHO9xIdimC0xHUBqQhp7oTFLltdCqPPlRE1VuAdg6m6RkRK202TL7juo7
         c4Pv9z3nDeAXMUe6QM+bye+u3rowanRLc9PHGjFuXta3Z8ih9zUpEyo/GwR/m4OcKsMJ
         SPk4FlrWW51JXmIGNx6dzrm68/PYy8CNO6zSgGLd4zZy4bdxlteVYwV8rBLZqByeksE0
         xAWly7um6yz1nDvV8m/msIRqljUb24ZKjPvPLCNol6zqOEym6Q4S/Ejnpt/3Gu0UyGAn
         nUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736705330; x=1737310130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZ+KKaJmXPxzxDNxe6MA06Q8Nc2be0rN6nRzuoDVTD0=;
        b=mdXcN+SAUC+O6fGMBxhzL5qztJpogB7o3qy38EuJPWu4i0g9gJUTlSt/N0T5Ty0qzC
         3Ky3GjEsg5OnluIAYXG2qAYJ4sJLWRtfJ79FNs3fV+oqS4G0w13sAnUkzVS4XXFwKaKO
         o0puoL0XDP88eIhnNWdOkZmzMIIHbXFe00guncqq9ABVNRcAc3Kxf3p3QTEsSHApVrWY
         v+Rn4xArIroMuovq1Jo6IhS8W72m/3i7o0X2G3oeq0/utWhJOXWAr45GBRcVewBqQlsf
         nrS/gfcXOVqsU6EC1q3mUMTsuF6VWla8EVnj+mpaA8bGPAjxJJ9Y2CTvu/tf2NBqjUJ8
         zIaA==
X-Forwarded-Encrypted: i=1; AJvYcCUtXJzNyDO8q7Ru/KSZ42crfyOaZ5+qU8/AYALDLhbS+xfQsDv5NaRDwkCCCt870y7+UUcReYHOtQKHi3zSgrpaqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV6XLPnKt6jKD6H7msPVec4bmixZl3JSqQHIn5mxk4JWFMYhPm
	WwrFPtYY5Yr8/eESZNd82Lf5bM9B5kzZ98zGyWWY8UjC4FqZ0UJRzi1DPfoq/5g=
X-Gm-Gg: ASbGnctWbE86jIIoD5nUQ13D4BkRve9A7hJwKlX9+T9PmkvWI09jf96alWNQmtT6XH0
	+CZyEvLDJ5oLewdRJlN5S+sg6NOmc71oTk7E30paHHDZ7ylkc1kwng74n3yAsZnQVXGRwDy3Apf
	JiWRZypZR0VwxtwgaYq5OAqA/qWzBrRDir+UAI2tULXEQruovMyPRSNKkwh9Gg54s5cOhG+/kHO
	WYuw55fgP1jIN8CtJiYNonG4ncANEnPpycqL8TGsM40+nGB+fuoUayTZUhUj0U55yXZHGg=
X-Google-Smtp-Source: AGHT+IHu9JNZR3ElrmXphabS7z0OElOospxIN9/DnCZllvZLlZCEZRz4dgWabn67diqwb3Q/GAGKmQ==
X-Received: by 2002:a05:600c:1385:b0:436:1b94:2deb with SMTP id 5b1f17b1804b1-436e26f556fmr67303905e9.5.1736705330605;
        Sun, 12 Jan 2025 10:08:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89de4sm150842705e9.34.2025.01.12.10.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 10:08:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers: for v6.14, part two
Date: Sun, 12 Jan 2025 19:08:46 +0100
Message-ID: <20250112180846.64154-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Previously I sent just one patch alone. It is not included here.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.14

for you to fetch changes up to eca836dfd8386b32f1aae60f8e323218ac6a0b75:

  soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic() (2025-01-06 10:54:04 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.14

1. Add new bindings for sysreg in Exynos8895.
2. Minor improvements in Exynos USI bindings.
3. Fix for Smatch warning in Exynos PMU syscon driver.

----------------------------------------------------------------
Ivaylo Ivanov (1):
      dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895

Krzysztof Kozlowski (2):
      dt-bindings: samsung: exynos-usi: Restrict possible samsung,mode values
      soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()

 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml     | 1 +
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml    | 8 ++++++++
 drivers/soc/samsung/exynos-pmu.c                                  | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)
