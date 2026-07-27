Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF14156FA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158629; cv=none; b=F8/53SOn1pJOUxcE7qI7BtQBdmnUJ4uFoJlFWaJWJo0Lwq4f/NYTDaHhgzQ4Mqqt+5NdwJTU23oqG3SvWHQLc2bqxiWbBuxlLreq2YVRU0WGK6HgqcgbMDiUXcedCy6xrnJPu6kSuYHZ5yxnZtotyW6gGdypTt/UHc59T4zkCJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158629; c=relaxed/simple;
	bh=QAqNaSc1EDJn35zx5q//in4SCGncZ9UeqeQhov+Gstk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7/Yzb378t2ZB/48bDOwkotiidEpdAbI4AgqdoforPX+hZPFXMQqqCwASsqtdhirlNog5xTt5wrb/8SavRYIBBYxILWrWxNLBXmuTAslFTy+diWyGJFXex82rfDrhLlx/ErXDqiOb30/6U0p+ujSq0BtG1o42klefD/H1X/LeG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMvBq0HI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMvBq0HI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso18151715e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785158626; x=1785763426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqApU/iRRg+SdT6DyB55HRonKrft0AEH9exH2EvMe3w=;
        b=GMvBq0HIXE0VUDMD+UnZTkQYKNv2/vI6YY+i/MHcDGrx0gf+NMEv/Ml4SEnGG8L71S
         08i0B4Z+3NgVTAk6LqnBQ0SbdZm0lE8NwzRyJKiPpPKV//NWpJ4ZlV17ATuDjt+lvOr/
         2bRUKuExW76nPol/xnmeQ36PdGndbVsS/c3BN8/SmXlWmokEZv372EfyyM85ofjHeffs
         g7/2GOcEeOg99HTsr07mt0ySJDXDyTNr4NCl18bMfUNM/bm292YFHGuqOyYDkj6CW+S2
         kSSpkuhbs0Of6+KGbv4IRuvq2kQgft+v7xAd469bzSPNDqAFUoImM9lwLf+9C/ispurc
         4C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785158626; x=1785763426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqApU/iRRg+SdT6DyB55HRonKrft0AEH9exH2EvMe3w=;
        b=LxWpE3dPS/R6eX877qmkgNVLABKQp8n9J2Haro9jAi9XmuYnWKVGOX8Ngg/8Q/6kL1
         jtAoXP9wosno78O4aSZ4fiC2YujJVM+CutKSI5HyyZy86psD1bKczBYqW1cE1/3eTeG4
         Mh3UCAdZwCxU2Y8bz/tdkznNvJnRoNNSA/PICttMzTA5XE7TEctVxSSftHTg3zqP92hZ
         UWtr1gCxbUnMgf9GCbGSdmogRzbX6QzvwoRXbQJQtustzQn1Sm9njxIX6nuOfm+RKtXc
         L0Xmqqx17INQ0G1OCIpldGVt5ECS/I4MYaJe/jp4/W3DUR/vKmqpFukBsqju16E48XjB
         ZUvA==
X-Forwarded-Encrypted: i=1; AHgh+RrUZ5fEPStb9fzhaMLV7O1cm4biOEex8GkMsyT+REwU9LFY4PCND5cosQtKRgA3dOQQax+sADI/YSnfLVXPTqu7dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsKKTK3DD1Pp9NEAb8ZQ5c6VxVpdI5vJP+CpVS6gdV+Sbp/aDc
	OMIDk0DMFBM97Kb0SLqAQ6JkCN1Id191PTRhBJzgzbqn4xvIKq3dZ6cDUfBc87NiVxg=
X-Gm-Gg: AR+sD132AFuvSTmBKwwebfqjXJh9kxtZegUht7qvmxqfuz269WbnWLVEWzHlCNdcMRo
	MrKj5Y2vUkvI4vf9BXuOzGVv4loCTKE3Lc+KD8hfN1wk3Fur9KGnGbZMeCykJ0OI2wxJxlc6weI
	CkXwwAh0wsCiGPIzPsByhaWyopOp9gz4TSiA4vfhtnLzacmNc3xUjts1NKM8jVjl8AJO6JUqAix
	52afjwJb9qfQNetIAWHKxkWIQkbOOmhJ2rYz0TuZSdClOt2/4W77ZWttyUGL19WLJ9/Bru75Y01
	ZeWCpNkpe7HgawCoSYjUvW3TajpFy7zY0q+v+qUGjATYV6qMTrujzKveynYsf7OZ6Z3Cbp6Uvrn
	Jslb2k6HpNN1Ou23khUsYRsdhv+iGbPjEX94kSu+3Hq/7LPdehnpH4l9G16dSNXCXQVCeaGvY6N
	uzMJnaXyW/UlkUip0vOehAP4gnk72bgrcpRkcPqX0VsuvoNSXYIwSiHn3J3NpGEVOFdw==
X-Received: by 2002:a05:600c:4295:b0:495:7990:a1d0 with SMTP id 5b1f17b1804b1-496b571a0c6mr69990155e9.19.1785158625718;
        Mon, 27 Jul 2026 06:23:45 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm224730055e9.6.2026.07.27.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:23:45 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 27 Jul 2026 14:23:27 +0100
Subject: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..0b614caa411c 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -163,6 +163,11 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		apm_sram: sram@2039000 {
+			compatible = "samsung,exynos850-acpm-sram";
+			reg = <0x2039000 0x40000>;
+		};
+
 		chipid@10000000 {
 			compatible = "samsung,exynos850-chipid";
 			reg = <0x10000000 0x100>;

-- 
2.51.0

