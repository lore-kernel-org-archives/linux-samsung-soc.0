Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019C22968A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019253; cv=none; b=kf3rj8GaEML3WhPWMFbhXfp3usQOJaPMBZO/jwcDKjRK6qMua9TejC0dXKf7UqCVCUkbqoPhqqTSzzGxZ92LVRoLL6Sl4rL2iP12RCKEiDySSzM7ckcnW7H2i62bUu6clT9QNgFmHcTKIBhxeigkiIWb/NGwC68LEkWA/bwrV/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019253; c=relaxed/simple;
	bh=gPZKjY/Cv6dqyLwE285RezILuvSeCSXXgwbDcAwcRGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dOSF/Me0KL7nl91GJ0yiBN9GWOYaPtYNo/TN8Gq4CisxoK2tk8meluj6E8FQU1BlZKO2/meq96lN48vfMi3JCofVyHd5pe4VWutNux3AxqEFOJB0t+texzF7BVsteUts6zUoyEx4fwLDERbU4hDbx30749VVefonAAJMVDVVP/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=heclECXw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="heclECXw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43623f0c574so5673795e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734019248; x=1734624048; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OqueOt3m+Hz5NDiZkEdxcD3dFeoon3Sxm9uk7ivrbRM=;
        b=heclECXw4zytSEM3yQPd3fha5UPdBK0BXFPDbKsEJhZdJtOBX+ON6rMEZoNCiX6FjL
         4kzTL2xBR1Ej7OorfiMulmjulSf1ogqLCOLBFduA3SFMH6+Grc6cYeuKazi0lL132QM5
         xgAyqM4x0GdcZgfb0rnJ1ZdK4CiNo1TAPapO9Ud2qf4S8OCkckjx0BP+MpO+WtuL3LtW
         RwV3SkvVFD4U8Obeq+dQ70USrJLFYzzVvzN+G1H+rzoEBk9G01NdSWV2Kkq7AcLaNf1d
         bR2ANtAQ+pneZnuqpuSsT+3ArQq4f5nABLKQSk2MghEo9A89mmZpLTVLKTJeOMLh8E38
         JNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019248; x=1734624048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqueOt3m+Hz5NDiZkEdxcD3dFeoon3Sxm9uk7ivrbRM=;
        b=mD4mO6Y2tPZdv2cvKk2F9ej31c1ZJmXL3IJvGvpL3N2h+LMdmhe2SFpWLKho5GTmvi
         WKq1FG2+6cIXwJrvANmz4Fu3omlNdMxKClGM6iJGrlmS/ihsEt+e+jv+Ybi0ElyGl7UM
         Pbj048Jb1WWZqRqM9dWNkWbHAypuUXUQMWrDVhlBnM+/hO40PEgvJaAYie3b5ZJZdSqp
         MtzCaJyFO+qbgAyG165SnnJhG5+t0Zyi8sGK8PUpTMPYVzza8l5GWSlutFu2+RCjQ0ye
         SmOTHP6ThXe5eKCCBQmGPWEA3ppyckenqJOC6wKkl83xwtPrct+LE9rt+yRwXIdVSj2b
         eyCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUECghP6iR3Vssd1A4TU87wZg3eZDYbILAIgtWFx9zIWHqZ0N0y8odkZhHo/VOSBTrpOnPF4yrdNp+cYnQXczblWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqeTAhsY8EEPtuJRlsI0p9AfrE/Rmt0OfV9eN1Fon4gUvqmxM
	yjiM9pPdY3+5WMwZ8yAOiCgO59xuRbBfW+4U0fAn420goSDfHZ78gOhA+Q+yDZc=
X-Gm-Gg: ASbGncvoflpQIFAxUt77BLLIf3rRIMzl0UMpCCkdRXcUAszNpxqcLuTsl8NBVkx4WUp
	9y2BfIeYlbcze/UqsRmqlyb3VsC8oJ6yk8V9xQDFkgGun8SqRj76wg3kNd/60InN0F+gDC4BF9j
	SbG9fjwgY3FTjbL/9Q5YRDw/b0cw5j+etub1gGU+C0sfz0VdZNOo72dlP5KEevTPSz1v86B1DGt
	yrgDKF411X2WnJNcRZfhfBS2XjubtZ6MBoS5UyKzH9FaZ6oVtPyLED81O35J6NWcwIplob0IvYR
	8dxCc0MgrwlOjpVyK/YE7thYTJ8yPO6KzA==
X-Google-Smtp-Source: AGHT+IEO8F14DLA6a9uq51Fn4E/i11A1F4D4K6m8q0VdStEpDipMvlbI8LBPnMinLyLtzeI1CSuDpg==
X-Received: by 2002:a05:600c:4f11:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-4361c3976ffmr61803215e9.19.1734019248210;
        Thu, 12 Dec 2024 08:00:48 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm4462941f8f.74.2024.12.12.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:00:47 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/4] arm64: exynos: gs101: add ACPM related nodes
Date: Thu, 12 Dec 2024 16:00:37 +0000
Message-Id: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUIW2cC/x3MMQ6DMAxA0asgz7UU3KhDr4IYnMRQD9Aopggpy
 t0bMb7h/womRcXgPVQocqrpd++gxwDxw/sqqKkbyJEfaSQMHjnmDU+Pv2xHEd4wHYa0RBde/Aw
 hMfQ6F1n0us/T3NofDngjvWkAAAA=
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734019247; l=1387;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gPZKjY/Cv6dqyLwE285RezILuvSeCSXXgwbDcAwcRGE=;
 b=hZ8flcnYPQV3TsFaQwLja8Fw09eEAZUxRLkGCgisxH6sMxSgluJopwrXKflaZZNoFnCvdGKQi
 Kz9nhpbJs61DlRKVpDVEdcXwIY5mz7OEpQOlEU6cijK4KqS3rNlA0dw
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Use a constant for the channel type until the bindings header file gets
queued. Bindings and driver changes at:
Link: https://lore.kernel.org/all/20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org/
Link: https://lore.kernel.org/all/20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org/

Changes in v2:
- update nodes based on the bindings updates
- update mailbox and power-management (mailbox client) nodes to specify
  channel type (doorbell or data) and channel ID.

v1:
Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node
      arm64: defconfig: enable ACPM protocol and Exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 39 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 ++
 2 files changed, 41 insertions(+)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-b4-acpm-v4-upstream-dts-2fc0b6a3bbda

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

