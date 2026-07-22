Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1543E48B;
	Wed, 22 Jul 2026 20:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753070; cv=none; b=GQ35PR9Av4v65WhOADTrmBFLshM59wfQLm6bdGbZgYX+me52B/GOQGuxtjIWnOL0BIsTBnzh3cHnxEgo3064s47RWLVDFID8/H2Rp7l7ZERL/jf9Qk2vAYmVGR7f1E6EDogaI6PpRYutHqz/fZaeZKjOAx70f0PyisWanhOXvWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753070; c=relaxed/simple;
	bh=L0Y6Q2/mXax8wLebsU0Uf7PpUrBnWwEaQFaeO3rTmCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LslIXH46FG96aGk2v8MNZ8nDIMZT2bNvr8FhK/eChB36wSIblFlpalHpbvV6EV1v0/zGYX9t2YaozZb3nQtBL475kJmKnrLU8V8OwPWTl/Q2DUDvTz95dKWdNaY4PE87C0BBkNdQ/ZGhIq2CsHcc6NMNBDkTs4xIrzQHHlKzte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=bH2OrSXH; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="bH2OrSXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784753061; x=1785012261;
	bh=EmqwpJz1YR/PMEdcKcKn2Qlhrf4Rxe9bCB0GGb/49Ys=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bH2OrSXHygKcQ3sOnemglt0ujK+OS4/SuZ71ZRBUeOwYrX/MeWDQ6ZeDdKM5JU3gN
	 Q4iwPacX0eLYlgmmbDfpssxbeomMRJRtXENn/F9399vFIvLHJ1kbxXBXWOUbBwU8nT
	 Y9DqNPaU5TcEwWtLbfitiRipPYYIop1dJd/G5XrwelTWsZ57F4UpX2tvsaXv4f4wtc
	 3s+ZfTwsfWe7QXPFBn8qp+LGswzSSKeabJexFHjCdZUMxGbLM0OWq+kLat2s4fCkKg
	 GQbon8I08YgVIcUTjXkmpKg2QwiE+tt/TRV5QBpR0QKOpXu6Iq4ZSv35/J/VKTGvcs
	 35SrjURk2ZCYQ==
X-Pm-Submission-Id: 4h55pC0Kw7z1DDXJ
From: Alexandru Chimac <alex@chimac.ro>
Date: Wed, 22 Jul 2026 23:44:06 +0300
Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for Exynos9610
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-exynos9610-clocks-v3-5-c672a2a30889@chimac.ro>
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
In-Reply-To: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784753044; l=938;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=L0Y6Q2/mXax8wLebsU0Uf7PpUrBnWwEaQFaeO3rTmCs=;
 b=POl1ASevPmwdHD2e8TBn1/5zX0JKPNQzZQ5abz87692gNcJHarFOJ54PnQuwL3+eSEx91xxky
 akbLENe/kuqAebc0VS2fNt/69hfLAcjvrgVM0G8v20MgZVDng/YeJAf
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=

Add maintainers entry for Samsung Exynos9610-based platforms.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index be843bf82036..68f3c4fe2913 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24000,6 +24000,15 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	arch/arm64/boot/dts/exynos/exynos8855*
 
+SAMSUNG EXYNOS9610 SoC SUPPORT
+M:	Alexandru Chimac <alex@chimac.ro>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos9610-cmu.yaml
+F:	drivers/clk/samsung/clk-exynos9610.c
+F:	include/dt-bindings/clock/samsung,exynos9610-cmu.h
+
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0

