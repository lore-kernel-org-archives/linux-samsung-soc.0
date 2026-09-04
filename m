Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905423D2FE1;
	Fri,  4 Sep 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513228; cv=none; b=hR/3ajPfFwGY9czq8mGtgZmfcgquymF1k5bpg2vvpXgc6lraJ7CxOJ4VGpyR9ZgnCVEtYil/p8RtCkTVS+J7yPC/bwk+SpL/gAB+KE+sTalOmG5gzUHqUZjYxiaXv1l3NQ5AiXd58XqlfJh8GEFVfNWF451/FN6k9hL4OFJMNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513228; c=relaxed/simple;
	bh=0P9F76FVBx2qhXy71sSOIagKjgFRrK/Pomv0R/cAf+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JlsoZ+gJ8zqIMu3Wh518IxGjxckVCl7Eoo8Zm94R8wokxTpDPbn6M64djWVLe+z+IbajDjWkm4BP5jrjrmYuJmNGke8e9oRvbpjWvZiF8kPzG3b4w/XbtepfC88izrQIXyMOzs0ukPVcObcvShe8FwJcdEKAox1++RbiJ/JxmzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=WHrPmDgK; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="WHrPmDgK"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788512814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xN3oFt0Y2IcujH1DIfbY1diyGBQXYknSa0KCk1kgoTY=;
	b=WHrPmDgKRLot/ajyWVqGI2TnujNsYmC+yXxif15HSpN61jqKi2Z0yiYpLsvGGwE01Y0jDO
	Q1XgKDWWv//DucrFXEe4+/a3041XWylvD94ceRA3pD/BTiDzsDqKGziS0Fgh1WFgS+vc3W
	EdjbjyOqKshI+jjBXlijkA2g+cgLsMI=
Date: Fri, 04 Sep 2026 11:06:52 +0200
Subject: [PATCH] tty: serial: samsung: Fix S5L on Apple A18 Pro
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-s5l-a18-pro-v1-1-4995312062ad@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJWwtBr2JcDPgDYwg0HTUmh
 Ltbdfkt3tvIkBVG52qjjJearkuBP1TUT7KMYL0VU3ChcScXWVKawVbPLL7llFeuh9Ad4SUiCpU
 uZQz6/j0v17/t2d3RP74j2vcPuWaEuXUAAAA=
X-Change-ID: 20260904-apple-s5l-a18-pro-5f2b3e1a4e4a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 Yureka Lilian <yureka@cyberchaos.dev>

The UCON BIT(10) is set on boot on the S5L serials on Apple Silicon Macs
of all generations and old iPhones [1]. It's unknown what it does
exactly, but on the MacBook Neo (A18 Pro / T8140 SoC) clearing this bit
breaks the uart and leads to garbled data in both directions.
Add it to the APPLE_S5L_UCON_MASK to prevent it being cleared.

Link[1]: https://oftc.catirclogs.org/asahi-dev/2026-07-24#35537011
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 include/linux/serial_s3c.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index f54cb6e23f85..1732bc9240ff 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -247,10 +247,12 @@
 				 S5PV210_UFCON_RXTRIG4)
 
 #define APPLE_S5L_UCON_RXTO_ENA			9
+#define APPLE_S5L_UCON_UNK			10
 #define APPLE_S5L_UCON_RXTO_LEGACY_ENA		11
 #define APPLE_S5L_UCON_RXTHRESH_ENA		12
 #define APPLE_S5L_UCON_TXTHRESH_ENA		13
 #define APPLE_S5L_UCON_RXTO_ENA_MSK		BIT(APPLE_S5L_UCON_RXTO_ENA)
+#define APPLE_S5L_UCON_UNK_MSK			BIT(APPLE_S5L_UCON_UNK)
 #define APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_LEGACY_ENA)
 #define APPLE_S5L_UCON_RXTHRESH_ENA_MSK		BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
 #define APPLE_S5L_UCON_TXTHRESH_ENA_MSK		BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
@@ -259,6 +261,7 @@
 					 S3C2410_UCON_RXIRQMODE | \
 					 S3C2410_UCON_RXFIFO_TOI)
 #define APPLE_S5L_UCON_MASK		(APPLE_S5L_UCON_RXTO_ENA_MSK | \
+					 APPLE_S5L_UCON_UNK_MSK | \
 					 APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK | \
 					 APPLE_S5L_UCON_RXTHRESH_ENA_MSK | \
 					 APPLE_S5L_UCON_TXTHRESH_ENA_MSK)

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260904-apple-s5l-a18-pro-5f2b3e1a4e4a

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

