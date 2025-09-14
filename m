Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812A325BEE8
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855937; cv=none; b=oOij3BccM174TB1gPw459pK84kJs/Dgi6d0CmY44y+jNDNi4B8F2xgsomEnzzL+oYeVUNxkFJL+nxz77Bm/qt5f2zjiVc8Ad07+HJy2gbVtP8VdL5HDqgNyKwN51NfiIvTeOcE5ygjayoBjPk0kT2HpkKSJlWClm5PU3Ra1+jng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855937; c=relaxed/simple;
	bh=ilMxvWH2dg61Z6fyXi47Z0rAj/IgKekCXgAzquw3YXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axysFGQV0tSl0VbAEbUrgspbJWLDr6zBOosdPvP63+f/AtZJzb2HlT+Rq+02RY2uLwD1UOuE5w2plBEN2sMCfGY/QWawD5QAnHfSIkydkEZIGBOraYFl6cKiUOywSECzeGDLXAhiriZyBC+ARDhsSolbF2sAj7DLJbVhyX/MzaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVf3Cw++; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVf3Cw++"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45f2a69d876so3075645e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757855934; x=1758460734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpcddqPrYhRHRnLKWFJl0UXLOkAIbo7ClNO40SWmR1I=;
        b=hVf3Cw++enjGQUC9WJ50stlt7rX4H35ZsfgQGzaiUVbxhOB32YAQdl4Dnpp1zqnTlp
         sa6KTtBAG0/zLJE4UWOPP0ziV027L105cojgMak1t8JT2gXaBI4PoSyL/uSaGfBCt9LZ
         voGxVCPcQjO75VppmQRCU0FPOYpQJxZtnGKcaUHg/nRQqRM6PfO3PHjOEk5cU4zboo7c
         G+hxISv31JYJxUeDImvElLbSO9SpA1boKwB7a3Mol8ML4izkmwdrZgbJ/6Uqow7ECg66
         nVv1jbKVTM6kDA5B4ZiUIpaPFjb8JUeD6kitjAU80jBEMrIL3xZIE0Jqb47Qt7/j+Md4
         Qh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757855934; x=1758460734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpcddqPrYhRHRnLKWFJl0UXLOkAIbo7ClNO40SWmR1I=;
        b=xQSGgayOGycZhXSseIsCRBOfPPrBFj9hGeiRHdVhaIHCmlFbuzvPrTpjH/+vTcUvDf
         yuIFSETJPySkY7h2Q4sj1MnYYAuf2KGVwrk/PbiLnEzJG2sZrulGrWYYTqzd2mPC0DYX
         ABtmrTjqvQJoDK1IMR5PGeIRuv7TMc4hVh0ITK7S5MBrXMBcJNp/CTQKOTUmRwxgtKkE
         XO2SfNIJSoJdd0nYdrGFTN2zuaA9qdyatPxB+hW/uWyEGFiMzAzgaBBjYwMJZL2Zt2FZ
         4pDzSErK0fAe4VrwTmnmL/oXmIKgnx1S1CNw/VMi66aQI/v2wiNmP750rn+RPceQKyA/
         I2xw==
X-Gm-Message-State: AOJu0Yx7leRXyQ21uZk7l3+3UQwkQ3LrbrdGQ5Yi2/8XxTdxLEE16kM1
	6w6pCjkc0mdpKJFuLe5w1o+Azw6KE9z0j9Yl+CQyHbQGAT0TQ+sotx8e6g0/CQ==
X-Gm-Gg: ASbGncuQz/UMhG09VEUL5CVP+XFy5mj0ycTIaLBm8eFxrFUoDnXew1cKtv1ufml8D/W
	jCFCKIYJy42tUy5WV4JBTn31EVw9S/a0fzIS0yxOGkOwKOC2A310w37qU5rvMq6YJEmntG2sRO4
	bO13xISihP56aAYON3iJnzZEp5x8tzYKwfjEEDcKN9+93ELYARPRoBNXtSMJqLgwcdggMlTuIKJ
	FckjHR7BoDwmQed5qnleFn9gvusQdD3+2gvc8OFsjSzNanyuJxXOCz755Q9M+kqntKDwZl3WCe4
	Q5beBXwN2RT1nQIqh2KVrG40wzh4MktANmcI2pU+V+zchPDT3+oPhZQtsabX6rThbsiYtHNXpYT
	Jm2hBO6PXx9pjYH+lQo829Uvf1g9hM8hcRbtNBi7rQaUXf11OeR9/FXC91cdi/+LOMtDAd5UdxQ
	==
X-Google-Smtp-Source: AGHT+IGAQ9494spxVybXeZcysph17sK0XNJ3EcpSw8C5tvKdn4tAgtOfyRpsT2ldfbY8hA09fnwBpg==
X-Received: by 2002:a05:600c:1c0b:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-45f212f9888mr83535235e9.18.1757855933631;
        Sun, 14 Sep 2025 06:18:53 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm133359875e9.21.2025.09.14.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:18:53 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for exynos8890
Date: Sun, 14 Sep 2025 16:18:48 +0300
Message-ID: <20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos8890-dw-mshc-smu specific compatible to the bindings
documentation. Since Samsung, as usual, likes reusing devices from older
designs, use the samsung,exynos7-dw-mshc-smu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index e8bd49d46..27c4060f2 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -31,6 +31,7 @@ properties:
               - samsung,exynos5433-dw-mshc-smu
               - samsung,exynos7885-dw-mshc-smu
               - samsung,exynos850-dw-mshc-smu
+              - samsung,exynos8890-dw-mshc-smu
               - samsung,exynos8895-dw-mshc-smu
           - const: samsung,exynos7-dw-mshc-smu
 
-- 
2.43.0

