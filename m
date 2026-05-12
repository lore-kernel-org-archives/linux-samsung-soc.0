Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B553A4510
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2026 23:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627540; cv=none; b=mKeJb24xKnWhgPyunQQaJw0tmp94UmDe6q4pqEG77VoC8D4k3I0vYOtQgib8G905BrkFA94MeU4tNWFR/GG74Jg9/yV2fU0F9CuiNwAA3BEiV1aHUHxw3XAHS4lvXrmeK9jIoSl9ATOY2USbH8WzKE07bHqzzUZC4Iw1MoutNVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627540; c=relaxed/simple;
	bh=QMCGvOgTe1IRUx/r/waxC3kN2j/mbhgWj+jEk5Ocqb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ecor0v+CRq8WaAHyI/1VvNcyIIXDfO8fESWdW0T0zK2KQou0AHJe0RQPhSWHwBai3nDWaJRC5hEAnsJQR9vRWhU3GGBWamsytgiDo93D5iArQoWs7hSMbQ5r3IPAeCAKCk2r9nWdUIUFiW15Yy/5CmCzD18FJLIlmAfZdTwEonw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yicc5trm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yicc5trm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48d102471a4so60516695e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2026 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778627537; x=1779232337; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQyBE0OznAhCrRGD3AceNMtDM18TfwDnmYG/NfXXQJI=;
        b=Yicc5trmAnu1E5+8sRNZ/cxtSyWuIIMGj2Ajk+BY/K+Odxw5MQNZgcwpjde36+AO7O
         l2rLlQLFK4YZp5pcZsSQvvB7H0+IYSmH1GcrEjO/18ykr3vHAd05/HP4yL5mqdnwepXs
         ltT/+qgbqaMPPo151MoNFdcc8bvWjwh+Hq9u/Y4iBDaBQViWG/mqZ6+KgKaikhe7VxVM
         hIsaPyjbC815H6dMxM5OuCClMAzwFsm4Aer7mTW3qqUNliwfbcvenYk7eLzVghbotQdy
         YIIWTaXzFtFSYjI7nyc5X5EuS/uhiOVDHrj7+RHjumPUkn3AjlhbYxhq66UtdSOYuzco
         l6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627537; x=1779232337;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQyBE0OznAhCrRGD3AceNMtDM18TfwDnmYG/NfXXQJI=;
        b=RaeM1HW6UZ04pPsidFGmZwieegm8oRhqwblrQirgAWXH/XNCjxFtXsQo80wSe3ROr+
         xdqTtZiSfaPVWxa6zN6NMZbfK84bcG1syep8RFMYq+e7jqSY/CcDyU/Khb7E7R6ZT78z
         P/mq2mThkkvanDjYRVEywSW6+RobRbsSHJQoAJ/B54cPolxZC5yeirqGw9djCzGJi0BM
         zEWMa8b99NI1uqmbylrNRw1Rof4y4if/Cwkw/qJDLD/PPQAOd0fpxY9edkGfcXrhD/qj
         8LZ15NF3XkC7ZvXMwoL0mQ474gnDH2v4xDppBD6RoTjcxmZRYziPTlMHOS264O8MBZ02
         TM+w==
X-Forwarded-Encrypted: i=1; AFNElJ/+o5pT9yEU963qo6OnyBKI+3FU0DjrM0CliK1QTEddUxeJbzz6EFmt7ocANxEcCG2Ocsoc3FSqc+ixKheXzSE3NA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5alEizt4gLhJPHEYIsb+pUm7NPFZXznYk4OFmweH5N2b2lO4
	udHFQemGKMf8DdGj46CHnPosq8/XJ3tM38CBJGxBHzTbnIudIbgPdTPe+RoD4p7eohk=
X-Gm-Gg: Acq92OG9Nv+Cbl90+AHPN4Ou9+GFNgYEGYFOCTvGZOH0T87j0RAzpDbI3FKgETCa0zO
	w1nN8K6n9YtFkfu0J4MOQ+4hKCbYfoMphhhUhFZtocLjLU31B2krNsY49cx92SuodAzUH4oKGkY
	xntzZtt+Pnq6mAv+piySxZhTAELQne588O1bpCFML+I2qd79aVmpyBbYZ22QQu0K330g3vtglIJ
	7AKsldKWshzM6340x0zcY43A1MhfmkpyjRMqc7yqEpMsOCNk+6Q7MpKX9N+VE3VBP5Xho6gVrAe
	LjEa17IM1nmerJ5/Ujujx6YyZ9aSYHwrFMwt0dfgQc80vmiCw5syA0Khm2bYrr81ewHgiFvVTfH
	J+6Hs7LxCzJYndkyjsL+YUSj0YXvlfk7JaepGN9wU2+naHfHSOd364xYHFN4qewDKoJk23Tz0Lc
	OLMjsVC2c5SjjJL8Ns/q45HrbfcXBAGaDeXdeUxvX10gjrf/aZDo2hMacRnHh9h8sXLw1FOzB0I
	RpAEqKsUIlDGmeG
X-Received: by 2002:a05:600c:8b55:b0:48e:51f8:eb39 with SMTP id 5b1f17b1804b1-48fc9a4b074mr10062455e9.28.1778627537139;
        Tue, 12 May 2026 16:12:17 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm20712305e9.14.2026.05.12.16.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:12:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Initial Exynos850 ACPM support for exynos-acpm
Date: Wed, 13 May 2026 00:12:10 +0100
Message-Id: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqzA2oC/3WOwQ7CIBAFf4Xs2TWALZr+iukB6KJEaRHaWtP03
 yV68eJx5vDmrZApecrQsBUSzT77oS8gdgzsVfcXQt8VBsml4rWQSMurH/Kp5qhtDOh8Ck+dCPM
 U45BG5JqcdpXglVFQVmIi55dP4dx+OdFjKqHxK8HoTGiHEPzYsPm4F5ishN8DDfuXt/cbGuqEl
 QejFJlmFtBu2xvqNeR31wAAAA==
X-Change-ID: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds support for the Exynos850 SoC to the Samsung ACPM
firmware IPC driver.

The Exynos850 contains an APM co-processor that handles IPC messages for
clocks, power, thermal management, and PMIC control. While it uses the
same underlying ACPM communication machinery and protocols set as
the GS101, the exact implementation details vary between the two SoCs.

Those protocol-specific differences will be managed individually by the
corresponding protocol drivers. However, a dedicated compatible string
is still required for the core IPC driver because the Exynos850 firmware
utilizes a different initialisation data base offset.

First patch updates the google,gs101-acpm-ipc dt-bindings to include the
new "samsung,exynos850-acpm-ipc" compatible string.

Second patch adds the corresponding match data, base offset, and clock
device name to the exynos-acpm firmware driver.

There is a dependency for driver changes (not for device tree bindings
update) on clk-acpm exynos850 series posted here:
https://lore.kernel.org/linux-samsung-soc/20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      dt-bindings: firmware: google,gs101-acpm-ipc: document Exynos850 compatible
      firmware: samsung: acpm: add Exynos850 support

 .../devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml    |  4 +++-
 drivers/firmware/samsung/exynos-acpm.c                         | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 9e0898f1c0f134c6bad146ca8578f73c3e40ac0a
change-id: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
prerequisite-change-id: 20260512-exynos850-acpm-clk-bed1c23b66eb:v1
prerequisite-patch-id: 223c977406801dde31779f956e33e65e51a0323c
prerequisite-patch-id: 9b11f60e3c53e94e28b5e54fb7bb87e5415d8a05

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

