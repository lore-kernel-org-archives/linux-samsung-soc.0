Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9C1257AC6
	for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756642950; cv=none; b=kfVq+TsynnIuH4eRjLms1/y6Ny8N2Xyru0I7yNa4zUXWHnJGXp6dQV5L0YFpftE/i+eNpyI+sTFyW6epMdvzrzg+uDTD2D1cmw1bMvdSflls5r7z8nnAE1VtRVKnTFURTi951jCIyF/WWpQhfnxbN7eJLUFOpAD4kaRYGekCHJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756642950; c=relaxed/simple;
	bh=v5nyT8+tGZRsO9dAtikr+4PQWjweFrMo06731HGMRIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTUqTRzwQ4GZU8GZbMhBNAA6uUQPgZHWrPWY0keH165zgwuaMeniwcLL+tvYVMFvN4RTLaeVlxg+84pnCaNgxSzp4c0oeGzrBQt2cPEAFptfmqk+FhIYOt9LfEKKnTu1VN388Hsqbh/XUuli9pm5kl9WN5Jx5QubXUjgn/NYqe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXdSJ/Rb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXdSJ/Rb"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ce208c7505so498591f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756642947; x=1757247747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tbdz/rnk5XYs1sNxhaGSOYuYNRBLnymKQPJwzl9yArs=;
        b=jXdSJ/RbAbpnAuXj4grC3XUbRzGcxv2wHbuaahp8+xiC7JVQyQLIWsX9TZbsDAo5mZ
         4p9VATqUy9iVqNwdn0JIwjdt4sqwpMRHAWqHAB1A5Cx19Oq3KWSsdMj/RqbTf79uRs0P
         k2JYErNdk6PGy7vJT0NYBbfJaQwZrjs6MfYyccAoHbEgdl+7oY7ToHCDhtHnx+zOX0LT
         CnDb5DGWi4+a+FQOPMww2v4FauccJPU7KfIqPdj3U7Las6cZX80yjJXYGiThKh1EvNxk
         M8Je9MZUf3ftOrWaX6REFbiBURXPCsPI96LJkzG6zJZSGBaJlTRZ7ZicVUvFZ21IuF9V
         cZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642947; x=1757247747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbdz/rnk5XYs1sNxhaGSOYuYNRBLnymKQPJwzl9yArs=;
        b=avnTbzYqrR76gzEkY8z05ybOwfT26lL9gbFr/P8HM6Z1rPAdfnc/4PdbGtxgS1yGgf
         rXxfjb1/CX75nCj35FBA0dJRqGLWHDLagn0SGmtejKXAYnS+2tvVQKUSbttLlXk+HQ+5
         R7OG8C2ABhuBAxnYmjmbqMOleDkkd11GHN0IfVgPooc3geoEUadtdSIUgWi8bOacj2tg
         w3VANBfwlBn//603Z/D/P9DXoDayEIU0/ehz8w2K+NGskRZ7N+l/IevH0zAOJ5Fng3Ii
         Ej/Su2b8Bzkc8n9mbyTBtXSxqdWcKP0x/kFsd2SHy90B1GCi2Z5ZeBZDv04C8b5oCH0S
         4zjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWesg7PG+yFyIHgpr4P7eRcQpUsCFMy+829VK+fhLkUrcZUIGOxA6hA8rPexk9yZ63AivJuVkyueAZ7bWRvdYC8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8OMr3qRXUwxu4QX1NctluLxkTX8CJqGpfukvuMiZP/8eDiTcD
	60Dfpx04D9h9VqFnWAGoBnyb8/VrDfw0cGCRjwyxvLnFycGeHu+vzVEQ+J5ZOZ7jvYI=
X-Gm-Gg: ASbGncv3ZwzkYUlUdQ0N0g0Hopeq8aP2w9k5fqw0kTZtiEkIEr3I8zb2NhR6zyue9E7
	3BXKZJdGdxXHJKATNrZ8m/PJh/T5UGEKRH4CJxVAGIRZ6UKYbf2IM0RlM34JqWxQPNLzpeXGuSR
	Wi+fWNMEPfTsXXg2nwITjCX+dIXi2tEYJe97oN1QI2hTix8taYAmP2EeoacW7oxFRc67mm8qROW
	+WA2Mpg/aZWTdcA/unmuQur/0/LhAFftX8gYH7OzHmQY6gfwHyhYuEaCMgMPurhcgeDmJkbI1Dz
	x/28I3PL1URxui+O2+7lbnpIYcyQY8XM+xJnKX2J28cCPXOcg1bs9WV6J97kUoEt9/OkVdLyiEw
	YvbXbQ+cp/WHVJIERsDQlXn/H0wmur8Lfwg==
X-Google-Smtp-Source: AGHT+IE/b5iJsNRkZ58Htd00eUR1h8c49rg/ihy2xqZajld0Xwde0K/MZR/16orZ6YWVgu6EdslHzg==
X-Received: by 2002:a05:600c:4fd5:b0:454:aac0:ce1e with SMTP id 5b1f17b1804b1-45b802c5548mr31769935e9.4.1756642947010;
        Sun, 31 Aug 2025 05:22:27 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6b99sm194866225e9.4.2025.08.31.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:22:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] usb: ohci: s3c2410: Drop support for S3C2410 systems
Date: Sun, 31 Aug 2025 14:22:23 +0200
Message-ID: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=v5nyT8+tGZRsO9dAtikr+4PQWjweFrMo06731HGMRIU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotD5+nEPqC2MIN8fjO2Pd41yMpJ+38QYiDL69b
 6llNeR4wHWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLQ+fgAKCRDBN2bmhouD
 13HfEACBXdBXTLrrWqCSOgYhgpk6KYuSF8sG1d7wBgJglr/sWcza2pYYGs2qRYb4pn1VFmpkE+Q
 6eH4CnJgGZsf6PQmkvKnc/kf9Oy452Iw7gpLFbWkbj0oZgd1LI3hPZriTvqrN+HwIGq7Q+JuY8i
 sYPNCHqYDXDiDDAE6R4IQhdowiPwx8VUhTA5U+RcyIqmbKuJZmOdHhe710wAsG8yTe70EnkaIiz
 51W5JdNTrXjlVEyGR2ucuQ0MlPAptnMVQEjJdYiXOGD9cNaLPbrE7Dt9mhI7Xy2CJlNnf3KRzxH
 dIo6Lwf863V4no9rAersy28ZUcte3ze4gM24jjmL/oGT04VY7yB4yhHk4YbUzk1EuYCE4dhPXdJ
 8s6mCALIBw0SeUk5uC7+gGhug92YNekj7QcmmqO5UyjAzZAnwCZN1GMDxq5JaX3JJI9K92ypb4P
 iYd240ThCF7IemH/v8ApKYEhBiDW6gacsyOMuaxvImcXEKIAaN02awiJvMVHUWKY3RFkvVsfFlm
 R2/vNaAFcAnTBLLlvFvUcZzk70dvmfmMPIaYnFr/yr8AvKQVGlNojywNHqvvHMhqFBLOq9y5gSA
 Bgl1WObRCdpuwRSKU1yTzz1Klpi5TFTlkBkkWOL0uKalgQH07Gk7vbtsFYH6b8NgnTsFD0brJFL akZAgNUk7bJsXpg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

The driver (named s3c2410) is still being used via platform code for
S3C64xx platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Commit subject (Alan).
---
 drivers/usb/host/ohci-s3c2410.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index 66d970854357..e623e24d3f8e 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -448,13 +448,6 @@ static const struct dev_pm_ops ohci_hcd_s3c2410_pm_ops = {
 	.resume		= ohci_hcd_s3c2410_drv_resume,
 };
 
-static const struct of_device_id ohci_hcd_s3c2410_dt_ids[] = {
-	{ .compatible = "samsung,s3c2410-ohci" },
-	{ /* sentinel */ }
-};
-
-MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
-
 static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.probe		= ohci_hcd_s3c2410_probe,
 	.remove		= ohci_hcd_s3c2410_remove,
@@ -462,7 +455,6 @@ static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.driver		= {
 		.name	= "s3c2410-ohci",
 		.pm	= &ohci_hcd_s3c2410_pm_ops,
-		.of_match_table	= ohci_hcd_s3c2410_dt_ids,
 	},
 };
 
-- 
2.48.1

