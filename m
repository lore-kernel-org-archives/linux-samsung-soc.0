Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F6C18FC97;
	Sat, 29 Aug 2026 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787998527; cv=none; b=MJVNrtiNoNGxhV9mYs2KQGnPal/QSDMZ+PO1XekalqWrA953Wnns0ITWcdbQKIvXlYxIGCM3KTn3pOo0ltv0uzuWNF81KQnzSsZW9d/m6Uk2zLbteZmek3l10yeu8AnovPH3FSkG6ZqUKV8cfnoo8sQsjmfC85C6LD8rULN+ePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787998527; c=relaxed/simple;
	bh=0LHTVujrq1CsKZO/WoUYdjGkoWUNdaiGEWftAdeIzlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCji8O1Kxl7Ug0dx6kOV/JgKZ99aOWRhX3A6ncYCryrKU8neJaU13BJWzuJSio2D3n1M2bQT3eeg1CS8iVb9Rb1kkSlfDM+ghq4CRe32A7w9kybfxg5vB4iys8q5bks1RGXlBiuWDEVB5zjobXp2tTp7CdZ9Ync+lQymRYjWWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=ZqGNPIOI; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ZqGNPIOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1787998523;
	bh=0LHTVujrq1CsKZO/WoUYdjGkoWUNdaiGEWftAdeIzlY=;
	h=From:To:Cc:Subject:Date:From;
	b=ZqGNPIOITjQWzyL+NvuxtEQn4v4Fdsb7eCIibL11gt9L3Wdmwv4cK2Z7ZwxA/2wp+
	 E8WHqR0gr7Cd5l214e6tx/fZF5gbXXY9VHfEEAompHJ7MlU2YejoenPNuNvvX9m3xr
	 2ahk7cxxlIxz2opYg0JSMqCi1ju1tav1aYji4kws=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS in Bluetooth node
Date: Sat, 29 Aug 2026 12:15:09 +0200
Message-ID: <20260829101509.138284-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-rtscts'
property.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    Changes:
    
    V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node"
    
    -v2: Drop max-speed property. It's only supposed to be used in some
         cases, which don't apply here. As this was the "fix" for getting
         Bluetooth to work on my device, which will be applied to the
         driver instead, the Fixes: tag was removed.

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 8a635bee59fa..95964be7daa8 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -875,6 +875,7 @@ &serial_0 {
 	status = "okay";
 
 	pinctrl-names = "default";
+	uart-has-rtscts;
 	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
 
 	bluetooth {
-- 
2.53.0

