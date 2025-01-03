Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3E91BC099
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jan 2025 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735892756; cv=none; b=Y3aXl4EmZdmlBHYh9eFiGPn45DTFa1ANLx2x97NJX3EXfhF1zgJJGlCurjzplP9RwrsqYPyKHSOvV5G6OFjO7qdbJWTHGJplS+ORRVIjvy6395BGwnPmakbqyawFOcxJZlnBgJON5668dm2xJr57VrBXAPyfcArR57Zvj0bFxfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735892756; c=relaxed/simple;
	bh=7YlwamCaibMj95ILlssS/xUUvQn5etKq5v5uqkI4QfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0SSDcASevNoFkgO7CLLkZ6vfar1TkRNDKd77XSGCmZ8u5iybARTUfHQhKtj+NBQXSIigpS75khYOHMkzePKXKLZj4HzZzVvY9u8zr6Mk4IMFypwuU7jsqM0JYwmFOg+94UkBRFYOtGoeVoRKj3X2V/Fqs4+6e/2kEZJLbqN404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DR01zJrs; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DR01zJrs"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa676e4f36cso145480966b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2025 00:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735892753; x=1736497553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYNO0guAuD1jSVG7+Mn2jJuelOVJmSNitmxA0BfO1/0=;
        b=DR01zJrsc4p/yjHUx0aVGULOSrYMt0JMbSUnLYHSGwbsdInrPUVRqQWN+R161pRUyA
         cFkNwCnKJORPquWm8ARwFQFZgwXFeUNQwqHfD77eKIeh8NxBWi9hsySQUAsaQD7uUOs4
         oUYsE1Qm8dWmLMBUR+XhKhALOPmxe+BKiKJDSAKrg3bIc52Vh81b+kqcAGU1jiC+sQr9
         8D5kuv7ExFEvJ5Rdok0jrXQx2IpYcybVASJsu/iZO3ZajkX3JZ0erZzs1zDQBrHx2Aow
         bQTXf/wn1JveAg1Xl9VAtjjpn67bEp2mLuJHuwRAYb59yRQzKU7A8CJGOZggPpCCyY04
         GVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735892753; x=1736497553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYNO0guAuD1jSVG7+Mn2jJuelOVJmSNitmxA0BfO1/0=;
        b=XP3gRThSa6RbYZnC9OLBCpsSQRAdbjhOj/j+Wq5wSVf1D9sTNPAAHnysqEr/xzy4Xf
         nlQhDYnKIhRWY+jvUPES6sthNZxvXm5sQ18ceRt0SGAMegVDxYs/xG6sbwtG1WZCf4ef
         ylMrRpLysCsMEwMFLjuyIbyB6jUSM6tC1mKQU+TZy1ISGy7N9iTiIYg+bOGRXECEpcFu
         raSauf+4l+gLKKxV2qISGLy6Y3BzsG6pXZC5Vy3QgM7i4l+cd9cEsgB4INo5SPvT589j
         FeyAIjvyJ/YlTTamUYLuzI8L2LzKQUCjZDdvR/P1Pj26YkyCGBSs+sw3OwJeo4VLhfJg
         FMeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtmiKBxVQF4McWJuFZJlifDjOSVM1eqhf4GK2ZGBSJEO3ZyHfB16PruF2aMQmSwSNoYbd6FVhPL+u1eiRMjAlAhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0IPv0ZWoY6xzGZlHW4IUr87hNMFk7ecwFfgFPRUR8/CH+/Ngx
	I3wk/0mjHoGGb2Xq87PfMIoEdljCUyzicT3QC2XJkHJbkR9XM8D+QcuhQZxLpxo=
X-Gm-Gg: ASbGnct+0MrUtbl+sOPEBVZ0g3+L/qqfiMQoRkUYX3t3L2mAXX+hM/SVw8iFZS9qtNn
	xF3D/Zd2NxC/PQoc/Eu88lf1ZLWF8WHwKzkc3PJpED2sigTgkVSVXo9e2w3++0ed+kDjCQZ4q0A
	8/8FnXnDDloLXxRd0Yu2/4u/ulyeB6XXq3Ok9FR3PhwB9IV7hGPW7iAXWsSjo9AU3bsR/numT2m
	NP5QeF56XDYn0KsRWbzIQ+UHsv0Dmn7xrYMmXvegRZ5ipjBqwdyx4l9uxtiUtUbcI+JBPk=
X-Google-Smtp-Source: AGHT+IGWWm2fDcYRYaz/N7szhgJEWFmaFTDYJU8U6ZmPuis5+d3SHG8JFgAZM8+mDcm3BEoTvblddQ==
X-Received: by 2002:a17:907:9692:b0:aa6:91ca:3674 with SMTP id a640c23a62f3a-aac2adb92a6mr1572179466b.4.1735892752966;
        Fri, 03 Jan 2025 00:25:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06dc7esm1868462866b.193.2025.01.03.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 00:25:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible samsung,mode values
Date: Fri,  3 Jan 2025 09:25:49 +0100
Message-ID: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"samsung,mode" property defines the desired mode of the serial engine
(e.g. I2C or SPI) and only few values are allowed/used by Linux driver.

Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index f80fcbc3128b..5b046932fbc3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -64,6 +64,7 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
-- 
2.43.0

