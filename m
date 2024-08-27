Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987851A0B10
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2024 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761218; cv=none; b=EWrJOSTkEtghyQPvksS6MAg3z4vTcjKO1vZM2SqhbPxFIv3qPDnLypWJWWuPlR/T0nrwGfx4um75snpZXQsnZyMArBIddeuiYdGPejQ1MaTIuzKs60RU/JKlfBjLcI0oxmFGhoF+Y1ShcHuKwDeQFpmoif6U1rXcXejByIKflA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761218; c=relaxed/simple;
	bh=hPKFaWEwOaTEBTuH3e8c+46iBkaH7ro4nsEsef3YavQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQfQO41hDsPQ4XhAIhaFyJYGz8Mh3g6b5oUZ4Cl7al5jjGsmntkuQc4TNcPVTz5gdfzCv2oBfAKYxR2DUnw7tp9z9+V4R8s/MkGEiDwApslZX5MqSZ+muZq/S6ubDbMPsN+DnVCo2nDxbxBO+hfWTGVgfjZjKQN4Hhb6GZZ3T8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ivuIv5/2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ivuIv5/2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280ac10b7cso3589275e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2024 05:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724761214; x=1725366014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HIsTjVY/9B3Lg0x8GUp3KD2J/JTusOKcRSUTrZvqKe0=;
        b=ivuIv5/29ImbmVoktkjhaOeZ3HwB1H0BoEiyT8mNLmxNOIs28XCtqIKGbFwmiM6Thh
         ybfGeL+aekuATrp8o4TRyr7mvd3CV/54m9kFfOQVl2Rp9sNvUEMjr4JGRurN+Ih3V5s1
         QY62JdMnfx/ESHlYQp6J+EEg/Ovzu4YMbidYBMkcCPF0M2qtyuQdm46tAqkrSyFWipqE
         0EOHJg6m6atC73TREdqyPDGfhVMI6Hoy5yJ2ImHCmAou3cTbW0CaRIWx5LyEt40GPo9H
         IboNlV9GchqzPiIghqWu8wbDHDjUGePCYuq3NtRwpgL/cDKO1klmaAmhDGTewZ6kpRkL
         lcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761214; x=1725366014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIsTjVY/9B3Lg0x8GUp3KD2J/JTusOKcRSUTrZvqKe0=;
        b=n5KCN/5CTE4XcJ6hYmsZlriO0pQN5dz8PthtON1SDTW9CgmSOdedi3GUqKo7XgtLEk
         1XsGe9JOtXDqCDmDAsodNhcQOMDuJRc7yty2sPqtwNKpNyMNvmqaZP6ZSd6CzSzkKmG6
         O6twfGrKFDmKRvF9bnuHLmYstBCn95SbVt2PK4b6TBFpWX/aRU3j32MW987pNBEoO6WK
         gSF+Qis9kAxFfmWWDoJVKqND/VKB8cH38ENzUJRcMzNDbyTrrAQq+4k8ImZ6wgWUZvZ5
         ONAq1wWFQD7hEkSZ2HH+FTPyGknQeX9+HLz5frzcBp9Nn1mXPVd8GLuPHV0ezyjxlrLv
         aqqw==
X-Forwarded-Encrypted: i=1; AJvYcCXBuM8RZyVsl8gQdJn0f4ur4Dvf9w3nLuufg8+K1Opc7rzoFhkidAf81qOuqWFkTRIFFn1ODFSa2/eDMYHxw/zJUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8eV+GjBxmlGD2+HfgWDmfCgMr8CbU9G0m4tpbPxD8ubE/M5d
	7q86HFKsAftfe0+Qn6cRahGm5bgpwiurgNKNnDa3sjsrAOXC5TDofewP8QVEpSA=
X-Google-Smtp-Source: AGHT+IG7i+eJRpMoQOnkdmCfoetSOU/Ebdq4Tdm/WCPxTSYkVwHF2O1bCXT1ZVNBiOJqcbCk+GKFmg==
X-Received: by 2002:a05:600c:4f92:b0:426:6cd1:d104 with SMTP id 5b1f17b1804b1-42acca0a4f2mr60118695e9.4.1724761213899;
        Tue, 27 Aug 2024 05:20:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abefc626fsm222544605e9.31.2024.08.27.05.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:20:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.12
Date: Tue, 27 Aug 2024 14:20:10 +0200
Message-ID: <20240827122011.30158-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.12

for you to fetch changes up to 39dbbd4e6778ac5580313ba34409855250633c61:

  pinctrl: samsung: Use kmemdup_array instead of kmemdup for multiple allocation (2024-08-23 15:40:55 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.12

1. Few cleanups: use more appropriate of_property_present(), use scoped
   OF nodes handling and switch to kmemdup_array().

2. Implement configuring pull-up and pull-down via GPIOLIB.

----------------------------------------------------------------
Peng Fan (1):
      pinctrl: samsung: Use scope based of_node_put() cleanups

Rob Herring (Arm) (1):
      pinctrl: samsung: Use of_property_present()

Shen Lichuan (1):
      pinctrl: samsung: Use kmemdup_array instead of kmemdup for multiple allocation

Vishnu Reddy (1):
      pinctrl: samsung: Add support for pull-up and pull-down

 drivers/pinctrl/samsung/pinctrl-exynos-arm.c |  14 ++++
 drivers/pinctrl/samsung/pinctrl-exynos.c     |  16 +---
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c    |  14 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c    | 108 ++++++++++++++++++++++-----
 drivers/pinctrl/samsung/pinctrl-samsung.h    |  21 ++++++
 5 files changed, 141 insertions(+), 32 deletions(-)
