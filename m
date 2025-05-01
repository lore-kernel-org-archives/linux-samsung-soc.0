Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3411D89FD
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 May 2025 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095753; cv=none; b=TJ6LI1vhA7BnzcC5ZN78D5NRTXCgZB850kjV76u0mg1LgKzCvA6cK2WB8ucR2KLIrFFoJuPweZ23f2FhgLcYE8ShGIzjk8gFhxKwT1TQ+6bDsi+nI7zcNF1hHdvZE6vELVGlhw7zAFZhMKha5kpg30nxbHrOPZ46uTsSO2M5Fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095753; c=relaxed/simple;
	bh=vNYmWvhVJQY/AqblF9NK9uhqlpRYbUIbtdpo5XR+1to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X1YMuoLk7rGedCCHuInT4IWmDt53tc/mdYrrqpB+NQvjQ98/gg3QD+4DcVnUq1DYoggnjqax4QIoNx6pij918sDx4MfgMv7lup4MFiQtAerWMKM6p4D5+8UXUL4dGif7m7cEDYDCLeDSxENZo/CwGWpDTvZDrcxsTTYVglX0uoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iui+N/gd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iui+N/gd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso977415e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2025 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095748; x=1746700548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JnUeJrEz2QMwYoW3OD7Syx9Jdxy3i/s9a5E6cIdqNg=;
        b=Iui+N/gd7U27Ge1BGBruaX96YwUsclq1Rt6A1fHQBf62la3S1tg9nek6Q6MI4XLlCs
         Q/vxKx66riqPXerNZwVYxFAwodgLoN7rT7YP/0vUNv2yGKW3Xb3fE/FQdy7UbL9tLGcv
         tWA8JWubZvUnuZY50w+frn9ckU/ZksN484YGJio2FxIpiYFe/djSrFDA8y2ayUB7DrmE
         eAolAvo7kWfXWHSs9F3pPD4smaeGeCAkrOO1UHq3RGNGXpMpEVfcQ4Zi+eSVm1/501Rf
         Riw9l5VpWQ7tcUyrqWMSXhwvmD9YxpW1DIgsCuYc7Kt+qDz/BinG4851nZbgEzxnyC3a
         YW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095748; x=1746700548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JnUeJrEz2QMwYoW3OD7Syx9Jdxy3i/s9a5E6cIdqNg=;
        b=wBZ5RMuNP3f9azzUJnBTzfRq3lN8R/kCokufu2rOGWpbpMGrZ0CcraZf4H4HA2BOod
         uKmPc7MdIL4U8+UVfSQpVOKG0DQBpIYzmuIsV3l5hmZtCaXhLbOv28dc6KuIi3XRHaBc
         ew1bG+KZ5JHmKwovtw9X+oyzk7qXz8r0mUOaBIBdhVUq4eF42SZPLhiAQSfJQZoo5cLS
         T2W2iTKOQXth2I/s8cb94ylMNbjrLsTeszq8NkAVK+zeZDT/j6Qg6WnmWrhnWmblkeD1
         vSsoSFIVy25P26ZSTs8DCHu+MIbaQJnRybC9hEFiU1TFWHHaO5Qi2Rn9HlStzijEQqkC
         Bk8A==
X-Forwarded-Encrypted: i=1; AJvYcCWgr38Yd1vv5pe1nY3+VwFSyEwRZ3i7Ncm4SQLD6kE0IDJpKt9zNrMhhQinPDR64xS5lmPkjyZipr3BV9ieHKIJVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpQD4sAek+ORw7XQL/Sp+nigJFUto6vM7fHH0dX3Q3JSI8QVE2
	73Je2ZuewC1D/bf7qgNt4i6kcVOd9gNiOsgGyclI9ElQCsBQDTk2u06EuB6W9f4=
X-Gm-Gg: ASbGncvvUcR4Hsy43ijpTD3e2ajUfz6KsC+SpfQypxtJUKLQljyGppk/5jfgh79xI5y
	b4SZc87vagazWT4z7qlb72ZdAZM57DGqp6VyF7y81Y5Ry+gxnEdqonazDZWtFHp0zCVaE7FLraH
	MQJsb1s/DBIoHrYi637oWv4Mgcsw/yOTiPHkpt2+5oxjyg8OREyCri1pp2FMPCuYeinc/okULgK
	BeDmPc6QWyJpJdYnQ91ElFQx7XgwEYXdr56qoqdKV2seq6Sr2iAMdlvAjotaWzXSjSNnoLzBll2
	cL4Z3tnMS4dQyxm7Xqih9NLJ73YC0wd55w05QEdzGfzufG5Ahg==
X-Google-Smtp-Source: AGHT+IHpYbP0/kmTUa86knuxCp0uPFuqoZHphNnA+x+8xxOAP7htntUULz8OHSqI0KW/OuRv2E6e8g==
X-Received: by 2002:a5d:59ab:0:b0:3a0:7119:cefa with SMTP id ffacd0b85a97d-3a0900a0a99mr1574177f8f.16.1746095748358;
        Thu, 01 May 2025 03:35:48 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88218sm486646f8f.78.2025.05.01.03.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 03:35:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers for v6.16
Date: Thu,  1 May 2025 12:35:41 +0200
Message-ID: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=vNYmWvhVJQY/AqblF9NK9uhqlpRYbUIbtdpo5XR+1to=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE059ULjeHoIezM1OAEcRIkI9/eVyLkGHFQs+g
 7rpEZaMWx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBNOfQAKCRDBN2bmhouD
 12nUD/9GGensklaBc7M71nRyVAyLRtoLji6ft/Ict9H+mJZDnuu0b8HD7g+Bd8cQXxq/QEfpTpU
 3eZ2eHhGVRZjLwvIl29slEjPUmSCfJt0/FwGAvs4CS0S4J4Cz/NiemKpg/4e8Eew6EF40LceTHj
 4nZkclCbJ9W5znA6QdShYnsvijNEOLhZQsCNNSEQqIfXdzpnozs/QhftGoV9hT4tAqLSVU2f6Hn
 jmsyfqT4JENOwsmtDN8j9YQYOrs3vGAKzcOcUDfiFbQ8DDWfVE7F1LRzzUR7XfQ/JoplAGqJv5w
 98STFW/3tbErQKmmTxGmJRd7k5b5s81O8DH2VR+kFZ41Iaz7bH5ui2cPJ3ollez7MA8bbP3yZT1
 sZR7s6lOYvLV4sNQ/1v0+JoMkc9F4S2fl3NO3Bm65SW2K9Nu7QGVotAkKCYTLasz0ifE8Rady64
 oPew0HeOVHkHLteSdmusZZmR/o+dlbVXsmqIFZ93b6xs/cb03KGr1uRj8YiVf4swVqTa4zpG/a8
 oNbXpNyOht6RernZ4dKaL93ynESVArjwMoLvKetKMbM7DOXbqThhhUDSABqUfRc4LpEZzAk90FW
 M9IRpcYQOZn2KX/e38M8x0F9wQBL0fY6A9Bk93WsBf7nV/8QLoAgsFBey9UQvZl6Kn7GIBFNNFh fsgUW3E/TP11+PA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lee,
That's the stable tag for you to base MFD patches on top.


Hi Arnd,
Please pull it as regular drivers pull. Note this will be also shared with MFD
tree.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.16

for you to fetch changes up to 2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e:

  firmware: exynos-acpm: Correct kerneldoc and use typical np argument name (2025-04-25 11:41:03 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.16

Several improvements to Exynos ACPM (Alive Clock and Power Manager)
driver:
1. Handle communication timeous better.
2. Avoid sleeping, so users (PMIC) can still transfer during system
   shutdown.
3. Fix reading longer messages from them firmware.
4. Deferred probe improvements.
5. Model the user of ACPM - PMIC - a as child device and export
   devm_acpm_get_by_node() for such use case.

----------------------------------------------------------------
André Draszik (6):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      firmware: exynos-acpm: introduce devm_acpm_get_by_node()

Krzysztof Kozlowski (1):
      firmware: exynos-acpm: Correct kerneldoc and use typical np argument name

Tudor Ambarus (1):
      firmware: exynos-acpm: populate devices from device tree data

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 +++++++++++++
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 16 +++---
 drivers/firmware/samsung/exynos-acpm.c             | 58 +++++++++-------------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++-
 4 files changed, 70 insertions(+), 45 deletions(-)
