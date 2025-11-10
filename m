Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9F309DD8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 12:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776842; cv=none; b=Pci6v7z9CCAcv/zTAW1fNr9ciO/PemjlN/zZzrbKkgUROgUAtriZM3NfDVTazpO0KOMB3falZIU/rZSeAya1YxPoI/U+94GQMGE1iOH9sc8TwWfCnYqEl1o4zo6HyjOvTqQ/r+QktO21G6THnklslAqwI3nGyWISOCtYa4Ox4kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776842; c=relaxed/simple;
	bh=7eCwQzIdJ0n4Jk8cIEMb6dznrr42scKRI9w59K+VWtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdYsCuduA/+hOHu52Wy1fA4B+bPTe40F/MAr19bve17HUg8n04FCoIF43Y+/hJbLIfzLPUM+ebC+k5l09SFmHDE9DAU63lQenZPFCpf8wCO8W1Gfy9v4IerzqRi7X+/FX3HQNQnRt5HBrgD2GuCzru6kWK6daxgi0xPFxrSrILg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=miTlchG+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="miTlchG+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b2a64d425so296187f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 04:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776839; x=1763381639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6MHSwghP2d14X8DV+0bLl36z/FEFxYOy9Zl9P0JXo8=;
        b=miTlchG+584NsrIkCF5niFNAWxJmA7iuI/pUk8kXS3RitDiQtIAM+Ih6uomyYs2jpB
         rZukutDFI45Qpk61YeRcXdw7rEsnodtX5KRiB8r29ibAj6/IeYugMlSBmWLPGkOZE1Hd
         GLIsHBnwCbAKs0d3cZ5JoF6PNbMe99O0W7j897+f8i+yE+f6B6wlaQp244NBM4b3B6rU
         IkotWnI3P6YtFNSSLTfRF+UaQXo0GgC/Hwino04sidYgG//MWQNOOKmqaBQCcZMkUAlO
         +51W57+bCCNJ5/Abosor4hS2usyMUOek5VxmNr2rez2WmG/IzUMwjA3VxwLHkVc/1pca
         AfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776839; x=1763381639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6MHSwghP2d14X8DV+0bLl36z/FEFxYOy9Zl9P0JXo8=;
        b=u409EETnZHwQKFVunBv5CPJcs+8Lb3vzKWhRoXzqh17+FfSj/k32AJdH++9CpNiDXv
         sxqLZoLEZ4Q/hKXb6eNa6Je5mg8I7snqcr5+ZRFAwEM+0yotWZDeDqv3MRP5biXkaVi8
         M4/NPjoLk+ig9dIjL4Acmtwbirg42jAFgUQonLy60FFJQ3qgArjKh3Ngu2K+mLFtEuqO
         4Erz5rywoR9V0ieHmauoOALV3GaJwEs+6Im22BA0NgkAxDgtdptJbIMAOUdmW+hEIy4X
         y4JdfEmpviJ0fX6TFbmrwKWWdATSrxcaVEYzLxBwfKwUbAurGyuc/sz6CsdwkxUasFYh
         lEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhW8PGZEH7FhA8PorNNFlmnr9+ImRbV8HUrQoBeHfJa8FVEzWMi+8r7Wk44YywX/vjkkSxWUvaVmCeqKnCAbl4TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBNdTM2dIThvd2XeltaPNcX34Ou0GqOSfsJwCBcOnaDZ7svmGT
	and621ImE2cjipGnwMpnnXkfCA/xi6KCW/I79pi1Fpb9ZVlihU7FQWR+CyTTOkORP4o=
X-Gm-Gg: ASbGncuSLxgSZR4uC3mryGucs8YViYxNplKWsIq9wiFzHY5vqk/zpRp9nHT8Oh9iHd6
	xXhELzV5yEj/6AH9YqxTcTdj+ynYZCW31XCVpf2eJF2bp4mxF9/4/bnkzGphgNVw0Z33v/7rVM1
	+FU9gGjiFgKegcXolksoG44eljo+HuuIQhLtydiSYnYgXhbVpxG14XH4at85qnKRC+n16tvdsNv
	rgTwOx+ERzno96rnJ+PF4eVn+AzylgJkmsuMmyS0Jkc5xxMP79md/0fim5izOQlTLvniaLvoGOd
	iBLV/labn/69AA1mASKKRUYoWys1F8bV2Of9uxVwq0vf31ih8TweuAmGiK/U1Fa7j3LyquGM4v7
	S2VO76O6S1eKuOV0+tX6PzXP/K4OrlZ3klPW78h7u3gA+l6oGDZ1ercnyWVdgLSxoW5k5vAP7RU
	So3Fk8gb5WK1A=
X-Google-Smtp-Source: AGHT+IFtCJoEa3fPjznfspradex1PtTFo+De784I9+Mj7ZLYALTxzZRy9e27nwxt5XfS02ZIFIavUQ==
X-Received: by 2002:a05:6000:26c8:b0:429:c711:22b5 with SMTP id ffacd0b85a97d-42b2dc13946mr3574288f8f.1.1762776838835;
        Mon, 10 Nov 2025 04:13:58 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] samsung: drivers for v6.19
Date: Mon, 10 Nov 2025 13:13:41 +0100
Message-ID: <20251110121344.120785-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=7eCwQzIdJ0n4Jk8cIEMb6dznrr42scKRI9w59K+VWtk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb6Lys/nhK6FyF7WpIVe24IhpaXO7tRMwX2q
 ee8mfep2SqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+gAKCRDBN2bmhouD
 13kvD/0ZXTLuTwJf0e2y11S5cpAeAyPebJadjrmUuAPIXoOOz5cBL6EcopBvNIIW6WqyzuabIOG
 iF28TE+A3Ks1JNt3Ow1Oq9H1nLb3/xdqkVBBjh28w0gtxEgoD/qJyE9zhEclB7uom4Lo7YcDutu
 vM3VjnnBJcdQyIVVZVwyUBPjrYgdc8fhiIgAlwjfXvG/TYDmnvTv1V68gN/seAfwOEQvzJgVouK
 Oj0oFbUz9gloMokC8iEI09F2mItSf0456QaxpE19cybMEg0kFnLYOB838bAKW9RwrCiuAw7peZF
 gGpkMyejtk52dYmkQVhYaZ1QrYfRwoqINBK9DUjR+f6q2G80mEnTXjOqqX5p3sOkv47ngp+JnGj
 J/u3KQ1px1sgyI3VoRFIhLRU2mHYXYIuQkHa9bVB7epZMabMoOt2V8u8gmI0jax9xvCD2BPfR+H
 ljdfF5YBzysI0zoVREXr3KIb8oyF39TVyxBHZh7isjgWDuU3ab4ahHO8RuOTp7uklh5j8cZ3qNs
 m3BJ8H1jU5pY76dszctetAiza/z6fgw7waI+siH/Kc+lvAawwQKYyCKhc/wk+9qIShklQBsPe0s
 P6DprrLIC13CTefnYCptD+EnAh5VTIgB4J0ib8UjCgpepPRUD7Yd+3mvYgmfk3ENWbFCHXPghtb J7qrPJTJjcUQSDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Topic branch for Samsung firmware and clock drivers.

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-firmware-clk-6.19

for you to fetch changes up to 6837c006d4e72d6add451411bcf407e0dea4ad25:

  firmware: exynos-acpm: add empty method to allow compile test (2025-10-22 07:49:38 +0200)

----------------------------------------------------------------
Samsung SoC firmware/clock drivers for v6.19

Extend Samsung ACPM (Alive Clock and Power Manager) firmware drivers:
1. Add support for passing DVFS (Dynamic Voltage and Frequency) messages
   to configure the clocks in ACPM device.

2. Add Exynos ACPM clock driver, which exposes to Linux several clocks
   handled by the ACPM (firmware).

----------------------------------------------------------------
Tudor Ambarus (6):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      firmware: exynos-acpm: add DVFS protocol
      firmware: exynos-acpm: register ACPM clocks pdev
      clk: samsung: add Exynos ACPM clock driver
      MAINTAINERS: add ACPM clock bindings and driver
      firmware: exynos-acpm: add empty method to allow compile test

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 MAINTAINERS                                        |   3 +-
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 185 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  80 +++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  19 +++
 11 files changed, 384 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-acpm.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-dvfs.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-dvfs.h
 create mode 100644 include/dt-bindings/clock/google,gs101-acpm.h
