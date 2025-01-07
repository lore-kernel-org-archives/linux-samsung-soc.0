Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34D1EE00F;
	Tue,  7 Jan 2025 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249727; cv=none; b=bRslXNGutoC0fV8jR/BrPBgKtET2jQ3++lZQjoCKvVMy/o4iMfv+M6Ca66cuRlDB4sre2kIyqpEbPI4jwXycCTcM44tWe69/HbJyzPJ6cxAvDqzANhEXVnXApdUdu08vd3iQOAHqs/MBGINcns4Vg2fTAYvr8vxq+q8sqQ+mLrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249727; c=relaxed/simple;
	bh=ArvDcP/mB8nEANvvf9tHPl+m2LXlFy7SdebAmmn/E4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FT19iuuJE4cUtj2y1K2FACRxQmttO/AGrlS1prFnjCdm5z6Z9xXshzdD0DQrIQw1Hkl+ZkdwzFQtiim2IXZXec2Gid0qok9t2TmxcPqXI2Y+5mRuBGVewBWyNajtV/GGzU1hLMwg/8rTPkR/D9jQIywrefyJFp85uB3BeRw5vBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GM9KwI21; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GM9KwI21"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso29048189a12.2;
        Tue, 07 Jan 2025 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736249722; x=1736854522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSUVW6GTWKF2wmefWyE0vBf4Q6ZRM8bA9zeRcXh2pts=;
        b=GM9KwI21CCPPsgVkjVRHSWV5m9435OUEDXw4h1gtb5PEXBheCMmikU3DPpsjI6Ww0r
         v1O8Rbij2jU9zH7FZ2k9FPY7gvnEeb6m+ddp+OBM14U5R47wJJLIkharY+WuI1mpeWc8
         FiXGiXPrdWau6nHRFhxoTO2h1GyETGW0k1j2tQXUoSQ2KALTvGiMREKA1Bm8h7OH335R
         1s9aA45SnAdtGQu/AamaaFqcq4n7ecBBuioeB5JM3lZhZkViQBWOEO2qbQNMOrCfaSpl
         jQVBuK7d9sebGleTCrr7gVNfAXbuxuIAQEZ49wyjBXYqozPxgV/dvZx3a3ksy/rtMEKI
         fVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249722; x=1736854522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSUVW6GTWKF2wmefWyE0vBf4Q6ZRM8bA9zeRcXh2pts=;
        b=lZc23XToDs2CUl0IZu8yft9EqmxiTkJ/SbaXpYKCQz0h19/Fu128I/ZzH35ewTCzrl
         z3evLUsno3Qll1eW7B7p4eiaCp3pkjgJmvjWGAeYiGmdyBld3/D45DmlQDaOMstYqqnK
         GItkR8EyHo0JfBgv6IPdJZu5LcUjHJERzBGHdd/QwuXz+xhwBuGO/sDcduLXPzECRoov
         ZhFSog9q2EQI4kKpsZ+B5xVkeYATneGNPXkVNtoHp4K4JC/ALiLgBhzGl/1GxBDRjEQ4
         S3VP8K/JVSPyAXjxZsutZgpX0PTGI6ppWbkJoLkbEKG5nwwy2WJhXZuCFqUYmeOAmmmZ
         U9kg==
X-Forwarded-Encrypted: i=1; AJvYcCUsUI5T/Z8ul0491od0fYpX8uQ4kkFvD2gFTOibK/Jugom5/CiYUJRKzlpnnPYxsdA3dCLWs4p47ZY0rEg=@vger.kernel.org, AJvYcCUtRIaYPf39u7mWTjCTfFZOm7TnEyaCgjO76keuvDAWDVnSlOMceXbcBKh1Sg/zf+xQcjy6T4E68KchlSdCyi8JUm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOc1DneM5VEtEr7JM3ytxXrU+M1Xr3R+sLwrTIE4w2mmAnv7bq
	Gz1a1eCNxwJ0ryajLupKXpkTIPcZUU/nSSdyP3Y7m8US3P/BXxBA
X-Gm-Gg: ASbGncurp0E2UUtpnop62bJzio1Dzaio1NeNQSeluxlLsYgvsXdP469m5ZyGqdPzDXy
	XzEwHozLUfVRK4nmFUKsxjdTeY3ggI/m54TmOGpY1Jjz2/ioAdZ2k4HoNbP31PDKqRTAVJJMFGy
	9qVX9REkg0O9QXOy0aiQHH5viARv9VWE8OoFQpVVHk2kIYVTHiiNDhn8rBnTWlpdNPHWOfpkp+3
	Di5zy2FKwyfqHCKsv7GNqh8blddOTJnCSr/0UiFNQUygru39bteqt7aCumd9I0ynrQxeFCI/jRh
	IiF6aR84WSDGY2QZG4I=
X-Google-Smtp-Source: AGHT+IHEUFxp4/hMM1hTgoqPNCWtPeLIRmmE8wRnP2ztgECUmYD8HSLD0/dfczewjo4gowWcJZ0aRQ==
X-Received: by 2002:a05:6402:430c:b0:5d2:fa65:c5e2 with SMTP id 4fb4d7f45d1cf-5d81de1fd2amr59121007a12.22.1736249721526;
        Tue, 07 Jan 2025 03:35:21 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f23bsm24881055a12.32.2025.01.07.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:21 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] soc: samsung: usi: implement support for USIv1
Date: Tue,  7 Jan 2025 13:35:09 +0200
Message-ID: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
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

Ivaylo Ivanov (3):
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: implement support for USIv1 and exynos8895
  arm64: dts: exynos: update all samsung,mode constants

 .../bindings/soc/samsung/exynos-usi.yaml      |  99 ++++++++++------
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |  14 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  48 ++++----
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |   2 +-
 drivers/soc/samsung/exynos-usi.c              | 108 +++++++++++++++---
 include/dt-bindings/soc/samsung,exynos-usi.h  |  17 ++-
 8 files changed, 209 insertions(+), 85 deletions(-)

-- 
2.43.0

