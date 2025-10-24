Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E540340A51
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761328269; cv=none; b=ZR2yLIWg/Pt7RxWHVXk+qj2/20ULPKP+87xQqmoVzUSLO3wF8+P/MgwGgP1ezq7gTAXX9nkZ8exzWYet6puHigWBhvoFGB0fnvdBoLXBayrug+E9qnriMp/NpZyrn31sVZ8yXRTNPjErrZBYiC47FlbI3MsSsCZ/QTXDwrTUkM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761328269; c=relaxed/simple;
	bh=raBiU2TNdnYW5GXBQGKlY34qsI95KKrr7UkG+dolrPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SaHwARNSH193QhKr00ckSjZeHfy2SvOFAti6x35buEpJ5HPZ7ZIWEsgaZeiTscRmVcTPAU/NwQEWX6hmz7DtPMFkHuzbYTN0cFh/94opCtxuzb7Tj+/a4yvT/PiY/LsUAS8gG5lYN//+SQr2vIw0JOLBTj5ZzAmEkyvuPHxGl0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mlTrcbAg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mlTrcbAg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so1531424f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328266; x=1761933066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1HvYCNLV5CI0boyLI+MOBTwgyqBxpYEqfcX5SoAEoA=;
        b=mlTrcbAg88rvFSUlVUqQxfJFqv2xGpB0p23PZOYywlF52PN5KBGz9aHB5ezK8TveCD
         G6HMV900q9myUo5JPKG+UeophXjrvB0zJiBp08QeULmgMWh7+YKCoA1MTy/SR0OIMZ9P
         zQTIWmjUbWKz7Y3OqZTZwvEJcPSqA5LSk9q+A2ahbL9EGHoKoSmzCfA3oHfDg+oFwP7b
         hI1wrufI7qpQEMqRxNo47BB7eT3s0q1Xrl15rdyzeIu761hUJ0ldxfJfc7nP5qGeqBSZ
         qXE4qnuHNkm4WA+bq557JFq13idy7e2+nS/SXMCwZuQ+PipBONgfR84mvom7Exdm/68H
         uKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328266; x=1761933066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1HvYCNLV5CI0boyLI+MOBTwgyqBxpYEqfcX5SoAEoA=;
        b=Wh/lSJ1mRPFLV7qo/mUrOEBNX0a4rckK4iPCNCLU5yle1n9BqHX1vNTlAlWFuJhBE/
         y0p/g1EgicRu3gIDLxDj1SVGZzYGkabr+1KlKuCCrZhWphXoprG6rdNP4cJB8xN5x4WN
         VyZ5Xx6DUIVwK53W8s3DNVX3qcN+jCGhMLFJJ5ngAthK6Bq7rv3CTXs+PajJaudjn77e
         nFRzr/kV/vOmP53d8ZDT3g27FI41dBEcNui8/SIP5S13gOZYK0/1qCvGCk9whSLx+ON2
         LQ40znWazDCoBcM5S3oA3ynwNrhxuU3O77rxJab6RAyDzWfJ565L7a9kuYc/qmLoeeQ/
         5l4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbHUL0GcVZ7aHInTkke4tkhzfgb1PBEAjdsHQTzVydU/m2iKrO4g1FjHFAEOir8nB7b5ig6DDoMJsGp9Z67QEnOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyln0jSaPtu8yDns7Jhzttm2BTxKXEvKFqA52AgUIDJqXuhX7mt
	6bXbeQ6z+VtWxrdOZ7XxetHNsD1xDKPMXSScxTFS8gZvqInIqcvTyHp6nwQf7o4kk3g=
X-Gm-Gg: ASbGnculgfCqE9EjT8xtRg/H+mPu1kjr0U2sjlJ2y1iSwDFbaO5k/DwaZxjBK3+Mwv0
	jgKKsUV/vTNSgEFKD0iWH8MWI1opuIuWsuWPoQmn5rf/umOJQH1z9Bt5RzK4E5jB84FbQ+w/88c
	MytMCyHmaZJjlXEhwB08wyKGbx6aaFd3PToXbqnDB5Hjb1by38vdpswVRLqFkmqfKasWIu1nPP8
	zdKAX1wUy3/03aaZeuwi5nNH/IPxc6b9oo74WYKrbX9QNwHt18LCGDRgDtltle6NZYsD7kwebZ6
	zDwo2FO3ZfFkXbPGkYJ7wm/h8wTkFgpRXBjAxAhRiNbhovRMMOyXPqHdlagnS0kWz1cyDICovwf
	j8BUFDOcSMY8UEfLC7SBAUG5ZFr+37RIkYKFDBMsQDEto69dLSraqbnVUF0xQYvVDg30Y8mA+gC
	dtC6eZt/Ri4gfUud1jAekYVz/0c/as7SZrMZ1P1i09uwqPmAbIszZRzSoLFMEs7fk=
X-Google-Smtp-Source: AGHT+IG+eLRf8YPCXCIvX1Icim3foq9BCM0qVymaKl3/VkViHXuuqGJB+jB3dPU4X7R8xwku0ueZeA==
X-Received: by 2002:a05:6000:2f85:b0:428:3bf5:b3b8 with SMTP id ffacd0b85a97d-429907467e1mr3127739f8f.44.1761328265663;
        Fri, 24 Oct 2025 10:51:05 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e7622sm10321900f8f.8.2025.10.24.10.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:51:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 24 Oct 2025 17:51:01 +0000
Subject: [PATCH v2 2/2] arm64: dts: exynos: gs101: add TRNG node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-gs101-trng-v2-2-c2bb81322da4@linaro.org>
References: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
In-Reply-To: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328263; l=1126;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=raBiU2TNdnYW5GXBQGKlY34qsI95KKrr7UkG+dolrPs=;
 b=e1UEZMWe5ikZ+mjOHJ6zxj4LdozzJBMXJBQkXRXZTR6davdh/DgSzg4n+2rpnv8ebPSQH3L5u
 GH+sVbHAu/sBN1oTyQY44OWkPjPvlcgeWGZUXH/mWGz27nhPuprVPia
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define the TRNG node. GS101 TRNG works well with the current
Exynos850 TRNG support. Specify the Google specific compatible
in front of the Exynos one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..380f7e70910ab8bcc28690782532fff87ca7e30b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -630,6 +630,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		trng: rng@10141400 {
+			compatible = "google,gs101-trng",
+				     "samsung,exynos850-trng";
+			reg = <0x10141400 0x100>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_SSS_I_ACLK>,
+				 <&cmu_misc CLK_GOUT_MISC_SSS_I_PCLK>;
+			clock-names = "secss", "pclk";
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#address-cells = <0>;

-- 
2.51.1.851.g4ebd6896fd-goog

