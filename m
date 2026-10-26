Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047319;
	b=kDL/x/ZzUpn/FTgGgJFbLFCjzuHX+4PteWjZ4X5j/RtvmS0ev75QBDTKSenADJ6QCA1N
	 ePf3i2KB4UM7yCyZsCD3AUVw2h9JFF/k+0cAZO5CX/RonnaaBXY/koi2j8me0OWBCTHvE
	 FCyhOcfrWKJiBvWWM+yjG96A4XoEpvtBvaQ0Cq21aXRngNUeVVlYbSjtlLMIWCUYi82Wd
	 KFwPqqK6tkGjYnyNFx1wvozXVnfrRHCfNEpvhNC3Kao8Dh6kpe9VQqMJ34G0MSG2nHNf5
	 2KTnG/aQJiNW2K8FRi4ruGlE2SBMPGV/tjc2ce3Htzs4xNLQuhbR9KFCVrKB0alKW2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
	b=l5AJMntSvNo2Zo9FuhJQVp0jQDWKDMh9MF4bXDVDtlcOrqFVcy7ewg/MkKeWq/nk5lo6
	 szGYe4sfxktG60Ov8iM8d4gjFMK2MnM2cxomGcr3NegKRYNBC6LeX2MrWONX+WVCEpKdC
	 u3zUuiglufPct5jICFgpTZtoBrjsi/5Tjq4ZY/0Asylsw+fJW3tveQYxF2PfHQ0rXVUUF
	 P33dKa0T234LVvHWjBiPIJgyutFZpPxu1pL9dgyUglc53ADJYxfWH843sI25xeVvjQJCE
	 UEpb5ud/zBNh7YC7ljueIIJXstUN7z6BHIS/2wTAm4EsWTyoX6+3Iy6QBtY7QSbVdcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeGzgw3o;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF8606A323
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 20:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5EF8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeGzgw3o
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso23168645e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 13:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047317; x=1793652117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=UeGzgw3oKj1+ar5nKLRK1O/jDI0bzDmuGoNYiHwFimUmmwxSkxH7UMv0x4tfGyka8/
         aC8ne+vIpoijlMr6SfGjUEPf00hxtbGJ+hNl1HRmeRQpwMFCgvj36qQup19O0OkFldin
         roKQnHtDayITfy3yYbgQPMvf92RZ+rEKQFWf792wT6MJZkI2f9+QsaYeicYaH1EXNIGC
         1Q26GoO1AJt5n9itbQ87kgiYBv6XRFvl/vkagTs9U/WChlRHULgDCjcyx6injwhrXTox
         e5lXb3/4p3cYopGTfV9tQMUkGm/RpW5E3sd34nNgW0lMmhBz7REqzbDbz4Ou/+13FPKu
         EhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047317; x=1793652117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=D2otJD5QEWHMSDxyXOzGVUiA07GHZnUQTA8c1RndyH6CVnczORq606tF4jgVDVbp5m
         BPCNlwNWDCDcTm5Tm4buTRTQcQ1haQDy/K79tqWC9u3rfiE6hQgyAQkUamEMkVEfWN9I
         KcI3oru38W4tCAXVmvUwoWz0XYbYqgzC6xXncS4RlKN4taYCUEWFz1/G8M8EnVZLRmdt
         kJ5FXuoktyq4VWTWr1Yv5YEoRCT0d1/DNBODRm9IhCn5Fn8k3IFarUq4SbfQ+po41ULl
         YUJyRV/cCtXNwsUbQJ4MHWQeyfWgIK4tDvPoqSGGC1iW48ha7g226G5NEnkrgkiL2NvN
         meRg==
X-Gm-Message-State: AFq9FYLImdE0Lks+FBXG61CZIp2llYXfKl7r/QP6op9sg8vKbgYVuAbV
	gXawHpKvN1CXwwNc28El8HKyBbVQmcNfB9rridqx2W4eQ6hgikFjaoig
X-Gm-Gg: AYBFou3RJQrqK/4Dzc70f9D4dVc3Wv/iSWyaddHXtKidbjdLu0VAuY6SNv5mMPI32cU
	5zWVBUc+Pb6e3XdqwlJ3cFeRDxnyG0LX9snwllOPrS/1TTm1GI1iQQhcndi0gjYDiQ5qilDDdQd
	Nuj6EJ+YllFqkmNjMi2DiiGojZ+LRKkpDcnPkirJGsKDdjgkTaLWHN/2O9r9VV16FgQwUob53K+
	9STcygKPtA0sLr/RZdDCTFVWnxOFnBr0MYHplkoM+HUtCAbmjIpq4ddLXuVJHtpKDgyr0O9Z7KC
	8amWKrvwkvXZRwCc7ogarjvvzrthxaxJB27aRyucC5BCanuk/03MTsqbbmZtuD4iI9BDJfwQ5UQ
	JNeuBfclu7RRvv0oJzwMMdINQuAxOghc2FQFvLYm5CP5Rac6SHj/Rz/nBaxexCFvh1rtqknk+rB
	oJd0cDbzjSDgUtG5zA56zQNEyX478EbN3VUodGCo9u2iOIzyfiZ7uGmJMGCaeHE6MwuOEhHlZup
	n6b2WKf33QoKpSA/L2MfMr+3e4Hh1W7OwVMTUHl9w7JDZ0drRJRMJyJQ7oXiltGfWiI1BxJ9QA/
	CGegNjpTeorywOiQbS2ytIRIG88E2YK4KVowd5S3gpe9rl2T7jBrUJwHk3+i48XKHngB1zF53m9
	u4FBWUGlisCrjIZqYt2hJVwPwnatpGK8lO3QJwdMPC3wGHPs4HRHaGfH6qSrUWQxofBfs/zme3G
	rm1ldv
X-Received: by 2002:a05:6000:41cd:b0:48e:d36:59 with SMTP id ffacd0b85a97d-48e3eba9916mr13011096f8f.57.1793047317271;
        Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:56 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:53 +0100
Message-ID: <20261026204154.26378-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
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

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)

