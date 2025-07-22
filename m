Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2E2E9EC4;
	Tue, 22 Jul 2025 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187042; cv=none; b=ZF5/bcJwp2L0r/7k6rG7jhQtEYswLY1oU3D7aaD9FGFQoiNG0OyAg7KclaJ3P9NLxgar2zQa/tXgfBWFDg4oWliiSQkoFkJIWB5CgPewyB5+f68jNfln53fFD5LL7wMfJjh6WcpYchsvxBIefZUQO6UpJFn4jHDPCu3I1pZK63k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187042; c=relaxed/simple;
	bh=D6lWi0SFMm3ZeiAM6hICX8hB7Dg05k1FCatK9Zt+nHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxD5PYUK+ythyPZrxEi3NPnvzCd4wniSTgdxkb4TcO/+sniehdzw5TannjzbVwkLXEHW93+eTd9THyV7X9WEJ/vjlQKqvGv7HesUAj4FTOU3U8aJnyEEo5XKoIw7yxoXi5GK91waJ7Wjs1vEnWM1gOhKMgLZdVvGY53kwjz9pKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/KmS0uv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/KmS0uv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so981989066b.2;
        Tue, 22 Jul 2025 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187039; x=1753791839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4/g0FAwfoBc1ZpFJ33DL+FpXxKqFt7haerTzfBfI18=;
        b=G/KmS0uvgDQEvhqBGgm8rqI+gK0b4mnzfClKlP/z8mjUFtbwQlYPDte3ZaukVjQMSS
         u+tnuDStS6Sm12Bd72aa86UkIsQLB6q6pwx1+0wX1behU6R5Zgmr3AQdLVzAo5L9oxrE
         RkoFJ2iO2HfxgUmhEv9nrDVs3Y8d1CGZIVJ8NFs/7np2bI1LZCmUMbTHonBLCMSsn/iR
         Ytivh8NbqCSXMoeDeOq57hPasRPbzk4ej7MNTM5/WA15tYyW+UJq5E7yld36EzL30wVt
         qS0KPXP/SgvVlzrLDgqwX52q2A0yWYmUL6D03FjGXFjZy0Vlj8i7/NR+oxk3DAuzsrLY
         Fumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187039; x=1753791839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4/g0FAwfoBc1ZpFJ33DL+FpXxKqFt7haerTzfBfI18=;
        b=gejkRY0OxUzLzpGdjy8B3oJ7xczDE02aome7kN2vP/jq6u/z2fVA2Emzroh+LgEn+V
         4Ol3zqx/lWy5yQi/K0SNLhUyX4NCM7HQ3iPWPx2VYGEv4vQSshbnYZYU+xD3GzBD1rq1
         yZ8WQGXyYEe5WV7iUarG54olOB17ZaUHuEDsuJTAthLmKYBwrhvzbNXY8ISXtdpbEyKN
         i+k5scj8NsMEDftiW6UoJkWFhhwTyPQ1r0cLxw/XH2VJgwiZzV4s8esoFWEoxavPZH/H
         RIlbiqQc6PjVMt6XhSPthRRT2tDgjP/vmvFFS//0/4qMLBqIRooBsUGBc/op4TEVSq6t
         m1yA==
X-Forwarded-Encrypted: i=1; AJvYcCUSuIVhReyIbAriFkgk8CK2h5XnJfvWfPIqsfoB36xD8bDLGIpVQvoDoEhSpH1xFkT4uLPYYdjf/7ExmP5t@vger.kernel.org, AJvYcCUzMLDV8WQBkfFJ7x78rcNlb3RREdNgX4ui1xf+H8mX+P5/4R846bBT0Q3iN10LIZpkb6YLTYO6xqPY@vger.kernel.org
X-Gm-Message-State: AOJu0YxU17rhUPN5497/edUgTO0qE6T2KRifE4v9+z/auwpmt5v9oLcO
	n+UeK0FcausMArs6RUuF776q4JHUPPUO4P6Hf/lChVvdotCBbpleOcbx
X-Gm-Gg: ASbGncspk/eVC3+3oX8Yj6J+qimdV0Lccvgfvoq+y0hA5oKIkHtoc8QzW4jtbf5BVVS
	xx2EJ3EZwBCeSQHBsH4ZRLesIYvPFE8obd0Er6bM2X+wpPi1SaMuRGDumKYB9M4hmF17KM6sK4C
	nKTtQmeTkkLv3BAxN3hmW1cP0oxISnGf2rW0pNTv+Q6BtWfy5TyIzXnXjOynt2HRFnNSMxnaw5W
	LP7eBes6cVCnY4ddhZf02XZj9VzCYZgpKNajR6R2YSB+BFV7FtvDojaqfu7DWS9GEzmhMY9ADCP
	rORIYVrayt9MkUOA/Vk9ZkC/TaYYizbj4Qgyt/Vlr22NKq1JfstdcOoZB/1r8uWPjHdUxnWfXQW
	REXJ6uKzN9Ph2ic6WbF+uh1UrnfBXsLGiOCC+9C/rs6Tr6uqbLnqx97UszmYhS7rIr2YEGk8BZQ
	==
X-Google-Smtp-Source: AGHT+IH/0+iq7EeyZ4cfQy0vOAyEo4RQDQZWMuHPMyzOjkIohP5ikawHhzp0OBmAfeBSqYEsgXzC1A==
X-Received: by 2002:a17:906:c114:b0:ae3:e378:159e with SMTP id a640c23a62f3a-aec6a528140mr1630162366b.26.1753187038334;
        Tue, 22 Jul 2025 05:23:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a056sm861358466b.14.2025.07.22.05.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:23:58 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
Date: Tue, 22 Jul 2025 15:23:48 +0300
Message-ID: <20250722122350.444019-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some USI instances have swconfig offsets that reside over the currently
defined syscon ranges for peric1 and cmgp. Increase their sizes.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 6b5ac02d0..3fa183c5d 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
 
 		syscon_peric1: syscon@10720000 {
 			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
-			reg = <0x0 0x10720000 0x0 0x2000>;
+			reg = <0x0 0x10720000 0x0 0x3000>;
 		};
 
 		pinctrl_peric1: pinctrl@10730000 {
@@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
 
 		syscon_cmgp: syscon@14e20000 {
 			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
-			reg = <0x0 0x14e20000 0x0 0x2000>;
+			reg = <0x0 0x14e20000 0x0 0x3000>;
 		};
 
 		pinctrl_cmgp: pinctrl@14e30000 {
-- 
2.43.0

