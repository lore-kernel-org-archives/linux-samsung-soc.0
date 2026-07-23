Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E240D448B89
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820596; cv=none; b=LCUUDJcjkbpRZGRVTAeaHUReYktqyMEG3Bqi/VDCsDLjVZFYKPN92PDdp4A5cFJM7iezHerYYEzO+DteVTMdBE1atmLi65JsalFTKXhAaTrjFVDPGT9Zupoez+xGLganYP/DJL+tKKlIjxCo11yIhiNj9dQbzOCK6azdm5TURGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820596; c=relaxed/simple;
	bh=F5ba9LQe5XM6kG9e4NQUbj1wSUrQm/myCErbTEpasGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fpp3h/XLshwxrtz7l7TJxp6nt7TA3p74qexRRvkh2LwFxjOduYrDq93YnWXAox9EG/dn+ja3RquoKLYND4MHLgmh3U79zPl3a8FgnnYSCWZtLroGnaaq+ZM+OQ4PMaVa0cCd2zYm7eldYnSiARDXLy4S3CeG97sv6Apg80Z+B4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jO3kYuOX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jO3kYuOX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso4553075e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820593; x=1785425393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ7DrWSeI6duZxzkpJi6xcP41u69UUs7TUTlnDPTSiw=;
        b=jO3kYuOXU2UwVq8jrdNAnE3CmgO9i/YW+aLwJN3Id4I0uX2saRUDXy1m7XgviHEMbI
         RVEMMc2I+ngmG6fW/3GjTFJc9/5gv9oO+2rhudaM2lrkBjrIrj6DjP+43hkCxaUWuq9S
         X+cbLrYf/jhg6mop+9Q7uMG/weFWyjTrgIQvoUy0/2ZukIfbcZRli9xlPArxtCHt7Yfw
         6/KB+2NdkBdpIWMkpyXE7otI0UjuLnHBduYKSFVj9RLIjIiaMjIYgKIGuxSF6GgTN8MP
         lzy0MuR38SZE2kIUA/fO8ddKYjIfDFDxEoqnpiiG91lDtYC7fG+rGTGk6scnwjrvRAhK
         dQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820593; x=1785425393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZ7DrWSeI6duZxzkpJi6xcP41u69UUs7TUTlnDPTSiw=;
        b=cxhjUIODxDiQmXpkGVP0r8S0LupcfpyvM9GQTf8B53E3uCttUJYwVwXUBBpONAOVTO
         ooerpAgrUxzESVsEt5SB5NND1I98x8LwSyyPNQ7e5VH7dScf//5TV8Bqr2U1aKpEuEGo
         qWMwHDhBlGMKQFmd7HAa9IQeus4hyhnZvTku3o2P013dAVVXT4TwDOhO6mbkHe78j19g
         Bu+3EgidwfIBGlqH2+EwvavtI8J1mqB0eEPMNyoEgsHUGvDmru0+F9zthz2sW4y1HFm3
         1tzTuwymoQnHY2PUkWpIhCT1lCrf7K6Ms0z8GUcRM5csLDwG7iFTMFnYS0MNfTwBYQel
         JP/A==
X-Forwarded-Encrypted: i=1; AHgh+RqxJi2LhRikNfowz9b/STGLVBIyVlaF81qNs5FpHBCNIW2G/2XWv+ZL6cye0TV68Rg7YPYmJZpbxEQsDeOKZPUdAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwolQHYDqtc090K31HVjWcA1jElyB1D8DcI5JVzgybj0tFx1pc7
	TQlGGh3WCmMs2IFqgrq8fFrn/LGyvOI4B2ZB344sUmW6g9CW0NR2wrjDbTm1X7AOXAI=
X-Gm-Gg: AR+sD127ccubETLUK17QFbzT3OBZMkVFDm9qXJ4kFGac/SS9xkv+9pscm5drLBbxTc0
	7lZ/qMHpoe/e+Q9wutk6Ee3pbV/J9whUy6uJZtV9WSDojJTSFNM0t9ZD2lvLemJLFMu95GWvdFV
	Om55LBVfcSaMefB0MwAAmitvi8giRP/a9+m43yIkJ8fjV85hMf0SNRIodyoEawtn06AlulJZB9M
	BRSEGsqjKP+YT8pqehjkJjJgMFSDfEw4fSIf7oabQj1Fm6rZPBCPEZjOFe+1SNYsG6HGawtOJuG
	iFdAvfl8yncEvp/4btAUzV6HO8LJRHdsC+THvDLDhVHe1n6ZATu3BqlwfwrtWcqO+4VEToQ3XuN
	dL++xu5leINv4+/QNkWQ7ha6eTBcUutj2t1i0N8jrKmnzGJPEL5IJgAWGoqmkM9QkU+poNJ1Hmq
	gxB2KLqzna80LYwxWCfPDf4cq/72z7A4505aqtOU2iFQ/8dml32jT5+QkRZWtKFFaFRA==
X-Received: by 2002:a7b:c446:0:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-49573cc18bcmr28824395e9.2.1784820593118;
        Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 23 Jul 2026 16:29:46 +0100
Subject: [PATCH v2 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos850_sram-v2-1-c94968e52f42@linaro.org>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
In-Reply-To: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0

