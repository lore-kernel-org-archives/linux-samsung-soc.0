Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE8204C0E;
	Thu,  9 Jan 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413443; cv=none; b=jFZeiOhxmdJ2m+U0zdyoMlUaM+wKCmnfNZ3cJd3N/zt+2XRPrAY6wgu4tV+Tbn2x/InQu6oMIh+ThZwXvkwlhaEPNzqFVgRRYAqhVYak5pX8IYrwfKq4YHLxOh2W+3hjJa1/UELRWroZe2MDTbcgU6WQipc007jZQBubeH+XojY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413443; c=relaxed/simple;
	bh=ucMZ3qfwbkNC7c194vu0mvYkAcrDu+GeTUOnRMKmsBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qEXzSCdEQjzbxc4g9a6i/qsG34CRE+H1KujSf+0qtGvTa3Gx+dRaauygePLH+2BZNLYDXXih7eZfEIeqP4lpWltAX68SAHq1/ucsrMRZfcKvE3V0nUZg+7aMfCOeEQJ74hcH2ZsBvHB9o4zBZRkU6rGRdFk4QSYPJXBzymZZcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn7pKC17; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn7pKC17"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4363ae65100so7336595e9.0;
        Thu, 09 Jan 2025 01:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413440; x=1737018240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZQasPUeDbR2IG7t6kKDByOfuHn4gvLOdtGRj3N9p9U=;
        b=Kn7pKC17xneZAw+9VMHbR74fhSJLcgrNrFd+q4UudEzc5cKgetDC5NuiW9aTt0b7iH
         hVHJeSAj10WpnhmtBGrY3uUyMlN++MxC31f0012B5sdPLbL/Yl+vH/eNEb0fBu2UvIRu
         8tumwQQYQdSb7M6+Nf4H49LrPNGbNbIE5QP3zCpmtQQA/bFnRMrt9BXy6xXeJ8WIdOQa
         aVqvJxTtNQIIa5pROidumqjlnT65SOK2wjJFSiovTil5ZazVeAS+VY/zolrRq8jB+nM7
         GJ+M8av3tbrK47uxmgG0fQZ6+RqJuoyP+2ACz6CoZjJmOEvOpDD7eqA9yFxk1MpNGVxt
         8/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413440; x=1737018240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZQasPUeDbR2IG7t6kKDByOfuHn4gvLOdtGRj3N9p9U=;
        b=uCrk8FxAxLeBwIwI/+CIBeZzfned1qdFzzrVn9okA0dMa5it+o5wwD69NflQaWDBKs
         xs66fkZzjxt5F9agnwIbQurYzggL+trZEkBje2yIauhYCqOz8+PqZOu+eqaHRr/RI1CW
         5oSHLrdfw+9QhUl/vIywRt1pBlAvk7IwgH/CABHxO0N6LTHTw8ZYeYi3OUWYq3P6JbbR
         /eXv1fDsnLP043zhDFEKUDeUrnHQxU0KK/cOv38F1ALTAsKRyQj90o3eK9l5FMr1TqT+
         NqnqYn3o5dswJgtA1iPHnZXkbQ4ncTyp+2XsFtZtnIc/RtbPXKT6T4u87Xz7BZ5NaUsF
         G7gA==
X-Forwarded-Encrypted: i=1; AJvYcCW53zBI7QZXflOesy/WI4j92R0IqglRQngfa7Fke3lkf1vfMPDcZxYE+U8xrKUCzmYHfP+e6g+7BoEgcEw=@vger.kernel.org, AJvYcCWVIl1QhDOtWEiQTHUNSG9/Txpsyw776yCJEoo2C02brCo338NxzcPok78K7m3SwU9/kHi7Zqzo/qicY9o4Jb9tzfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJdzciWQnfzNfKzZwChCUi9qB8m58Fw83XeSeUq+TTmF7dqTQ
	NWa8KE3w3XpUQMg9WUHvmo+1ORbOeM4rOWBQCFF75ucjOJvp+MWb
X-Gm-Gg: ASbGncsV/nbB5y75MQ0ykFhqvvbv4Mm6Kwk01C0WJ8eVBobvcfk+ivDBHpBB+Agn468
	WpEJNt9s3Lz+T4rrjidGb9L+AI11jnrkQbBpywRVGIeznlZAnWr3NFj1tm8ukZ+58NxD/sdDoxl
	zUtF3g3t45npiWeDgsCFxKlz+EfsUGx2/MNq2+sXAqaIUnAfFaVJ161WNRzAe4DLXxsD1KAMksV
	22n79aqrSk2jTM3Rtu3xZT/ej7eZEmz/m8sdf4OSUPq5ZyL446wqJ72wkR0hv0eeQCoJTadJ+KQ
	yTc1662zm8/zOYOZ7KI=
X-Google-Smtp-Source: AGHT+IF7Rv4i/SXGgR2c1TDytyprerm4RmK0kPLJ+znHdFHpPXl789K/F5KOK9ww7JHsBwXR2SLMFg==
X-Received: by 2002:a05:6000:2a9:b0:386:43c9:3ac2 with SMTP id ffacd0b85a97d-38a87305310mr5058563f8f.15.1736413439567;
        Thu, 09 Jan 2025 01:03:59 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:03:59 -0800 (PST)
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
Subject: [PATCH v5 0/4] soc: samsung: usi: implement support for USIv1
Date: Thu,  9 Jan 2025 11:03:21 +0200
Message-ID: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
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
 drivers/soc/samsung/exynos-usi.c              | 92 ++++++++++++++---
 include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
 8 files changed, 193 insertions(+), 85 deletions(-)

-- 
2.43.0

