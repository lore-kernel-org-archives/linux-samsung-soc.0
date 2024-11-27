Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF11EE03B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705308; cv=none; b=P9k7ceXuy97vDd2l096zMLG6/6fqud+1udXSxKTXtnJS75zaYm+Dj2KXmFDGgt5IgJVrAU7075hWwUOzkJZOv0VqU/38vUebBbyc3UfuCCRgkXTzFsHsxnqW5duLWgF36Atx+FDXWZ5trReaL5xpFxfzoGjXu6QMZdGn7Uq2yRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705308; c=relaxed/simple;
	bh=bBXu9c7nBHpZKJ9tgZ+XFFWkeWIErIUAUyFvGXzCs78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yw70S28xG4CAMuIk1S8tkP09M99HSKsYhB/lPMlPklRl0pMuhyXlAqqzm+bHrpQ+qmi0dXNRoUmhNqO28xwVthK1cfpwFxKCAYHy8r4Br/THLPcOQHzNvWxF/+UEyTe4aCqF2+ML6mwfed6kkMNMlF0S6QuwmkEBVsLrf5+1bW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ek/iInXD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ek/iInXD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso8890195a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705304; x=1733310104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4erez+OR7MplArQbIopexB2PZBOe/GVnXjpG92loz8=;
        b=Ek/iInXDPa10EYC1+Qwd3jtui+ru3GP9vYb8vVBcViImFE4VyJYb8MKXaFZppA8yJ1
         8eiExOfBdu5rGv7QyTEIarZNhXrPbIJ7o8jPWGxpCojessVj7wyZABVEjYLqVlEENfj1
         8LhINXCnnb4lh6wzp8Wa4MjYCae9Yp7Ll9UwP44P4qAa4BO4+xldb/vkotwtWtpPgPye
         2Oh65X+IKpHQ6cUnk7G4mjMKBof4PaMwrCA7VL0IuoeTJVt9iXYextPiAv6ZKTjAhSo7
         hinCcVd2qr1V5CkAOR1UYRgZb4CW4PzCNKgqBCk0vWhi5tEJkrsa9hgG2xoEQMM3FAcK
         SxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705304; x=1733310104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4erez+OR7MplArQbIopexB2PZBOe/GVnXjpG92loz8=;
        b=Cf2TPogwlx+SOnj/kQVcoVin1r2RRQL0uAOHpX7E1cxhd7WE4Lf4FOxwfmfzgjHiRY
         BvQ7njCw05Ewzs74b46ZYmXwynECrHcloJvOMnxHOME1snFxSMk/5hbfBANGAD+fLH6j
         ixsXEXZHGJJe8ZW8TvJpTSjRRwiHvWjPMkbJw+4Q+EocC8NFTSsN4RbTUuSYvGx+Bibp
         bBbSZ8i9M/rFoFOt74A30q5lse82waz5R6VrVrug5ZJ06fFJjzj3DTdkh2gm3mK/zHRo
         tmKiqEJnX08ls2jWiMFdR28jV5m8QaOe5+fwkN483j8xZmIa3lZIVx7SwBJz4P5KQFRb
         wRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmzC8uYaRLwwswrxvEJf5zwNULHfc99X74voQRiuXyIuWiTECl4n23LTjXdPi46nHeakMzuDQyWuAfn7+AKBjzjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVazUBifSLud1faETnaC1ozb+O2RMORWmFK8GLU5ePtwXi9Bpv
	y50/mXem2ulL0oeMzEReMMfQIlN4qDf/J7yxTwqjph5UZISIt0Mm85QZMhJNiFg=
X-Gm-Gg: ASbGnct2XjO4kYPRLmsk7yzMoJPt69vr2X5PrJnXxQtHeI4wfzjkedPhchKrt0CdDxY
	G7hWwv6h/zUywaKRMDJsftEuDAPTZEN7WNL+4v4EntWGkujB/Y1h2oAaFu6Lpk2xdFd51Iv7bA2
	mHwbyIf6k4G9ud49xb/e92fqWTjK1KlujPNnWlnE8ia6fEWX6D1t9dq7GYV37tY7F0ZVm3QRtE1
	rsDEj5Zq9LIFhbCb0n5xRO+BZXyz7t02Qw4Fn+pZ82ergMFaFiVimBOY1PAGbdJ8KuMshc/t0Zt
	VgRv39j2m9ZWil/XJ6v+VNBuVZKqNrzQeA==
X-Google-Smtp-Source: AGHT+IGqpdrPnW3Rg6CugXIox+EqlkbBd+gvIfh6uKjWCcF5TRZPn4bamon8RUhLocSTA4S61CGyGQ==
X-Received: by 2002:a17:906:18a1:b0:aa5:3663:64be with SMTP id a640c23a62f3a-aa581028c94mr151558766b.43.1732705304136;
        Wed, 27 Nov 2024 03:01:44 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:44 +0000
Subject: [PATCH 6/6] arm64: dts: exynos: gs101-oriole: add pd-disable and
 typec-power-opmode
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-6-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

When the serial console is enabled, we need to disable power delivery
since serial uses the SBU1/2 pins and appears to confuse the TCPCI,
resulting in endless interrupts.

For now, change the DT such that the serial console continues working.

Note1: We can not have both typec-power-opmode and
new-source-frs-typec-current active at the same time, as otherwise DT
binding checks complain.

Note2: When using a downstream DT, the Pixel boot-loader will modify
the DT accordingly before boot, but for this upstream DT it doesn't
know where to find the TCPCI node. The intention is for this commit to
be reverted once an updated Pixel boot-loader becomes available.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 5f7be0cb7418..ef9ccd149b6f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -107,7 +107,6 @@ connector {
 			self-powered;
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
-			new-source-frs-typec-current = <FRS_5V_1P5A>;
 			slow-charger-loop;
 			/*
 			 * max77759 operating in reverse boost mode (0xA) can
@@ -146,6 +145,12 @@ VDO_DFP(DFP_VDO_VER1_1,
 						0, 0, 0x18d1)
 					VDO_CERT(0x0)
 					VDO_PRODUCT(0x4ee1, 0x0)>;
+			/*
+			 * Until bootloader is updated to set those two when
+			 * console is enabled, we disable PD here.
+			 */
+			pd-disable;
+			typec-power-opmode = "default";
 
 			ports {
 				#address-cells = <1>;

-- 
2.47.0.338.g60cca15819-goog

