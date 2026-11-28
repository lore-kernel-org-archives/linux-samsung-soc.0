Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873912;
	b=YSoxjKt2wUXR3IITW90xocuyrwQ5fbTUpjJpaTro8FZYhlAij6m3iAxNAW6CFvVgjdU6
	 qyT2PpqnIou0Hkp0z3MzU3e3nacjU55JncFNZ1lawTiV9b05TZWdjAhD9Ud6nh3Y+6Qn4
	 q+Qgxyvivw3bg1m8sXLsaY+kqgApreEEZPr8lqH68qOehk92oUeeLu384GkzFweicfFoZ
	 G31YdRUsEPz/1ngHDakZtQfzTGRN1DCT7eBjU+WNcwMVl0CU6KXs0rfAuHQmLM6y+6anU
	 iCAA5t9O3EMcgz4sCULAe53BrpE6uOVcwz632KXqVAxhEdg7/HC2jTXfcLtSYOazO5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873912;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=bjLdsgpYe9mamn5E+YpR666RCqIy1t1bYWOxM+a7YQk=;
	b=fQToU4Aa7MPfioJRQK3wWIfIFy5qONB6FYXKcwiLe08EWevP9O3SYetlqsEbn8V4kIMd
	 3yPxYzedw/YHnjGitFX9AGFu+U+iWsualqvRGqBCFonOU3Cn6DJ7F13d2ueQPjf4JZuX9
	 iZBYj0ykl/b7WPIdpcUrNSDIMALW6Cgw5WIgPIlG2Tta/2MBf/KQ0QrBSncw61YWJrfnS
	 1Z8fam1PweOvfnpZOQpoam21W1DB2h/Xy+UX51dKxC4NtWngjk+7YUS7+yfAO3wEGIymt
	 0l3XVAWXR4Uoo3DVINxfo0yWP5OQY6m4Fw8VU8NNeskD20WPuIa2QjVq0seRAiWnCRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b="RpxQR/X4";
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A3606A684;
	Sat, 28 Nov 2026 13:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431A3606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=RpxQR/X4
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jcBXd1x9QzMlkn;
	Sat, 28 Nov 2026 14:51:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjLdsgpYe9mamn5E+YpR666RCqIy1t1bYWOxM+a7YQk=;
	b=RpxQR/X40AzCemX4SlNOJSgjjbrffVVRlG//M02SmrPg1UIP6Fki+tfvj2g8LZvJQt55Ft
	gThhNWwTfcrqRQT1B2KIRrmhCyPa055gsKMe9nI08nZFmkhQ7O13TIhoiMl4TOLgEtFyj2
	nJ4TnfqEHwfnCrlJUFPnzXCb2650xD1Ox/fVLUQt8sUFKMPPctW+zhC44EmV6EGcPfjt7g
	6nVT63d175U9VXtcZw3ZFrQ7MOSQC1CB0Luw/2+sDlibye6Qfb/M7L1E9dZwM6uIwsiOlX
	dZo2XatjwSfZjiHh8nLeyua63Z0aukZ3vIPvpQS79Kg7SVTJGusHL9Pnm41D4g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:34 +0100
Subject: [PATCH v2 7/7] MAINTAINERS: add entry for Samsung S6SY761
 touchscreen driver
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
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-7-1be5c1029087@timmermann.space>
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
X-Rspamd-Queue-Id: 4jcBXd1x9QzMlkn

Add a MAINTAINERS entry for the S6SY761 driver and its binding, which
currently have no entry.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..9de472b68ea9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24430,6 +24430,13 @@ F:	Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 F:	Documentation/devicetree/bindings/media/samsung,fimc.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
+SAMSUNG S6SY761 TOUCHSCREEN DRIVER
+M:	Lukas Timmermann <foss@timmermann.space>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
+F:	drivers/input/touchscreen/s6sy761*
+
 SAMSUNG SOC CLOCK DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
2.56.1

