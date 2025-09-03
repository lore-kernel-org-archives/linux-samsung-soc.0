Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E37E30BF78
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909483; cv=none; b=KnfqQf8RV8+sOgfYG/Gfeb6tpJK6YoOowbi6qFZvkoO7SU32TIYht3TzMCJ/bLSkLKOjG+u8gRANcvk47jaUawaawjCYGleW1je9mUt1q5Mzv4jMVK0j7d+UvYdZHst5OcQW5fv/LHnaYGZkKkQfuB99G4m3b7zXtHFIsAjzNcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909483; c=relaxed/simple;
	bh=O0ZaIGzNEXwrghncj9YNIJwIZXgEV0h6GP+O9Ob9bCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArARRCjqdcMTANgEp62xxPIgDQkWSNq+QWTSiujHWzfCKzEWYN93PQIaiNGG/dpcqSsIvgZ/WY5/na4vsSOWjTFXqUwQl2HSG8tnbw2la8rv6Tc0ZSAIjHLIx6d96o7Yt5AO4QPqcuLBjniyy4jqDImPHy/ji04PBUlPIxRbuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4iikCw1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4iikCw1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b883aa3c9so25539685e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Sep 2025 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756909480; x=1757514280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXbwYHHwDtZG7uyxiQ/Fmn5Mt+BEh2eODNORnfwMtFM=;
        b=z4iikCw1gTz5ZpisslL/pguJonOHjVLMnpGioM/7uchq32IcYVHDmsPLA3h8fDyZMf
         De8Y/nYwbtVq/YFoDpbyoD2E3X49f5wyjG0asUJcE9ZUzRjMygqiJTOTlwG8wpcHpkdv
         chbXc/Fb20qikQuBd4pmDx7AszFRe9B+RvAAohuE4OYoJA/MkvBs+7VvKI39pO/uXqGy
         yLry0Fn7/Rwz+tcuIRgJvKpenUS0a9MXSp2quJnWTIczTXfHTL/jojil1YGBean5/XN5
         s5ntOTq1H/TSfuYmLrPuX6JUNNPUuWJH7AQqo2LqQLquwxsT/UeezZUoNLMcgNzMuJDT
         3tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909480; x=1757514280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXbwYHHwDtZG7uyxiQ/Fmn5Mt+BEh2eODNORnfwMtFM=;
        b=OEHCVHm+4bMBWU4cGkEGTjwaysuvlj+qM4us2F4+XJd4+s8vftZ1uLdUC5reWhrn8a
         DxY1HW7AinCD6jZDRIkHfrcL4B4LrXq7R6FY/QCxkeasnB+HQZ5bV0kgwxC8QP/pwO1I
         M7IhSJxK8gRNMyGyF2yHL3aNI1LUiFSi3VWv7yIolCKNqYnzhGJRai8HJS60PCHcudwD
         dR0RGGACtEYmFxm9Un4+NDpm6ontyofD0CsIa5EnITu7bMdk/u6Dqgxny8zrxY/aa5Bu
         pIrYI0kmqSyvXVUadDsm/igwN5/EyzR74T7CJvQMWdU+Jj6QXvI/HKz9M2nkWEjTTRGI
         bujQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfz8Mymiqdhksb279X2Eb9w/8gaRyX3ZDmqqZOtDD4uuLzmofppDBeoQRgPqvsWAWwEbbaS8E/Gf2psOZK7ikWbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5KCRjo9lhY5kwveuzqEXXHTIR9OmEUk6YO0N+lfmrg05Eg81
	ZWbYob2HQ1130M7d/tHj52wjkxoLXtXhNwrQ/opl6dwM2RixOB+l9QRmaQDLdcKoBaM=
X-Gm-Gg: ASbGnctvfW+5a2OVi5CvhNN3y55BEjEMsXBX8rhlvLzB6E/Ydt08/2ja6ygjdRghTYv
	TCsdmZmYDFzaiPJ5WWq8onbHfR/BypEKCv8l5PMBeoQf4O3aVf3OXpDa1fx+GKX7i+YKLynXoKO
	zNZO+bsF8uZVdKXqrIaNemqaFBeWo2gPEH324dyvBAwLkY65Y5Qovsuf9Q4sLIn+pj5dDAGdGfP
	zY0RawhfaQyHHm6WAQApcZMhSS3ZTCi3+Lxb/3KyexSOWNPAaDpxD2GtjUjciMMc6jgoCP0bn/2
	5nlbEKOyDr6+bMsP7Jqc4M3x61sgkVaDYqRW6fiXGCt9aRNdHC2MGcMno93Po4pt3t00iPcNyFf
	IsgZU3XiEbInQD/URph38gNCFj2ndtVzFEwqkYmrUnQcqT78SGA0Mj1Ht6n9JsKjTYS9OMw/4rN
	xCRw==
X-Google-Smtp-Source: AGHT+IGElUVvAdnTLsoSyPE4S7KSi1NXgc85bTjMPXuYMbOZdz2o4+8xSGY8r8pqxR543TVqoUC2FQ==
X-Received: by 2002:a05:6000:1884:b0:3d8:7c6e:8ad4 with SMTP id ffacd0b85a97d-3d87c6e9003mr8330251f8f.10.1756909479612;
        Wed, 03 Sep 2025 07:24:39 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm3996035f8f.33.2025.09.03.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:24:39 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 14:24:35 +0000
Subject: [PATCH v3 1/3] arm64: dts: exynos: gs101: add #clock-cells to the
 ACPM protocol node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-dvfs-dt-v3-1-f24059e5cd95@linaro.org>
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
In-Reply-To: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756909477; l=858;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=O0ZaIGzNEXwrghncj9YNIJwIZXgEV0h6GP+O9Ob9bCc=;
 b=Vo6WkR/E//OV0DsTSlpds8sKzQhNQBSu+HqfP4AtDKHJiLDyc7STDizBG48Nhd4baH1I3LEcE
 1EAmsYRXET3B43eHFQZqaTcqLTcXr2LlCFSs8nmManOhkxRVzbBznF4
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference
its clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c0f8c25861a9ddb5bbd256b62c66a645922ca74e..f00754692bbac39fd828ebd4ef7c269f746f2522 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -202,6 +202,7 @@ ext_200m: clock-2 {
 	firmware {
 		acpm_ipc: power-management {
 			compatible = "google,gs101-acpm-ipc";
+			#clock-cells = <1>;
 			mboxes = <&ap2apm_mailbox>;
 			shmem = <&apm_sram>;
 		};

-- 
2.51.0.338.gd7d06c2dae-goog

