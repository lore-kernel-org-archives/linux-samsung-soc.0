Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B039139566;
	Fri, 16 Aug 2024 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794687; cv=none; b=F5cLn4QUz2QuF+x/Rjj/NjMG8G7w2ZYNM2/ul/VNcqb2A+zMdp/LIXwq6uExvpyCRyAcB8z/BJF6YI+2TJUr4MK4YRRRc1LMM1wgxJzpeMRo5B9Fdaifns+kV4vLmDRi3bJRzQ1gnqHgtJFNQlk77WpiugDsYzT3mSiMNdrXGJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794687; c=relaxed/simple;
	bh=9n2dRgGAl4hw4l3oRLChRSV149jqa2jkry4HCt2pAsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b36uD9mP9AWq6Jhod95/mGEeprOf1GifpgSqUVQg+8vXF9ikpG+Qv8/XLLVO3NARNH9aJI0Susphc8esTpkJ6h4Y3+uoP3PAghbPXxvKnATQ0+hUmv4l7iyM3G7M6IcWz/SobGGyU9m4UdnijmrfUj7608z1wmhqJmWY72Ua3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS3xQyGy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS3xQyGy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so12096615e9.2;
        Fri, 16 Aug 2024 00:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723794684; x=1724399484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IunwWJytaRslMINJvXl7msOQ8aykw8LsNbHsg4ezH8=;
        b=PS3xQyGyBQC2lZMWH6YfFM0Q/qzV4GPvtEWhvEj+WkX1kRM8pe/ZEM1QTITDzRiCYU
         BvVxFDf85PfjFEoEhqnBJ5bLI8VNmjg3bu/rFOyx3GFj7Sr+x6pOlpotInDDN7MyQskB
         altQAU9dFoirIuDK8MskIRl/S3e8ofyFj6Y+dBv348UGDZWnWY7/+DaJsvxZ8bkl6tOG
         R448afGuIYeVBl3w0R9ya1H9RuFt6vhEcRuyX7O3OfjuzKEgwFhzJVxSDnm7ar7KwW//
         X+b5lXKd0fkyQUnco0Toi63I8F1DAQKwWGwatcuNwnOv46jd3l2ZWJqxkXsgG8X4wyTP
         eyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794684; x=1724399484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IunwWJytaRslMINJvXl7msOQ8aykw8LsNbHsg4ezH8=;
        b=QGHufTrg2imI7J1wKfJ9iQPow7xuVfTuNyq46keyhfy/h5INK8F7PAaj6Zl+mzrftL
         AQt1bnzHi+Nva+q2m1d/StbwvCG0+McogFNrZRcBLLgorfva3Qnn08ABkw+kA86aNPBj
         3dXEe/DCFQ3iWibQnt6SQvKl6HxDyOlADnLIWE7uH8aMyapWOKlYwm/qRavyC1+cNgOG
         Lwqke2m1FAO2Cy5YVYb6/ezs2eZRyWjlplxCFAti3NKZThy7kdrzNGoXYNm2l08IsxfR
         pKorOXXR49blrHncti9EV/JUhVStzTE4YBAIK0mZvY8+fEomT+3zA3sM/xEyhPRdWhuK
         n5VA==
X-Forwarded-Encrypted: i=1; AJvYcCXODTII0lPypcbi1vN+iWCGyhORfJRDIspnrJ9OnOyLSQkfWRQhfyj9LavpEClRyhibsbfkgGT8oBPK4pOUaqDSbJYiEsUZcbZafNPgegxok/TIQHrtZbIJy131EvEj1lyEtO86p8odESARYXj4HQH9xp4zxr8SsTWFLHDNnqESmtNLSXk7nsr8Eh4GOw==
X-Gm-Message-State: AOJu0YyJVtXq8ENk6aswC5/PiDZcPrilC5NTddkS02rZ8mcilZ0/j28Y
	MNXSHHCQyb545FmsFlF6oB2wuu76q/0SZLeeeiNkKu16q8LNHCN7
X-Google-Smtp-Source: AGHT+IFjJcBN8/J5T8cHGhkx4qB2p/SDnSyKTH/7y/grx4LnP0iZCz3tAB8h7joAk8VUOp5hIQY2WA==
X-Received: by 2002:adf:ef4a:0:b0:368:334e:2d2a with SMTP id ffacd0b85a97d-37194328c2fmr1341141f8f.18.1723794683545;
        Fri, 16 Aug 2024 00:51:23 -0700 (PDT)
Received: from tablet.my.domain ([37.30.8.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm3026201f8f.52.2024.08.16.00.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:51:23 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 16 Aug 2024 09:51:02 +0200
Subject: [PATCH RESEND v2 5/6] ARM: dts: samsung: exynos4212-tab3: Drop
 interrupt from WM1811 codec
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-midas-audio-tab3-v2-5-48ee7f2293b3@gmail.com>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
In-Reply-To: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=9n2dRgGAl4hw4l3oRLChRSV149jqa2jkry4HCt2pAsU=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmvwTnsIb3lMya1KfWhEvX91x8+K3ZlKkQ/VdTv
 KR2QObrgx2JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZr8E5wAKCRCzu/ihE6BR
 aHd3EACKOh9GVcx0vKejDCZjgQua9HsLWSdDU1fGRJNTAWYUZboiNdAkclvcOqXdTMADaB6hdvx
 tWKctAQRPME21ATpB64rnJokrMyxvgIwVCf+8srbSwIwScyI7xMt8YsTk3mwm5WAVj1zUub+zUJ
 dtds9TolUntDTtFFTv2O/xTndHtUiQ5FYVzwiuGEQWhLfLeKvHQyZXdnx7gr7cbSUYh6sV4ze9l
 Quy4CQbTLLaA8FetQV2Y1HrTSVx2Jv37S/u7DHCT+CYpxEDd0+sNcCLPImy3SGfYxJyjUfDhhaj
 bIFVuN6xRRis75GtxQhH9ohpYM4htbX1eIBSUoh6KCT7sG/vIva0vTedMGxxq2qCYOo65gntCL1
 FmUL2lKWRPMjRg4D9+pkChyzmfTF30DPtT2ibzIQN47hl0mJSXkHpQXbs4qeTkwABW+F714Rtvf
 aybIiBZpASKkiq/QXx8CMupVYUOmEJz81Yz3U+coLbio3p5YX6NpmvXdssjxvtOPpZxTWLV0NyW
 ZDCUJk8SeY3YRo1FZanxqnDJT45uVIySe/AHN6/msJCjF6W5UaEvCXxEr3EgVZLcwrkxyMVHCSg
 Lz2aCLcrs2EaCdr+KDU6bwW3y6TbTVsV9xTtDFRAoWHK2Vwof8unfShxbi2UOUfSrbBmR4l6EPl
 2k9kG4oFeditjYQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

This was initially copied from the Midas DTSI, but there is no
proof that the same interrupt is also used on the Tab 3. The pin
listed as the interrupt here is GPIO_HDMI_CEC on the Midas,
but for the Tab 3 it is the headset button GPIO - GPIO_EAR_SEND_END.

Drop the interrupt, since there is no proof that it is used.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 5106bb752b7d..70e3091062f9 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -540,8 +540,6 @@ wm1811: audio-codec@1a {
 		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupt-parent = <&gpx3>;
-		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
 
 		gpio-controller;
 		#gpio-cells = <2>;

-- 
2.46.0

