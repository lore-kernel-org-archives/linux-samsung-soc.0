Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D02F2E;
	Sun,  5 Jan 2025 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736093032; cv=none; b=ApSKw3LPj6OJNlfDMEpWizbnWjqO1F1Zu1/VF1fV/fvHFeiX7cPHzffbMGxfRpsrUEglIDzBdSulB7JPBmkOBHMr1FZ0MMD16FgzC3qYzXdM4+5p1vnO8ts0GRWOZv+MgAZRlmPBMROy+ATx98geDQvZwHVCDvgVtylQJ0LMH4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736093032; c=relaxed/simple;
	bh=qnw+KY1WwWhBUUIgb5vhI/8ad7nexUdFYnDCpyld+3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DoHw2zVRO0eh9v2GKWfWW1Ph369ncTp91t6VKENEIii0DnUjVuDtMIbPOOwsXR8ZjOa4lI6CsYhGVK52URelKpq3pchUcXR617KsUi8LRLdg/aBXAAsuZQohPOGWITPQdGXcJeM5vribfU8UJL7rxhZutwZplj3fwcaqyPhUZtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaiGwajq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaiGwajq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43635796b48so82141135e9.0;
        Sun, 05 Jan 2025 08:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093029; x=1736697829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIdqPqr8ut58WJhh8jC+m8wlfdOxzjL71ub5pO+L6Qg=;
        b=UaiGwajq0Lw4So/Zlcjmt3aKf6Yd2Unhn0kxKvp4irK6PZM72XOsC0XDDWZczdjFOb
         e4C0UAksvroY5epB3HGNWcBVActvnAKgmDs6NByrWxYwlZupBP5KqaQdZSfDwki4B/SA
         uKlfYddsunJyzzXIkdvMYzJ0FhIHt6D8qqxy2TL/PYCqvre27e8aQeH4iQZSgXDKWOQe
         dZpGdoHpKPtgum2HyFlpLtO4z4PO+5EtXjD4Z6zMWuiubPVquF4GQTp45USjuH1zBUP8
         ORmUZv56gw3bdVBkhxH/RdMRHkVD7pY3csx3PW6vCa4ZUMszXXjiAjK/W6sLa9rrB8oh
         pGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093029; x=1736697829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIdqPqr8ut58WJhh8jC+m8wlfdOxzjL71ub5pO+L6Qg=;
        b=R0xtF7a8u9Msx3LGlyjs1hLJjrPRL0vMYEjs16gJVB4s7toTObqmseaXWTFzXzLC77
         ThjRrAGbVNX9TsOlBsh3feadeAfZ6/Xspozv7caUNrQODnsNVIe75jnpkGSKE9ElnBLO
         fNma+r1+l0OWCEixeX+FHxmeODVC9hbeBr7KEasAPzV6MmolqKxsNPC3SUeHzb4ytv+W
         yntmp00OUycnMuML+jfA67mCB36eVk4IyqJM+GEyotUJ1Yn7aWibHQBRzAGfR0VlfiQh
         Hg5fHBK6tLdGF0BmZmUGEQT1GVYGIEH4JxxVtAPTDlrdCz0nwlBmiacNVK+VN1O2NGDV
         ySTA==
X-Forwarded-Encrypted: i=1; AJvYcCUNpZfMWkMEmYiPirrjHNWVp2iGegbi/9tv/bu7ds0kWztzWy9HWGmkMhW5ud2fnX6EkNcNjpMdeeJS5nqeUbwBEkQ=@vger.kernel.org, AJvYcCX5GXErdOITcJq0Zznt5a2O3foBP+9mEDjoa9OIhj6zQ7WJbLlN89eBGKDkWCW0EQnFYUqvKd4aLHCuovU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRGsVZBLMbXr5KvTdx7lteTD7sMSvGBAoPkWZJek6erJmbImb1
	oNTdIzhsQ38qDAqZ9ITcxNYKruOKagMSJHFVw328t6AaBI8MQVSafor5cQ==
X-Gm-Gg: ASbGncsUbZRUOr+/GczMpK2oE65SPlPN83smy/kC/VK+nxTty42DOjlSiI2C55gz87o
	cSvdnLpZ+D0Hslh1edPSqanah795HFvNF92cCa1+k3T94QDqTQa1s121ErEWDr7bES8iKxupso/
	sCRLDcb9HmA+GouF/oaT/XSPosiVlKzBNCtbvKZX4UaOAW430ZxPASfSr8tlp9p2mbw6TpQvN1+
	IldcyCbtdWaLBWMFPqYdwbtwXP3NuwAapHDUF1Lo+1ZswU4kvdnvVO3ypBWUlhK1oEXhrw=
X-Google-Smtp-Source: AGHT+IFzX5gYFguVH0FccGIXUzFUCgTN+rqYpMq99wBW/xyi6mHs2FyajvkMivnBzCBB4XcwrGukgg==
X-Received: by 2002:a05:600c:5d2:b0:436:747d:55c9 with SMTP id 5b1f17b1804b1-436747d5775mr394893415e9.5.1736093029286;
        Sun, 05 Jan 2025 08:03:49 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:48 -0800 (PST)
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
Subject: [PATCH v3 0/4] soc: samsung: usi: implement support for USIv1
Date: Sun,  5 Jan 2025 18:03:42 +0200
Message-ID: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
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
  dt-bindings: soc: samsung: usi: replace USI_V2 in constants with
    USI_MODE
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: implement support for USIv1 and exynos8895
  arm64: dts: exynos: update all samsung,mode constants

 .../bindings/soc/samsung/exynos-usi.yaml      | 101 ++++++++++++------
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |  14 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  48 ++++-----
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |   2 +-
 drivers/soc/samsung/exynos-usi.c              |  65 ++++++++---
 include/dt-bindings/soc/samsung,exynos-usi.h  |  11 +-
 8 files changed, 163 insertions(+), 84 deletions(-)

-- 
2.43.0

