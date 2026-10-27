Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136609;
	b=2O3X8PrEZVWZNjZpm0/oSj9GpL5YUnQSQJKMQXVSwP3QeDO52VoY/fJPPk4uK2Lga63f
	 eH6tTSGg54skzWx6EPB3pUqZaYdI+k4uvQAQZg76Ukp0cP3ZUPRWkTqugGB7WWJTSnWi1
	 BMiUZMPbqMTsrWxbTGSrdEbl2jT/BaQWHaIiha1jwwLkCjBQl5QXiotxMcoBd85hCTm8P
	 +C2Ed4mxTHln8V+qrWTWZsftOPNLk+T+y3hq4/VwsZ1ZfXC0YxC3YjZfAMBGzQcnJGG3d
	 W2vROfaaLnk86OtpsoK8QRSTeX2phOiK+YM9yI32ZefOiXet8qVNa4FlXCaVBkWURyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=;
	b=q59zYKnRl2xU4yXSFBwCPkeEHME79GPba8cZ7hlHbVeAOahpHbTIhp+fKOkibhAFGGjq
	 cXLlBF8OhdpfPbknqMsow1yvs/q8JK0M3xlYLp/w6CS3JDLyXcjcGmaUTqLgHAmKqKTzl
	 tfGj4yDXco4TUM2+K4PLYX84X5dor9Se0SmnUgaKX6x045mFvAk3GwzeUPzdOl4gSEk4s
	 WY0PzxjcXn37E2FyKybl6jfbLYmpWB8HOmaQ9x82W8Eq2AI2DNy3f8cHlLfbsFqGhUrGM
	 kyIPOU1uMbRBil6NwlWZUbUSs+haQXNh8fDc/E+tIUeuy2kiaV4URect6hVVXRkDQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBSog2+j;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1DE606A31F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 21:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1DE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBSog2+j
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15943c9c005so389164c88.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 14:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136608; x=1793741408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=;
        b=OBSog2+jN3r2rpNx9Xur5CeMY7NcIR5nhY5nwyK5qJTv6vsdEg/uwgSE84O/EDLBkT
         dJCpUYAcLnsDNmAHrCKz7b5pUdWe8t1tWQSmyRLFn8QaXRRxrIMXExJo/2i3r5u2XBtS
         w/sZtdo9mdegFqammTnz2fEVF0F+8gXcVzc/9OPKXoT/C4jfzK2EPDziW+pDE7ZP5NUd
         BJ+ECGh6UJjAuDhDJ5xcThQPfAFmRnpOxVHF1E+sj+UpWqFBn3uY2PZHGfM4CvVkIDCK
         LyidrJWMh/jMOpb29NDXNuODzODR4TJ9kPSrdAzax3Ym9RBcBG9sH4pmt9YWtpxa/bGn
         7m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136608; x=1793741408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=;
        b=IN23I5PJhUr28nGLG0twDaO9aUMoTwi3LuouooOHhwd7PBjt1o/8Dm7Zd1dA7TEAhJ
         bSs3pnSAm4rz+LSzbRFRhYtt8C9LYRKDMJKXblN2NjPNwwb0JEHvi9bDW4hOQsw2nGwI
         hhfbEU8g3csepDikBMpq+6tmcbMrXT2BHMotAFc9kXa8vNA3FDyK4rnUNYHjHqD53igm
         f2yxJXYvW1kjubGGZw2bFtOKStRlD5VmiLKMlW39I3PYtrF67jZ+tH5WjJTmAVqf4BL6
         eepv/b4TLGiiYHhM2GaXUrNGCb8ar33YZTBBdGC+DLdNVbGqTbC/7xxenrftDMOM0ka2
         inNg==
X-Forwarded-Encrypted: i=1; AKwUvBzPLcaXHJMP7Bx6zsVKWJcIrhxy1hWNTYLUEqfBE3Jc6cOzxnBKo8UHBOsQkTiSoyn3Wuih/gF+voZ/NiywUSiuuQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYINsQEgMpPsAoMoYQyfsaHsTK8DumTwtP7VoRvFWUaZ3qHW3s53
	oIlM1Bm8nDpdhnZ1+SmtHsHRoPzjzOrpnEogmZ73m/gB12fI1O4psBSp
X-Gm-Gg: AYBFou0/oXTOvRQ2Mjg/CEYE7qZQ32fpCoNBSNDx03bfpJg2advHr52c1rUJ8lhOSQP
	hs1E5738fjEQw+GfdPDhkYp5MWt8bx1ootgN5TQ6+McGpk79BIfqRqt/yiSS75c2StHchr8SqWV
	8ussIittLN+jQPZPj/0w12XCoW07LVjPQLWFCY2jWPISmY4EUjn/aYAYNziL1UosJYR9Op7oBCH
	OT7p2GEYmkGKTUQONUg9U+yOFK3Hc/CLrsxvoMwh4A466aMrl66Ybd3vgA3TqIA8TAmKNcD6Gvq
	HFiM5s/mPpjYVe07sv+stu+y0+OlVJ/j3u+tVmdpgQ40iSCTfdam2FkBGEc+zTo0pYpTX8T/Zjo
	gey8o+FI0lFJRhILKXbQpb8TGLNYwHs3ewzyDAq3mA6krgy2ds3UyV9EZ7yIW2j2s6PEaKerOPF
	gEftd/8YoU7+iB52MfiVY199E5KY9hAAXI85REIDXe6q/Wv3xmN3k3TnaEMz/V5RGblsKZsNSNZ
	hqzOyTpA/xleT2Pr7W9rZ2CAl8qA5tU8Kh/4AEsHvrz6SdxxbwvRPie97e4Y4dCyMGpdKoHrui9
	A5ZcggvtrbqWMr7aiJKZQ6Mdqkg60sT0e4Uh9uh2ryF2
X-Received: by 2002:a05:701b:280e:b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1a6cced4b3dmr557529c88.22.1793136607833;
        Tue, 27 Oct 2026 14:30:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:57 -0700
Subject: [PATCH 3/4] ARM: s3c: crag6410-module: drop empty wm0010 platform
 data
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
Message-Id: <20261027-crag6410-module-swnode-v1-3-2f885799b6ad@gmail.com>
References: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
In-Reply-To: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The wm0010_pdata instance in the board file has had no fields
initialized since commit b53d47775651 ("ASoC: wm0010: Convert to GPIO
descriptors"). Because the wm0010 driver already handles NULL platform
data identically, drop the unused platform data and header include.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 6443c816d111..55f55e9b9a46 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -20,7 +20,6 @@
 
 #include <linux/regulator/machine.h>
 
-#include <sound/wm0010.h>
 #include <sound/wm2200.h>
 #include <sound/wm5100.h>
 #include <sound/wm8996.h>
@@ -45,10 +44,6 @@ static const struct software_node wm0010_swnode = {
 	.properties = wm0010_properties,
 };
 
-static struct wm0010_pdata wm0010_pdata = {
-	/* Intentionally left blank */
-};
-
 static struct spi_board_info wm1253_devs[] = {
 	[0] = {
 		.modalias	= "wm0010",
@@ -57,7 +52,6 @@ static struct spi_board_info wm1253_devs[] = {
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
 		.irq		= S3C_EINT(4),
-		.platform_data	= &wm0010_pdata,
 		.swnode		= &wm0010_swnode,
 	},
 };
@@ -70,7 +64,6 @@ static struct spi_board_info balblair_devs[] = {
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
 		.irq		= S3C_EINT(4),
-		.platform_data	= &wm0010_pdata,
 		.swnode		= &wm0010_swnode,
 	},
 };

-- 
2.56.0.307.g5fe7bd680c-goog

