Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107320B81D;
	Fri,  6 Dec 2024 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499760; cv=none; b=hETig0cJeFMZ2q4Bh0z7CEmFHUTyydDP5+Q76YJzhCKCqn880+mM3cC13+y5SEBvWghC9D+7qRjS4NredjiriUneSb8xwe+GeXhIFwhwfg6dU/kb7EOWzxUbvvRZ74Dr05uXmChG/V1ikWV6HtaQPf/HYTUPVKTsAKkCHk3f2UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499760; c=relaxed/simple;
	bh=5TvZ7eh62szwn05oK/fVvj0pJfDk/MAb0mJhBHtI5i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPVfliCAH7qSrAw5mGQp8zXTyYBwi8MmW1IiZeKsEaBBdSfO1V+X5hGRE/OafXcRKFe1nR3roqqx6oJ++YZuny19rAY25PJhLqAMAM3IUdEp/RX25OAdqTzoNSpCBglm/wpypUWPrTf8Kh83I9Yd6eBMPr0r/SOW48247gaYiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=EVjeK6DJ; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="EVjeK6DJ"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4b9p0W60z4wJ9;
	Fri, 06 Dec 2024 15:42:38 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4b9G6CG3z2x9V;
	Fri,  6 Dec 2024 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499733;
	bh=5TvZ7eh62szwn05oK/fVvj0pJfDk/MAb0mJhBHtI5i8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVjeK6DJdkfLl8bWBj/CHbVzI8oMoUE8Bnqvp5cpFBSwqdvlz8Y/8b8hQIYGVRq5E
	 /RHMQntGwudwHi4ieF2PdHTcbBLDUBZsxrgCm5RK6qXMwxM46ygSNC3dq+k4yjDuve
	 5gpxcxTnULqaLtR9w9fwlTAxHDN7pbzVCyrA5nZfiPPIoc2inluIlsh9R0edwemnB2
	 o00A8HUwYSqLBz/ik+mQcv6gWSERHeW7jcx/tarGtdD7lvSEVAOiSZDytXXa3KVQe+
	 W+y3N/U381Mk3Y8h7lCEQ5WJwGbGYDoPfiltqmglF7vWafzv9xshmGdqJy48xXFqQh
	 xpnQJuspbPKAg==
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
Subject: [PATCH v5 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
Date: Fri,  6 Dec 2024 15:41:49 +0000
Message-ID: <20241206154149.4271-5-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Samsung Galaxy S20 (x1slte/SM-G980F)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 8GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7dbecd367..3405d9e82 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -11,5 +11,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
         exynos990-x1s.dtb               \
+        exynos990-x1slte.dtb               \
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
-- 
2.47.1

