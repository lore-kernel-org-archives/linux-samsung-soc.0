Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56A02EFDAF;
	Mon, 23 Feb 2026 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861250; cv=none; b=TG3EkUctgORjSHFpHbFBS5p6u7OGdXuN4N/srY68sa315p4M1+e4Borp8E+GG9pz21Ue/LXeySIXDnukUtW/E4jrdumE5IX5MKeKGqRIJTyRAFFT2gzFOSzahu+BufLKme0e+yvIg8RoJ9D7uO5ofJmnJHaN/d0je4Vsq9kOvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861250; c=relaxed/simple;
	bh=oERAn/f7FE/Y4BZUdYVrLUwwtTaAz3aZ3OFnsEZHQe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blYefHmy94uod+F3Vex8o1JSk+1PyUSjaPc+mpqlZrt3rELlUlVONYIcPPl7s7zfBndv1/S0Vpf1q15KFVRG6QiGFpk2vDirxtlJglh4IHtBrtKRqPCeMlnWcKCtxpWTLrEb0EL64lnhM2WZTpkPdRxzUrW06C7+1xR0BbNgR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fKQ6b2p6Bz9v9f;
	Mon, 23 Feb 2026 16:40:39 +0100 (CET)
From: Lukas Timmermann <linux@timmermann.space>
Date: Mon, 23 Feb 2026 16:40:26 +0100
Subject: [PATCH RESEND v4 1/3] dt-bindings: ARM: samsung: Add Google Manta
 (Nexus 10)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-lat3st-staging-v4-1-219638defb01@timmermann.space>
References: <20260223-lat3st-staging-v4-0-219638defb01@timmermann.space>
In-Reply-To: <20260223-lat3st-staging-v4-0-219638defb01@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>

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
2.53.0

