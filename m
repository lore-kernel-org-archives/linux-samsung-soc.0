Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873905;
	b=Mn1tVDQhgMkjY9xrf1r8nZmihE7yixTwmN3cSds0/WxvvOMvMxvsxT+vtIPD+urDqcqV
	 sP01YHpoD0reSHNMFGLHe4SxuQk8FQGoIN6cPbN6GkhDjGhOFT2HJwdZyPH5G4IeiKGvM
	 ThCNaPVe0pE49fi5LZ2hgDI1H8rYGJHIRe8zFkajju6TFg5UluJWK7C4c2eAETalxxoR+
	 Jhh7dwjDaGlOzXZMxcP63upMh/fvpyDe2KkBuLVqRts2KzfQGzGqu1zac17iAky3Dw/Zm
	 kJ1V8EC5d7yXfLPKSLp/6hwizHr7YKNM0FLnMKQ9HsH63NhBtmDUpqptOdJSMPCzqHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873905;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=lB1V9xfXl8tQv/mYXKXj3a0bxoflJn/p+eO9avUpcxw=;
	b=XmVjtTTmKSGnJET4tZ8CQZqNd9xiOrUQlAnwMxcMGN5IPTtIt9uN3zs2AOVt1YrDp1cB
	 XYDW2jtvmZRZJqRuuYw6VyLbf+GsPZ6j6NRkKG9r4qgywsYZUAFAsVg4Hfd+cKy6Ede0x
	 lrNi/fckf7oHxajGj0iKNb1J3RkFaUbZBRxqoGXpAOWFsNtQpcBUwEq3ZQdK02QzxCOpM
	 wVNfIETwckQLd0M9L+NiArJ+rxdLVtjBKv8jOySlcHvcxWCP6ru2sU+g9ddTYQ3GpK8e7
	 IIe+KRfX+pFVZFH++v7LJJ981yaz4QKfq4z1XMvnDnTHQ8K8b0QdOPx2yqzkoGVRy8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=1HXO5MIX;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D715606A31F;
	Sat, 28 Nov 2026 13:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D715606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=1HXO5MIX
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jcBXb4J8Fz8vZH;
	Sat, 28 Nov 2026 14:51:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lB1V9xfXl8tQv/mYXKXj3a0bxoflJn/p+eO9avUpcxw=;
	b=1HXO5MIXfDyhAQL5TVuVBDoadwndiuw2iIPuvoTtVkgWhWDF4fPpKeRyatJDDzsOTdqOFg
	nKF7LRtyjVf+uDtpnp3TlcK0pOblG9aPcXwyrHxXAgBX8aryLlvtwmStQn/UWcYtIt6zco
	KD2S5a6XeO5R/HUmhEk2woIFjQQx2W1dMIt/BfB3gPzuztG2ywEv499+sQkFH8o0lEjm2T
	QNnHMDTjSZJofrg0gxEK4gGtRICU9g4uSphZHK82yz3ZbrUCbCMOVjsLOCjMmswnaJirp0
	aI4mbhSFOSSk6g5geCxFz0cJgCD7HtWvIWVh5aSwkk6W4A2fcSBkxO3mr/4LAQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:32 +0100
Subject: [PATCH v2 5/7] arm64: dts: exynos: gs101-pixel-common: add labels
 for touchscreen supplies
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-5-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXb4J8Fz8vZH

The Pixel 6 boards use different touchscreen controllers. Label the
touchscreen supplies so board files can reference them.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index a12f2b88d72d..92b1640c0612 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -399,14 +399,14 @@ s2mpg10_ldo22m: ldo22m {
 
 			/* ldo23m & ldo24m are unused */
 
-			ldo25m {
+			s2mpg10_ldo25m: ldo25m {
 				/* touch */
 				regulator-name = "dvdd_tsp";
 				regulator-min-microvolt = <1600000>;
 				regulator-max-microvolt = <1950000>;
 			};
 
-			ldo26m {
+			s2mpg10_ldo26m: ldo26m {
 				/* touch */
 				regulator-name = "avdd_ts";
 				regulator-min-microvolt = <2500000>;

-- 
2.56.1

