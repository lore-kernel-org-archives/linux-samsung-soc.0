Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E39218587
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018242; cv=none; b=Dcr0KsoCwtN6Qgg/AT9PpDVvoQVpvDG5hJCGhcSAjt5cRvFwtL5LJ8L8IcvOBnKEblDJMVojEN7Bp2V3bnYKvU2Ez+ZEgEoITiHqZA8nSynwSs6I8BehBSgV+FkIC7zofzEAL63Z7mTkQgOvV0CqU4NfZxV8HJCqQuLMUeVhUfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018242; c=relaxed/simple;
	bh=inxG5U01dwICaPn51/1LEiQE4F0yknkNINDgMxzkN1Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uerMb+1FYYf3bUJyqntWpgt5aM+Z8UJw9G7RuoEt9i4nn51/UHmQs48KxB/1k7HTm2x3Q5TAHRRLSKGSjF8hocqYQktoKRurBfTP6CMvYI7CUqJcwm1v4ylcNwRaxlOc5j92JzH9MvFDaimZ4faOImCBUd+qpBj4B2UkmHmGlgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aS/5Hnj4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aS/5Hnj4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso8230185e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018239; x=1734623039; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V+aAXEtiKhZgITVnlfDN7uVlfTiNthjBcG1kR+vyvKc=;
        b=aS/5Hnj4/LtWQWg9Jac6iY8krt37tEK6573V93V9b5L/9Rb9C5HyDbFRo19PUyVERN
         JTaqO5n5N79qd98h7b977i3hUcENRoMdfdEDzYlHr19/+mPn9Y0W076h5SVWgNfCFEUI
         HMr9PtUTAzCzHRBnu/w+Rz0xlZDmzPpb0m40Ssic3fQoZ5Jta/cH7NqQqyzUzaUADCTU
         wxjO+BPSyh+l/omterrBoMF2WeGubPIkDQUonSk6mLQ8tcTePf/iasux+aLgyRRe8i/Y
         ebNFFRk+r/UMLBSJAmG64X7ixO635jcFNgZqxsGHoh2V/AJdc8kwfDzLPDWFp6IZVS0D
         +Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018239; x=1734623039;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+aAXEtiKhZgITVnlfDN7uVlfTiNthjBcG1kR+vyvKc=;
        b=V5cgERW6zKDJckO0iDKTE7nNBAi9Sk7yk3o0B24gh+bfQ/XdX3lZEnhxg4oYYAdmvE
         okD9QXUqwDO4bkY8/K/vEf9+e+B+kPH19x4uVU4P3+X79dz0hw8Ah/ia7qq4nTUcX0q+
         vFK4g16oWMVkjVbn6J7YAm2NbBLv/vQVfKA+5V/cDTfFxAiSUueAlyhZWSzXmdrb0+6b
         gz1Iq4VEhUbsrxgDsgMdGoSA3WNCkUkOc+H6dyeIn8NrIO9yLX5i7m2iZP4lJybiiNlZ
         V9PLy0tVpvrw6LHbzoFd55i6sH74L/9388ylUUqctYSlZnZzUDiqZvwucRqiWg7LDexA
         CsZA==
X-Forwarded-Encrypted: i=1; AJvYcCUfaN99rGyG4E0EkDL2OMkr3uvH0vaRgl+Od2uVzuaZLZUc80LhZv/0v/cBT2N6U0XZpIOAVTGrrYi6pTmw7NdVUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQfkdvXt8cBd88AqTahnbSrukk+1QYK8qAvuzRKEQlRyAeKHdL
	H041wSCe78+sshE6lOUfBDmkZb9SLmP3hERE2UGyxv2s7b7oHkpx8PHNTbImQ81g1kGFuq4U1g9
	+SZA=
X-Gm-Gg: ASbGncuFBpHSx8Kd1Asc1Z+vPvy7QSd86IilLmcY6IaKlAjJyQISV+VgWMQiQ+ddvRH
	qCU5/VoanUxFpIkV9ttu9LO7SckdcixApUERicvixQiH1soPFjhqgcezvR5ggVkvBMBQ0UIa0+8
	7O+ay/inHO1rt3piEiR8m4fbOpsYTGVtAnga1fJXpeU8AxsKeiwrtK6mQCrAMBdRQm8daeH+Ipe
	Su475pzs87tK0PiK7ghKfQo1WCGKJ/MnZHCkpL8tqHV1JZ0eUlUIpGZIbtVXOw3u0/Js6Tr4LPF
	jgSVN/PMd6GY1Lwq52Sjlcjw0pVtpe8dKg==
X-Google-Smtp-Source: AGHT+IGQl4Z85AVTG7eUBC1nrNLIWFn7oDXenV6gUW5QnelGVJjm3D3cwfx7mwDbNfv9MIN+zuqTOw==
X-Received: by 2002:a05:600c:1e0b:b0:436:1b96:7072 with SMTP id 5b1f17b1804b1-43622827675mr33627055e9.5.1734018239353;
        Thu, 12 Dec 2024 07:43:59 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553208sm19992375e9.9.2024.12.12.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:43:58 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/3] mailbox: add Samsung Exynos driver
Date: Thu, 12 Dec 2024 15:43:44 +0000
Message-Id: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAEW2cC/x3MPQqAMAxA4atIZgNtifhzFXGoGjVDtbRaBPHuF
 sdveO+ByEE4Qlc8EDhJlGPPoLKAabP7yihzNhhlSBtt0E7eYSK8fDwDW4duPG5sqak1KUWjqiC
 3PvAi9//th/f9AOGOsatnAAAA
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018238; l=2062;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=inxG5U01dwICaPn51/1LEiQE4F0yknkNINDgMxzkN1Q=;
 b=y7Ognb6ayQPqwvgD0Lmzmg/KIvR0LOshRRT/Qq1JDx+MdDTUxE+D2Vxxb/cIfuliW7U13lCnz
 eGFOcRSXwbQBAGbbIwa9LJ/hA9vDdp7sXQ+xW2AKj+qCSkJ/4BIfRCb
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The samsung exynos mailbox controller has 16 flag bits for hardware
interrupt generation and a shared register for passing mailbox messages.
When the controller is used by the ACPM protocol the shared register is
ignored and the mailbox controller acts as a doorbell. The controller
just raises the interrupt to APM after the ACPM protocol has written
the message to SRAM.

I mark this as v3 because it is a continuation of:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

Changes in v4:
- rename bindings file to be based on compatible: google,gs101-acpm-mbox
- specify doorbell or data mode via '#mbox-cells' dt property. Update
  driver and introduce exynos_mbox_of_xlate() to parse the mode.
- s/samsung/Samsung/, s/exynos/Exynos/
- use writel instead of writel_relaxed
- remove stray of_match_ptr() 

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's review comments

v2:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

v1:
https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      dt-bindings: mailbox: add google,gs101-mbox bindings
      mailbox: add Samsung Exynos driver
      MAINTAINERS: add entry for Samsung Exynos mailbox driver

 .../bindings/mailbox/google,gs101-mbox.yaml        |  79 +++++++++
 MAINTAINERS                                        |  10 ++
 drivers/mailbox/Kconfig                            |  11 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/exynos-mailbox.c                   | 184 +++++++++++++++++++++
 include/dt-bindings/mailbox/google,gs101.h         |  14 ++
 6 files changed, 300 insertions(+)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-acpm-v4-upstream-mbox-948714004b05

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

