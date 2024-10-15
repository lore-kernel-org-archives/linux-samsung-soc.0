Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F31FBF52;
	Tue, 15 Oct 2024 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026154; cv=none; b=JkSL8uvJ6lXI9LZkrnMmc2FWdcc+4cXm2s5OdaLNNGzp9ulIp279WGCwLWhot5OEZ79HoUVBykH6aZiMLCFAT8weW1CJmpxubjkJ8uaE3U34XgC9nRt5XNyXTRYHWuIz+EzJlAQi5Wvb6yH2drgnWErPQ4hIGFNOzM5QZ8zVDEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026154; c=relaxed/simple;
	bh=i9CRyCmH1jmIrAYXtqp2Ol8Cit/CqxernI4YANbTw1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBhfmlZdJBY1v0iLXVUgdvbv1XKFaV7wzpgGUZtjSYifUECCWtRpl7v+gRNoX6Pq5tcIvVgIbXk8B4fTIsCsfajvH/UVLaNUr59MV+hZMZDjV+BpPbTF3dFFA50J1I4a1b24QaGDNW/dzKffE045NfHAbn52zBGu0pz2adFTnDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=iPtVTckb; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="iPtVTckb"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmkq5bRqzGpcR;
	Tue, 15 Oct 2024 21:02:27 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmkh2CM8z8sWS;
	Tue, 15 Oct 2024 21:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026142;
	bh=i9CRyCmH1jmIrAYXtqp2Ol8Cit/CqxernI4YANbTw1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPtVTckbQukNYAzjRLnYDTGLa1sqedgtred3RvQ9uh61f8yKJdGtHn6pkhcLpoGgP
	 NBC8oIwA0CxYumnthYQ9GN2C28bwOMFTCIQu+yuU3tWlajwg2Sj+3cziaTHpCVaeN7
	 5R+AnI+hqICERQo+zS1E2IGsngFRls0juzF5omzLakA5cYVipFng3+ICNIiFfbXg6R
	 qNkncHJOMcHSzCxr8qDTXKn7Fw4fd1LYoCoinSnJ6FK0YLaQ2bqYDe+O6kvCjTOXCc
	 cTYDoi3TbGWud0kvHJiVBqMjxxT2rjbiiEJLC05fYQgS508Ssdo8mUWun0e+yuq/Yy
	 gQ82L3Cv3Mtxg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	David Wronek <davidwronek@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990 boards
Date: Tue, 15 Oct 2024 23:02:02 +0200
Message-ID: <20241015210205.963931-4-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
References: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Exynos 990 boards. Currently the Galaxy
Note20 5G (c1s).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 49884a7ab5c6..d25a17e69725 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -230,6 +230,12 @@ properties:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
           - const: samsung,exynos8895
 
+      - description: Exynos990 based boards
+        items:
+          - enum:
+              - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+          - const: samsung,exynos990
+
       - description: Exynos Auto v9 based boards
         items:
           - enum:
-- 
2.45.2

