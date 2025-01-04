Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBBF211C;
	Sat,  4 Jan 2025 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736008161; cv=none; b=pYmB4dKja088XAYH08UQHzE7puydi9Esq+Aqdl6G8g85UVRuQbV8ZBI26fpqpmg0iJ2yE0scjmY6csFusedWWbVEbRLZpoiI8TrdcH0z6L6p1InkzBSOFZM++vulVw7SDIWdSk/IvWEeiv2GRqYkhdbXXbyrZ9SUddi6PzYwFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736008161; c=relaxed/simple;
	bh=+0JVdIjKEhi5DNkCWXGGcrjQYlDZCm0cxCKqgJB2Ee8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ouxu+tHUAnYYDJzQhiwAFkoKpbvo2Vkii8TqI4IdxFP42sUbOMROtrllsJ1eZzoZBu2eabHWLMNmuZWjjVjrP6uN05dv7OIesDXu2ouO8T6pH+ad64I4b/LL81tSXHN3i4tJxV5aVMVDNjYbpUcBSOeo5E0FM+X2K+/iN/mFdm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izjuhrJT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izjuhrJT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43621d27adeso90733055e9.2;
        Sat, 04 Jan 2025 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736008158; x=1736612958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75kKbb31JP2zVHFIDZ/o0cPWp6patqfUDNdVfPTRa8g=;
        b=izjuhrJT9EyNDXo1oOW3VsC5OXeM6ZkLvCamAigxZTEceF/5Jtf6DkBmhkJbgPvlOU
         X9Or/wlzu8rcn/HlWmYlDLPGYskh6shckFp5PY0fGL/8b1tnPnHhp9bw77Oa9XVVpqky
         XcSl/7dpybM8dSWoSqxrPpCZF8MESOlyZKWWaWTe7QHaAdzk/Iv0oWCs/r9B360jqBSi
         ufnl/3N63NOno1iWYx0xf2S94/3/wcTRzoRpvCnTNJPNyB+kCoFyXiFh8yCOf5ULjj/S
         bV+YeG1I8Kk4OjjJ8I7qUmDPkLUqb961R4RSUL5yMx2yonLvFRsZ5PXQvNQNURI8c3Af
         O6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736008158; x=1736612958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75kKbb31JP2zVHFIDZ/o0cPWp6patqfUDNdVfPTRa8g=;
        b=HIg0cz8TmCbBgD32K8JZxO3xD6kzxu9hf27tTOsVnvL3fQtkRRkiSUoDkLB8C2+6Ki
         CMtUeYCM/Pc3T65cACfusCeQQ5HQjB+5oTccU2fsLLsVyrILBIIB5EoS5usHHNUYo3yC
         4n7B4QJa+igzPK6XWa7zGSJp1dhM/VJjhdTIkZ1U364avYZy06w239DoBaQZgBllecG0
         mIuQXLE7CI+kduCZ0YnR16ELmboap2sWMsLN2LnUBkptFxH4X4FQ0vdXoeqBWkD9rPsb
         VTO2/T7lQhcAUt4TuCqyCxsZ+/7BEbY80yYn/8HtKOAwHL7t6zvo3hxiher7I6n6DXIP
         I8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAUlusUzgHb0yRbYC+q0K73e7zDDttOOpXMNEM6jgo8dxyLsFe19GuaO5BKfzoc2FaJ5FNnJaEJDZIL+A=@vger.kernel.org, AJvYcCXml7UcyN+L0tMfxY8KizE1wF9okKsai9wy7hU8KMScmGJ17Gc0b383CHjiwKuUjIAV8bczRist5dula8pTentz68A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pFXfFGH1JOwqlt+4uKyP/vuYOtytJLtS+m4oGOWGd1peFI58
	SvwUjvXAIPl7ZqunpBBgIMr7IVvFJmmykOGYpnAxdZCHPFCWhO9HDhYe7A==
X-Gm-Gg: ASbGnctqTbX9cnYTGQqyQ6Q4HifVLbGZQGDv9pGk7PpCeaGfx9Q878aON9OIJqS3D/F
	DTRKmfz3VOVYUTkrBtr5WyXBNLmPOc11zasDLseC8IDWX2e0TPNW46uXql4zi0HCsazigK9YcHw
	DesW7esxnPYB2ezFWHAgiKZmSE3kfODkJu5mZAAUGbDjkUNV5y3c8Z16xu7VQU+feRTxKoAPmnP
	rGUK+mbjqNYVWe2We/UfUY/d5c5HVFfZWk6YmfemveIlboDMhDJZ+il7vmw8K99u/8j+vg=
X-Google-Smtp-Source: AGHT+IEwXbvJYKrDP+G3pOKdVCJMWC5VrzP8JtzhdZgCM4Ja2ck79MkUoLJzlgAPiaoTuEpTbft98Q==
X-Received: by 2002:a05:600c:154c:b0:434:9f81:76d5 with SMTP id 5b1f17b1804b1-43668b49a47mr423056215e9.22.1736008158197;
        Sat, 04 Jan 2025 08:29:18 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm522807895e9.29.2025.01.04.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:29:17 -0800 (PST)
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
Subject: [PATCH v2 0/3] soc: samsung: usi: implement support for USIv1
Date: Sat,  4 Jan 2025 18:29:12 +0200
Message-ID: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
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

This patchset also assumes that [1] and [2] have been merged before it.

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
[2]: https://lore.kernel.org/all/20250103082549.19419-1-krzysztof.kozlowski@linaro.org/

Changes in v2:
  - add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  - restrict the possible ids of samsung,mode with an allOf:if:then
  - set the properties samsung,clkreq-on and reg to false for non-usiv2
  - only make use of exynos_usi_modes
  - make sure pclk and ipclk are enabled

Ivaylo Ivanov (3):
  dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for
    exynos8895
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: implement support for USIv1

 .../bindings/soc/samsung/exynos-usi.yaml      | 55 +++++++++++++++----
 .../soc/samsung/samsung,exynos-sysreg.yaml    |  8 +++
 drivers/soc/samsung/exynos-usi.c              | 42 +++++++++++++-
 include/dt-bindings/soc/samsung,exynos-usi.h  |  7 +++
 4 files changed, 97 insertions(+), 15 deletions(-)

-- 
2.43.0

