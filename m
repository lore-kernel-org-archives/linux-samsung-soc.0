Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB5157A5A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 00:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727193; cv=none; b=ZsnF7sWJj29mDMDlHoivMUL2+pIsH6oBFwSVNGjmDN6tMAXJQfA/rvKUX4sMFjvI8J6PZCXeYSnM7gbzyPrJGF7pO/W/UkfUSejn29CbFk3ed0YsvZyPwFzA5C1Rp+2U7A3jvb/6wgzdfFOAKJJ26JXxl21K9mlwRpDVJ4HFiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727193; c=relaxed/simple;
	bh=b7z5f+aN9HjkLJpPXtPz+6mzoIt/UlKHgKR75iFSd0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kg4Z7xuxw7Z3An86udSvh8opFgab4cwmZoSETHMJKFz4Nn0lip/2xa7gbgUH3OGKSVg6k/jt2y9ZIu0X7olwDJIytwe72YpTi+Rn8LLMouOxygbZ9Hbil8Jm7qht9K1SyojAg5k37wuhz8KaWa7HA2OkyzLsemKHTAA46vD4ryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sIdY86kX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sIdY86kX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso19175435e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727190; x=1791331990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8zcsJ6JNS6L3slLlgYZ7yiqUfkHSeYZphHvsSL8bbk=;
        b=sIdY86kXVvdxyFSEF0nH+iwd2qZ3xxMJfoS8sTvfj5etDiJcaTq6jbUifoxyn1/BBv
         zkUdHNNmMEgqvK6yUxj7bFPqVHL6M8hjWU/3IyRGnMFfpIA8hooBQAMhZHeL0OUnYMy/
         tVzvLZNvDTKh4DIpjvU8DRGR4dq6NhZfZdvrJ+Qan2Sv6GZWr9VNOYtntLw4PZ1HlW6k
         IJ4YVPP9C9FZ7ph/eGq8g6V5WCR0euG96Df5vNmF+0TDLQFfvizYZAfNmLsJyvWi5P0I
         sWrKVwbRu96eijYj5aJGX55ZfUAm51cBW1u98sCM8cL9HP1eTGYXIg7goSfudzgASyAu
         ZGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727190; x=1791331990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8zcsJ6JNS6L3slLlgYZ7yiqUfkHSeYZphHvsSL8bbk=;
        b=W4Mgt3heLnA52+oSZ/3tNQFecaU2UWPqT6OgW2Mp9RUqk26CEtLpdH14rjjiD5zDhT
         D1zMbdZW7muwyU661SAKpP1rrSBzqoIRSTNVT0mCPd0t3xM3hdP0NzXpOXXyiTDmLFXC
         vMZN1nG6mPHPoFauZ6ux1PJWCoXzxbgHxg3rwvZN/IwYFlDLOnmxoDGnVw/lPepwOUyM
         2tV9gTreH8DI87cihz1W35nyyBBR0ZmMcSMDnhn3NfPgY/EqWR8qnLWg+otaEGXciDbV
         UEEMspxEBfj8HJg8veXp5TnwsWFBwjnJkaz2DWb1LbVqCl0y6gSEnofkIzd1vpLU4i+Z
         A2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5gWm5m7zaArM302e/uoxZTw3Kl76jr8n5CIlDxe54oLDgiqwULZYmWVcKy1bd8/54y1nMYnbCZF5w+CyJvDWb3A==@vger.kernel.org
X-Gm-Message-State: AFuF++nxbINgB2vo2JsZ90CIsHyJsMEOAB03joKP04WdU5jrLxRr717/
	DC3M9MhWsMh3I/2SQ6ozlu2DXduqRHoTYjmvfedU4Dj36GEIscNwyroBOkqGdJYvAn8=
X-Gm-Gg: AYBFou0IHug4c5bNbkDKk3j671UOtqHljsmgiH9NAVsy2WZhzvBUiAWIfVTLsqqf6oJ
	yrfi1s17qBu5fPjHbgPkvUtrcx9akhYCTJJ+KF0FwW7pQYpfxqRA6Fe5ITvd2f1xV+X6LdI5Cp6
	jo0+2C4UKW++8jiNvHgxtd4lQRI4H2i2GxJbFYrkMHeq6Rgq11DvBvkqrmw6BlUjaRvlQyqriEQ
	IEDmUuhawryWv2w3m0dkZI9ZjlxtHy7bmkiugdC6TklzApXSu/yJoxQ9h8Y5VDbrYf4b8p6wsf1
	+N8gAqF7IziES1CSOFVvloGzJ1qPQsdf8MJiaIuXwGIEwJi83OG7EB3GyK5wLTHguYipYtaO2Qs
	pPl2hRMDztNEqXpw9iQeThozEGI+4AnxfCrroJSApyaBopvzdxmuwLkEShrDIWfSDQI3Hqj1wTW
	q2QkNKX22zEGYaOxhl8WFtLjG8zIJXp/hgqEzx4Khcd0J2jXgFfVO+RwP6fLmM9c3s9ag9PzGSm
	JqNaUljNJlx7T9w1BcMk1Z2ZPmFCoTjqnqg3/EUwfSxOt/J6qNh5MvIc7iA+A==
X-Received: by 2002:a05:600c:800e:b0:4a0:3c3:1ad4 with SMTP id 5b1f17b1804b1-4a01502bd28mr12961385e9.22.1790727189896;
        Tue, 29 Sep 2026 17:13:09 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:12:56 +0100
Subject: [PATCH v7 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-1-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The PMU interrupt generation block introduced for the Google GS101 is
actually a standard Samsung Exynos IP block found in older SoCs, such
as the Exynos850, and is not exclusive to Google SoCs. To accurately
reflect its origin, move the schema file to under soc/samsung/
directory and rename it.
Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
string to the bindings. Support for this block is required to enable
power management features like CPU hotplug and idle states on Exynos850
platforms.
Also, move this file under Exynos850 SoC in MAINTAINERS entry.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
 MAINTAINERS                                                       | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 70%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c02b919d6ae..137297bf508b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11298,7 +11298,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -24629,6 +24628,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0

