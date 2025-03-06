Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A197E9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741256093; cv=none; b=TyyMUI4Q5eJRILhlCVq1iNYAE0PuJTjXS+6OneyrG2vgB9nt4NY1UPiHX7pnsWKxcj3z5iW6ZDQS9Wj7DfaPmSJjyoMTf07v2GSvWbkoOEIEDNxu66SmM0lYPoFXlhU2BlGVy9Nv28mwK9GSGiIf9lwkkLCMOgOxO/ZLsHYgBJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741256093; c=relaxed/simple;
	bh=zZ5zRPaBf5NaYRVFcYpDRW4Giwj9aHf2bI/tXWWPQGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wy5R86XHff90Me+UTo6kXxZoUALyxbbIpgAfbqy5sbY1VIoFeoyX8iWvW1NN6dYK2lxrzlbmLPd6RXOBsuVPYh8S9QAsTYeOHjFgoTwNWp+pNXR241OK2izMDYKmV3X9xJbaLKns/5x3LEIXSjho9C3sS4bJyYXHIR5KtQu9/Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FejN7/Xj; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FejN7/Xj"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e549af4927so733685a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 02:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741256089; x=1741860889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTX2x3w2+rrqKrzKo+38sY9i/3t1a9Grj2c0VzKk3Q8=;
        b=FejN7/XjiXAYXgr9oe/+HXlxHroGXXNbDazRWX1gsLEUp7hH7aiZXETq4yYepQe03A
         oTqqMbOcN0ovsfxuwPrK+3lFtC4QDeTjUlzOX13ub9AWubLK9u70w5i8i2BlzJJ2X9u2
         D95X9QseotoUPF5UI6U61W323dGaz/Hrfs0cYcfnRBx/awwR8e6gOlz2ruNuy6OXMGr+
         azes7xL0y1YnjNt+m5xL8V3SttT9F0Wxghs3DDgljVvN4k3+egduRB4i6k4qXIZLqd4H
         GfP5dHKTMKjODZvi3G5GLBcStmgOjGnk1FIbGqwAoF9CbY7XkqDWDAiwwa8RqO6SLJX3
         ieVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256089; x=1741860889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTX2x3w2+rrqKrzKo+38sY9i/3t1a9Grj2c0VzKk3Q8=;
        b=ocfCjC44fT+P7SxWI+MLr0BDoOztXaXAKorP0pB6ojeeUMjY0m/onJBZ9Ea2IEQwCT
         k1E2+s7OGr9Uqp+8YYftnjqUSq8c//GmSz9CcG+NHnRBidyPPs8jEKifxOmKjdvfNPov
         5yodM+PLJFe2Ik+j7979sYVwBAwtx/ZPZ2ojqXyly9lQiICDJ02r+UuWM/SHYfXpnfgx
         Uq/+xe2i9eLeTCt4AHBTgnqNEMBlr18pkMZyjneHL5wXNpmCu0A6LCvatZvSwVVw0GMr
         zXu0IA+sOf0vKu2xnhnI4BalnajTT/gj5Bg/Rguk4BN7kYcRHiFbPo4YQ7gvp3wEQBwm
         w+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW15+opOM+PvYb3VImKTp8vnnTFOJdh4q4L39Ib06c2RbYPhtLI8OcPCWL24fWMwSM8Acx9JypdnRjTppjLmQnx6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmEfQEjI+sUMsk6TB0n7x3QVFUt7ywZei6Ab18gz/1zlybjnRv
	Q25j9cSSTaxRDHlOGOgbZ/cI1N6JNGa7u00l0PS3jHiWU2sG+EQScSkcQXMsIyM=
X-Gm-Gg: ASbGnct+vhoE7bRCCRgUYfOTE0c99GNVt5lZEJIvxjjjckgWsy+2x8b3n825ko3rk8T
	xPZ2Hr9ddScFtmldOE+uKun2SasIWELSS7GpOBhlZBB4FThAHbueEXJva4skfpF7YMjwnXP7wi5
	k45bki+76yIrS9opTDApSkB8rgTev+LPmvkxReVa2hjyY821sX/Ek96T+0L6wQ02ba8Fx4/edwm
	Oa3ZSf13UINcsr+uQUwGRY1Fsvh218c1Ihld7oC6ERdOpvFEr/ZqjlIFq+mH7wXzLOsz+1QIEwZ
	5B26jSsX2cZEcMT7kOUVBoK4XvYwsU+1AFHvPADiIOGHKjUr7vwuAatoDlNIqxiodINAM9SiXu8
	Q1H0T+7LNSmdMnmRWywcS7GYixnw3
X-Google-Smtp-Source: AGHT+IE/o3v5XJFu7xvLRW9BZC3NmMkBoh78OMt+bw+ZmwbbxHMBjWL9+2GSNHmM24JOepTrXIj9dg==
X-Received: by 2002:a05:6402:3902:b0:5e5:b3cb:38aa with SMTP id 4fb4d7f45d1cf-5e5b3cb3c80mr4508256a12.25.1741256089661;
        Thu, 06 Mar 2025 02:14:49 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a6af7sm708972a12.33.2025.03.06.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:14:49 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Mar 2025 10:14:46 +0000
Subject: [PATCH 1/3] arm64: defconfig: enable Maxim max77759 driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-b4-max77759-mfd-dts-v1-1-9fe8b0eb8123@linaro.org>
References: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
In-Reply-To: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Enable the Maxim max77759 as this is used by the gs101-oriole and
gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards,

The child devices' defaults are based on this MFD driver's state, so
this commit enables those implicitly as well.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b31ee659536a64b7db704153d6fe9..eaa88c3e6a93ce555468458763c2531fee2a903f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -763,6 +763,7 @@ CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
+CONFIG_MFD_MAX77759=m
 CONFIG_MFD_MT6360=y
 CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y

-- 
2.49.0.rc0.332.g42c0ae87b1-goog

