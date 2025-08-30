Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F09D265CBB
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756553580; cv=none; b=ehfGqQkgugSryUS8+x26o1FQol1WIr1ryqJtb4VBhRKKlx6Vtw4aNLproll8roUwA3/fjOw+stku9uP2IJ/UYui1X3qgDCG2ayuNJlbkTY/E8l+qukSeHEH5XiVioaAuyq5UKWoI04mdi/xD9epJsklt9r3/NqUN/8rGCkfVkyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756553580; c=relaxed/simple;
	bh=kXo25ot71PKao96MF4jC5Q47IZVAt+tdcJDhDLvaoXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CU9a1sJR6rLyzSv2QufrmzYgCQKoSIwMqzlMCZtWR1gwWcccUSBoaM+tAPOX5zJzkhysiY2FgS6X39G1IVpvsFsJNm65pz2pIHZbWbfZC7iSiq/o5Xk+Lz6gyQekmXcGiLL2TuRnBQGSbVNQN4alK+IXmvrQma2GTWNrOsgc5Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rssioEC9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rssioEC9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3cea1388486so146261f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756553577; x=1757158377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFmqnQTGqXxn55WYLK2556v68/MA/H1ggbgVwEpgWEg=;
        b=rssioEC9YMKIMphTqwLo/INDSk88mw57WswR9Ov3925dr+gljefdPhkKuISUsxEwLW
         EwgTdlqWO5ErF+l00y2D2Ko2DAqBsAKPgglniOejRNHw46Xum73R2ULLBIkyBfycv+Oz
         srXJmRfw23kEImEzzPVyWPYTSMHGQHPcB25/YsbybQk/lMhqkUZBcLI6gILU+toRkD2U
         g10PUQNhPnBSUfRYSrI6AGD8X3fWd3UNww5dbPZ/jPmY5p6U7st8eLCu5OjUF77gNMCl
         6/kix/HKftJrbTe661h7FjUp/H+CVeU7Xhnvi2T/6zfOcAhPDImbywC4pnOUZNluc/Lv
         4oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756553577; x=1757158377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFmqnQTGqXxn55WYLK2556v68/MA/H1ggbgVwEpgWEg=;
        b=gnBO4DXvUiHE6RXbHMo9HvMYf24oKeI/kHln1+JpfdRSD96uby8OYefjbK5R0v1avx
         puFsK42dlXAMdWkvnVz3n79uVMkKBtngrAj6jVpR4uQOLfX3jhBipBzWlBj/ZwWy15Z6
         3UqpTp0AKHafGgfDSWZDapCR+bO0cD5xk4G4VnTrgj3oQuAKrjqKM+IxB9+ohmVrL+r8
         Ig9xrpsfTMT08c6P/6Mg5oH6o6uH8U8hRWjyr9N8GJLhhW/p5ekWmFAJSZR3nzL+r3lY
         TZFlIaGcdUXz5xNXNaK6RIu/02bdPcYKwZ0vpcZyycLoCoYD0ABcIzFHYD0aJRTEqX6h
         N8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCU5ndS7WTuCXu48NAT4gmhEncFLhpr39ghZ+TQ50dyEY/dJV803wrl/Xa3o0ame0oUi5w73rOanltTO029wwPWSow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu2j27F+XVm784aC8/9JAdWH31TmOaviMupRZ5UwMB2panc+Hu
	BIb1fh14xwxYFwgByBwB3UcE/xAcWT5/AKrqtHIPdHl0yjU0XWz83UOhZRqJEHsPEwE=
X-Gm-Gg: ASbGncupkwWZQwzCEjAErwdkiefZTLxewzxG24IBzMwCgUQRS2oeToe2ltt3SvgWo55
	wRupO61HhYKvDSjRIRvuwt63dwcpTZVHCjud8ucraLJKfw/wVQlzXDliwaZqqFkziS84PpCAGbL
	xq4zKGK+B1CtnDg1jmc8G5iEG2P+ck1ztQBQ1JhPKDa9EvyF8hLc4jfMHTx6mh0uEsJYRSJgdfZ
	EKs4Mo/wFXJA8GwnrHp873uG2r5gwXpmie4RichnidxyEe6bivcdtxaoN7+0DTn9E09yKxRKUYn
	4Im8/l3L4agQknnKPCAu7PV4tkE5jccdfrIlxdEfkSTBGsOe6j8zkTCuosF6cXevBJOlZVq0PZ0
	s4ULwIRwDd9yNMQC5us0aB8xY0xtyI4Q0Jtvj0u0+6MGa
X-Google-Smtp-Source: AGHT+IGKK/qSnUCxIDpMGOBRaCQakj8d6VMwSyKMl0I+FHgNN+kuVHKO2/oVKVJVRl6z/fpK5Ky5LA==
X-Received: by 2002:a05:600c:37ce:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-45b81f23e6cmr21995105e9.6.1756553577525;
        Sat, 30 Aug 2025 04:32:57 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm75468505e9.3.2025.08.30.04.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:32:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: arm: samsung: Drop S3C2416
Date: Sat, 30 Aug 2025 13:32:54 +0200
Message-ID: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=kXo25ot71PKao96MF4jC5Q47IZVAt+tdcJDhDLvaoXg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosuFljxKGu3v2hhBhALiaOsXxtFwZ1tXYGnBn3
 xTfxiSjsCCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLhZQAKCRDBN2bmhouD
 10PLEACNZW39Nn75JA5RBUdU7uRFLAFlwQAQ6FGdpKDD+l8AbufT6YOx7/PBxVjhYlDta48gbu4
 UlLeAl7EQ32fF1mfnZMHRrJ7Js47GliPkqqQRTkbRLSfheo7JYwa5piEB3nT0vxvz95pOIC3jIK
 6Dka65RxK1r/EtTHQga1a2NsL+kwEHNuoIFqwa5QX/8C86fG4RGPsjdlzEsDmRpRgDMPq/swWCP
 Q15I/hWTJNEiHzQRZhGaUuslwpxoxbAC1RBrcf9g5WDcqIzzUAvkWMf8ARez2KIpVTtxIxyBM2i
 AQ4ZL7Jhv9AA7o8r8h0hpqIq+j/WGf/BdVuHVwEmRbn0BaWgMeVYH5UVPhuh3UHvhPoEDogh6M9
 qYnu/EdxJSf/x0pgfx1GD17M/b09DYVf9Lh8RQFClQEW6/xubuuUhK5XvROErwBz31uzaFl9SHj
 svhojbfHpUUWZc4GGQYBLkucUZkWTJL5gVEdYzf34i4z0UbtTe4W5mDQI9u2a6qr2TcjvbTcSYY
 9h0e6+gaxnxSFkf1PfrOoygwuPKXGEwYa/O9hL0MuiFF2Bf++4AywoeM7Itvv8sKFrXC+ZFZmlO
 v0h/yglPvU51VaoQRAwrfqwNxKIW15+JK7G1vCreJxRDhUujE3slFTTC3dkQIr2oq2sq5H+3/wn i+Z6nZNekhuYSJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 26fe899badc5..f8e20e602c20 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -14,12 +14,6 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: S3C2416 based boards
-        items:
-          - enum:
-              - samsung,smdk2416                # Samsung SMDK2416
-          - const: samsung,s3c2416
-
       - description: S3C6410 based boards
         items:
           - enum:
-- 
2.48.1

