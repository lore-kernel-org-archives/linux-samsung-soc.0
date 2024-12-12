Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D601243550
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019256; cv=none; b=TtY7dRJsXtRUEr1lYWNoerSAbqdQnkocb8YHCTEU77SR8w/1m/jgPiODhKYypcIr84caUVq1tco0EjWkn1hIAT9poB80o6uJZ4g0czDvgiQo/jZj4waGzs9NnisLjWWi3nG3NqILLx8k99wr2LpXIhgFLegm8TQJkPHV/vF5YYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019256; c=relaxed/simple;
	bh=/C7bHQrkgGdLprOLUDNL1QPrbsGLOKte0YUezSURupU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHcx7bYCpXgcYKR3YTiyGPHCP+HfQTxCCkv+Ecpak2TDbSqYH7MczLP8UZr6V6ASdSKiXUNYhW7CSEsqhUGXrG4pcQpYmGDIAtONkW9qtAJ/attmfhVQrfX6WwkpfXaO/TGHoRU7+GWRBqdJXo6JUyLDf0gSYPWn0fsgMqkx0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oc3pg1tG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oc3pg1tG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385de59c1a0so476802f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734019253; x=1734624053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUJZKl6ex9Y6tnVneUNF04HScPdq/LgCtN2B23fl+ms=;
        b=oc3pg1tG5cZU3BVT9S1eH4v24orfEjakcbFRdzF40K32ojWsMRowUnw0RX9Mt1Vxdy
         O0EhVQ1o+YqWE0dgYZSiQKa5mSUbKNzfPKI8vX4dpUJYlRMbW2ATxV6+WJJMJ99zTP8A
         DZboSDqEWInTm5yYp3+Q8L13C4lawOFK/TI+0PoDXF6u6ElwWA2aciWqzndQjd0C1Opj
         YjqwV4pAHnM0jHV5e18l/NutkLlolc+MpHF8/XHaLwwieBe6VzVXb/wzlpD8iVaKnu3A
         GJGOQ8ZfYyLLGQCxfAvpQF71JfeDBwsDXQ7J0GzXrofn7boMgCtA66mECU/z0VwIHIUK
         YLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019253; x=1734624053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUJZKl6ex9Y6tnVneUNF04HScPdq/LgCtN2B23fl+ms=;
        b=S+wNpBdAyswRWA3v3mAGU4QO6FkH+ZtdtI1+Sm4QRf8g6G1vG5cGCGYqYUOBiu7gJT
         DG30iwayrEk9SEOkE9sTVpD8242XsVMLtHN7h0Q70GnkFd+rQ35+MFXyQhoYErxRp5tT
         4tXNfSaXdE68vI5rptujqyTiwhsYfwZDg63zxoDiVaFvwhAniF+eOeS8hbtKL7nTMvj3
         sVhiN7zcSF7/7NCKwkUzzH0zG3jB/agE0QUe8o5XAF6E9a1PoJvezBlzrAiw/v7mehLn
         /lbFR3hA1sPO2A3rTuvRLNEX18OviffXMple1N2Bt+CGaDEdxskB0Uqrv1SqeuaRfWBf
         zJog==
X-Forwarded-Encrypted: i=1; AJvYcCVRdx1Xx3jy75OkVjTpnyE63AJ7aaWIbO4xIz+7CP5rr6QobyxbJKsuMuanbpWnoDqKvCrudp64ETLJEwEgub9o2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxg4ZVugSh090oC/ZXBUq9SUFoJBolWyKGeKXoI1YJcj/kZh5Q
	H4oNiDmC5h8MK1RpX2e2PeJj4x1ChILriLtUZsIkyxsEieIHqjxYn9wvEqwQgIk=
X-Gm-Gg: ASbGncvuwVp2o8uqrHYhAt6XUieOJFutiCbESWLTREHnUPuCEVIcxwKKBlp5DM4j3US
	kLW/FVygLuPYAvkwxtcj6+U1ccbgeFYPmnrdeeNe8N1JfKA+8fWquzFFm89zu9FtKW5WbZRHeBp
	/8Br3eVzOxPSJWRnVqODp8l1vgFG0o9d6keRRK41iK542QQLe0Y8AJUMl1px/x3MJBPp8RbtWLB
	d01H2p0rLm3WL1ESfLvKTLJ9ZZDP5761F0N2+Q5q/A/iqw/2XdFItE4at3YVr+fyzSjOrxEStef
	/v++ZDTXwIhvMywA5nW3IuAUMUN8TIhz7g==
X-Google-Smtp-Source: AGHT+IEN5nwnyUkAQMvO2q9jKMCm5xWXv8+YOzw7jcftLoAsAmmzmAcKvyZSzw3KzqJ0H/b/wrjw7w==
X-Received: by 2002:a05:6000:186b:b0:385:ec8d:8ca9 with SMTP id ffacd0b85a97d-387877c98ffmr3397430f8f.42.1734019251001;
        Thu, 12 Dec 2024 08:00:51 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm4462941f8f.74.2024.12.12.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:00:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 16:00:41 +0000
Subject: [PATCH v2 4/4] arm64: defconfig: enable ACPM protocol and Exynos
 mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-dts-v2-4-91b7a6f6d0b0@linaro.org>
References: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734019247; l=1030;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=/C7bHQrkgGdLprOLUDNL1QPrbsGLOKte0YUezSURupU=;
 b=q/qMWb3Eov9H0T2BHl7oTCrCuPXOj90JVrh0cjnd8k61RuCnu1AB8+Cevc0d3x4+b2BnG9tb0
 ExoRQa94+dQA0btBlEStNmn/o64BWNR7SWxVKOt/i78pqHEKVU8gpwT
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..91139b1cf813 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -262,6 +262,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1378,6 +1379,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y

-- 
2.47.0.338.g60cca15819-goog

