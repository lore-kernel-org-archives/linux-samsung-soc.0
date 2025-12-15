Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A7334C08;
	Mon, 15 Dec 2025 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811149; cv=none; b=W16pX9FEQrxyZmUg2Ob/32OymqbbwSGLlkHKQHroVZruqiAnjt/X4o3F3GGE3/zz+hVdIe0inW/Sb+hpitZUZkRALK+SC44YAfLkJynYzV4i54NwdPIXetD3zjaS1upfoC1+7n7n/NvLEm3+vfpff/k4Lxnqcz8y0Y3KUIupGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811149; c=relaxed/simple;
	bh=x1v0MJUWK9BMlzbS3/wVIg7Szywnt4X4hx4pJPzYhGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjGsn9SZWfEPqp2vF+E0n+7gP1DksDlqAn3sihDKKIbzkO3jmlaIr4gb224mQpfbXf0+VZ5bXYgiLDPVJTfjgbWJ8gdTV+bx0HkEvHy9GFjD1/SHbKdY9bFuT16ie40Hc01qrFovAee14HhLNNq/sdMXQxo3W5FhjtuxOjDcwT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dVNfY418Kz9tk0;
	Mon, 15 Dec 2025 16:05:41 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Mon, 15 Dec 2025 16:05:22 +0100
Subject: [PATCH v3 1/3] dt-bindings: ARM: samsung: Add Google Manta (Nexus
 10)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-lat3st-staging-v3-1-2e4914b64dd8@timmermann.space>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
In-Reply-To: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4dVNfY418Kz9tk0

From: Alexandre Marquet <tb@a-marquet.fr>

Add the Google Nexus 10 board to documentation.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index f8e20e602c20..13d97257f070 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -117,6 +117,7 @@ properties:
       - description: Exynos5250 based boards
         items:
           - enum:
+              - google,manta                    # Google Manta (Nexus 10)
               - google,snow-rev5                # Google Snow Rev 5+
               - google,spring                   # Google Spring
               - insignal,arndale                # Insignal Arndale

-- 
2.52.0

