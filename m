Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AD776C61;
	Thu, 14 Nov 2024 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595023; cv=none; b=X3GVgY+fsG9PLhm31TTElSy+xmeGuH8Sr9j3q/VuhAPaFDz5VZjaFZQ1ZcKo/C9j1BZrLqpyuHR+3MOhJ4LemkXtAiM4qTb2d2+LknaAHhl0hrUeoqq6Di8Ph3hRKmCPfdYbkTb+hNXhK1jRiNrn/0jeqFvr14irymUp+wXWDiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595023; c=relaxed/simple;
	bh=fKfznyVOD1Iu+UIYCwjYyeHj35rBR8SzkJmfoQKPDr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JRjIsXTz0UOg7q5b8vUOEP9wda90zF1Ck8RqwPRk2Em5IdaXELxxrXkL71ZHDcdjJ5llQDmycoAJt2H5/5KVAeGBotF5X/09QQBSc4IdxxXUAEnpnQT4WezHdsU8rVOIG363musM4bUiAdsx4TaVURft8oS6bnqySyhaqKiAfTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6YnCjZk; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6YnCjZk"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-288642376bcso316199fac.1;
        Thu, 14 Nov 2024 06:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731595020; x=1732199820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LamMmHrHoISVxlDkxrXlCn20NYqsihYLKICdj17wsng=;
        b=R6YnCjZkYaJ3Ew9aVFi2yLbY6w0QA8v1/FcRAOxjNaWw02PDSKk+C8Ja+IJx3mX05k
         Zl5d1jdvoz1A/4SR1rYM/Tw2oeTt0pb6DS/gROGJOcd1Q+TEE/1Gyralychzl+iAV65w
         FPJqiaMvSEe3+I21Xcea8ZVf4EL5KKep5I5Cq7SQ4e0Cz+AKqPgVFyD4P6hTpCjiZ14M
         oeyVoFdm3lIp+X+ItFGz1veTdSJ2hthLFGC5ra8aVMb+CTnSqX6v/1noc+YXe++TXlaZ
         KIzxSmtwyXvRAwTIxUEiP1NJ+5y+Q7ICY9cNB2tiDmo+q2+hqotx1UKBuuY8zHKAzim5
         qBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595020; x=1732199820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LamMmHrHoISVxlDkxrXlCn20NYqsihYLKICdj17wsng=;
        b=gj310/MHFardGWc6o+824YCcuJ9kwN9Oiw6LWSNa9ZU8klzOjmgSqp2MP9xeNv/LZ/
         BYT8TTdOmLXabjQMZKx9LvFeRwUc8rKqZRHvv3ReBCrBKRC6+PJY2QdxY4DJEyPkjjR7
         RBYJDzo8GbqLS5u+pXtFrDeADzE2mjb4fEJayZdRcWunJYwrBA4OJKMy8zw16V9RsjcX
         TXyQBWOfaAzYHjSGaSWlPTRnyWEv3Nz46tJg3ICAuNJnQmMXZoN3blq15ErDWh9/B7ri
         lRFEQVq7NFWbwqfKnUxKLK6G/D3BLCBkoDN79benhz2ww2Y0HXpRkfwfqGRIJDCCVEn/
         UImg==
X-Forwarded-Encrypted: i=1; AJvYcCWRK6uWMl7JBmOkCo+XABaXoYvJtxT0WSUdD8lfr3uSSCkG7LTOdhejLf3c6olF1BBBtX06j1SGSin7@vger.kernel.org, AJvYcCWxoHA8J1xKGlsIhW19HxXYEmNIN2d2ldStDjrjIy2GVIZOWWrVUvaffxRtRzrH8gsB5/VS6SQqdZrf2SsKgLH3XH8=@vger.kernel.org, AJvYcCX4iueJd0sn240aEOe/gqFXBgyW792bxZ0oaTr5TKaC2gTfjhMBQzjSxA3D7TY8uQoGzWqWglE5oBc7+2V3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5cRAqWjGVQp91mi3wu11QVKQXbE12tuBtLJ3Dm/YfHSx9ux3i
	WlLzGcWtInoe+UdZ8fnFlFfc2plrsjGLzK6i5bted/qRI0Qxp+Vd
X-Google-Smtp-Source: AGHT+IFsQik4tjBSI2mRjcpS5ABfhYDsS9jNEFlH4iamdiDIl0ypAeAwQjngdw/0Rj4LrHF4boIDmw==
X-Received: by 2002:a05:6870:889e:b0:25e:1382:864d with SMTP id 586e51a60fabf-29610648008mr2874010fac.30.1731595020475;
        Thu, 14 Nov 2024 06:37:00 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a6eaeea60sm393294a34.43.2024.11.14.06.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:37:00 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
Date: Thu, 14 Nov 2024 14:36:35 +0000
Message-Id: <20241114143636.374-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114143636.374-1-wachiturroxd150@gmail.com>
References: <20241114143636.374-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denzeel Oliva <wachiturroxd150@gmail.com>

Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
based on the Samsung Exynos990 SoC.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index b5ba5ffc3..168e77375 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,7 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.34.1

