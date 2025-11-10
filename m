Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51FF30EF7F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776840; cv=none; b=qZH+m+hUQT3O8O7RUTRIp3Ljl8t8+j8z228E0yFXPdXF2VRuz/Rd2yqHcfIRvi7BlFvuKPgiP+YAR9eeowkU9/PkBgTyDdKAHh+SCF1XXAUkEYq9lxvdtQLJWjrFyogQcOzN9dig0C9uwdkyzxVoKz8RmoGd0E8x7HysDYkC870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776840; c=relaxed/simple;
	bh=prTJ8Oc+m1RLqjNAKESRe03pqfxl99t8fUIb/LcjQWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7tlaZEQeiv/i4NLS42bf/J/8SkZ/P/iZEpWmTwZf6RZ13d0eA9riwSWe8MZ5ABILiDE5cWupnZH1z46+Ce6tQN656+1bQ5/0fGh0vw3Yc4zdLlWrUO0RCLg2YDpb03+I8PivCMvh7UddsKYdyaplLNPtniC877oOqdEN6abBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vv5lL8lW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vv5lL8lW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429ebf2eb83so337403f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 04:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776837; x=1763381637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+J9DK7umCkB0lH75JtGcDU05puxofKEqqEJe5YRpEM=;
        b=Vv5lL8lWdI9S/vjHelzxhr6h/3QI8VylGoRrQ7MC8SL6GsRzEJOAn/SCOLcYozBNmH
         g7b79puMi27Pz+erb9KJy0VzbR5t5/+tlBG/fAZPWt2yNI2/Gk0DP50xMh+ewcpWf41P
         JNzwrV2AclViKKqhdX7vAaNHda9KyfZw8WFiXWowlctyMTnLmFweEepI/aZLgv2xCSIY
         39E4fe7jt7EU5TiplbjFff7VegfXUJkPVb3LvkcYq+sl5fGeEV/uq7MbdGumlhvqE16c
         RwvHCUcJ/HBWtIPIqJ+XhQQ9yO5Ice945mqgbqxPB9DKMMz8UIfdyR2/VOeYaY4FCK9S
         QfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776837; x=1763381637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+J9DK7umCkB0lH75JtGcDU05puxofKEqqEJe5YRpEM=;
        b=cajC66fFU7TZv72WTy0bYo15UoTYHkoXb0o7oJE9KDKHBm8kxWViq0PcjKSRdFHPGs
         D+WR3y/6nZlssOUWG/Lz1UiwCCf7NYRRoFpCZS9vb9BuxyUgfH6Ns1X89bSAJEhH0AL2
         jHUo/Ynm/YwOyUahwvecpy3dgQbUHnJtlRR2xkcTXz8sDVgDGw2tQGZ79Cd2d86+Cff3
         +uyECjHzqAZ+hh013nbyaVaDIllE88lqRTWCKHj2LEZ7jBTYpZcaA53z3PVokpbJY69M
         1sa61goPKV8zCtZhNyW/6dtxvoAKitbo8ygaNssSd9gCYhujiGHniu/n9kppA8RuTnAW
         rvbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNYggJ8EH4EWJNS5JQlP8sAKq9d+TWe7ry1UrZ9WCAlvexnv0AShvl6/x64Lvv5laXSADrDTSEPGP2IN3+6JRyNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzRsF0u5lNFKCXPl7ILfuPIpDhgb0uA3lGP4FrLqdceZpaLsy
	/JxnfUglpgiQzXZ/ShM+JOeU7tLns0/sa90d4GxtM1nsqbp/h+tii0D4s2CIiNztLdQ=
X-Gm-Gg: ASbGncupWpbBJpHJv2/Tqj8cb7jDEAdAUYNSibh+sJ3IJVfUzDejQbdaFLiWB8NXtm2
	9b56ukNGAwRKjiYSVOetifKTsayXiseXyhSAAEcyRiKTt5YVn5a+H48LPpa9gbdDU7LtopoKlCH
	bGJ+zAlCumPQt/KmPcvWc4/+OyqlvYenLTd6YlODxcnW2b8+0rIAYuqxc/ZK7Ns7bVxMC21oeP/
	lMAnelytyyDFY4tceDoZFFcFkCqkwxLezoHn2XKwHM7bw2cAD+/1fDWOIFWdcEMfvrhvA3S7IGa
	uPUEGs5yVIK+91EhjLZenI0dLBTssQyAiTzqHPg3HYtxnf9/JJST/UMO1gxILAseZusT8iIh+jR
	/QDjhXlx0KQKaT3sT1mDMrfahppAuJJT3sgNp1NKTc9mpmSOd+yFpEiYgniCiCZ5QBsxJ2QiglI
	GCnKAUNTeSwTg=
X-Google-Smtp-Source: AGHT+IHXmMAMgHGLYPHdNXeuo+MZBbEjpXPzE5xhKoqUU5naZQ2bnEDU9zb8O6kz0C5VmdKT1m/FAQ==
X-Received: by 2002:a5d:584b:0:b0:429:b4ce:c333 with SMTP id ffacd0b85a97d-42b2dc20b7amr3337629f8f.3.1762776836988;
        Mon, 10 Nov 2025 04:13:56 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:56 -0800 (PST)
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
Subject: [GIT PULL 2/4] samsung: drivers for v6.19
Date: Mon, 10 Nov 2025 13:13:40 +0100
Message-ID: <20251110121344.120785-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3147; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=prTJ8Oc+m1RLqjNAKESRe03pqfxl99t8fUIb/LcjQWk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb54uvgcIsvJkyeUuAsVPO83CjVSmDVgud5l
 2LOf1gbAw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+QAKCRDBN2bmhouD
 1xCwD/9fQop5LN4wvcGWsg5PtGyKeubevwoDlObwaQN/15SYy87W6CxtCNV9dU/3SM3XPUCmLxy
 uawL7DFzPR6UBCAz7+k115KcJsrWJ58J8ZN/sq6svzOwBU2eYXkGWaO4eAGEyfYWgX/of3DDa0n
 Z0M0AifAC5lkYD2gnppGvNQUa+xIUelZD3jB3ObaZ265L76q8gtLdwImZ1ab5ceJ96tn+eypUgi
 qDiOaWZUFR2ymvuY69ivf21U5/MkM5X3862NhjhQH98JHywbcdB6XT98a+OZRXo0z88cD54OPKU
 uqHXlZEEF4OzDd6/qys4ESBxMzYUEwvDc7k+tZ1phMgORBgkQPl6D1jOjVrO+ZWgdhLwMMrk2WL
 cuEqbXgxdL8MhDOMfrtFoKTsMklYtQUXyBqCH/3OB2hyAFdjeeZt4xsL0j+fWLC1bQ5rD7M4zbP
 rw8+XEqZOLWKVa3wjMDlmg1PsLpsfZrcwjI+Yzf/lIVprnKmBkCtLxSaMCBoNvUhIyj0gkQcc8i
 7G3LQKWCYj7DM+f4RvdbrixjruolAA+rJHNQ0jEa2OVlRB8czyUHKOqT42Itll2JM32X0VcEzxe
 PgJc3iP3M1JZ96vJkm6qgZyuIy3IceO8y474AgSC6FERBGdNoEEoOvR+BpCltuZ5eV7S8ANZldx moJ9/Njf6RuKBSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.19

for you to fetch changes up to 81280d39a2f9e7dc12056db889da52cce067b1b6:

  dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU (2025-11-05 08:20:21 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.19

1. ChipID driver: Add support for identifying Exynos8890 and Exynos9610.

2. PMU driver: Allow specifying list of valid registers for the custom
   regmap used on Google GS101 SoC.  The PMU (Power Management Unit) on
   that SoC uses more complex access to registers than simple MMIO and
   invalid registers trigger aborts halting the system.

3. Few minor cleanups.

4. Several new bindings for compatible devices.

----------------------------------------------------------------
Alexandru Chimac (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos9610 compatible
      soc: samsung: exynos-chipid: Add exynos9610 SoC support

André Draszik (4):
      soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      soc: samsung: exynos-pmu: move some gs101 related code into new file
      soc: samsung: gs101-pmu: implement access tables for read and write
      dt-bindings: soc: samsung: exynos-sysreg: add power-domains

Denzeel Oliva (1):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles

Ivaylo Ivanov (3):
      dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid compatible
      soc: samsung: exynos-chipid: add exynos8890 SoC support

Kaustabh Chakraborty (2):
      dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU

Krzysztof Kozlowski (1):
      soc: samsung: exynos-pmu: Annotate online/offline functions with __must_hold

Peter Griffin (1):
      dt-bindings: soc: samsung: exynos-sysreg: add gs101 hsi0 and misc compatibles

Tudor Ambarus (1):
      soc: samsung: exynos-chipid: use a local dev variable

 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   2 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   2 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |  23 ++
 MAINTAINERS                                        |   1 +
 drivers/soc/samsung/Makefile                       |   3 +-
 drivers/soc/samsung/exynos-chipid.c                |  18 +-
 drivers/soc/samsung/exynos-pmu.c                   | 138 +------
 drivers/soc/samsung/exynos-pmu.h                   |  37 ++
 drivers/soc/samsung/gs101-pmu.c                    | 446 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        | 343 +++++++++++++++-
 10 files changed, 863 insertions(+), 150 deletions(-)
 create mode 100644 drivers/soc/samsung/gs101-pmu.c
