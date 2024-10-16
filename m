Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D9C215F45;
	Wed, 16 Oct 2024 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107318; cv=none; b=gMbleHR9N+TU/o6wKqTlvd/bNWx4SOQFoO2Z2HzdQzzSoLI32W5kqTrXPmNg2ZRKm1tcoHtwuyFMr7qSaPTZ6A2HxhhMJrbGDlrKEQ1Td/fO5+4HnNO0ja5Cco0zLVLE2eE8yLwj7Z90z50V3KD63vPz97T+gFyibNpxK9/WKXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107318; c=relaxed/simple;
	bh=ibgiACFyEQq5G9kXRK2fjIrJz1rMzfVtVv3tCBGH5FU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mE5yQ3UDKUkNi+kE0O30+XHAu7dqpYRYPWBoNk5anbuWimPqBaaMJveWxLZAMaMuc+Lf0IxCPvENTch6TBPPcvjIm1DpQ0+adNIofbvDmyIS2LEI7eJCovgJXoutWenZpMgtDyh/5LBiGx02bz2YS0cQfoIol1FBivUsFo2PYro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=OSuLD1kD; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="OSuLD1kD"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTLlk1XlJz4wKg;
	Wed, 16 Oct 2024 19:35:14 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTLlZ50LMz2x9B;
	Wed, 16 Oct 2024 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729107309;
	bh=ibgiACFyEQq5G9kXRK2fjIrJz1rMzfVtVv3tCBGH5FU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OSuLD1kDMrASgNcwmczBs3aGKI0gsFiCLyss1RTzn4cdf9bB/DsCuvVpciyLbSoiL
	 bXv0Pcv64fuUgBwqxAgHZqJmQh53U56AHzjaGJO1/0Oe9ygh72ap52zVUjFLGUGEro
	 Qavd6rk5e6C8Et8Oax+cBdK6gIPEmKntkyDUlNn+U8ShgDjb3KXcQIbCljuLtxBu8E
	 gEsC198p2610FO7oH3Nkb/p2FvqqiZ6AeCF9OC6IIdFnyzJoQMTTMyvz2XvSH1P9H6
	 DAIinVuDo3cylcuF8f0nMmrWpSvJmC3DyYCbjpV6V2D4e0HVSYohvQOaRCaaPxh8sz
	 Sol5GtMr0HfXg==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v1 1/3] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B board
Date: Wed, 16 Oct 2024 20:34:49 +0100
Message-ID: <20241016193451.28897-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016193451.28897-1-umer.uddin@mentallysanemainliners.org>
References: <20241016193451.28897-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Samsung S20 5G board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index d25a17e69..3dba0b283 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -234,6 +234,7 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.46.2

