Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378113176EB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121643; cv=none; b=nQkTqGXRYGe9S3TGTqQyYJzhnwNGDARZK9Npqw+sgU2UGbmdkUbQ+PkSzmHkx4EpHMqgI5Q2mw4HZIoTE66ifqArMg9aK0optUxcUodaI8zx9k/py4SvZCSaetdVwNo0Z6Cci/nR57AoS7v4tVHSi6oh8vZApE31gHCCTDbusn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121643; c=relaxed/simple;
	bh=cmENj0W8XtjYOV93TTYCBYmHtN9YboPhPdx0mxFR9/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfYw7nMN8A+K0qphH0bKUEMDKEFQgbXaskj51dHOBzarLZgGmbFF+AG0yg+eIwE5bI2cWoS+IMpIgRzHEt03FuPLYFH+oU5UAk0LI6o2FXPfvHiF0YcT27vc62fhnXqX0fbsIWwt/swg0pQVOVcOsDJ3n1g2yoyE2+Bdt+MwwHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXcqUHkj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXcqUHkj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b387483bbso1575603f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 04:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121638; x=1763726438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvAB0mCQYQ8c80Klm7WQAFVp/EeiM2LU4sVj8vpf494=;
        b=UXcqUHkjHeabVmeDd3wkbv5ji4m3n0Gxpl44FqVGrhtg1SgsywepfgWDr1Du6a+2vF
         /BwbqZ2Cb6mxU6uXuQyqzlAC+k9VoE/bjZByUIBBn9MLVcW82PtHwP/yTkig6yerRZ3G
         OaozlY8G7BzVtsF9QZ+bQuqJc/zNXIuFyye7cDBc+L8UFMwDRFaN0tqpA9QfZp20hmyX
         N6fpCJ4d22NgX2Dy13KA+k7bfVPuHor284wyWnVbNfbon/QrDkoAMLrnlBMD8TKGYUwk
         etbhXgj88Ob3FLA98hpCvnGfvNYqTqq3NPa82zzHyTiuGq7L/ceOE+k7oZIYpUtZc+s9
         bmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121638; x=1763726438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UvAB0mCQYQ8c80Klm7WQAFVp/EeiM2LU4sVj8vpf494=;
        b=h2FUwb3KHNfg2XSb5y3Uj8JFi2YUB05LnsFw6xk1RCfq+1+6weJl9Q/sQBz60WEnvG
         7VDX64VBfkqpa5LvSFSHmmm5S0luxrHSbqbghlATCWo/xQUIZ2Iy9GUSr/uMbM3GgD7V
         RD0ZU3wxxx0kcrjoyn91RsTdHZc2taygS7uM6DTWyNxdVPvqKS92rp/tVR6quojwzIxU
         22B+yMLMnOX5CxAxlUdr9eGLgYLd/xGFFZchgskl91Zq7aNfBUzfr1kufwM3KwUjqp7s
         7jft0VOayv/aTPwEac2i9iJRD7007k3H9Bc+/VVevt/hup0ja6Nlt1Qjburj+L/l/NQh
         /Hiw==
X-Forwarded-Encrypted: i=1; AJvYcCXm/I9gFiJwUorF7F9fokX2Z070a0Xc2gENwjzCGAvNDNA/zAFJpVmbwZq+8l1zJxNIT/VagX6g9NCC+HpDmBV++w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2oYdX5C1EKcxzgp9J3e+LXjdxMZV40x0I6y1CruSHNBnd6uYh
	rEpzswT4S2xRvYK/GdOEpRx4V4bdIWqMJzGbcd5jNHE/IMOuOeWbRCjcCz/CFMmYLwg=
X-Gm-Gg: ASbGncvabsRn1ACGGxVJ/dz44ZS+aXjwxMuHRfFt6AtlLhPdn006hY2PLapCdzKruFb
	IT066Xu/v9PN2rmasQqVW9JZ4M4Pj/oSrKGePU3uQSWlMZZKy/WLvYFTNG5i5Jy62+MCd4PrcAw
	yDzF2Teakl0Zt85LTLZG2yd0pZIdSNzCFYrnOWZOj3fikHF8PaW42COYRNMfrNdOKkLNipIZc8p
	o+Rp3Lx50WEtv94ePRCxgXbvAWxcLVqVA1c/ibNQG7ug5beV1ez93Wi0mLrWRVQRn+gPNYNB/dW
	4OVtvBXAnqffBqw0s9KX0umdbKzPb4V9+WuGdaZcpYVQ+/Zv8071Lgy1CHfKGQm1Ec7i9SR0/Mr
	4ExGeIsbD4Wa4SbbCTAnFQ1PJB492Cu0dwKKF0cC1L4+EVaND5ZNwyfOcO/JeGplFv78NLHk6Lz
	ri3vUdoTf3FJpM3WWISv8adh9sTonTvZav+xkqw4mR
X-Google-Smtp-Source: AGHT+IFDytDOoxWCznl5GNdQ7r3wEaAqpdygs0quJMyPhhtYCqkt8A4W3XGhbVCI7Rkl0znQmLbd+g==
X-Received: by 2002:a05:6000:2890:b0:42b:30f9:7998 with SMTP id ffacd0b85a97d-42b5934d76bmr2913871f8f.27.1763121638277;
        Fri, 14 Nov 2025 04:00:38 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae5bsm9487578f8f.8.2025.11.14.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:00:37 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 12:00:17 +0000
Subject: [PATCH v2 2/2] arm64: dts: exynos: gs101: remove syscon compatible
 from pmu node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-remove-pmu-syscon-compat-v2-2-9496e8c496c7@linaro.org>
References: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
In-Reply-To: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, willmcvicker@google.com, dan.carpenter@linaro.org, 
 arnd@arndb.de, robh@kernel.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=cmENj0W8XtjYOV93TTYCBYmHtN9YboPhPdx0mxFR9/w=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFxnhnEbiRUV2bxgCurkMI1ULYwN3pjRsDVkQ/
 Iqdy1H47GmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRcZ4QAKCRDO6LjWAjRy
 uphND/93WTuH9XIpzNaqeJVvHv8NtS/9c9v8swUUO444EIliwGiCxxV/coXPYhWI8QUrfPTrqh+
 1Bf3ymdvHWfKrjBBhR1/QMZ3bI2I8JYczEvAtxPSpc6qUqmV8ET09puYBhtdQERfJpo78+hsVg8
 JfJD7UXGuSvpq1fITtC92c0aUIsHGcid0RXoFFTlOyaG0nklcSIlwmyK/2d8DzxQ/28HOy6+omx
 +ysHJkTdoG3pd9ErIYABY1NmpKOQX/+bKmTZ1DIGvXw6Er0xtqd6Rzi5cHdSbI9s6xYxIi6gb9i
 EZ51sbexkWvVRRXAFf272t3IS7voZ/PbJef4NAfopXrjojS8fUT+AH4N6EX3EOj9Hgg7aJwWhp/
 eFtbMpr5stHFvqWj9bcKX6bgJf21qrgr4KpHDKkF8ZoTT5mzjoAHY4gnfJJHa6Dm/CWzyREyYtl
 kwaFEeZ3HmCtAK3vi3NVlGb51SqMQV9YRJJmS57/Rxs/qNBH8/CGhDhKeqeVq7p+vOdTW0VYuOg
 PaUX8ZHsFl2lbqbbW9UGN92azRbYAZePGPLcYMDFLUEfnM2Yl9Jn+pc7eLweT9C/4rHZNxomI12
 Cm5YGjJm64UpUNmTB6BkvVanUq7Lf1fAmB7hGzJdjCJhaEMPG63UchaVDKttcdJDrLeSRxcG+2y
 zWSCtDBgHgBu0UQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

As mentioned in that commit, it's not correct to claim we are compatible
with syscon, as a MMIO regmap created by syscon won't work. Removing the
syscon compatible means syscon driver won't ever create a mmio regmap.

Note this isn't usually an issue today as exynos-pmu runs at an early
initcall so the custom regmap will have been registered first. However
changes proposed in [1] will bring -EPROBE_DEFER support to syscon allowing
this mechanism to be more robust, especially in highly modularized systems.

Technically this is a ABI break but no other platforms are
affected. Additionally (with the benefit of hindsight) a MMIO syscon has
never worked for PMU register writes, thus the ABI break is justified.

Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 - Update commit message (Krzysztof)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..e1a7d33fd4a369f7b352b81d2070beb62a0ced16 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1705,7 +1705,7 @@ sysreg_apm: syscon@17420000 {
 		};
 
 		pmu_system_controller: system-controller@17460000 {
-			compatible = "google,gs101-pmu", "syscon";
+			compatible = "google,gs101-pmu";
 			reg = <0x17460000 0x10000>;
 			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 

-- 
2.52.0.rc1.455.g30608eb744-goog

