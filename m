Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE3288C18
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132904; cv=none; b=d0DbCqo9+pUaobuzS7Uq1T1HnU/bJmiMlmLWque9vRo7ulxDLKkDV7843esGGObc1zvjxNVJs0EnXR18bL31OWg3SyJdFJPIpC/mgLpIKd7V1/0a0/7OZMk2n9mlQTRjK5qZ1++bA3r/gq4za4v2tackzeyS2HL+vnlZUxU980k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132904; c=relaxed/simple;
	bh=3YlMOIgu11vBoJjUEqiVPSS+lh9NXRYYK3t5EeYjBic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bUnaofEwtZnisAXFYRA44e6EulLnWYmpIWiypFQGfKFQ0N0R76PIJGGAarJzeXgGESvyBKZTn6KuE17cAX8ZKylVNAMANheTxbeoknto5AACmPVcRhr1xL88jvi9irDLSeEFVxNGT9x01a5suQxjUNi4AZEAHZitLx3TwDU74oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AW/IwO0G; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AW/IwO0G"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b20fcbaf3aso101376f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752132901; x=1752737701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITUbPKjz6nt7F9zre32Uex49fG0CgP037IfGy1Dq7d8=;
        b=AW/IwO0GKlpGOF/ZgOW6I9P+oPKXysRC3zpLkE2mQN923L8etZ2jMybkvH1YcAT+SW
         jWRJvehIdZU0ouPIf9GJl9GedF+33wjtVkaFbD0wpXRrI9WaY0B2u///+AFfOMB8aWS5
         yQljItfO+9ynefxNp/907bMUO78sGHq8+msGkm+xptCf79sqENd4iZJGaeqOiFPfp5Yc
         5+Y/WRSUIXT0Vr4JfvWyc6kPRS8P5kO2OWiFIjr7bIv5ez9OLK+XGPNyLPZTlMnId4na
         QwWdh0bJAXXDtRAGGqAWIsdx+NsEx48E7mJDXwAmWYjYR10qcrYTNQAqU/7cVGpu40Ek
         xKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752132901; x=1752737701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITUbPKjz6nt7F9zre32Uex49fG0CgP037IfGy1Dq7d8=;
        b=BZv7qN8bz+8U20dk8AJrXimmmgWDojPDqwiYSG9tGaCC2OLsIDofzlKURuFjPZ6tV2
         IALZUcKIrlT+s+BOGMfJiu2pOoN+vLpLlGTXU8pYiw322oRgCWZYvI+MSYFDUcMVQl+m
         gS2JW/jaOjcmhUPzdUJ4ikErWO/IBSP4tgg09gr5oGoDmPnS9/wZk12wXNhFfxQ1+CMT
         3auVnqIk/ziMQAuUoJEIU/8/mFJUHBACyVNIRcgAyP2ltfJVcw37Dm6McECzTM3ljobf
         FTRayBL4WLvmdN7gxCN2ybr48FFwYc4dsjWkL0gUmYT+zoNh/jxIo2KbMmoXruIBjv+E
         zHUA==
X-Forwarded-Encrypted: i=1; AJvYcCWf7EDY6+CmuKWzOr/8aEPbznICkJj1pldzGFnn3oFgn2huO6wWQfWc/7O9XKRFNo5W5WrQoY2zUguOBzLveY6nwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIujypAwci0j/14+cf7WgaPjYieRKQ+pH8oLkQNuPepBYamNAs
	jDsf8HO8n2kzqeMlnRGmpSyQVxPTep9RtrSYSYnNQRckTz10QUrNfGb798+wKdGBPZE=
X-Gm-Gg: ASbGncvhOvwfG5+el3n5q76zf4TxWzAncEJ0EnIUm18mON9Od2yeJJtbt46dIcahQdP
	ZfNqHLGvEzCuGU+XDjAeDiJWhkQcu8fr/rGJYsDl6usA1B723jFWMx6pAeLydCe+JXU5EyAA41c
	hheewOo2Fd/40OWD0+AYRZB8nmVHIjC44a7HeRPDYn5I6xV5sPZz7bwFyBHArqmIUmGcSrNWvZg
	MKnkYZUjj/rLISbbwn7dy9cFQm8CvWyOGn0O+7N0ahz4M6shKZtDTtNGiqGvOUIWHyh2rUJyBB0
	0OAEniDAdwOlR4mR/0GFvOSgxVNFJaMs8zd9RBZBNdK/C2tDlZG+bfj69qyXk7wFpgOvv76tswn
	U+L5QFlvVRw==
X-Google-Smtp-Source: AGHT+IHzDyfTOcdmYClAhYTQidw10ZwlS9z8D2W1xO1hV9teei6UadmtYmLqVDhpcn3elTELAFK7sQ==
X-Received: by 2002:a05:6000:2406:b0:3a5:324a:a04e with SMTP id ffacd0b85a97d-3b5e447a874mr1570352f8f.0.1752132900931;
        Thu, 10 Jul 2025 00:35:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd466154sm10826555e9.12.2025.07.10.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:35:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry
Date: Thu, 10 Jul 2025 09:34:45 +0200
Message-ID: <20250710073443.13788-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=3YlMOIgu11vBoJjUEqiVPSS+lh9NXRYYK3t5EeYjBic=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBob20XQQOTWxlqLjKHNNyaH3n8/WSBNW/mnXcu0
 xFUmc6gGwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG9tFwAKCRDBN2bmhouD
 19h0D/45ArZflYDgoL5gbSjHj6laJbsN8NIETDO2vubnftED+Br8KEQ2SXkxq1iLWL27Mt+KdyL
 hQRPb7VIqm5S6kGi3DShOE1IHEy2unlB4P4ovWGVT2L/I2IG0e8BGre23UQKtbR2o8n7hrs/c+S
 50R5h31IjXFgYNTlaGPtCCnI59pbL3pSPdVBEbI4/81/WlU6P7Vyd0gBQpFwdMAza0m89uQMBBt
 0IAR8n09LBS95ivakTkCo9yd2+B/PuTi5WXsb5y9FWOyqYzaf+QBhxfgH4v/5uYpP31dTAUfbiD
 dtG6b9HRzGJGZ3H0QlX8kMVYulXlZCiRThwoLqNdfrxtgc0pEPicFsote7V+zSFW//E/et9jlbB
 DNpIqM3G2ba90tnxrQYjWkpYwIYQXPep15sHhxjjsi1vDidWBUwaCk6MfuqF4ag1SBygxdG3MAR
 2fPcN+cGN6lE5C0yTT8e7xq8I8zaxNNDCq7ug+dQLrkhM4R3XZDxQRNdZtsfMf3eObcYmDV42OK
 gFiq8cUDGAV/cIAAIJ6cCvd1vNRn/l6WGXE9WAsuc3ZY89FXf5Ro+Ttcz8JB1iwYHEXxN4PHdtz
 DCAAjbWhTfFUeETPzigKWVLONKNFyGXRg6obkLo4tAPNbB7A45KNgLIvoHGiknQIJ6Mbzxm7gJZ cRotHgmER+hQ2gg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Effectively all Tesla FSD DTS patches go via Samsung Exynos SoC
maintainer, so add the pattern to make it obvious and reduce the chances
patches won't reach these maintainers.

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: André Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4073f7ac978f..a2e1d879cc01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3205,6 +3205,7 @@ F:	arch/arm/mach-exynos*/
 F:	arch/arm/mach-s3c/
 F:	arch/arm/mach-s5p*/
 F:	arch/arm64/boot/dts/exynos/
+F:	arch/arm64/boot/dts/tesla/
 F:	drivers/*/*/*s3c24*
 F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
-- 
2.43.0

