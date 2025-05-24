Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B49199FAB
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2025 05:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064101; cv=none; b=aL74wKbdHRAIbE0E66FcWTXE5Ywdk91txEF3qjAEuom6TeUHjT6+3E5gyV6obfbdYLA3AEsq3xCF/2AmP5KeiDqgfIMMlfDHH64bZtxL7nSoLvAcwXfLFkQ7m7p7mEujM8OR66qLdT+F/c4M1vxzWyAUg0mWn+YIKrdxX6Y5t3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064101; c=relaxed/simple;
	bh=3aztcBEs5t+8vb2HvoZuOjO3OzbfcifNMPQfFU+/Q0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O18PWi+m7UWRDOIi07Mc+eDQ9ZZCmbfsdE+0jMbAiol49VajukDon+H9yiocd0PTw6mvWfJIJ8cj5roITrF4KCIm4ZqCjGTBgSI7pFvFoua+DTzMsjM0acU0BbpiuURWBaFRcyAQwegqCPsdIiZZOVekxyzUTg6LRGTRgmN+EEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSn4nZ+D; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eSn4nZ+D"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-602e203db66so517263a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064098; x=1748668898; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVLgX7oZgKgmp7JBYszc+Lbf8YbgAmX++SIMz1uljwM=;
        b=eSn4nZ+D1wAIxz51qMcxVy7kmAiMCv0Wmdqdz5/vlhy392XzVhKsdAEg5+f/PDUXAt
         UAZGgh3UcC5+Fevb0V0gFSZ0FkVam3Ov9VTlbkqhYxGMVakq8g/MivUDWdJblU3+OKTw
         L7FEmu247ydu3wnXmcHOy4BRzGH/3u6RF/DrOmt05JCwDPaCO++xwRH964HXFH9mnfi5
         W/r8fZKwv/hbox+6lfBMjtZuM+rMXT7S11P9Kfm5dmK7DPLSaYUURee7hRLKFeY49pU/
         O4f3bbabLWJFD+jIlkBgFmzbpTxZ3zlGCodaeIv/Zh+5vo2c8Waw30FJo5qwOMh4C/e0
         egxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064098; x=1748668898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVLgX7oZgKgmp7JBYszc+Lbf8YbgAmX++SIMz1uljwM=;
        b=SadbVZeSEMWbj5am9v0yNkRk9nQvadJR8+vIHOkY3mEdW8xcyp/7oHcDrx3KV5I5zi
         txbu9W+GKou8Lw0IKba98ZUhhIVFW3EWVOdGZXaQLeSO6QrlSPC34GzLfgvIDsBTyEdx
         lAm62OJYselmifazSXSTIRYQI00t9uKgNVynqJE59NBRONsGU09ZmODZ5vD1nPYEVIdq
         Fhodl8gjFuCgw79f+KWI1FmF4zrSTXsMSKimiKP31f13hkhzi90pYEDXJUUqKUNGAIbY
         1QoOeD8PTXeFSCBdyLpjoCgFGb9mByaYyu9oH8TWu9GpSzdWzI8h5lHLKwfO2nd5osSH
         Lo4A==
X-Forwarded-Encrypted: i=1; AJvYcCXJEEX1ba+LITEYNgbYSXRmL4RM3vBYzjwTUv9tbF3iPSvhCSuJhPcIGYHkFwauuNnDVThfQoU0fRd4r1JktUv3aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYx4JfYQwvWYZ/IX9Fa/ttIJyRK+u1z3JDxZlnmhCRNbV1OAxA
	PNvjCJZidLDNSomF4w1+h3VbovMJ9/EjTk3kkAEKt3RDus+ox9CHI0c0nB+aUc+bCC4=
X-Gm-Gg: ASbGncstymuK800UIeJqDQSzoVwz5p8OXe8nV1CXXYufXtdYUaa2W6o8pJEQjJs2ZZt
	bxLqnodSWU3mZCz/CLsJpUKWB9JWtEAixXlXHhC4TZHwMopOqWdlF7JGQsDMTIZwcykn8NBbCLM
	DJD/n1/Fr60KWfei3NvgYyL2JA7KbdjBbpIV2uRbMirOIIYua5I4iZhcD28HbEGRd6lfWFoHkAz
	mI/djVtZ0CT8HEspzHQmGe9Y6dIWVUWTJzlbDLlONGzpLazCDp4AWZOMmOLflTiHpnDigOJOK8Y
	vzYWG5z7dPC3JabQsA+Sw9RpbdPPMmHdlY/qG6y/zoNe2MrC0wGGjDpqSF9ngyf/vcSzwLcrMnn
	XFUQLfzgaEvMyj2b1lNw3m0X/DTCqugTfiCg=
X-Google-Smtp-Source: AGHT+IFwfRfCw7b+i30fDVsYjamnwABVc4tlq1MkutzLjfaI4FhpNhFaGTjcBmSVXr0eujU+xxYGNA==
X-Received: by 2002:a17:907:9688:b0:ad5:7499:2644 with SMTP id a640c23a62f3a-ad85b2a4f94mr135383166b.54.1748064097988;
        Fri, 23 May 2025 22:21:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/4] gs101 max77759 enablement (DT)
Date: Sat, 24 May 2025 06:21:27 +0100
Message-Id: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFdXMWgC/32NQQ6CMBBFr0Jm7ZhSpBRX3sOwoHQKkwg1LSEY0
 rtbOYDL95L//gGRAlOEe3FAoI0j+yWDvBQwTP0yErLNDFLIWlRCobnh3O9N09Qtzs6iXSM6o7V
 RgzJWCcjLdyDH+1l9dpknjqsPn/NkK3/2f28rUWDrSBtBRpeyerx46YO/+jBCl1L6AjRlJpK3A
 AAA
X-Change-ID: 20250306-b4-max77759-mfd-dts-fb88b6c6bd60
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

This series enables the recently merged Maxim max77759 driver and
updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
accordingly.

This gives us some extra GPIOs, and enables NVMEM which is used to
communicate the requested boot mode to the bootloader when doing a cold
reset.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- rebase against next-20250516
- add dm-verity-device-corrupted to reboot-mode (nvmem & syscon)
- update commit messages slightly
- Link to v1: https://lore.kernel.org/r/20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org

---
André Draszik (4):
      arm64: defconfig: enable Maxim max77759 driver
      arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 PMIC
      arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
      arm64: dts: exynos: gs101: add dm-verity-device-corrupted syscon-reboot-mode

 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  1 +
 arch/arm64/configs/defconfig                       |  1 +
 3 files changed, 78 insertions(+)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250306-b4-max77759-mfd-dts-fb88b6c6bd60

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

