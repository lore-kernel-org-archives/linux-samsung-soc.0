Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000C3343D72
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915367; cv=none; b=aQRWBLjFhtL8KyVDXPu3rr0y3v7mKiigWmyO8j+vONemMy/jX4CrtM6LPQVhrxP5GpsuCCwiGAmVg08BeFqOzvFGBRV01Ux1dHqZbDoiv1i+dd3UMbkQ+ghEGMb5ZNiMCJP7NFiHlVq8jx6i3ZN19LFRcUIU4DlRFnkXiHpbYgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915367; c=relaxed/simple;
	bh=5p1LeqfmmwFaeenEnSkkkwhzGqyUgPudlC9tgJJ0jsc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YkRPdpYI8TD0Gb6c8gw/YrajhxsEBa+nIZzBmi7WQH0ZfNqoYYg942CFQLeseLyPIJgwlTMEQ7iJ1U5tZ4GtVzmeZLY3Y3UHkiSEC84UoIrBEL7ONCH72PIV9rbf4A6to2z5H6DEbTJAlZ0iD+ulSu15+6kMojF+d1h7H9Dys0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DkHVekZx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkHVekZx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so17861025e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915363; x=1762520163; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSizeuZT4cpU3hNiP/rAVuNIA7WcfkZd0/3ee9GQoRM=;
        b=DkHVekZxYsIHEKdYlAMZ7F6bfAVEFc0Er9nNl/RYgzkOO5wgMM8RxH2HGBCehKP6l4
         Why2xa2PYnQK+Rt558m/Q41061Iu53f/jSHdMq90772oDde+ixRJ1ar8lvSMjijR+iCL
         YnTGiqAYdRee8bBSTBcUybAgijTkaYQYKi2J6BKa3nJzBx2ZOBtlVlpabvHwPH/RreU1
         Te9LDH4kwmdQSKxLQi35RqwkQNCHZOIWt8Nx7dcjic0rO3gUbsz/HSwkWJNTbEuueIrr
         UvS/xBEU1KfpT+PUItslvFsVzFaTvS9yxC6M2kYjzv5L03iKgjUzCbFjeYjB+G/2+FiM
         hDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915363; x=1762520163;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSizeuZT4cpU3hNiP/rAVuNIA7WcfkZd0/3ee9GQoRM=;
        b=g6fuvghVfNOQwHBZWmSrj+xklwNU+enlcw0BnS0UPAeCKMAJHkQ1nwv6mDo1Ju9voH
         xBatnU84BGxZLkrVZzQ0LSP7ZAYOaZersbvtMrB7TFgqfwrHvJu/tG84jJUc1Iqf7pjm
         xekOsDQmiGqvnDc3FztzN2Z7HH+4Z+WSaj0Pk8EIscXPaHI0LXjz1niIcUmyPO1iwPDP
         VlCU9Ol6TkTnz4drKxu0XQmuGhRNMQDLl8KOuWiTwuK/kWz0VemefFt+CzGkIf66Wx/Z
         T0kdV/XM7m8jSeyZUamWDxPe95F3HQm0BLsYqgw27wm6pJ5Sc/+nw79hFIKG2JSj/wO5
         uhMw==
X-Forwarded-Encrypted: i=1; AJvYcCXEChkGkP1elRDF4rzRLSkK3K3hz51QkEKVfvyBzzzucZo/yTEXAJANva7wmVv0oGvZSYCgxMvcIFR9pMkt9Gjl+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9gP39zsx3f/T3+rimvkkdEStCyJB97+VUJHZ6MTuRQmvs142J
	Bmrck49AKo6iVmbhxHPTZWjUAvMiIxjJpPWKyrLGizMAY2wH6PJJ/Ki2F64AKNa5x2E=
X-Gm-Gg: ASbGnctqnlQE1JGKb7+t+RJboN01uV+nUZzNO3UWquGgcXHO1U4aJl0FJZneuLGWFbi
	T+8OC7bkdwTTTNWHn51qeWdWLX/MuS7hR2dxuZq6P5I2d01P7Ro0+DPGXovnM3IQVkJBWsQ0Q+X
	A33FATjnvEhStsfql0UQ3f7L1CfOpAcNpnxGrtfoTdwlt4tB15CAbNIDCW8iYytGHeq0INvY49/
	XRw2P7I7upgstcYXakiHlzpTjXpGQfXn5XfyVXXgDAZcHSzdV50/yWKJQHUnQ5hpzLdJZAFe9HW
	yzqpyE2vK+DLrIdiaUy6/7Pf7S/GQM/agW6XFn46i6RUUybIM8AKojpeYJy07ziACIwGLlenuY/
	9iJxEKuOBws4bNE0QwzfOSuIpUgFQlqfqgw3OA7PcbO6b3SbovkxVP6KXEl8CTcB5+cmm0RO4Aa
	0AUr3dSZu2YLKs2sDwJ3kO20E7uaeTnCkZBLI8mWDaV/pOQBuyHv3TQQtpwKHppIs=
X-Google-Smtp-Source: AGHT+IGWxYF93lfuQ/cW7BRqRYwYwuobMFF5l+VG4Chs/3oiv4JkKC1iwBzuzNb9Up1q3LYo95lusA==
X-Received: by 2002:a05:600c:a088:b0:477:19c2:9765 with SMTP id 5b1f17b1804b1-477307da91dmr31824705e9.4.1761915363285;
        Fri, 31 Oct 2025 05:56:03 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:02 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 00/11] soc: samsung: exynos-chipid: add gs101 support
Date: Fri, 31 Oct 2025 12:55:59 +0000
Message-Id: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN+xBGkC/x3MQQqAIBBA0avIrBMcK5CuEi1ER52NiUIE4t2Tl
 m/xf4dGlanBITpUerjxnSdwEeCSzZEk+2nQSu+oVpSxoULpEhf2MnizeWtssDrATEqlwO+/O68
 xPkTejqdeAAAA
X-Change-ID: 20251031-gs101-chipid-fd84da8afa2f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=1738;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=5p1LeqfmmwFaeenEnSkkkwhzGqyUgPudlC9tgJJ0jsc=;
 b=d+BPbUINRjy4l2Ym1VjrE6HaCPsue9Nyr0tngMPGtDoQTB20S2dUN9hf3AEOOwYRtOSMPMOd5
 AEgHi19masrB06nuIdc/Jx2kl1prsuWCOWbdWaO8oCSDDIa9mNVnt+f
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The patch set has the typical dependency of the DT patch depending on
the bindings patch. Plus, the dt patch references labels from the
efuse node, thus it depends on the bindings and dt patch from:
https://lore.kernel.org/linux-samsung-soc/20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org/

GS101 reads the Product ID and the Chip ID from the OTP controller
registers. Add suppot for Google GS101 SoC info.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (11):
      dt-bindings: hwinfo: samsung,exynos-chipid: add google,gs101 compatible
      soc: samsung: exynos-chipid: use a local dev variable
      soc: samsung: exynos-chipid: use heap allocated driver data
      soc: samsung: exynos-chipid: refer to match->data as data
      soc: samsung: exynos-chipid: introduce match_data->get_chipid_info()
      soc: samsung: exynos-chipid: make asv_init opt-in
      soc: samsung: exynos-chipid: add support for google,gs101-chipid
      soc: samsung: exynos-chipid: prepend exynos_ to a method's name
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      arm64: dts: exynos: gs101: add the chipid node
      arm64: defconfig: enable Samsung Exynos chipid driver

 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |  51 ++++++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   6 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/soc/samsung/exynos-chipid.c                | 163 ++++++++++++++++-----
 4 files changed, 186 insertions(+), 35 deletions(-)
---
base-commit: 73f7017e663620a616171cc80d62504a624dc4de
change-id: 20251031-gs101-chipid-fd84da8afa2f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

