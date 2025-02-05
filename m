Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E30E21C195;
	Wed,  5 Feb 2025 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794329; cv=none; b=apD1fATD3IlOZ2ATZB48RU4lpDYCWJYy5R9/DceMJUCKJQrojv2agvXmFkAXxHNzrUwoZZfH1f9Rx77n2XkVl6JAJ8NUNfr//8xqC6VBf5hd2komyV/qkgrmtdefmwXNez1t6sCL8sYKuB+BdRBv9Feek66mYXIAYe5235Mxl70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794329; c=relaxed/simple;
	bh=8yFf9WV8I3ssOc5w5pHXmqlX64QiOLY21KDvFbktQkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JlqjU2lV0zbaGVhqMlEBANKrpjTLm7FBlGqpeIQgRLLefZj9JAqyIu/TsMMR8+OHKszQHtgjEJnrSnuBDBmSHJ3rA8EMzOG5L4n4cDxfPaaE3s5jpyX8K15b1EfYrFdz5itt5maIxsWmSkM5zKxqhyFq4t7S0iGa5HYZ/JChTdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDRREQgP; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDRREQgP"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4ba72ccc283so173718137.2;
        Wed, 05 Feb 2025 14:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794327; x=1739399127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beA6gjGZdB5oydWLbpWxW9pYKOlWwgtrMIKBgVMVP0I=;
        b=KDRREQgPNVip/4CLs/2TZOfkiJc2qsJSUGAXCNKvRv1gvsaxbLK7Z2fBsei8d3b8+Q
         65kOLiYO+MlnEgdEhFjJe9sOqhSylY/owo0Vttboj+VxX+g1N82zmSXXTlvgcsuP0HlO
         rzCDJuhD0VK5yyYNcJelXOJBqteg1Dtguk6XF+kesKQe+Y+i4Dea30/H5GIad1nIj5Bt
         PZAaLW6Q7Z+l3j/YWi02HejScGUBdYGqOZMK7B9xlH9SdV94zHABcogkuoBRzVnld3dF
         2Aa8lYhoEQKhUpRY4CPm+qWPA8Utg5cr1Gz6kv+T/+s0JqJK/p+XgKy8vAm4FRtKhADE
         H3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794327; x=1739399127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beA6gjGZdB5oydWLbpWxW9pYKOlWwgtrMIKBgVMVP0I=;
        b=fTWDvSK9EqbO/Mys+Xz8+HL6vkPs7DjgHf9t0T8IV4cUJmMC7BqLbnc1TF9LSHIHgo
         I9kKOjTj+SqOimi2v5QmfIO2nlmh+zY6iutE78jhYg0zEg3XL4ONhF1XSxzrU8KPSnj5
         vNxWTlXaVZ4feEEfAu2KaQdzZJ4BoO8Ig7/3v8HAfDGulxJnD+OG6/ChGy5SARIsii1K
         iUqq1r/FYnWkm7Oy16v/NY5hTYrD/LjTP2aZrkN7LvWXWcPIF7UEiyFtGkivEdosvN/M
         PYTu1qeaQoGVPnHt3HFP65LEQ+cUM7rkZ4EGPX6UpQAsA+y5w395v8qmTdnM/Nddkk19
         hVPw==
X-Forwarded-Encrypted: i=1; AJvYcCUvA08X+09cxQX3TtaEuzcQgmHrO/QroFtdw8ng1fjh5VbYJTa67z1BoehvQR4Bepsn7AHoVVcdiNCTqL4Qh4dg2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOl2zL2j+sktQvejnmpsFEcpIkVdyda2aRhpieJMJ3huC/IaL
	fiFT0cweKBjVoyhrbAMvXJlZdDO1yNL8AukKabEerCrfuXNyUgQ5
X-Gm-Gg: ASbGncvCxh9X5Tam/sNNQKyyIHhH7+fctCH0EUmbjoJ6+blmHtfYddedxDjK5JLm1QS
	mw+jadDEwwZOQC5MnmD5IoM2JcAGaSBpM2k6IOmUTR/TKtwq/ogn03IlUY45OrtYqbWwbUBI0+k
	HIrz6c/n8BX6Bhs+hpaqMbrWmyMifvH/GYZaKlcAhdlqdPTykRvYCBJsdeBUM+/BbADnfJC/JY/
	sZh5f54ofEiM8+5fI40LRlCYfWRP84BWOgS6EhFDRbzaOHGwtdw9muhpCDGAJ9YFCAZqpYvAH/e
	mjXvFDeHht9jPl8WR7gaENFacmgU2j8UWSQJLefPoKOxADWaR/eGxWP64YZIfhC3zc68ivNVKIV
	Otw==
X-Google-Smtp-Source: AGHT+IE3nI+T7UN/svC5dEEyiI49AVWPcqQVx+uU5ZAnx1goXIkB2M6UC2RNJ+9BdlxIm9Bylg54jg==
X-Received: by 2002:a05:6102:8086:b0:4b6:4502:4a84 with SMTP id ada2fe7eead31-4ba478b3533mr3842089137.2.1738794327322;
        Wed, 05 Feb 2025 14:25:27 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:27 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 4/9] dt-bindings: samsung: usi: add exynos990-usi compatible
Date: Wed,  5 Feb 2025 22:22:18 +0000
Message-Id: <20250205222223.613-5-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos990-usi dedicated compatible for representing USI
of Exynos990.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..4283d35f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - google,gs101-usi
+              - samsung,exynos990-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.47.1

