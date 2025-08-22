Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5428E2FB98F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864876; cv=none; b=Ym8ZQAzUH0rhsHq/H4cuza4LEKFU5u96+PoZC2vc/cfw3O8JXmhaHcrb4+NzV2yfKdeEgwcyX72e0CJbDeTyLakdonCDnsSW52FbrOXVcARoMXekhXBbLOjQu+kd2EQ8sBAL27o3lC/d07MOq+nA/Nrf3unLc5ccYfcLlYrgcAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864876; c=relaxed/simple;
	bh=o6g4sH8xwOZxvS6dJ9XIqGAPSYO6MiZyEWLPUzyiJHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9ZncZ4vcFyX0esXqPzK2EPvvkRk3coA7tUFxbL3cH8r/duSSB2mmKx+OhTBTPKi0oRpGXC0ZFJCftJK+qCEV6xsPXCHsNKYKelXtKrEwpJnBvTKL6Vh59AEcLIIeLYa0ro4h9iUn5Y+vwCltWifKzArJinvwmX7qVwLq5dIRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QMXyEwT2; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QMXyEwT2"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61a20bd7a72so331138a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864872; x=1756469672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6N5Z6+PPrN+8tmcPK9l7I/hMUuaNCiAWjah4ZlXQ5Y=;
        b=QMXyEwT24PVQCbRPzNDQmycgq8GhvspO7aCLxQuqTSwqRpCQDINZbz4qe/9FSWJo9C
         rQ5jVrenUh/okt63lNRk6PsTKlC/N7O+uLcIZ9rbNTZ/YxOALu+QbiOlnMrbMw7VYxY0
         wgGsdU3G3gjC5PEOkaDdimKpdiv0nslcmY6p9bue/hJ669Xj26glilr7e7i1MX2EFaKm
         ySTPc7gFwP5/J54k++i3PqssYP153AaOeIfQfPEyLrC1Py1G7m2iQJFFvPRFRDB0PXfn
         VRf9OaeHSyLzVxdEDtXRt370Vt88dZOdrcMXpV8pgUI8UqR5WCd/U6OFwYhk7EHMJhL2
         0l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864872; x=1756469672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6N5Z6+PPrN+8tmcPK9l7I/hMUuaNCiAWjah4ZlXQ5Y=;
        b=WgMkgxMpDaEM3/+M7mr0jCydJw0XQfVko9DoKc7MQHxnNh/gpsB/IZ5TCkxyULp8WA
         EV7qXELCURnywWGoYxbnPD/Kj0kAPFmhiBU6sNnJr2f5I98/2rYTTAvQIncgkMd+oFb8
         kTh2S5zlA3zd56OsFGwLfWIqJD20NYInxKSD9IRzfNRWu37FxZhjFivuqbzjQyCB/BGh
         EwUs4gpMVbGnzTntpGaODP7fvZRXw0LJ18raBxulYkZlLelXkcXFGnLdLhTb5RW3vZbw
         h9HKtjFLxco1BYQeMf2uDUKFj9gom4QTkgCMWYk0DIcasfiUz3IHwv+Jh8POwwpmUAYW
         JEoA==
X-Forwarded-Encrypted: i=1; AJvYcCWTL72TPHyL7E91JP/22FZ3wpXcfdDxr/PHMjriEXKTC3OMwWDDnbeiF/AiBMhjnnZnl7S627DIf6OrUuGxoWDJSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQfk2wa03O6PF2vtCXtlF7ycZa0qL8kzaNxxlQHqiJJx1kMdiY
	E3NwbVlXdFEmxp99cH6zFylRvPO0J2uxNW47DRUpcnIU4j0UhgT8b4/AsbtlmmKxprY=
X-Gm-Gg: ASbGncvsnwXrZAeqku8J6vQjNW14g7PgQpuZ7oAQQx9Rjk4//bMGsNi5XkWz3AH+WF9
	1s8AqQuBTFX95MmFgNcadG/gQoRzXIp4IcndKS1sw4tgdN5xxRyUvFkHdGInwVdMgxpsFyW3Obh
	84yws3Rd7M0yHWBCKNtlqkMkJYpvaQBL8eCN0fsK4yoYyJ15nMA/bzOpU0sAz4ZN6DgAQJtpNKU
	un0IE+KZPFBRA/CL98aIW4TPXamKWGlo5dP3EiidfetOBtJW2gsqP4+GfvGzucNwh2ouPe1OC8R
	mST/qQT7M9Dm2dsMlacEbskWdAV74ZVMhE+xO2Hz37Ex0i/lS9rMVvDMVyTnTK0rWmajhVFJWSw
	W/pf2RZ9pvsVXYVOM/024KuyE+5CdSPkQWw==
X-Google-Smtp-Source: AGHT+IGIZr3bIv6eaIbf1dIX960O0mePoQhjaIFsVAHQscZR6OAVAyxebm4Tv8WtSLatPWQGfRyMPQ==
X-Received: by 2002:a05:6402:5112:b0:61a:8b68:c01c with SMTP id 4fb4d7f45d1cf-61c1b4ccd85mr1211548a12.4.1755864872537;
        Fri, 22 Aug 2025 05:14:32 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778c5dsm6842065a12.31.2025.08.22.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:14:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] arm64: dts: google: gs101: Add default GIC address cells
Date: Fri, 22 Aug 2025 14:14:25 +0200
Message-ID: <20250822121423.228500-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=o6g4sH8xwOZxvS6dJ9XIqGAPSYO6MiZyEWLPUzyiJHs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqF8gR1nb5IgNLVHHNEvXLhk3sUV6XknUzyyYq
 M+ZiJ8wRp6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhfIAAKCRDBN2bmhouD
 1/q3D/9o91Na5DN7pJ8BWw5OySzlA3p+PZZCA0SrZfmVb/+kEk3YlOsfZM0s0U/Qs1HgujTv94W
 X/e1SoQ5634ngY9XzVi5L4paRCJJK2NY5hPnYtr+HbdnfQPi/aDVHkbYupYtwB98OmqXZFsoiLO
 PL0Jzuju3EPhY37SnY3nSvnY2gbSywewrj0bxUiIw8hKlrAZ9wwxdue3XkszAFvCj+KsUWr4uER
 lD085qYnarxWchBt3QeZfE9OVIyKdHe75Pnzkoi+9VS5LoiSAVCcG+K6AxYQihZcwvRJml6ytI+
 Z9upgrNHt4CWOLYW/zKzvFB0HpEXO6zUh5Unu5Vx602PF/XbUYqzqsBK7xQLlbj2CcQUREdF7ll
 4RnnGs0TpdUC1+1SX4TTIG47toGnNFQ6kq018BbWrNERIDKGPQehNFJ8Vzraq8qO9vBYfl/X44X
 kQdGdJ93jKHKGzcL4raJZo30tYwy/rHKbOVCkQWZ8fqF5NLR3n5I/y1DP4WxdnVbqKsWUBDSRM9
 YR5iJFOFbPkiIzDx6KSOUCb7tzUJY6hjCuZBAejjdzJ5xrFwATUhoQpeZ1sZaZmk182qyq6KDDY
 E4A0cJSgsqP9+rq7W1UE2Mfdl7JbGR9z0r/aKjoA2STmCXX9RqvOXH7IFhF3FJM46BghM7Fc8Ha HiBogtOwSFCZBYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
because GIC interrupt controller does not have children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c0f8c25861a9..31c99526470d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -341,6 +341,7 @@ watchdog_cl1: watchdog@10070000 {
 
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
+			#address-cells = <0>;
 			#interrupt-cells = <4>;
 			interrupt-controller;
 			reg = <0x10400000 0x10000>, /* GICD */
-- 
2.48.1

