Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618565;
	b=i+TsL3/vuq6zMig6mM1ofbfn0/tt1iC0JDqCe+NsTPxRjwu2mNgXlzpelDTSZf9FTGru
	 qmtfIPQArcZAat/veWe2V6Qt1Xn3r3IsrfxCKnROwt/g4hTl2QCx872rSPhbPhISwQD5h
	 uallXAm9El/91iKWUUWtZTRoGszksHPbpvsGpYHpce9yWX+tEmNaaECmeltLJV5V50rFy
	 V70xvbm/U7kg2h0qVLpS3ssXIb1AqKNFcXF+NKSemgx170BkQ+RHU073zTwcLQmUVjt14
	 6bPLtnXry4MtwmZOOdUoQPkNvF2w0VJtpvXvVjx7dxXbOhwX4H0agP3fdGiKxAWm6yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
	b=RkGgZmdt4CkQXT8v16OiuEq3ZPfpLWso78Lak5VhpU8IcBruYYGLu8OnXNQUg+NXQOV8
	 wIrLdUzvvy/iES4VTYsvFt4QBUVLao/LGKDR9BOeLaFhepD0t0eOgxHnF1kfp6/VF3KQq
	 cSkSrGNla5WXXS5QkSiL72OZmX6HPcdgZRigvaR+T51MkkKTtIWg9iYbDlvYwQKvIPfun
	 dT/dfFi7BX1KJxorUINCpYc6xJj1av/DC/6/AzbFzxomiq/IS9YvjsyVwxRUrwo22bVip
	 14hzlarEMuNSe1/QC6dTbE8AuK3fz5AUceejaw3MAzlq6wbk4AwzAJqPl0OUNUXkhFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FobxV/cl";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E7606A33A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB8E7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FobxV/cl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2701222f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618563; x=1796223363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
        b=FobxV/clKloqO1UdxCrv3xpvWs6c5bg3St9Zcvhezhxh5WxrLqd51kvXcBRk9xsnru
         u0jnrpYyRqxAzbc5rbydfIWEbRafIhLTbZeVRoP8B0KIcE/32LogcZVTLQrgVTKKYqYT
         4/FUQvJgAOXhNzVXT5JiZsZfr1bdSon44rBRtzTMlb+EGV7qLDTvEhDRbIs1l8Kx9e7z
         tp0u/OCpRwBPV5A+4k7AMj65FGdxKdXxz4qiO5tkBlyKnzrKm8fXqx+bDULRIz7n8/F0
         GO0GO7qfAGPv0SiGGZAl7anlDx4cfHyz2GYl0sbXT80n+Tu0OhYrTIjvhz5SCm5KbMil
         O9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618563; x=1796223363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
        b=YqZ7/Zy1vBhii4YiWy9DD9iTu7phFZY5AgNGmaOW1KU7tYzhhwoXqnatObRGAF/zdT
         UkwR0vjhN+f1HKB4b4BdtU6joOy/d3Mm0WPBLdayn4lEz+If5cZ01zTuz5zWYS8icJnD
         a8nvcZbdquNQEUDJPWw/8GwfMQuc1Cndvo2U70eo8D6tLHUME/yiXNqaVmEazz1rwcgO
         wH7ZivwhJJyVFfpWT/ok+rGlRrnDr62vJG0TGW+AWB13qUJ5lVmRZaOPIHGszK/d/2Do
         orClIcG7BsUYrYuNyCAY4a/YbzoJd9MkLXMhgLjpvcGRplZMzR+OhpaDpCeRv+Y8hsmC
         C5FQ==
X-Forwarded-Encrypted: i=1; AL+hErEuXwWpMxWKurBQzPN6qFvi8nHuXmu567D9ZzOzlBAkYxP8ryc97jrpAJbkaIHILZTLdxwurb8DLTMesGDvjzdRyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+madauV916VbayLUwI5uBErTdlH7H52H4y4E7926Umoy0dvfRS
	vNWbsmP1pwVASqmFtMKvgUXi5YSaKj8IVofF2UYIoSWod8WeA0PgySmZ
X-Gm-Gg: AZFdTZdPFuZueOEyouLD1FfEbDtq8kJp6HbIjYDQAz7AkzgJSnJ4O4N+g5+Rt9+zm1Q
	95kNnoW/KkOwaZzbr1FODbCeCwWcfv0hrBQBYck3cjPLJ2c9wj8XtN3XV4MP3cgbNQxx2PVt1x1
	uvRqJugXlN7v+/GBy9bOC1MF8Y7A4+Std0Ht7VN9A/5G6T+uiUzQe7DFfRAsGEaj5bu16xeeMYO
	bTym+fhLP0iX/V14xlsCP+Ve42A36ziD8R7reA6XcO8KFvot3gTJTELcKuEA/sQ5r0DH6MKN41q
	oQWYNy7eJOtTZ2GLQR888MNH/tuSZG3UUmXlNC/nNpnwvlTRvVRFLS5Ds4DBJxE34hRf7ZUxYBA
	TbeeKzCsu5jILyzcQw8acibqmzHqtu/RmbcbhrFoZI/OdvJl8GLPnDEiDbIQkn2KC3JRkk1AQep
	V+3IfgimH/8DGeYHsf699QGOgxNzG0xY2yyIX+BOduCavZ+dcO69TK7o9L4bwBJ5fNEJ6m5c7Yx
	v1htftlUp6HLgtsrcFYpJrD4axTb5Zx83BIwQDW3xvHfaClWx1RP5s5dPdxTyhobJFXIqQbkTii
	g4yeaXHxJ1Kv72IPeVDEysLxizZkQNl1ljr2UW8b+AT9WkB6dN6+vxU+bZR4Tk43GqZ+Gkwlmd2
	IkGysclGCJhOu1S3Lfl9VKILK5VyDE93QJw==
X-Received: by 2002:a05:6000:2902:b0:4a4:f208:6a46 with SMTP id ffacd0b85a97d-4b58a524c2fmr17778122f8f.13.1795618563291;
        Wed, 25 Nov 2026 06:56:03 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:03 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
Date: Wed, 25 Nov 2026 15:54:52 +0100
Message-ID: <20261125145458.2594179-2-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Exynos7885 compatible.
Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
are already described in bindings.

Signed-off-by: David Virag <virag.david003@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
 - Add Reviewed-by: tag

Changes in v3:
 - None

 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..f644a4aa1e95 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
+      - samsung,exynos7885-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
       - samsung,exynosautov920-usb31drd-combo-ssphy
@@ -234,6 +235,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
+              - samsung,exynos7885-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
               - samsung,exynosautov920-usb31drd-combo-ssphy
-- 
2.56.1

