Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A216F3A16AC;
	Fri,  2 Oct 2026 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965414; cv=none; b=HHv5l8P/0byoe1KIF9zIu8qZ+g2IYOnFRdV3Am4E/uowCscmS8C/eWssQozP0dzlUOMLVM7NAFDzpN+FDq6wVrr43alj4kPOpsuI8gl1BGWVempP8SJryb2WnoB9e+1vji3967jQDeeFEa8v9qiOVCssldv1h+lXNlWotH1U45M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965414; c=relaxed/simple;
	bh=0P9F76FVBx2qhXy71sSOIagKjgFRrK/Pomv0R/cAf+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QHQTBh9oNUVj/qIEuSc9ZLr7ulECmpSJ+EiSXF0/LpYp1Msa49WqSlNbm/JEI9DgA847ghGRmrSrnKBmg2ApIKmWnXvYoJ+2SvMyTgTkzX907GRPHpAkaHA8Bej4mwpmBWT2Wo9r6qGp1TSuV2Lu2W+DKqW3hzdDXh6RAZ+ijYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=dq+xSeae; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="dq+xSeae"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790965404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xN3oFt0Y2IcujH1DIfbY1diyGBQXYknSa0KCk1kgoTY=;
	b=dq+xSeaeu220bgEHFzL4IIAIwJhJgA3REhOqcS8Xdd6dURHZwreo+LE8noDf4Z0rUPdtWN
	/5n7FhDPSdjx2r3qbdjFXdJq0/nHO7wuXw4Uj5hY9jON47tkyiAWG9FkG83Sv37wLKpgA3
	RcwaUfTVWJeShC3SRTdV5/WmVWCPFbY=
Date: Fri, 02 Oct 2026 20:23:15 +0200
Subject: [PATCH RESEND] tty: serial: samsung: Fix S5L on Apple A18 Pro
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-apple-s5l-a18-pro-v1-1-4674726b4066@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OvQ6CMBSFX8Xc2WvaUog4OcjqoKNhKHCRGkKbF
 hsJ4d0tuDuek+/8zODJafJw2s3gKGivzRAF3++g7tTwJNRN1CCYyFjOJCpre0Kf9qj4Ea0zmLa
 iSogrSVJBzFlHrf5snQ+4FffieoHy5/t39aJ6XAtXstN+NG7axgPf+D87gSNHmedpwgXLhGrO9
 VSRizeNPzQUoFyW5QvtDi660QAAAA==
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

