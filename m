Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391E61E284B;
	Tue,  3 Dec 2024 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213031; cv=none; b=erLYHLK0tB5qknkxZdzz9GzSTvSARVlh4Yc4Zw6NhenahZjpcnX1xtn35G8Wpby6To88zmiinw+8ii88/F5X0YgxsLku+kzX5vpFV14xAl3AkGoA67vqm5Q5nqbcNjoaupaUPD+2nIvUxWUJfIoLnJFkz8HpbbQc/TwpteNMKg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213031; c=relaxed/simple;
	bh=bNG16fxeZRe7PkHUfBJcI8c38q4ij6t/20saRuOZksI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiqd518qgZ0dFSl5pVZ7L7e3nMGS/6aD/gAkzulIAgQJWzcRpXiFDe+y78sZQsgEh8fIPIu8Xs2tTcJdrFeZClBk0GVmzPp90gfiJjs7SdFxhl3T7CTHveHVLMc9UEOU5UMB0hyhe++l+DsHEyRihZl2Ejv66u6BZHj8ASZFSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=lt97fZXt; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="lt97fZXt"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2Y7m6CV6z4wNK;
	Tue, 03 Dec 2024 08:03:48 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2Y7d10qWz2x9B;
	Tue,  3 Dec 2024 08:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733213023;
	bh=bNG16fxeZRe7PkHUfBJcI8c38q4ij6t/20saRuOZksI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lt97fZXt2qpb9pbxaFECX8tJeWDp8RvPwR/gLyBP0gnF9EhaSvJMX7oNyIoY0yJJr
	 nq4MQuni6iPJazUnx9jJOFD1FRzDgyTjHEIkRvZqioiHnAwNK6QhCt7STMIE4gClEA
	 1oECxoEU8t3EPPdLjdzW7RDU4j553QV24mP9PboLKDPIWaJ/RThGUIR5LhI91JX1UB
	 /Mity2lWfS6dFkHQhc74FzqLt/5aSFQ/O+iocoJntgDoR2ClC3P7nXP3kTqzpBIh4r
	 5EfnSEYLCtmd1fv6Xhbshi+4Gfwj7VdV1WJr8Ia+ab9RwuQXe3z47REw5FW6QJ5nRi
	 lZJPwkljuxcvw==
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
Subject: [PATCH v4 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Tue,  3 Dec 2024 08:03:23 +0000
Message-ID: <20241203080327.4751-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
References: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
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
index 168e77375..fab29f95d 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -241,6 +241,8 @@ properties:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
               - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
+              - samsung,x1slte                  # Samsung Galaxy S20 (SM-G980F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.47.1

