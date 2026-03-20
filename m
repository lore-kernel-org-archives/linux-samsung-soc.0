Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5639D346795
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041319; cv=none; b=IG17m98uI80QJ1JFxKs4eUVMaEPVDC1Zl4r7xamQAIVWmn0sGIpzFcVHDsV6/HPpjQG+ICnl0ry5aZExS2LD4hzTVKdG+9fKpY50BMA93Ok7OEAIzM4/JKt43CkWbLWn2fu/mcNa7mTyFpBZUk3BRN+5ZSqpq0Du9laoEvN5R60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041319; c=relaxed/simple;
	bh=DmTTdgGsEE6YI+ZniW//7SFL+HqlQKi8Y0UulyibIx8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hkza6FCh1/D87mmu6orIjTOaTnnHBSpbCSaCp36xGg9Uxe0S2cOfHEZIFwOHp/0QQkmvod6iyDiT9FuEMCw3h5EZYJ9f2p61IRENxdra+BY7WKC/iej6A3RxTWNWwGnYedryL2ISyZLCwUneKiraV6kPchq9Uy6jfvixhYtJq9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lX/T0Hpm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lX/T0Hpm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fe655187so14812485e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041317; x=1774646117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1bGv8/uYNdnIMNZ+E0Ir9BQ3Ee2imch1dX4Gmz7nQ4=;
        b=lX/T0HpmnXP/yaZw2yt5dhJ8kIt+pSO6N2ncNuWpbI+BYiC2wQtB9Rz9KsEvLI0tje
         5Pswq0onkAFj401+PK9ltnDVtTgVws1ZDrHpT7NyEePnN0NHhcmFOBPm7EcRUPJgknhe
         /+wuF0TS2fhOSPFlP7g0XTsRQPWT0SD16/bh1bGvix6QDwYnQ2H44afSHZB2VQQs+0Ji
         jTtsEhfyVle4xbOw8cFaHXZsv0eQ2XGhCxvsdkh11lxAqcrX+ttNaOYJy/OODOepZ6U1
         +4qcb68lT0fv+Kgn1YjEo9z9v6EiFvx40nbndQY9zthl0S6NjyK9ACdtkqvip3bOr+1c
         dWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041317; x=1774646117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1bGv8/uYNdnIMNZ+E0Ir9BQ3Ee2imch1dX4Gmz7nQ4=;
        b=AHAstkBWIeaxEeAxyMWbSVTtggPEEParu7yMIFkRBxYaVxYaBB8m8MwEJlGA6yEI00
         zpIwgZG6Zuae33zqMUG9kxGYBkIeQg+pGWHspF+BCniLHJAs51wuRHR4dZIw67wIf3W1
         IiInhi/60mi0F0GYsVpZ5aMozaRFId5GMO++BQpDXtddMSoRmxogHvAQX3gGmT+90PwZ
         mvUFB2foEzNpYcCxYYYZvP6y6qcUVrV+T8e9uhkQscTYMMRi2e+onnQJs00z3U0xAmKs
         +nvUmtFd8oXVbJ+6icc64JcWYBS9z3bHi44bOBzkBoYdemYxe0EKtO+XGQR4yLVLXsj0
         xa9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbp4rnlmbk6/fzZRI2jhiSKhisMAvNuxvSb0EmJocdRg3xf+dxitLHteNpTAY9hUuKqUocRoWhHgTQG4GaGQpC9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVgx5E68wrutUZ7b1zTwX6EW4pZf1esQZXXV6/7oulF8Ysb1r6
	k1GBXuJ0ZfzWqJ4l306dYs4zKeZr2cW2oFTGYy+KGel7gLAaPcZ4m+Y7H/h/2eQnBX0=
X-Gm-Gg: ATEYQzz0owqX3vkDz9DElMJZ2u7SvcSsDwNuuo+0c+ASl7e3gedtgqXu8MTVyLqznL5
	/Remkh7Tix25WKZrXoeRl2vzOGz+5VQQtfD141Xegf/7fofz1yjY5oHDOX4jtlGpX35In6SQkFy
	Ge8DekfpkQq7OR94rtP/8Gbs0lNpamuSQ1mY42Ujw+r9lqvLD8lR+oIXFtpOD6IkjhbDmgTZbsT
	ku6/ujDhI4ha4jeDL6WXV6u70b7uQiaanuwDqe/R5B4l7eQ8LIYaKJdhymxoS05NoG3vwmYRbtx
	VcyOd+s3H0jXFxfmRWmWT/tryJdtAjLzMxVHtHS1ykuvd8f3WC7xit4Vwt45bGOEAN6IGX85vum
	jSoLs/k3w4rte8sFkfGM+mihizoriEYSVoaKApMbDAzbOILdbSsL0e8RU4pwcEVrviyaC8SwMOZ
	v5oSt/nRLDL4eBlT/u0CtDAzcZd/4Z8JtUlbmtd6SprdtfkYvoL4AeMOrIN5HPA2Q2Bs+OoF3V9
	udp5bTcowYIXig=
X-Received: by 2002:a05:600c:8710:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-486fee051camr64543975e9.21.1774041316606;
        Fri, 20 Mar 2026 14:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
Date: Fri, 20 Mar 2026 21:15:12 +0000
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOC4vWkC/x3MQQrDIBBA0auEWXdgaoiYXqV0YXVMBhoVhWAJu
 Xsky7f4/4DKRbjCazig8C5VUux4PgZwq40Lo/huUKQ0jYqQ2z+maiZCm5XNG25Wft/U0IVAzng
 9m9lAz3PhIO1evz/neQE0O5mLagAAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Hi all,

This patch series introduces support for the APM-to-AP mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

Also, it requires APM-to-AP mailbox clock in CMU_APM block.

In theory this can be split into two series with correct dependecies:
device tree node requires clock changes to be merged. The suggestion
is to let this go through Samsung SoC tree with corresponding acks
if it is okay.

Will be great if it can be tested on gs101 to make sure that I didn't
break anything, I don't have dev gs101 devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (5):
      dt-bindings: clock: exynos850: Add APM_AP MAILBOX clock
      clk: samsung: exynos850: Add APM-to-AP mailbox clock
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox
      arm64: dts: exynos850: Add ap2apm mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  9 +++
 drivers/clk/samsung/clk-exynos850.c                |  7 ++-
 drivers/mailbox/exynos-mailbox.c                   | 65 +++++++++++++++++++++-
 include/dt-bindings/clock/exynos850.h              |  1 +
 5 files changed, 81 insertions(+), 5 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

