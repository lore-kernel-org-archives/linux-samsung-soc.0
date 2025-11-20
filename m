Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E92D12F5;
	Thu, 20 Nov 2025 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649814; cv=none; b=nmv8Aiy4/RD0It2av9DclTIhgB6MUzzee6SeO5D2BsbqphxmuQTKC7M4C3oIGnWImPWoBcgLzcijmPONw8eaaJz4MXted704R8nNoXyQe2YxVRgiyfI7xw7GRJkxeK5ubkOsD0cmrzOceXkICyQ3UWT2rWcb3r2SjkC0wM/4k8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649814; c=relaxed/simple;
	bh=kNqApYj/rT+gTO0Y3Frd6ynFyX8brDQAMxeVnmYO+aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7Mf6pKQxrfO3EXWmVERpU+yGzrC5QZAx9U3/6C8AP8OMVVAIMsSLunLr46Uu+2kxx+PbUPocGcqI0ynfG1YYEJyr9EoC/OrReFfAuTZoJGm6Db3XP3wACIYBROMlOyF6PE8agFAnB+mHfPx99CLPksjCfHgQvMAeHh6+/gdMgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dC1LR4Jk5z9shs;
	Thu, 20 Nov 2025 15:43:27 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexandre Marquet <tb@a-marquet.fr>,
	Lukas Timmermann <linux@timmermann.space>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: ARM: samsung: Add Samsung Manta (Google Nexus 10)
Date: Thu, 20 Nov 2025 15:40:14 +0100
Message-ID: <20251120144018.961604-2-linux@timmermann.space>
In-Reply-To: <20251120144018.961604-1-linux@timmermann.space>
References: <20251120144018.961604-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandre Marquet <tb@a-marquet.fr>

Add the Google Nexus 10 board to documentation.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index f8e20e602c20..97a5a678f43c 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -120,6 +120,7 @@ properties:
               - google,snow-rev5                # Google Snow Rev 5+
               - google,spring                   # Google Spring
               - insignal,arndale                # Insignal Arndale
+              - samsung,nexus10-manta           # Samsung Manta (Google Nexus 10)
               - samsung,smdk5250                # Samsung SMDK5250 eval
           - const: samsung,exynos5250
           - const: samsung,exynos5
-- 
2.52.0

