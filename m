Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B851DF72C;
	Thu, 17 Oct 2024 16:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183431; cv=none; b=UAN+13m1XLnnWpzZ6UuywwMKyVxOd4UKXPKeNpZiCxJS25Uj63Tow7bVnLlmsjd4oni7pOII+0PkMGlf7fE9L6A2vkyHVTrNc6+KwaBS5YWv81Od9UvFsq2BRrSay7L93HEJ+vQS3DUb86+OLmCdxXqov4WtYPfDzn6fPpHI5ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183431; c=relaxed/simple;
	bh=YKA5oZNA6Y8WRMnaHj84OJT2eyExbepDtXA/B9xr3k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sm95xv+5m2Szf6K1vi7RzJG09YKMCRXtNlaPkqSU2PM58MQv2XFSQdsRXg33d6VWGIDdGk1qZR+3IMHrIYPPJ+pl8aRDOBrm9+qPx5zZkUpl0sppBY8erWR7JTCrxTYGjYAL/VFyNAiSf1SdgKtzjfzpd3xl+aiXKbc4Y7Ebxz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=JhbYUOhl; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="JhbYUOhl"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTtvK19RJzGpSv;
	Thu, 17 Oct 2024 16:43:41 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTtv95SKdz6tkM;
	Thu, 17 Oct 2024 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729183416;
	bh=YKA5oZNA6Y8WRMnaHj84OJT2eyExbepDtXA/B9xr3k0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JhbYUOhl0SEzHuwrqR9Y0tGGntYWScEUxCTbxO1cL8DCTXuLfi6YNNIi3ojtRzZEr
	 NiavFRChgEwNho+DlsiCBHAnLn2tE3aVz12KAshrumf46gh1qCCa9p8AadIxayByXZ
	 80RfucXLLtFK6lgeDmtBL4dOiBOtGGoS2oEbycpp6BPp9e1XzzhD9zikWPjhy+amv7
	 72ish6JZh8QOa2M+9FIVJc6ji+hXJzqTXEX6tdvs5lIH3solcEWNba0uP9F4/SPRrU
	 xJjyQqGZpHM2Rcgu/NSY+XDXJMPdV48K38rvM2pWq8e7LEGJFqKHbUhRlJa0qgk0nJ
	 8h5cdTwY0mzCA==
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
Subject: [PATCH v2 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Thu, 17 Oct 2024 17:43:24 +0100
Message-ID: <20241017164328.17077-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
References: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Samsung Galaxy S20 5G
and Samsung Galaxy S20 board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index d25a17e69..70a915240 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -234,6 +234,8 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
+	      - samsung,x1slte			# Samsung Galaxy S20 (SM-G980F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.47.0

