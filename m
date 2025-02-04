Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AFC166F32;
	Tue,  4 Feb 2025 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690147; cv=none; b=Z/g8OJo6ilIqCLZT7PMgEsNo+q+H9Zgpo2fba1f3Xx5Y2fcp0lziKfMI+5JJ6XNWIRL1Si2bAQLuI7OF3XuT9zM4vQxzrQlWspYtyV6Fc+9BLJwoxhsvC6mS+t/7WJbgeCCKg4r4AQSr1ai3sTc2RMg7CYe+RrO/u2c7ebiwn/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690147; c=relaxed/simple;
	bh=UB0mN0VrllNzr2gZQVWzvBu+xxfti+MCGUfxbpLsf74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hytjMOswcujH7TgnYmM2cC9NFGZ+1EBXbTo4BS4YNZwY6efdBjKmRrjPVIecPhtzGBzjn5Z9z7IdHlf3GhwJzmrmSe5xR7etDUhaDvNiqzr8yjGq8d24YsT1IhfO82JTvzVuOtirw3gtzDAFbI170J42H35KHVZ0MV0zw7ZRG6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmWXbfEh; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmWXbfEh"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcd9158685so512239a12.3;
        Tue, 04 Feb 2025 09:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690144; x=1739294944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwTYKeTvP2zh98/mahXQlMWN8DbX0ZsQj54Z/htdF2U=;
        b=nmWXbfEhaBFNsN3KxiFV58ZRzUpCsfsp7o0gUkwg4GvrPe0Be3/KiGBGPlvJSdDex8
         pJ7QLOGlp45gMNjmjUPicewqLR9pan1Flqr1iPY8QK1WzREo8rWTN7JzqGn+HnToASH8
         ubzeOCrpjK7dWAGHQCT7y7ZqBei/gt8Ahnm9YTdTLyqrEUo3OGNwhoQKM5v5OvJuJvKr
         pfP4jP4YGwFL+VXdSjPySFweoTstyxPcTGiCwPXDAheL7XY3C/k0Tw9oV/iYh2zTx5Cx
         fiVc3HOrOHuj/5fOdBQhUHwRGpZQE33dchUc1VnwmnjbK0xXeJYY6FW8eXp7r/5qEEmY
         QLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690144; x=1739294944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwTYKeTvP2zh98/mahXQlMWN8DbX0ZsQj54Z/htdF2U=;
        b=eq/4k9BUUDXUlKvzwmIT+sDoejE8hIUinGDtEaBszPZUKqzv9Caj8DSPXEKrbSe+G1
         kgUH+vOq+iwrnbr4MyVDcadqSpaMxdlkmfMMqpESqLq/QD+KFdxbney9lhFe/aEPzzkB
         yHOZfov/AXAtUyJBiizraSHvIJEwydwCYoDDtcj6719neSGNcK0xyyQsNjJKqOyRxbob
         u+8QbJFunnGTn6rrUN2iTmWPVxD+VXnNk1AYOd9T2KldSlpTKmQ1oALPdfMGNxeDdJme
         F9XzJNV/y8Fyu/U+7XD7kps03/VL9+G2SF6cAlYleVOWgWZX8Ztfi4QYwhGf7aKxRUIb
         Ia7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJrxDX1Rg2ztCtR3O929DRlYBK/uxHX7lEnsW6e7MHKp0T95HqLvC/6ElQgAK1dZZFKHJY/IXmjWyqtlsQJmtYVFo=@vger.kernel.org, AJvYcCVE+u3HlXES/nME+0uk2NJYDlomnJCk9MNaoZh7XVavaJZbLPXyViXGMtXGGrGr+nujQXc1LqWuDZgGHT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6lMqK9uMrkkCmZLTwO7TyR1YvzCjhlv5rHFWzkXnwF5lZ4BI3
	Qn/0YGdxaxC/ob37clH6LgTK2vO+3Djot8+NswYv6thGi/DNXnvj
X-Gm-Gg: ASbGncuRC8DbSYhDJYOYSE9Gwg7RTIXj42EfrP3wtU4pZR0imtG74djs7Cn1ePtJZ1L
	mlZfSHJtU0vubWHpdAbk2GcwmHE0+800PioDEePmqm8USu2zZB3jkoc+/Zo9QgkXLwTr5Uzr6H2
	hSsGQodlBJh3FOWSzFq1LNHRyKwNAyzWw6Gz4z9zGvctg2vDxa3KgZEETwTijWMXuC03vC+Y51x
	kfl1d0UQ8qslmRD5kUt/zCDSgvDEspLxRcFRRlPon3918jKGkTZH7GWJ3gj5XuboCkNi+dK6zw+
	EdeAuw7CIlEfvHoxOA4V+GXHmJFXLJIx/bRJVP0Tlj5szXFAXJOdO68PiHoqIbVXyYU=
X-Google-Smtp-Source: AGHT+IEOk+OK5ArG0VIXZjzqbOeM/+xjSaekgbV8rm9qb76uKXgF+iirLCOOn4iceexDRsG2x5zcjg==
X-Received: by 2002:a05:6402:26cc:b0:5dc:8fb1:d43e with SMTP id 4fb4d7f45d1cf-5dc8fb1d6c0mr17739015a12.12.1738690143316;
        Tue, 04 Feb 2025 09:29:03 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:02 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] soc: samsung: usi: implement support for USIv1
Date: Tue,  4 Feb 2025 19:27:59 +0200
Message-ID: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
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
This has to be applied before the device tree changes [3].

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
[2]: https://lore.kernel.org/all/20250103082549.19419-1-krzysztof.kozlowski@linaro.org/
[3]: https://lore.kernel.org/all/20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com/

Changes in v6:
  - move the action reset after usi init
  - make sure clocks are enabled during unconfiguring, otherwise return

Changes in v5:
  - add r-b tag from Krzysztof
  - make the usiv1 code a bit more symmetric
  - split the action reset into a different commmit

Changes in v4:
  - merge the first and second patch and don't break compilation
  - add exynos8895 compatible in the binding's oneOf:
  - keep exynos850's compatible in the first allOf: if
  - add exynos_usi_remove callback and error path at the end of probe,
    making sure to also have a removal routine for usiv2 and not just v1

Changes in v3:
  - drop the sysreg patch as it was applied
  - add a patch at the beginning of the series for renaming all USI_V2
    constants to USI_MODE_ and a patch at the end to rename them in dt
  - redo the usi binding support for 8895 to hopefully match all
    feedback from Krzysztof
  - change the description of the usiv1 and 8895 binding patch in order
    to account for the constants changes
  - change the subject and description of the usiv1 driver support patch
    because we're adding support for exynos8895 in the first place
  - make exynos_usi_modes a two dimensional array while also accounting
    for the merged usi mode constants

Changes in v2:
  - add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  - restrict the possible ids of samsung,mode with an allOf:if:then
  - set the properties samsung,clkreq-on and reg to false for non-usiv2
  - only make use of exynos_usi_modes
  - make sure pclk and ipclk are enabled

Ivaylo Ivanov (4):
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: add a routine for unconfiguring the ip
  soc: samsung: usi: implement support for USIv1 and exynos8895
  arm64: dts: exynos: update all samsung,mode constants

 .../bindings/soc/samsung/exynos-usi.yaml      | 99 ++++++++++++-------
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 ++++-----
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |  4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
 drivers/soc/samsung/exynos-usi.c              | 99 ++++++++++++++++---
 include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
 8 files changed, 200 insertions(+), 85 deletions(-)

-- 
2.43.0

