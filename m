Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705D61F418F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320225; cv=none; b=tI8Yl4ATN7p3sDqmjoBJZsyg0Lz0LXTU9OmLOQN02fE0Ekw4AMi+ITfIBrMl4L8I2CqkKO/J/yJO30W9HHWJ8ES2mwhMY4osPuEO7w8vJDJ9zGkbTNXfgAYPmIik6ewTnVFBt2g16cQTtjmCSM023QqbJq5k7aMFlnKYU2hAUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320225; c=relaxed/simple;
	bh=2/cGZtwwaQu+YHcCE3TqjM1V5QCsE+O2q7sflQ8Skes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLgdNCH1Uf/zdkvhDERSTMMrK1KtjbS8MSB6O/hP4KGy7tWp7XBrJnJlDNOsUTkcgdcrTqYbwYRViL1R0c8rU9CacCjfRYULcokoceiZ3rWDnS12BazQYxtZqIis4T8tM5jLZj8dCxGvylMvSk/dgOiZsrf55pez3/OyZDIJnN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=0OduLDql; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="0OduLDql"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=0OduLDqlvmEYjRfnrz9Jj1+yFnUaeyDE/SDc3GvkGtQofEuYUMXEFTmSIVI0rCxxDDMfq1+JDKPf5Qla9HHR12vBYJKmhvq5dEDSDWOw+4TGccW+WsFGdum1ki8rbMFxcZ9hnoHPAERaYpDoe8DriojXLRn3e5k8cmtW8Crz74ufF3TP8a2IiinkcPkpTJXEYwwu/pIfuIJUXRIe4mIQm6s0GM8aSBDBnC/jf4bE0VtauoIGFzxqlqh2TKQqQ2iWqSYIBfdIWgyHhaW56ZTnSP6TcpOTH0HE13R7Hp0oL067si/jBkC0rLew9Jux6LS/uWB+o1s47X3JA0bViaSXKQ==; s=purelymail1; d=purelymail.com; v=1; bh=2/cGZtwwaQu+YHcCE3TqjM1V5QCsE+O2q7sflQ8Skes=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1985443548;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 May 2025 14:43:09 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 15 May 2025 16:43:01 +0200
Subject: [PATCH v3 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add
 exynos990 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-usb-resends-may-15-v3-1-ad33a85b6cee@mentallysanemainliners.org>
References: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
In-Reply-To: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747320182; l=1286;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=2/cGZtwwaQu+YHcCE3TqjM1V5QCsE+O2q7sflQ8Skes=;
 b=IFpvQcMNLGhVIGVMxkwkcOJEhsgCa6xS4YXYhcKbT7+BkFZWHG/d/F9tdP0Pt2GiW0xSLHMJ+
 3hkft3rI6B/AT/pLwaCvIKBaE7NtuYb7q9v7pvSEhHBe7mM3Ts2K0oq
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Add a compatible for the exynos990-usbdrd-phy. The PHY is compatible with
the older exynos5420 design (two clocks) when running in highspeed mode.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index cc60d2f6f70e32ea745d523c8a74022e4fb747d2..e906403208c02951ff2bf5ed8420d53ad70eb29c 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos990-usbdrd-phy
 
   clocks:
     minItems: 1
@@ -217,6 +218,7 @@ allOf:
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynos990-usbdrd-phy
     then:
       properties:
         clocks:

-- 
2.47.2

