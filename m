Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5840D217479;
	Wed, 30 Oct 2024 23:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730331004; cv=none; b=Lu1UOtHeK/VbN1clElFKuWMCQhFpZ2my5hOK9TzKehhFtJAjOqg0cncy0sa00SMxFUm0ql7UlRqVMunoMpwo5mnFs2v5NVCKMKtZuzdJ+V0drTIYyP8FmgrmEvGLZGCyLNJ/TYVfX2Tb1h3OY899yvLMV7+QHy/qjSivHWXxzH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730331004; c=relaxed/simple;
	bh=7lBUwBD04r/9si8AUXSQa6LrxBZxNutsNB9ssGXmTxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+LRF1uyECO9VFIBOcDB9SplBJFCIfGCrIhCTOgZiPUHnXgdK3NAKMQWoQGPpp92ZpnHT7e46oRIuMidy9gFhEUl1RKVrfOVszcKYs5RdNiATzpJ4N9FuAoGpFrqFhS4d1bwBFX2vNw88tVu7tkF2yTU8Rfe+zUTde8Wkn6ZT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=QiSUS0x+; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="QiSUS0x+"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Xf38q0dLSz4wJx;
	Wed, 30 Oct 2024 23:23:39 +0000 (UTC)
Received: from umer-b550pro4.lan (host-92-8-254-228.as13285.net [92.8.254.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Xf38g31RDz8sWQ;
	Wed, 30 Oct 2024 23:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1730330613;
	bh=7lBUwBD04r/9si8AUXSQa6LrxBZxNutsNB9ssGXmTxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QiSUS0x+OsHcMfEAvYP72i6VhvYzBXanpL8QLqNgTdgKonnolNjDv0ui7gqEjevkM
	 hyqJatHg4G7ams3xnasgHS+b1SJPOCIPDR1weEdvs5d5B3eQddoTvtC+HrQV74WEhp
	 A2XC05Pq0M5obJkyhevlORv6hyZOCAA+ACvngmpkFn0PpsXn4JyVE2rCF0NsFMwZyY
	 xNw0xmwC+n4QQYi8LL2QxzNo8OERKPEFCKp7g0k90JQPuB4D4mKroIwUaD3+EfA+S/
	 G3d0/BSc80v6p48d+gE6s+QVhgVTOyfw2swMZdb/1lDSSCK3rJljTXcrb4+wEsuSXd
	 q+0oCj1FK//Dg==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v3 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Wed, 30 Oct 2024 23:23:05 +0000
Message-ID: <20241030232308.72210-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
References: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
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
index b5ba5ffc3..f15228d5c 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,8 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
+              - samsung,x1slte                  # Samsung Galaxy S20 (SM-G980F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.47.0

