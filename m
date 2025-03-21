Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1051C863C;
	Fri, 21 Mar 2025 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568966; cv=none; b=iA3SweVT8aSDC6FauHVmp9354NOQsxsMVt3KtcJvHuFdECo0fKdjAD2OZoAexAOG+dfsblATIe7OP3GU+5bwdfhwoQDLjZ6idN1oJ6ahx6oXLtHLcZTLCUE2AmXJmH9Qc3mXZ96zGcMihADFV9NXHMtYNioHu+STXXEZPMo0qe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568966; c=relaxed/simple;
	bh=9NjdffFcqoMUtLEWDBo5tVuRbkE/efHqE2sYv6kvsOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NgUK0SMhqt4qvXV+ko0RTMa4L2rfkP1xsBKs8gsT0cxuM6VprryFSVf3OIxjMxiXhTxpaVon0Xm7Mgr7bzR8QOzPhFz+wn+TZmhUbpHAr5N/pFEiOUQZb1/WRf/1FhZ+ru06If5uqi+LeqyGp+LvOE1572Wymp/2vcQolPrW63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPx9SrcS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPx9SrcS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so13009575e9.1;
        Fri, 21 Mar 2025 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568963; x=1743173763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0b1ZVK4FQBOKzIWDvZDBhV3e5RNA779GaFmuBBFBIPY=;
        b=HPx9SrcSTu9ADtQsYv5QjuWAq0o/bmabL5+zVHLUsd2ZL3qqPlFfcVnS2QZqPvl3d3
         sGexY+piKisM9SZdZpQ7yRV90136+c/7pFdKUOvkmKSQqMXo3dULV/egO76CsaMh07oI
         g9DjlITmZtjqdTj+OrDwg3CJRY95nhfJ3rUinp+7/P/Za8rMmCvVUIVAwT6F+dlMqpPd
         lDP4zmw2BCQSIH8iwjTov85sIGm5SOBzbxgtLP5kaWhOVdrZQPWQ8asvtDAVp8nlL2mW
         WrNqOZww0jcAXGKHTkkubI9eeGE4rpsOLtnKFNRBs3UGtS1RnHDAjOprg2u1aYslyDJg
         U81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568963; x=1743173763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0b1ZVK4FQBOKzIWDvZDBhV3e5RNA779GaFmuBBFBIPY=;
        b=YIyaxsfrcGKsOzlYDiuZV4CfMBXKzDO9MUE9qb7nJgOBbVtF3woAGQAs8ZDLMDEJGQ
         +4ZuH1loOBDiDlSVETs46ulNPt9ahEa9PbF1J3JbTEJXga+S52fJH8vUcKDye/0IhT/0
         OapkiZ+wGQcEb+SwwJEivokzU67Mj36RhSpYqROaKEwCjxuunrYCbqIR6bddINiGpaDf
         HCQuQl2jHx4dW7pB/bFnMOBB4LT0e7Ybu5xeoUXh1uDDhvj7HmyLac3TKATsQDiLxZVL
         fTE3veLtFCQMiUFKl3gAmE0R9gcykwqbyCo21XqDeAZpvhIU43EKRsl2MYPewzWW2x04
         8d4w==
X-Forwarded-Encrypted: i=1; AJvYcCUczLb6NmVzYpKMAyI2Hhy/6BNHAZdILxT3z+89mnnGV7hqFnWB30tIeWq3NGB//VIYi4S/Eekly5ULAW3t@vger.kernel.org, AJvYcCWsdBhVdODM8/5HT/o7UMTXliA7Ty4uB3QYWZNNjmwHLHzR2aTnC+QKdi342lK8BfGl7wTClL2BXulg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0xxAjWENodcBX0SELNHHSSSzJo0WQNOSZvFgHOcSVVu9GRfS4
	Q0koR++l6L3is0IxX3Ib2hVlIWdfDtFqJRHyBMNyDNFPbMULJWCs
X-Gm-Gg: ASbGncs7PBhVu0b7sqNXNXhSUnqvZY13BK38ikf9pD13vS2ALKfbk5ojWYzaYhnZEPv
	zXOdSEJ9MrZZv7GY0UOFpgyZJGSctQANxTpukkkV46IEBcuI7oeLHiyJyU4RVcFuTXiZAP+Nzz8
	EwJ3Fr8yKkaTYek8bxY5FP97j5CwYGdydXorHGJvs4CEMh7d/7nCBcQCKv9bkU+bvj56QoH7djs
	IBe+4KCXS8oKvdeQbl5ERKYesPUJNE64Cu8kXir+1HXq9j/UnAJFGRwFyUACAGNZfw2fTt3tW2E
	zwc1XNEa+hBKMR+N+QZ/3L+ukkODWxsotDmZ4a8iBOS2zjbBC4IzKWSy1Bmav/2OXhs25D2CDJv
	NhOSKJc1u0RgXLpsEl6YE
X-Google-Smtp-Source: AGHT+IGUoURGAWj8U3P960wJT/eiyLcta46A5WVi7nZH3W7YjqEoIAHw3UKw8FdD3W+LtY7DrmzUwA==
X-Received: by 2002:a05:600c:cc:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43d4915e6bemr68811475e9.3.1742568962858;
        Fri, 21 Mar 2025 07:56:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm29217095e9.24.2025.03.21.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:56:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Fri, 21 Mar 2025 16:55:52 +0200
Message-ID: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds device tree files for Exynos 2200 and Samsung
Galaxy S22+.

Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
(r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
including psci, pmu, chipid, architecture timer and mct, pinctrl,
clocks and usb.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Another issue is that cpu2 and cpu3 fail to come up consistently, which
leads to a hang later in the boot process. As A510 cores are clustered
by two, it makes sense for both of these cpus to fail if there is a
power issue. Disable them until the problem is figured out.

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

Further platform support will be added over time.

I expect [1], [2] and [3] to be merged in next before this patchset
because it depends on the aforementioned series for drivers and device
tree bindings.

Best regards,
Ivaylo

Changes in v3:
- account for the usbdrd changes in the exynos2200 soc dtsi
- drop usbcon driver from the MAINTAINERS patch

Changes in v2:
- mention the board codename in the first patch's commit message
- make all reg values hex in device trees
- reorder usb_con above usb_dwc3
- drop regulators for usb_con
- remodel usb_con_phy to take usb_hsphy phandle
- include MAINTAINERS patch in this patchset

[1] https://lore.kernel.org/all/20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com/
[2] https://lore.kernel.org/all/20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com/
[3] https://lore.kernel.org/all/20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com/

Ivaylo Ivanov (4):
  dt-bindings: arm: samsung: document g0s board binding
  arm64: dts: exynos: add initial support for exynos2200 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S22+
  MAINTAINERS: add entry for Samsung Exynos2200 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  175 ++
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  561 ++++++
 6 files changed, 2518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

-- 
2.43.0

