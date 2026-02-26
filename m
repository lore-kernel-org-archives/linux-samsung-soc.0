Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5621A3876DE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120834; cv=none; b=fLpQ+sO65ORD/48gOcfEod1TPzUgw8MHY7PEt0TyCo56E9Lz0zIVPfAoZf+0gXMMUNu+N2fUpTN0UktFT+CCxYgjppiQrRAqFBXBe2O+mgL90CNOTjj5eiVG3yBcl7Ad9cgRnR7/mR1QZqZQrWz6zId8+fw0BM5xdTgmYITMS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120834; c=relaxed/simple;
	bh=cANxC1NKxrkDZsONAMeTnAuC0KO2uEW0PF+2bF6R2Oo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LJn9DsED76fH4FQKfvm6PtQzxuvhyLy9qExVjwIEJzqpUdbKdQCCW6w9bSTNK38SFqhTqwiZA2Uvw1xqjfN/U1Bc2RovmwxHIaj1MRXKdTdJs41NTSGFBqT4PoX1oqoXCyMflJvXnjXibxXOIJJd2VlGPVYHGALHW8cFh6qC2ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXcYJ7vb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXcYJ7vb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4833115090dso10630965e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120829; x=1772725629; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=voOK6OZwZEX8WOdHmmT2ZmjcPsrF9B+18Mhvcppjino=;
        b=jXcYJ7vbExaarzg/6+S5v98Vs6DJ4XKR6uL7dL7+5M/sjtjlaFZ9XpTrEiFpeB1BG8
         BZjoSVZItqQtcJtmtBfslDlUj45RMxoH/Vpom2LGjWlrYdEwYKr1/85v9w28GK+B++rH
         oIpxEyS4WfaTwuHfVSTIY03G29Ou/9a3c3TM4NkfNOhd0jTGw/Lof+Gb/2o7Wb1cjEKM
         8zXJd7xo47IVrVQsSLCBQ3vyVOhRAngjaep6mwVfGNeZnMr3zP7e25oVSfKuP5ptcHgA
         QTr3AaXQV+hQXj6Muo9Ef3CXk+fPsQfelNojNvZ8Y5tzz1dhg04ipTM/VdtG3MuLgrvU
         318g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120829; x=1772725629;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voOK6OZwZEX8WOdHmmT2ZmjcPsrF9B+18Mhvcppjino=;
        b=PbJKM4/UrBB8fm01DjR8PxW4qd2WxNPHarLgeDuWqPh8ARMjpvTtTtMjRo6eIpLRFI
         D/w6QXwwTUFV1eviMC2bcmyk2x8fOqF9H6rtFHu78kA5gJD3rht8Xz35pgTDUlckZlBn
         5HS6Ditf0FoHqcbxqKmlVXEIuCD1+j6du9Ra3gAgNswOM1BSebxnpydyRpF+M5ucO3oK
         RjJrQKZBLeOPQE6qLM30EREOui2LsWjdu5AP60IxhcUX8l7FvFohGc/lFj2S+X55LXRD
         ckxksmX6xIktU3mg8vEiIuPL0iUDOLTGW1jObrpunUb/s6vLxqHxPj47F29K7VGY9wAW
         modQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7w5FRiTCU0RNJcf68GNfyEYMVDn1PNy4YPmKb4VR1fxaD5zJY/3oLOPmd3DTSDE6Y+hddQ4hwYFrVFCshuxjZOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW4e2Uyz5Ne0OAgZrB+UcuxgsEXb/H2tzmG6anzpN6NdqgQPyS
	MooRbtkUXBEN0rlSL2EfjgOZxQus30bM/UrmWb50WYCc1KXIRTt3XHfDsDWLB1Rp/lk=
X-Gm-Gg: ATEYQzyrH+mXWwcO27hHv4fFMMAubd95xRZyPE962AjI8lHgDUQ/P6AM3lnF4se1HXP
	NB8pRGH8P4LH7esL4lpkCyid+6TGmDwmc5RTllYGd5WS+3J/g9txzBt0CayeRffmlPXASXU9K82
	k/90cB6zAAWTerDspupNfZnKrKiJAAussLEKWMQzRUgFg96bqSlIroIlq7LYeTUvOJi9IguEFbN
	SX9Hwx9YD8oQTJpl8cLvYPsMj9tg1PrqlqOOWiDHTieOXMvri4HTatWC5i8iaxp61tgqaBCsAtY
	Ptq5jfEmJAJhd0P0br0xcq1XN5/fSE57M1rKzgdjBxiKUJcQ0gee2dCi+JH+iGrM2Bx2QCvb8Jf
	46o5LuOtZ+nEWP+z8sUyO81RG+BX9DvwYGrd4ak9hjM36ygXILHSVGxmNTeih/5vjcWh+k8kpkM
	u51CR9X3nwRFHsmq622jMuQ6FaoKx48QJ7ui9001+3NFuX2tZv2+ZAUwnzDeVhsiVuUIQsH3tdD
	ei4bYztrkNHvKg=
X-Received: by 2002:a05:600c:8211:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-483c3de3dd6mr48592575e9.16.1772120829407;
        Thu, 26 Feb 2026 07:47:09 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:08 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH RFC 0/8] Exynos850 CPU hotplug support and pmu_intr_gen
 cleanup
Date: Thu, 26 Feb 2026 15:47:06 +0000
Message-Id: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpqoGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMz3dSKyrz8YgtTA93kgtKM/JKCnNJ0XTPLNENLc7PU1LRECyWg1oK
 i1LTMCrCx0UpBbs5KsbW1AF9OfzFrAAAA
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

This is RFC series in order to understand if it is the correct
direction in order of moving forward enabling support for CPU
hotplug on Exynos850-based platforms.
First steps are generalisations of similar routines and device
tree things for gs101 to make them more "Exynos" friendly and
last commits add actual support.

Tested on Exynos850 WinLink E850-96 board.

Some commits need to be squashed together probably but at this point
they allow to better understand the thinking process.
I was thinking to merge deprecation of google,pmu-intr-gen-syscon
into the previous commit and renaming of GS101_INTR_* registers
should not be a separate patch.

The {offline,online} calls should probably be moved into a 
SoC's DT match data since they look to be SoC-specific at this
point if we don't bump into any surprises here.
Please also advice if, for instance, gs101 calls should be moved
into gs101-pmu.c or exynos850 calls should go into separate file.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (8):
      dt-bindings: soc: move and rename google,gs101-pmu-intr-gen schema under soc/samsung/
      dt-bindings: soc: samsung: exynos850-pmu-intr-gen: add Exynos850 compatible
      dt-bindings: soc: samsung: exynos-pmu: add samsung,pmu-intr-gen phandle
      dt-bindings: soc: samsung: exynos-pmu: deprecate google,pmu-intr-gen-syscon
      soc: samsung: exynos-pmu: rename GS101_INTR_* regs to EXYNOS_INTR_*
      soc: samsung: exynos-pmu: generalise GS101 PMU intr gen for Exynos SoCs
      soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support
      arm64: dts: exynos850: add PMU interrupt generation node

 .../bindings/soc/samsung/exynos-pmu.yaml           |  24 ++++
 .../samsung,exynos850-pmu-intr-gen.yaml}           |   8 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +
 drivers/soc/samsung/exynos-pmu.c                   | 137 +++++++++++++++++----
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 5 files changed, 155 insertions(+), 35 deletions(-)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

