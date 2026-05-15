Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAD543900D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837552; cv=none; b=NnVFTTSuDX6UuUWW8LrZDxXZLYguNiqyUP79KqFz1tpOasdJ6dAo5Ynz+L1Si2+2eOs4sSuF7WenOFGSCB3a+XFhoYii72uXpJfQ98jLk+jqqCpz0FZ7glAV0AvHC11Na/6rD+PjtWF8MYJL6A+zOiWpZfwB5KCs+EKEW5nDwrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837552; c=relaxed/simple;
	bh=+HsrIB4HqtNDz/N0huuhjVUr/0qz3ZIpfdPp18ITqeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gPMulxJ87u9yOANCoEln0T/M/vAVjfDJibLsBzhzmDNJRhOTdIxEupmK9boCDshE0j9OPIJm65wwmiFlvfNL07Vv1XOEWF++zq6wQsRsg75pYpL1F7XtBpPA1QDCvcWiGzh9Yyz1l4z27iGq8Xji0QxNYl1oSWrqfr6E75QBS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQwRESC1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQwRESC1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa0862dda1so2015909e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837549; x=1779442349; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vat830XxEIb6nbNDu27nBjMOJEfurilB5NC72HXohd8=;
        b=wQwRESC1YTdQi7/XK8H3bLOWyKdWovnKzyFmgRLmwDrhVORFOp2WHQUO8mFbt7iPWg
         KY6Nj7sHgpMvHoUxh3i8gvbdwbgGWTCzZuZ78k1O7wvZ9RvbcUzbDnGXqFMEs8mGEV55
         NCBRTO/oUe+PWEqRnKYhHvVMfxyhx0SEi2U00u8cNjkars24g4lsiQquSKdScT2PCCc/
         nX97FrdjWc3Xjliw9gEq0kmDcGt5wFaKu5R4Tc/WSxbu+XqvcHJ2GAM37nYD7yQd+3Ws
         M3CcXaeFbQMol3BS9vi1CoMDtt+X+qT6Pn2GBSkibJ9IQlCkHAGCXKyizYVDRep+SPeG
         6j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837549; x=1779442349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vat830XxEIb6nbNDu27nBjMOJEfurilB5NC72HXohd8=;
        b=Fsdm9mRKfeUhxFLhf0pjY+G4dbYTWwOo4EgzkfVXYqb48irB7NT/lA002iyeU6ecuM
         UXIic94zZjNL+Y3hOkwt7+q69EzNtBcs5GBLTBGgPvppUcftI6lDQI0nLvIhYHXqUzXm
         hACYyuP2JMpLqTYvyMDEc61zIyfLj0eURsYJbY2E7JFjchuqGhswkDgc4/1BSG4HNT5F
         zaYzwYqNtg6iKfdeCl7mHLglENXVOfDqUnk1M9SKpQumpEk5mMspaDlU1qJeXCiVtPYW
         Q0moNa8tburAo3WEesOju0D3eKLtdrYRMoIO9ZaQIRzmRDazlORUNJZRcDau330QcV8Y
         utIg==
X-Forwarded-Encrypted: i=1; AFNElJ/DttXBvqVY0GjGRoetHXd1cSFSfDG4jr8UtHYGr3F5pN0RPWRwo3nAM8sX9o39E2ZAsTy0AV7NcaZiaRlVFpmO4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZv2FcaxLBLHNlAXg2cgWfuRdPcKmjrPvr9LAn9hwEOBG424T9
	ACLClNH5PoqvWGC72pBmRJKltUigxmGERTZz8CZovl1KzxgcjA7DFFR7moelc6qPzhA=
X-Gm-Gg: Acq92OF/FQp57ajef6QwmSPznPFheGumJrK8W4isF++2i7PV7ZzYjM4OkaN1PUFVTLO
	pNcyQu0TBvWFEgiAFmte6D/h/I6eK2Nzyb5F/YdbaKhC5ioOMOTfHhawZf9pVFEcVJZ2JsCJ3Cq
	6FbQQv0Qq5nUKAsP0WbN/S/3m0NMs/LMqbTaIc0nJbvRmCgQaORs3CWyEDeidGhoQcLbdWORI4j
	1PO2IL5EBVcHdOx18AX2VK1MKLdXQtRGsXytFuafxs9RDehSGcX/DzLI/A6K8gXrR/QDcvHSUaO
	VD0PSD5CZQhu1hKxwWGCCWwhAVtwsvbQwIAT1wAopm84m1wenB/cXMITzSgw+gtG8sE1mmQHOqj
	YwbpM2X20g3aj2ElKM5sLoesqHCDxiZBzxGDJwHH70Lvb6hMth8nm5ZD9HmaD5b7zBvbpDWpJc+
	3QAGPcwnNrjjMXn8G6r60jLbKcSw6YKeUIEAAaz6KYGk3fBboYBq4vR+r3O9dlPFGpZ7hRCB45/
	MtYdWox
X-Received: by 2002:a05:6512:308c:b0:5a8:efe8:cd9 with SMTP id 2adb3069b0e04-5aa0e5e9c10mr934778e87.0.1778837549046;
        Fri, 15 May 2026 02:32:29 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
Date: Fri, 15 May 2026 09:32:24 +0000
Message-Id: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjoBmoC/2WPQW6DMBBFr4K87kS2kyGUVe9RZeGYIYwaMB07V
 quIu9dApS66/CP99/48VSRhiqqtnkooc+QwlWBfKuUHN90IuCtZWW1rjRrB+XmEND5goPtMEuH
 k0fWabK/PXpXaLNTz14Z8v+xZ6PNRyGk//oGLZ8We7HHHbj2ILg78EUBoDpIiOLLNtaYOsTFtx
 tVxdZHAh3Hk1Fb5fDAg3qjVNnBMQb63f7LZdL/T6//TswEN7tV32Lm+OSK+3XlyEg5BbuqyLMs
 Pu3xZ2R8BAAA=
X-Change-ID: 20260505-acpm-tmu-helpers-4c5af0e2f07c
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=3775;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=+HsrIB4HqtNDz/N0huuhjVUr/0qz3ZIpfdPp18ITqeg=;
 b=JXB1K7dwaCis2Kn/x69HsjDl/PoJmKxghyoaD8LQdV2AwWHQR3qmkOpgjseSm20mx1QmOgw41
 aX24nnlBZ2JBQgioiJHvgWfP+X+8J/2U8zavoKfuI0yrOC8FuFDHbOs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Hi all,

This series introduces protocol support for the Exynos
Thermal Management Unit (TMU) to the ACPM driver, alongside several
cleanups.

Dependencies
============
Krzysztof, these patches together with the acpm fixes from your `fixes`
branch will be needed by the thermal maintainers. I'm going to send the
ACPM TMU (thermal) driver for review. In case they'll take it for the
next release, we'll need an immutable tag with the acpm fixes, cleanup
and thermal helpers. Thanks!

Other notes
===========
The MFD and clk maintainers are included because of the cleanup patches
(3 and 4). ACPM updated some structures that the mfd and clk client
drivers are using, so these patches shall naturally go via the Samsung
SoC tree.

Note that when compiling with W=1 one will see the following kdoc
false-positive warning:
  CC [M]  drivers/firmware/samsung/exynos-acpm.o
Warning: drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'
Warning: linux/drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'

I proposed the following patch to fix it:
Link: https://lore.kernel.org/all/20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org/

Cheers,
ta

---
Changes in v2:
- collect tags
- resend as sashiko couldn't apply previous version. We want
  sashiko's review feedback
- Link to v1: https://lore.kernel.org/r/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org

Changes since 20260113-acpm-tmu-27e21f0e2c3b:v4:
- reword commit message of first patch emphasizing there's no
  functional change (Krzysztof)
- remove static keyword from `static void acpm_set_xfer`
- replace for loop with memcpy in acpm_tmu_set_threshold()
- update kernel doc on devm_acpm_get_by_phandle()

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
Tudor Ambarus (6):
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper

 drivers/clk/samsung/clk-acpm.c                     |   8 +-
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
 drivers/firmware/samsung/exynos-acpm.c             | 113 +++++++---
 drivers/firmware/samsung/exynos-acpm.h             |   2 +
 drivers/mfd/sec-acpm.c                             |   6 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 ++-
 10 files changed, 397 insertions(+), 72 deletions(-)
---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

