Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739C6282EB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914720; cv=none; b=B0iIz0ONNzjUCxsIN6NIDQo88QfpJopuenONT8EPj0vk1f626N2rJRwKKJIsCWo+3JHtSVbYExpT+HgWHWuXlLVowAXWyEGZltMq25jAg/0P6VxarUWN+QgcWARSww93vFqiAjg2iq1UPSgoA/noxvBz6kxhBxZZuQtpb9pGORA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914720; c=relaxed/simple;
	bh=eShtlJ8Q5lLAIYL5hn7v+uZe4nyW0U4dTV2Vv/o37Is=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W5kDsFEDd98MqN0yihnqXWLaeyet5ksQV/TjZUzg/meyMNRijwBcHg+XLwFOQaeZuhc3eR5603boooStQd/C9fK6WncOY/R7deyCY1Uk1X2IwnYFyXi74j3x85amRLYG3wkqXS6TsKmqsmXXCEozHERv7kPv7rHJjMzZNp+jQWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tkuvf8gl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tkuvf8gl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-474975af41dso16128535e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914717; x=1762519517; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbj3gKZ0mzSwdkwPXRoDa/eaYfVSxFDtUK1SIosiT1M=;
        b=tkuvf8gl1vis+wTuJce5VQPBQI8OXyaXxO7Oe/Kg9R2bBf0cZ0UiSOLp2ONdMl/YWF
         f4CYcAixwuCSCiN3gSDFMuIU6HffGEeRTE+ig2ImLchnH0Yiibvyaik2S9QbKcR50J1v
         G3xLFVAF/QA6VA09KivxvFLeIBDA/lC3E4en3TpVj43B1eJzaRz+BS2hyv/qMMBf9WuY
         jlr76nUTkZZFz6SyDN18cuBdF3cJcdlzlYKn1Spcbw48fjyLvC5Hv5PSL/EjJpr90xkn
         M6CnjRpCiVh7YzaOzkkkeRmf73UYHbhAHZ4xwxzVLin+vKUz/jTyGPSh+ht+wS7Eh/CG
         hZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914717; x=1762519517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbj3gKZ0mzSwdkwPXRoDa/eaYfVSxFDtUK1SIosiT1M=;
        b=b/yIf/hufwIHcER8adEcVUNZFn/v8lifdhtIaarbqVl730GfuyR+lROaiD3ykf306m
         TAdlAzJxdZwL6LcvJteVsjW4jkqUtPf0ckTLmtj7OoBjUb7xtTaXq4n/SofwXCAOVyjT
         02Jjv6UnSfxNSO6p1ucIpuJHWBSqouDJ1lF2VrOyr7UQ55O+ka5OU6xnAlx6UbVGMjwz
         KFLIb3uSspjauoI8d1IDPrR/fwc6mWOkSm4vRtIZtZKjGiTmJsFdh77wSF1YOFqv4DJ6
         YZ99ch6Nxtx949OKYkq1KLaFn/AlqNOcDloSrnWWFPaKNppNx9yotHxWA1vxyyF1GROt
         R5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+7YKxf2JhMGLFo/3sKxd8gp9OYEMzQpEUOq1iWVwgLAYnNDFJAjehK4bGJnwmA/OKFLs4b9P4Ad3eTKCUBUuaFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC+EmNW6jmmOW8h+X85gPXsn57MDxkgZYr7PgM8cPK6z0fP7EU
	ESkai1xS/5k47R3vB/6LFHTp20h6Bwm1R290f+/mSGEhrGOlP6aSCyvoo9Y2g6gziWQ=
X-Gm-Gg: ASbGnculUTPWY1hG+4rnZGEBk9+BrBSb5ZMaChpCad9GxWk8+rHBaICUhh0xHrBCXAM
	lGHQAdQv1Vyc/WyjeNBwV2aCKQO7wvJJyUs6glqtr4zf5p8tgPxjvfK6xtQboVzdtoEUdCvyeMm
	g3q1Xik+T33dI1tMwibc+9yaVvN7UFnHNercNrYsStgvjQKBy7Se7Px11E8YTB7yuoUu2mhMnsx
	BoWhl2elqC0MTaSv83KgBu1dXyRim33rLKFN1QvWT2mVk/8RrPn5SVwXGIdLtpfbjEeE9mAqDbT
	c06JjVD8qFmG9Up/F3ZM8vl3WJEI7iTGKyrY17uTC6191rlJnYucfF8ZIc+tFBNwa4I9+OK/TuE
	rGxMOONAxS1nS5lFiUj+Q+JP8LD8/b910RSf7eahJhT62bfh5iMDnUMP5WZI+4wmlsvOCa7VJzt
	IyMoEY4MNnH/6IUrC95UgV4LG0Oyhn1IAxxYgcVoKsatqBqkVXPeYp
X-Google-Smtp-Source: AGHT+IHqy0NvjSEdkC5QA4dlobMBtMSys4ERttR9A7YfgXRw5s+9LrWnpqc3fCglT5Vt6XnCw3B/fA==
X-Received: by 2002:a05:600c:4687:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-477307c1f24mr29666305e9.12.1761914716741;
        Fri, 31 Oct 2025 05:45:16 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:16 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/5] nvmem: add Samsung Exynos OTP support
Date: Fri, 31 Oct 2025 12:45:08 +0000
Message-Id: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFSvBGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA2ND3fRiQwND3fySAl2jNGOLVIskkyRzS2MloPqCotS0zAqwWdGxtbU
 Av8ZwdFsAAAA=
X-Change-ID: 20251031-gs101-otp-2f38e8b4b793
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914715; l=1825;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=eShtlJ8Q5lLAIYL5hn7v+uZe4nyW0U4dTV2Vv/o37Is=;
 b=Cav6xp6EkVef+kR5+xm0NcqzjGfCB8JtxlbVHdTW7e4KMSsgOBlOfS4QS/NSWUZKRyXAq0Ff3
 4hPYHB6jVi2BPtPgXa6/b8DGjvet/fG+YJ7cfBVavtwrAhttcx6A8OS
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The patch set has the typical dependency of the DT patch depending on
the bindings patch. I propose thus to have the bindings patch taken
via the Samsung SoC tree, if not all.

Add support for the Samsung Exynos OTP controller. On the Google GS101
SoC, this controller provides 32 Kbit of OTP memory space that can be
read/program/lock using a specific sequence of register accesses.

The OTP controller register space is of interest as well because it
contains dedicated registers for the Product ID and the Chip ID (apart
from other things like TMU or ASV info). Register the OTP controller
register space as a nvmem device so that other drivers can access its
contents using nvmem cells.

Support for the OTP memory space can follow and be modeled as a
dedicated nvmem device.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (5):
      dt-bindings: nvmem: add google,gs101-otp
      nvmem: add Samsung Exynos OTP support
      arm64: dts: exynos: gs101: add OTP node
      arm64: defconfig: enable Samsung Exynos OTP controller
      MAINTAINERS: add entry for the Samsung Exynos OTP controller driver

 .../bindings/nvmem/google,gs101-otp.yaml           | 68 +++++++++++++++
 MAINTAINERS                                        |  8 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 17 ++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/nvmem/Kconfig                              | 10 +++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/exynos-otp.c                         | 98 ++++++++++++++++++++++
 7 files changed, 204 insertions(+)
---
base-commit: 73f7017e663620a616171cc80d62504a624dc4de
change-id: 20251031-gs101-otp-2f38e8b4b793

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

