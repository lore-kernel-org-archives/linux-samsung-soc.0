Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B057D26869A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739553986; cv=none; b=aiUQbu209N7oOkqkgLLwpPdZQdVoExnOvn1sm1gogdOIslM7cblKwutl+38hU8qsbItIIK4j2Rxx8jtAP/XzytFq2ZW3RieRjp6lDn3czQI7jZnT+gBpumX4BJ8T7vTDAPMQea26oO/YnKW21M0c1HVf7rv+Oy/w/B9KWvgoayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739553986; c=relaxed/simple;
	bh=iDXXbPWbID8m8JbMx1nJgBGgKzWTYtFCC6JsMVbw3I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEZED9xL9/fXmgOHLQNYFjADtDHPm/XCHQF9cvRDkNhLCSVQZTRZ1QdGVOmFdoH/9m49KGQXAXoY2jj/xkeAQct4+FZjm/L5eQTqJ0VuEcabgZR9pfaL8Q40JNiCpO06NXT03UMcr1wPyOFw0r/WYPT++THfw5ysZRhvfcO8Ivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=QkbdHz1Q; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="QkbdHz1Q"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=QkbdHz1QdCgSpPWTSSzdDhcQ12Mpzb59utA6h91owRHnT2MAWOnphp8Z3LIoLu79ypGbRkbZ910EeX7iKFLePZ9wWOayYNhdXZMDajXAJrJtDC7t4jJDAF4T+1BAlVasLG6DBkUfS0eYu+2P+w9tHQr/jhBz6zsK+zxwEqxPGiAPTdp34w7/MhfpL/epyVP2sOrkBqPmRIaQD5ge8DSUjUcRY7lg9qA/p/Waihfgj1ocELz2xrXYA8W3R3O8Q+2xBuhLgnKvbBWa34sEJkLFK18nh/Emnza3P8BzyIz8TTNlubGctmnaOglQgZ7jM0ScsVWsJfwI5Nuyuyki9AhG6Q==; s=purelymail3; d=purelymail.com; v=1; bh=iDXXbPWbID8m8JbMx1nJgBGgKzWTYtFCC6JsMVbw3I4=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1457029256;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 14 Feb 2025 17:25:51 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 14 Feb 2025 18:21:07 +0100
Subject: [PATCH 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add exynos990
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-exynos990-dwusb-v1-1-d68282c51ba8@mentallysanemainliners.org>
References: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
In-Reply-To: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
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
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739553946; l=1219;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=iDXXbPWbID8m8JbMx1nJgBGgKzWTYtFCC6JsMVbw3I4=;
 b=0CiJOuWyRSYcOvfmqT1w7uVi/46ykMVj0zRaUAklcpxVMoDlW9I9IdOuFpfRff+c4Z+DMXIob
 vBNio8EOCWBD6N76A5sGD2D0J0u2lDqr8AnWPzsaJgdg07rIrYlN5gY
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Add a compatible for the exynos990-usbdrd-phy. The PHY is compatible
with the older exynos5420 design (two clocks) when running in highspeed mode.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 27295acbba7674f6cdc402f18ff4c505bd8760f6..b9ba92b8975d3e88162b938624558b3fca9f4faf 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos990-usbdrd-phy
 
   clocks:
     minItems: 2
@@ -185,6 +186,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynos990-usbdrd-phy
     then:
       properties:
         clocks:

-- 
2.47.2

