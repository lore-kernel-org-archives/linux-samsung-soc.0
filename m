Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417133470A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605433; cv=none; b=K/FAFsPgnHjSOI93/PC1xGMDH8G1kSiU3/MYJNA3QgAo1xo+Egz6bCXTCxPpaZC8ecSqgoSosUqS3H7yYJGHCMpSXcZzV2d9vp9boUN3ig8jY9DtmQNQyMZyT7X+JyXpgnl2d2ppuTmehz5+dAt5BX1wMWjZa8tr9MF1nzyUDIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605433; c=relaxed/simple;
	bh=uK6l/5FClBpWiFuJ8AGtZeaEMw1qu6cY3Abo5OK8elQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DXbMKOzfrzS8VEg3sxosgaZeSB7haEa7xt+dNpeYegUqh+68mfad4nYo8SOnk64sSgk4Qb2YKtJEdKFaXnFuew5uePYl2a/qDNSYxd3d4pmDxEiKn1dQEmufPPlMn1yWHuVTHpZ9wVgYotCDTwvn0XDaRgvj2ajx24YhcIPSSuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+0vbgtu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+0vbgtu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so3404276f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605430; x=1756210230; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ie1f/VjDyAptInpGdNWMqZ31v2yZSYdvuR+Tc8cHCdE=;
        b=l+0vbgtu4aMha4vzzKlxUbfTF5IAkRvuJ12+zkrfYK1dZbbofKgzSlKK54gnszfdi8
         kSHaP2Ltk/c0II2Atp74p8xn4PpyGF7xm11mTkgRkFIicWk/TQwZYV3FUzVzYzEVEV4r
         g/0OxUN2pgTX99xX5ovTputstk2WrrjEymwRjZydjeQk8ocw8VdgfdBkVYj5BN7UeRQX
         UBMpv49Y/Xys8mwGjSklO9+lFjJNmJe0BoPNNURfdD3cgCYfPa31rVnxUCd8KWP9nSEJ
         F49CKDpzkHUGZkJ0p1/OCP8+x1EiUpNDDDXaTud/mUq2DRkdKBK0ueS9RYY73b0rl4jh
         5mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605430; x=1756210230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ie1f/VjDyAptInpGdNWMqZ31v2yZSYdvuR+Tc8cHCdE=;
        b=H4T9QpXIBQ3m+J510ViJEGx72jKeita2wOQ8Eh+L03Ago3QyJ1Hxo88PzftrT0QYhv
         QWwMu8LLxDoXA/n9FW4YhX0WFRLWgcwWaEHRVCBdDmNCWpts6BRZA5blLHqJliglRVK6
         sthrmXi8PlL27SqAhqJWOVQAoyNA9U3ELNCe22SsDUYR4hQVEH2S9Heb+GYSae2TBqcn
         J9Skq/Ov1+NPKi6ZhNAT8dEEPbJrdvAuatgp5uQEbNuTO1Y0xiBHnaN1hpSJL18ts8W9
         qp9V8J7NzKSGlirRzLvv4bOXrGerqAzkGZ5oV/s28WJMnjUru2pmj13ktlwQee0MlVY3
         02tw==
X-Forwarded-Encrypted: i=1; AJvYcCV/FentiVatT8AjCt/vggkhAqgyn4YgQ9ecAb8b0ruKl0Ib8w1e/1QJVoNL35Vzs0ZX0y/YgTSTX3Gahq2SstDjDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO5BVBDz1ytZEu4wFSazxfaWK8kC8g3LmTWPWMfYu0cjBF4AzW
	/4uOEMZULev+JKjW5jf6Ue9hiuu3EVr7YxZXT6U23/VWfwEMjl1jBB2xtaQGxYWE+4g=
X-Gm-Gg: ASbGnctDerxrpNyPnPZwkMiTPB15D1JusU1HstL3eoQtWfAJ7he1BNc9RGxZ2ycCXJz
	i8oVPWZF7zn0MedwZvRNd9X3daGdu0gccgXFqytLCeFpOVhNjLVgOsSNoehxvtZJgZwpdT7+NHU
	ACEme8wAwhUvn1tiWRvl1dKrTSnxTdvsMdpansprzCf7b0xt2hp0lZ3x/RugKV1hPordSeQ9VOM
	07NLSNrtOO7+31LXwtzMNXOo3aRpELqfJg97ExmbNKcc9rNK4w1E0RorR80IaVWXEhQyIzQW1DC
	LWj5SdwWctlhStV8geXAldQKAVWNpuwbZ75SzQelpbi2+aizcChHLw1NFrExaqLgWpKWfnuBVa2
	tFwIElEwvrYHaeTvTVZOVTleox7UcADqGfcejpsG9yd2M1QVH03UmLrrHlgPmw8kOOSZO4MPGin
	IfUg==
X-Google-Smtp-Source: AGHT+IEVnyLLYdJUBKqyV5B9bTgqz4JCO+O/FbUJTrqGc9mAPKgNQg4D8O4z/x0vvOilgoLsTrLApw==
X-Received: by 2002:a5d:5d0e:0:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3c0e2c89fc7mr1886575f8f.20.1755605429978;
        Tue, 19 Aug 2025 05:10:29 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3464410f8f.24.2025.08.19.05.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:10:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/3] arm64: dts: exynos: gs101: add cpufreq support
Date: Tue, 19 Aug 2025 12:10:19 +0000
Message-Id: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKtppGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NL3cTkglzdlLK0Yt2UEl0Ds6Rkc0uTpJTk5BQloJaCotS0zAqwcdG
 xtbUAScUs814AAAA=
X-Change-ID: 20250819-acpm-dvfs-dt-06bc794bdccd
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755605429; l=778;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=uK6l/5FClBpWiFuJ8AGtZeaEMw1qu6cY3Abo5OK8elQ=;
 b=6Z9LFvnLbBkK3WvrNq62MnQ4QYomccVeTTKMdmveFlaz6Z0gqh9MC+muKCNiP24IiW6woESJE
 2Y6uvX3VHa1BaGvjVy48GB6d4+QUUj8xsa45frnjcwmmEw2CRKInIse
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define the CPU clocks and OPPs.

Bindings for the "google,gs101-acpm-dvfs-clocks" compatible are sent at:
https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/T/#me3cbe2a97485d19eaf505ad23202f20a21305dd8

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      arm64: dts: exynos: gs101: add google,gs101-acpm-dvfs-clocks
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 288 +++++++++++++++++++++++++++
 1 file changed, 288 insertions(+)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-dvfs-dt-06bc794bdccd

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

