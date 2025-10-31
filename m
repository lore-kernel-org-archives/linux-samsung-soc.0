Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073711D5147
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914725; cv=none; b=dYgrsEmca50sB8iMVvnftvBRYaKADAtg/RhGoMCylSb8rfffDWp1VvL9kSzi29DzMG4tGVILv8G/JUcb314eBVNN4yzwSjshEQ3a3BhNPE26UuzHmi8JgA7iNZSWzImUDU+wrn11OcMnWYFfGUvO+DS63ULcFJ7i5xYA8HCnaD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914725; c=relaxed/simple;
	bh=jbtOQh+KZGaronPKGSCjW9AW/6hcLTFo8o99haI6DgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePAiNW5ix/Zey+VZA/1bbxKXV/2TGpV/GRexy9xnl0yurEb23eAad2Sifi8UC3sLaKX8iXBIjODWJylZyjA0FhDPnKeg7LtFbkS0mscUHM89yw2cQW7cIViA5y813/JeljPWps7x4FqkjRobGPo6lEWxKtSUi27gjTcrLz02eQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4Ffj/nJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4Ffj/nJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so13307895e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914721; x=1762519521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LI8bIiPiGdrKa8u7FU/JStfXK2j48QfKQas4QVWIkY=;
        b=a4Ffj/nJRpGs3i+ujW7Qpz8i2DnyHbJL4wgiFhyxqDwpIEGeU9vL9kelwr8cnT291a
         44fa/xNTNSof/X+oWEyJ2WuIsfRlkjfbnl4cTyNOfPTtY/7VVjBacjjy+IyScSzpz1kt
         lGweZWqzwQWIAspHqUNogJZWPOfGyNzTRmmu7wxx7igUU2OipAzN6JG2KHOcW8eoelwx
         HO1H00Ptl+RnioxNyiiiyv2zQH3AVHlTj3V318e/mjENYmRjMj/S12+VbZhwF1qktqjH
         4G6tMvhWqLH5CTZl3Br7jEYq708AQoEn2wZV21lGW3lQzpb2uPwRjAJME82dxDdcs7mN
         xpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914721; x=1762519521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LI8bIiPiGdrKa8u7FU/JStfXK2j48QfKQas4QVWIkY=;
        b=fK2k4pAP34PD18e567qt5P4nKRHCdjUdi4hfDEF9ck20zX9Ob68XSBp2g18UT5rhIG
         pH9wsq+YwwP4XJdlj/7oaPm5W7YwQ4IVCDXfKEPphJu1T8ecuHP+GX10gINGuILS4scZ
         eZCqlNp9DHUob0RZ/EvEWikiVduukL/NQoCWfL1N8rA8a5xfUWU2l/Oq9F0wRZNkzfWi
         vFqRan1+LEyWRChdDGQEuA1rERedKDWJzXBhCq7WQLZo1RqpixJrJJzjwPGEdRbnqX4t
         tw/LspmCxPakAKAXA56zzzv9L/qf+OLGwWp/dr/D/eoKhQnPzXFU+YgVYbbIn9YL35gF
         F/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXG699JJNlCmmeQzoxp2ZdmbN1WLOtjALoU3Freg7/yHVhAmY5S2YiGOo4Ma7lHKo3xAsh8tB7+/L7HIFU4B8Tf3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbwdWJFdH5W7aQrlmyMQ3EF4yODyIX995fc1AtKESalqR+mPg
	It47+c1OYhtkqC3gBO7vKreQvsuDu3m+wWXtJBjwnPkarxczlpqjHQmpYdT0/7S9/y4=
X-Gm-Gg: ASbGncuF239dr02XZwGtscgteDa8u7i98DZjH4/5c7J6pJ462gdVXonDVa5Tf7Bf4Fk
	7FF4M4eceQMVF0cn4tuDkfAKBiEyd61OVlv9jSGNbX4D+mcSSo7hcguZLQC2JISQtvkKwc4kOQO
	RZbA+VJ8jvFg8O1/nIbBvx2094dlBA/CiNvcVPGzQB1dunR93ZqGaji/fl5j3Vg+ZUOj/YsZ/Ky
	3zNkkv5vtPeVfFlJWbjcDW/QP/MVPT4K1N66S59IhqSN8hxEm3IrOT1SOA6L/SBzjqnk+NE/oYM
	RDH8F62v4fFnYYwMy8VndspQ7RWPJKtAbtc++qcwm3UEG6OwuJyyGuApH1Y/2Ke8GKQ7Gg7L+d0
	W3XXdIUw9F0fPjxrNa81M2UqOM4GltlbuANXP+NQ678Yu344fpTUVoZkGpTUOmH15sH668o3kI4
	owiVcr+1jBXhGxcmBArqi3AFxSK+VnIl6rw31Ccc7mHxbyD44W8EEg
X-Google-Smtp-Source: AGHT+IHOR9o3pN2qjHmH3aj2ibwtFk8fBD1ANgqBkHALk2NU/zxtz1qYd7JTDoI7nz6jygMlz28LcA==
X-Received: by 2002:a05:600c:314d:b0:471:1d8e:3c4f with SMTP id 5b1f17b1804b1-477308aa77emr31810825e9.24.1761914721275;
        Fri, 31 Oct 2025 05:45:21 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:45:12 +0000
Subject: [PATCH 4/5] arm64: defconfig: enable Samsung Exynos OTP controller
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-otp-v1-4-2a54f6c4e7b6@linaro.org>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
In-Reply-To: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914716; l=915;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=jbtOQh+KZGaronPKGSCjW9AW/6hcLTFo8o99haI6DgE=;
 b=anPmmraBvSuRYrza8lT7XXPyLkgmlAH/yyD7w1SjaBtSE3hCPJZEkgDHb0kPl8CtR+4Ta8bjR
 mEUElj9TnrgDeBa4TOQQUClCBg6x6jMhPpnKkx/DI+wT0L+NvF59rcO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the exynos-otp nvmem driver for fuse access on the Samsung Exynos
SoCs. The fuse block stores various system information (Product ID,
Chip ID, TMU, ASV, etc.) which will be accessed by client drivers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 646097e94efe7f1a18fb59d5b6dfc6268be91383..6433e3c0f88b892ce6f2ee190f866a6ab4889771 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1682,6 +1682,7 @@ CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
+CONFIG_NVMEM_EXYNOS_OTP=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_ELE=m
 CONFIG_NVMEM_IMX_OCOTP_SCU=y

-- 
2.51.1.930.gacf6e81ea2-goog

