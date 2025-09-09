Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0683D274B29
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Sep 2025 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441928; cv=none; b=qkADYvS0oCSbcBB0olv9R925EBtd6zLYfHRNOEwI5h3G4vgPpRi98BUAB/1gSTAg4AtVQBGo/i+T7BPGoQaU8FW9jZwTROhLAsHe7G3X7bu35sZVH8+tIstDoEA67ewB1L1jatOFVXprJmgYFGsZon0O7ZhNOtmA6zEKFCNNL+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441928; c=relaxed/simple;
	bh=QKAZhgwl8C9a3pJ24Kw/6R/+17cXSST9anu6lQ+Gwzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6QVfMme8Omq7hsA5mf48NroFSrD0QLpzGKIMSHs2vZo3lM4BxQQUVr/bzGVPq/Y6vpJgb6xzoNLfVb5t/2DvrSIbEu1cfrumH0o9vydHciEZ67TZStxfuk/KEmLzMEDVqZXD61Khqq9d5tc7lof6eN+5KasLkKdTGrMpzohlhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKqMaMZo; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKqMaMZo"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61edc3d4367so847710a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Sep 2025 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757441925; x=1758046725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n3SZVEt5zs+XMpyDtIWhZjJMWmB8ACyyA+oaZqN6VC4=;
        b=MKqMaMZoZ4d7lgtPtbwaqPCbSNjf0mpcNTmvSmH7+SUEfbKmL1inPwnYX0N0K6UxjH
         63OCD397YAu0sVz6T2S+ceGElAPL7xhuAvk80L5hmrBMl6oXNSVUZ3qZgJ9ppRa4qqp/
         OTT5IxpfBofxEm8Aa4OCziQku8nDtSJnhUElckdpYhUSy6jRyVg0THfLaM0xg1w9kj39
         rjL3mgrVSyO7lsoVqMmRzPijYg5nkdOZzqA+0Y9GPqeAbQgGUKH6+P9N86j/pcmPEoif
         r+BCjufiZznlPfDJwPSUH1Acx/HjGpeWNeC31llBxUJZPX+9AzBMMU+B6voybs0Pp9mV
         ysNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441925; x=1758046725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3SZVEt5zs+XMpyDtIWhZjJMWmB8ACyyA+oaZqN6VC4=;
        b=FNThCLy1VjTOh0gkit/UO71tAD1ge8bH0lSPJgjr5FByfE+NglcT8iIZ6R/k4AOdwI
         y8WwBmK9Q5D06c+PMD7ORURyrID0nB5XL/1C8zPf+UvholGfAwHHjFb/5xWZLOf7/y4t
         mqYj31nJf8cDDY/HhYiNjkwrcgCzNl+BnMdxmIaP38XZkEZLi111YwbXptrPl86VpVl0
         q3gOA6rsZLZJO4TmlnLdMOnnKA0c4uhJWzqvsiuCrFASH0bUp8LB2TeLsbzNhPsjG5ex
         TSTNFYW7l8jtmmGUGUvF2YE5nQDTjLtw3+A24NLt6N3tr2su8Td+qXuusW0zVPQlPtOB
         OOZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7aIJ6jluTaaDwIt3mj0E0hyjdrirnMquJ/O/m17rBbNeNZslkuv1ebHu22HsmgsxqiU26Zd7epIFtdny8gXsJ1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDq1/Tu8daBZK3PBWUAGopAsl0+e1LarsZg/AeiO/NPJrcZFwX
	sY0KxLQFY+SJgD2A1tca6EI0bxrAo6faSxTo+S8OdgyEDEw2BxFUrsSkUl3URblcF9g=
X-Gm-Gg: ASbGncsooQSECY4akU2z4tTirJ9ITLB9TCeiYefznfQavuvKfyvu3ElhYWumsDAR9z1
	l15PMx2R6qJ0lF61DGUSMf2p37Xcdxsynd2Ij7KXGaAoSQNp+awim+c/QAtPpUDbjkFrGr1wwa8
	rk1B4NbOaHK2e6kF+lxTFoylokhRcXxF1MHQ3XaceyVKENsASC4sIJdwuL7hzKCTiSO9qI3NzD1
	xQ45Ery8lrSDqeisVTXMnZwD3M11KxL5Ost4EWXwj2P2rHNbibCUtbZTcUM1RsF0MXE2CvoI7ST
	pnfPq1aNiSG2d/TG4cBnfGkqx/A1OTuPh1maxiGDx3UCaFM/OMWxNNWBXuArVsSsUUw0V1SvSIv
	rotexKgQGerja7AcZ7WIyYXPqXQQGHyRw0FD9iaR2W1lx
X-Google-Smtp-Source: AGHT+IGNth9oSerkP6rAYgoEwMoe6KL9F9a2LImFw8iipYkxvb4dQmj4okAnUSdxaK0gh9AuCZGu0w==
X-Received: by 2002:a05:6402:520e:b0:61e:a890:aee6 with SMTP id 4fb4d7f45d1cf-6237a42fb5emr6064679a12.7.1757441925351;
        Tue, 09 Sep 2025 11:18:45 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018007casm1668531a12.35.2025.09.09.11.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:18:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.18
Date: Tue,  9 Sep 2025 20:18:41 +0200
Message-ID: <20250909181841.102103-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=QKAZhgwl8C9a3pJ24Kw/6R/+17cXSST9anu6lQ+Gwzc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowG+BZOESL0M4KVTSYey6u54mYycQfsFUzEvyQ
 SgmbY+SFAaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBvgQAKCRDBN2bmhouD
 13DFEACQ/DzLe8tGD51gCZ2sgoIL8ELCE3e1EmGSt7dS59c0+FRk92zaq9qdbaolAJgqy2GDO9y
 EZ2kcYxMZ/DU+ySaTAvCEJoxmTgf1sOyEEey3UI9mm1P4gxZ2UHuljxuOfWqHKD7PJJbdvQhJa3
 w00oN/TszoQ32k7fd8tK2uGpfuF74tRC8En7Cp2+DX5CEyTTeQ9URb3OUiIj5nVoVVxseFA+EtF
 IQiCrS7moxnrN9KTMEicM2PvpugJLsFwph1UL3oLWYnZYHSYC5DrY1MB6VuEBHTNrf93oct24Az
 6/1fKOgwxdc72ZRGKgM5dqV/espiu7hSsKGqxFFP21DmBqgCz9xTixDjrzAwoywL9xRHbgNVmyC
 /eH7AvrhdH4f0S5dz1kRCS9tJcs40CXOpJ4vaQ+gC/ThZtb+ySbtBhi+lIJ+5WxPQHq60llULSD
 C0mSILK1Btnuilf3BH8HIk/noRZMAWKA+U5mbROxRkyAIMcmMhqb9Ivj9dPXO3vjrRpDrZJv36g
 It+arAkoY8Ba+KaHZ9pDHbdFVsSNQNCgUwaNEHVbw+48bUeLUGcMY8UAF6+U7Vx0vlGmq2k/Yve
 Xj25uLN+NhKvc9syIAjR73z8R9QRhE2w+oSW0HztC9bD5EF3MAiQltNpzYR49mlCKqBZIEPLAaz ACETqPzn7WNXDVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.18

for you to fetch changes up to d37db94b078197ec4be1cadebbfd7bf144e3c5e4:

  dt-bindings: pinctrl: samsung: Drop S3C2410 (2025-09-02 12:31:25 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.18

1. Add pin controller drivers for new Axis ARTPEC-8 SoC.  The SoC shares
   all main blocks, including the pin controller, with Samsung SoC, so
   same drivers and bindings are used.

2. Drop remaining support for Samsung S3C2410 SoC pin controllers.  The
   actual SoC support was removed in January 2023, so this is just
   remaining cleanup.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      pinctrl: samsung: Drop unused S3C24xx driver data
      dt-bindings: pinctrl: samsung: Drop S3C2410

SeonGu Kang (2):
      dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
      pinctrl: samsung: Add ARTPEC-8 SoC specific configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  | 19 +-------
 .../bindings/pinctrl/samsung,pinctrl.yaml          |  5 +--
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 50 ++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           | 10 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |  5 +--
 6 files changed, 65 insertions(+), 26 deletions(-)
