Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2812F192B75;
	Thu,  2 Jan 2025 20:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735850452; cv=none; b=P8f5+T6Mkv7GhDb+BHCO+rQAL9rceP9YwdaxhP+6DsfnrKHtNCElcLQbVa7/zL0f5LGQxJYF12bUYGXuwdnB7eWeMarJAWJcqC3WgjN2SktPt5rGNQLd8fj8+YmI4r+6p2RMn3syU2llTLLr+Svz3R2zEndkViksuPLgqP3ZMkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735850452; c=relaxed/simple;
	bh=g5YzoiIUTd9o7sWkdnV3FSr8XDrUWCg37iWZYOBnGXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oz9Xi+itmtqJH2x8FSnNPtnvzCz2VqlWa4XdJNWeTX4J5sAiNy1nFE+oKA198om/yg4tKh8B58dwIJwKScrT34e0hv51PoTCO510QvCv0CQcLBdr3QBvNMyuYDr9jjWuK+vkfNLTry82mgzs7t5qMJDwRblr2LKrosHhL92W9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9NEcoma; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9NEcoma"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so1667370666b.0;
        Thu, 02 Jan 2025 12:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735850448; x=1736455248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7aF1eq+bXcs38+fZolPr5Vr3auU0RoYJ0PNzi44nGA=;
        b=B9NEcomaZMDTWsL5ynV9WrqHesffimugDMDlMdQrDg7oZOM4dyVd2TY4xits1LAQHD
         ZugDl9aTxKHe8yoUsapG2uJX51tytFlqyZ25PbS1h3hyEKU5MmGVOQJrYdvI2RDH+xdO
         qfRsnpL62yuz3VCVSbr9Xl7nXB3w7VKWrkXGMBF5WwXDfLjiaYJi6tGpG2t9Y+o+r12x
         MB8PpIUH3etK0d/i/m6seWAXlGle23x2E0weyfY2yfk5BNtiClfyvUT6QllukPib4o66
         iKBi4iruAXsDT7EAGw6AppGwLrkdX6Qtz4TLMb8EOyK4e7bm/Kf2xy75bz504LkpCNMs
         +wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735850448; x=1736455248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7aF1eq+bXcs38+fZolPr5Vr3auU0RoYJ0PNzi44nGA=;
        b=VnwHZrLP8HfoX8TeuGsqf7KD+jBz+uXqR/YAhs1et43yzQDLVo2A2EywImG1b/T1+C
         CLUlAsTIgVVz/xOIZrIpG2kefRbxHnqUbOq99WKigxUrzbIiP6nXvDsYYuOYjyNc6rOi
         2T9NY9AAIks8BjKsGfJsn3opKNq8BWk2eIzmbpFI/SKCQ/swhEFh6xKGc/TrqxPjpvY0
         +UObALSxArwFcMk/uYSLkMNtT7fxCmwqyCTbk73Cg17mMViWDfphNRml1J5HkaEn5oxJ
         hfz2VppJv3l2Z16pu4cktHcSzHAZZB9kJ4u76iSuPTGyox4aeqh9LsTbqMsw1ulyi4cg
         QJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSah27p5fPm2oYP3jW+BC2eJNrsQDiif7xOvni276RstsOyDfciWPupiMrJAP7ql+aOBFpJal+LEFDNq9zoaH7g6o=@vger.kernel.org, AJvYcCXUXigOasuqKImxU9uWfOH2yoZoNYL40SNlafXt7Gv02tbQEXH/V4sTLbf6NxSP1rTlZfuRpH54W3O4Sog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ6ciEpI+Sf2kpWwN2Ti3OKaVPXuctHecBP0QARNyhPO/E8jiF
	24elRDWIC/5mUGL50oTUwxgy/QqDiysD9d1F6/B4dza5FXf4PbNjvR3r7A==
X-Gm-Gg: ASbGncu/nZ1Zm8/3uE+oG2sqHwP05vNpiuqN5uR7oSV4RFuQBMR9TDwY/GjGAzj7PUX
	/lADszkBdjKDjoU9Q+63HN697LvVWpPmIQhYArFB7MVKSBrz44WrwS3Z0K3Lkb3FOfHlOCELg9n
	MjAm2Di3fbIsK2hItjE/CycgJm4HoC4PfIasUQr55tXyxuxBA5ANF5GbmKkM+y2M9eWFve2GDKU
	B1q7wzZISVX0wmgV2J/xe1WuPHzHstGBhrFRUItnbTBtdLttT5bgtXceK4wrgPH6S1K1UbNHXmx
	Z8x4Yg2paSU=
X-Google-Smtp-Source: AGHT+IHPQtap3PTyufeAyVPFpllndA97AqbD6wvm55AJUubhHTVEkCnF9Y804Skp8NHZkaAiw2OgVQ==
X-Received: by 2002:a05:6402:5245:b0:5d3:ba42:e9fa with SMTP id 4fb4d7f45d1cf-5d81ddc01a0mr114968130a12.16.1735850448200;
        Thu, 02 Jan 2025 12:40:48 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1814251866b.98.2025.01.02.12.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:40:47 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] soc: samsung: usi: implement support for USIv1
Date: Thu,  2 Jan 2025 22:40:12 +0200
Message-ID: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patch series adds support for USIv1 in the existing exynos-usi driver,
as well as dedicated sysreg compatibles for exynos8895.

The USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895).
It provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
SPI, UART, UART_HSI2C1). It's a bit different from USIv2 as it doesn't
have any known MMIO register map and the serial protocols that it
implements share the same register base, hence why the way of modelling it
in device trees will be with ranges, like so:

usi1: usi@10460000 {
  compatible = "samsung,exynos8895-usi";
  ranges = <0x0 0x10460000 0x11000>;
  clocks = <1>, <2>;
  clock-names = "pclk", "ipclk";
  #address-cells = <1>;
  #size-cells = <1>;
  samsung,sysreg = <&syscon_peric0 0x1004>;
  status = "disabled";

  hsi2c_5: i2c@0 {
    compatible = "samsung,exynos8895-hsi2c";
    reg = <0x0 0x1000>;
    ...
  };
};

This patchset also assumes that [1] has been merged before it.

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/

Ivaylo Ivanov (3):
  dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for
    exynos8895
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: implement support for USIv1

 .../bindings/soc/samsung/exynos-usi.yaml      | 22 +++++--
 .../soc/samsung/samsung,exynos-sysreg.yaml    |  8 +++
 drivers/soc/samsung/exynos-usi.c              | 58 +++++++++++++++++--
 include/dt-bindings/soc/samsung,exynos-usi.h  |  8 +++
 4 files changed, 87 insertions(+), 9 deletions(-)

-- 
2.43.0

