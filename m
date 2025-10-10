Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B52F2610
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760100414; cv=none; b=ZaQI86Kmo68rpXzE0GQCHeihGI20dWEDYvazCexFdZsQToVchEh3dAzWmgkjOeFYyOihXTvnSqkkxMYUMtIPdBHBC9KJ0gSYcci8HUzII1cgx5aWCdcGQR2cS+kUll/G/1Yxt3Dsa7YQsosvIaIjIVNq3Ts2HUTbHlTo80k3EeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760100414; c=relaxed/simple;
	bh=hUk7p7wXwxuWON/P6SaBYN67C9x3HyQcVroLLSWoXfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYw66GFoEq8btV7KzP1YeI2NHGK289gH5mlFSe+PlqB7j4URcBdBwa2SLqr9uPe+qQ6oWct4Oy5wifd4CBpX2iq08rWZ/eew7uMb8J/P4e2boHKTt7xoZwzecX7yvhgQcxYUhb4p7ozSFW+rf1FG/uykoGr/kPMLcRDxs8mTKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+Q6AJqY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+Q6AJqY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso15687765e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100409; x=1760705209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euDBh1JPBik0jtg2IFON/RfdHFmTQnkqEMlQtD5Hj7I=;
        b=i+Q6AJqYmm8LBYnWZA8kmyEyGoHVTegHASQDDbaz4rGaIbsc/whJJvcu6vrzHNgRVB
         c9/g5dJlEG2S25+17M1PUWImRVua9g2HNFhsKv94T2aMxZJL1YL2PV6xJZmL86tgQEoc
         updU1xJHMb+MXNq5INGRue1lYsqWQ+ycmXUxkuN1Ma84PyrujDF8DP5UwjiX+y5yeu8V
         3D0QKAShx9+Nsgpo5fFl26AFnmCeuQ0QtAVXOLYN/qZ0WdEASFS8ca4onoPWMl1fu0eU
         xT7/omWnVlv5KT8YSoDi6AnpTSGwkzODlGfx5GTiwtrl+IaoXO+f3Fxv9wPmVtRrxzGN
         BPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100409; x=1760705209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euDBh1JPBik0jtg2IFON/RfdHFmTQnkqEMlQtD5Hj7I=;
        b=nBvnPAUSA6e58Kt69lbGsJW509nyNjGqDA70ZiAMO58wYnxv+luoJ9P/PUbprWD8o5
         WF2eHjUdDWHCmi9/2sOZEaNY9K9lnFJGqljrvO+9CkSpsLYzPOwJ3suCiChbm9crNRox
         Ttk+6rK9eCH+5Bt28E92OcVbA8ZkvyFOuFdVS5IJdOt/a2vbA4zVa3R3jztZHvsyRW12
         vUjetDskzyX+zvKcThehK7QANkSs7X3guAS48kRvcsXp+f6UsBVRtDxLel67oiZJfJ0d
         WoLkURG/CJVJ8VnT/mGP3GN9APV9ngPUcCzT4NfTg7duIEhRG8iC6dR04oTjzZZqBpZs
         cJjw==
X-Forwarded-Encrypted: i=1; AJvYcCUBb3WQFX8d3DXhVCaUvwqqlWwpuEw2cat9SOjkbWfpboGSKBWQcM5CI7kyeDRB4AWOYm89cAphNfr2VEJNxlbRcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04DXW00GgygjmL3QHgP9WuS6tZgmsAv4Il/oyH1kvLSZ1epK3
	ravboL02vSz3qq/b11Za7MFlp2h0uNUkWZdu4byZ2tF+rZwqenJrKoa77oCVRjj0FEs=
X-Gm-Gg: ASbGncsrnJu+fFK/0vfepog9VY7ZPzCxZLe82NMe5bejDXBCCM92P08JBGS/uhDoPb2
	GZwyn94lGQg7NLTu9/3vdYONcXVvxAIGgcxjSUWGuJ2RskCBNB6Q8pRLVsmRqL225KGwAiMuk5/
	ofMo6CqrwK5SsYeDAwXXPOmL/Ov/lvTuUMOWS/NGaJcwLXJMPVMAKDTXwqHk/97DBURk50bHn2d
	wnXrVP3dZAEc733oj012HI0sdX6Y5siN5+TAvg8HMBiI7ACw5qj2mV5yJW22LMVhgadqV2w71bS
	MRZxgnqETSORvkBVDp6eyG0Q31kX65I9JmwI7BsKIXtZdEGXqS9TONBhbiRblmVtqlVkbgkH8Vx
	uC3hLGzl9hSbOuM/fyXYy8iztfTpKEuuiwEGADao7cp1i1moKODNOmi9/IJ1CyRZdpmHcH5rCNg
	obTRYoW2x6I6Jo1kUyMgbQkw==
X-Google-Smtp-Source: AGHT+IH8x0QfTr6wJYCjDE3d42CDoKbarW30rvQ/Cc2ORyEX4B7UUOdkskMSSnIc4XAyGE82hs4N5Q==
X-Received: by 2002:a05:600c:6592:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-46fa9ec796bmr84534875e9.16.1760100408792;
        Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:36 +0000
Subject: [PATCH v6 6/6] MAINTAINERS: add ACPM clock bindings and driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100402; l=1202;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=hUk7p7wXwxuWON/P6SaBYN67C9x3HyQcVroLLSWoXfk=;
 b=Enoypv5lWz1jLL8VOiF8wE4cWDFIyo47tyJbQitxtWSbq+eKO6jjL0y+BmtW8IkT/uywAVSZb
 namtqWy2kaMATnFmk94Ffxc0XmxkNambqyqvWPYoai4R6uOhoewf3BJ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Extend the Google Tensor SoC support list of files to include the
GS101 ACPM clock bindings. Add the ACPM clock driver under the
Samsung Exynos ACPM Protocol entry.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a27901781c2b2589a0f95678cf3df06401cac3c..6a6727ceeef67622e96441165aec542a2cb696c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10599,7 +10599,7 @@ F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
-F:	include/dt-bindings/clock/google,gs101.h
+F:	include/dt-bindings/clock/google,gs101*
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
@@ -22756,6 +22756,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 

-- 
2.51.0.740.g6adb054d12-goog

