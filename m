Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6851FDE01
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656931; cv=none; b=X25xg3cGaa2XFDm3v6m9lVtNRsPXkK0UT3DASoP+sVsSjdRTgNobGM6oKJhNCE3ieYYsNObtlSrVyhcY2+LglEsHQj3hHyBEIoVRo9cdiU8stSC9YEnwm3pZ+Gs+riI3S0jWIGR9rqYt8q+6TuJwfjqpe1cZ7T1rMfPDX7Q/4s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656931; c=relaxed/simple;
	bh=64jeP0Gi1PI0BAdjU0SxMLQSz6AyN8tWg2xGk+X2TyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUkidrvfs0cwZLH2vvBjajqBKPzs5d4Z1QrfeHDAneUVcjx7VeQYkKONjLz7/owO+r+e/hbZzzRrzU7U5Uw0mUw8kZWdIHMzyvaTQY/sDoIOhp9Bf+XMRqtlwNV6dtOlUhvXUu6FxJs5FtKX4JpKE4T7LRmtaEZuWq4y8pDyuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CO4I0v3S; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CO4I0v3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jHiB1M85VGtsR/nshHD2x3rEN5vUZAWnBNyMS8ssk/k=; b=CO4I0v
	3Sr1NVhsYy+ZtuERwgeF4Uph04r7ihtSHRLsVuSv+HXHx2bwRuaaAQF03otTtChe
	4U3/0orXT7LsGE22NfVvuqyarmeMUFpFzH6+jpjhsgi34b71cocn7Z6UnNWh97Uu
	omEvoIq5nS3Kmd0jwMEuL810b1WcVOWQCCPtOKH93KdWCXMaBuBr77kie5Ud+dnb
	OgyiU5ij+leX+pLnMt9JAm9b+1hstq5n+ZtxZ1r9PbFyLhMZk11uYgE1JVS5/VD6
	oEK5wTTxJT+FsO+dgr8/stE/pu5I9Y14fWurTH5sOKbOaFl57VYzG5GWX9SPUnlx
	trybxFdbkZgNN60A==
Received: (qmail 2475066 invoked from network); 19 May 2025 14:15:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:22 +0200
X-UD-Smtp-Session: l3s3148p1@qBMJFnw1DppZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:01 +0200
Message-ID: <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 8f02de8480b6..197de398dd9b 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -85,7 +85,7 @@ homepage-key {
 		};
 	};
 
-	i2c_max98504: i2c-gpio-0 {
+	i2c_max98504: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 1 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&gpd0 0 GPIO_ACTIVE_HIGH>;
-- 
2.47.2

