Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59DE13CAA5;
	Fri, 16 Aug 2024 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794688; cv=none; b=nvakIqL9aFQpYnm3kKIWpVYeaL8og0v7K1euiO8CsjQY4MtVCtiEsP+MoQirw6jPgFH/SVYFxnuymNF/nEYsBQXUAktaTKoWmfsgaulbLpcJxTL54nAwG/ZiBaZuqre/7QQiHLUTUTP4/TYeLY/5sEUI74AulkUOyV4cmMIZURM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794688; c=relaxed/simple;
	bh=QbDGTrOuqa+9JhAPdZB7MbiB7g0LqwVmKKAqqQeXAR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDS/c95E2SeIdIEqWMFf84P0PS5EwZe5A2TAUdIUjqWaz6/Bh+Kqcpxo7GsXpqaMM24p80lBTrUma54AdF1OcP0mhfHCRPxRe+iAzl3aCrXnHU90xuy1awIvpj5yC+gGWyHwkwrCYK0zTaPoW73FcXfvo/HSu/dhOll3QLbrV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMSdsoqS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMSdsoqS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36dd8a35722so902379f8f.1;
        Fri, 16 Aug 2024 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723794685; x=1724399485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftpauJHvJu+xnhEvp7WCn3mWm6mJ6dwVq2EMLSHYt5k=;
        b=PMSdsoqS+GkoQv2eo3xQHb9OK9DWtO9wiQP7xhU/0FQU2RvOfAsFoABzMxJtk6xpT1
         83pvkxAmbKI+gHezxfvNUcPrFMjsk9OSdy9tVwaDbv+wG5FKDL896GRTwT3qnMU3fUZy
         2HsqseBwzYckWD1tjcQHCXKysvUaSjcfoO4ELICDku8Wc4EDkQcfYx6PPQI/T/gT0baG
         m4DizQaRfQo0Bs+/oTZcIx42aSxYbRvO4kL8Hmpt690w7xktcdJwYRkoGTS1Fq2tiwWN
         aW6KXhFTsT8c2KbF81Fchde15fj5eGhDBIGIwZQmqu06mxT7cLZ2TCVxOANgzmeSFZET
         UX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794685; x=1724399485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftpauJHvJu+xnhEvp7WCn3mWm6mJ6dwVq2EMLSHYt5k=;
        b=mcSI+6wJLT/u/ObGb9FrR3TPuZbQ66XBNRV3hk+5CiYp2Z+AI3SujsWOOYJlbAcuCt
         D4Y0fNMB1Xh6FSquCt6cRB8HGuZW8vFQve07dgiqm0P4VG9fFq7Rdnj0cu09gAgGT5FH
         EvjY64euz8if6/HsCD59ZFe62L/p2VSaDPBZY40VP3qjl6+p8EO6/cqKCwQyieWjsGsP
         7UuinUZTW+xUew8AdNR6IqzblWis4lxN4Ix4f7wgWcWwb5gLrJfFgCxLcBePsBMJBg0v
         pFbR6H0lAPDuEy+//jQVDOHdmfqx7WlWcUTrxl9f1NwmLJs77yYICyW3GpJQYwtHLsMj
         MrTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQrbqmEHicxgRZTlkb/NQ5W3mSWSRTt3TTBoW00qvsJG5PpUcHPH1yhWzzfuC0VHFxOXmiShBiJRnWADVrj92wMGLAf9YaSoyGv63PM+XPVQzMSLK4T5hBZhn/2QxfwLj5VIxVpPvOUw2S3uHmSSHir6hmnKgrpAX2UrmxtAG+W0gxgVSR5AXkGOJJyQ==
X-Gm-Message-State: AOJu0Yyy3RlEt3qg0oD7Z6SJLBeNVA/FnXi9bwWM3zUVbUxezOjSVYIY
	i3ovLclNr2JcNhCcYXWR0Jq+TRcFCcqg0kFTfndOjE61hJUzHlbL
X-Google-Smtp-Source: AGHT+IFcWSg7R6ZOrgOTbSp4WTq9l/KTHzuMWJwWrtjUMZDFfV6LDRMvpsDKBTTz+8GRTCWba44Jpg==
X-Received: by 2002:adf:fa50:0:b0:367:9881:7d5e with SMTP id ffacd0b85a97d-3719431e648mr969068f8f.8.1723794685161;
        Fri, 16 Aug 2024 00:51:25 -0700 (PDT)
Received: from tablet.my.domain ([37.30.8.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm3026201f8f.52.2024.08.16.00.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:51:24 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 16 Aug 2024 09:51:03 +0200
Subject: [PATCH RESEND v2 6/6] ARM: dts: samsung: exynos4212-tab3: Drop
 dummy mic bias regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-midas-audio-tab3-v2-6-48ee7f2293b3@gmail.com>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
In-Reply-To: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=QbDGTrOuqa+9JhAPdZB7MbiB7g0LqwVmKKAqqQeXAR8=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmvwTnloZNW8WuZLkNUngAi1UB8gAHT75XHcj2c
 tku/+yxd1GJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZr8E5wAKCRCzu/ihE6BR
 aEYfD/0X5RW1LxXFB1Mj5dXgnFZv0jcjZjmJMmmqXCSEU5pWFlL3B9cgA1TTpj/Uc8goGZE4niC
 oZXdJJWsLU8pmJ21p5ntE7KeN9cPCezRa2Pvh+Rwaimx1SYyZS4Pv7SVuYcyRq/u8daN7Cyay2y
 vbVqEzuwd7Vnjq7PjL7hVSRO2uqm55Nhxd2MW/HLVCDH7m6Kkxwcf+9bLuUPtlEgU4G2XNHmWlw
 9A3yNFd8Al3As+WBAxkegsxgAzIWeec0J+QZ59lUHipaqx3mcwyINrWXCWqoMe+4XsCKmdqN39h
 IS2MyC/FDZF7cZq/s18BkOf7rb0CUuA9yfkkqhgiaajxpRftKSWoQgEnIc7SXQ5UfWd9Awni1iX
 zCoThh47d5DwlLuvqCn6hNin+x10y/ZxPmjl+hab10Hwm5ZyxupCGzgGTfcenFtsCoUVd3Rj7Q8
 k6QEjCrzVPgTv+eIv0JqDnMOW8SU96UimCL5C4fnLHEEJ3y4VXY54szWAXWM/2fwvEH4n+WJ9Pz
 ae8fM3CQKDC+W1S/BrfrIDVON3AduYhpHtjdBGxt8bdYqr3HegtZfMGreIkpTjCogFX7NTtWt5l
 F66ewVkEvh4O5SU3KHMu4CzwXQ0ZBJMC6x/x832hBc8kJOsEPZeYL/YQ078cMPqFOuAvDiImaKd
 heg8dTSdgvuuS1Q==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Add the samsung,tab3-audio compatible that makes mic bias regulators
non-required, and drop the dummy main/sub mic bias regulators that
don't exist in hardware.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Rename earmic bias reg node to voltage-regulator-4
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 70e3091062f9..553ddc3d42da 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -286,21 +286,7 @@ display_3v3_supply: voltage-regulator-3 {
 		enable-active-high;
 	};
 
-	mic_bias_reg: voltage-regulator-4 {
-		compatible = "regulator-fixed";
-		regulator-name = "MICBIAS_LDO_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-	};
-
-	submic_bias_reg: voltage-regulator-5 {
-		compatible = "regulator-fixed";
-		regulator-name = "SUB_MICBIAS_LDO_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-	};
-
-	earmic_bias_reg: voltage-regulator-6 {
+	earmic_bias_reg: voltage-regulator-4 {
 		compatible = "regulator-fixed";
 		regulator-name = "EAR_MICBIAS_LDO_2.8V";
 		regulator-min-microvolt = <2800000>;
@@ -310,10 +296,8 @@ earmic_bias_reg: voltage-regulator-6 {
 	};
 
 	sound: sound {
-		compatible = "samsung,midas-audio";
+		compatible = "samsung,tab3-audio", "samsung,midas-audio";
 		model = "TAB3";
-		mic-bias-supply = <&mic_bias_reg>;
-		submic-bias-supply = <&submic_bias_reg>;
 
 		lineout-sel-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
 

-- 
2.46.0

