Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E821D5B8;
	Wed, 12 Feb 2025 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376004; cv=none; b=qOfiMlSpwOpwhel5LVB7uhFmkkyCWFEaj0DoveAYz7LvDgCm/8SyFU7SlR53dUbBnZC0hs7H6WGDH/pDcmLmW75KT4tPgXtq+mua+x4H8Kkt4598EkBDykgxRJcINjq1hnHTYMRb9h1ssZNM3/wzFJtt/iWmdqQu8BJYGiHqd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376004; c=relaxed/simple;
	bh=xY+L/NdLZatv1yKtV6ZsZ5DxzpcOvWiPA6L0Bhck5ho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hXE8wVm0do713pt0VDe/oaz+QiATXtrNT+ieyCqeExMmRgz896gAmoRhyz+G1yIh8MTMPGae1BE/fhSlxRMyO4yNrl2sbd7IrVLCTZBTyMHBC3Gr0LtgIvfkiixOjOrHkhrhkdYKxfaD47+4q2t34j4YklY/VAScatD9FUG2ZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kz5jBzUv; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kz5jBzUv"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86707fe3eccso605139241.0;
        Wed, 12 Feb 2025 08:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739376001; x=1739980801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZAy/eVuHocLtw+QAdIzG1zYEhIMA++9xC/HxPnjm/4=;
        b=Kz5jBzUvsTZ/4Kji/RhuLvfbhET68TVD0W31uxDkllzXc3D8vSbsZD2izsP259OHyo
         iqb/rZKf8QB7ZA9PWdH82WQ5DIRqjYySU9lOGsItvv5iOVfJfEG5yd+8MHwQRyun1VR8
         34ElqlEEIPX8X3byXODlWzMXFnROdbVDS3da3KN678jrOnCWVgzjd4buAN3Rt0CspW7H
         3vKue9TQb1iXpQ+T2ClL3V+5HEBl5h8Anotp2ier2T9HU6zVqFynfqakz5eTvGpE01E3
         GU1i/ZYWmCpqmjINOBop0bjZLO8HESY0G6p4a8MQa2jG6HRo3VsIacJuz4Ln1LwX12p0
         nQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376001; x=1739980801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZAy/eVuHocLtw+QAdIzG1zYEhIMA++9xC/HxPnjm/4=;
        b=UPjLgOO766mzh3Y9GSnqjrr0buLgtNvhdhzb8r4GBRQg/7f2xXXij5t5L0OuP63Z8A
         4JlgjE1LtE8IsRfiJOa12z7Ogymkf0oC8NeHKENEB6gcJyID6dzfplK8BA7TaNVAGpHY
         y3IWq0zT/pPmK2NfGSCYEojORUlQFnvXnOiUywNWf5TswjVMPn/rjnx188tGq/clVhqp
         NQDIe3HeuULubqEN36PiBApdcwXpmTvBv8G5JDO5PW3wJs0GBfsF6jVKndCThdkQKxFQ
         5u1/9N3ZdtHF6S7NF7xQvsx68yTam0IthqjUMH10yWaTQhpabh3KVNUNEIvIH6G0r6Vi
         kNEA==
X-Forwarded-Encrypted: i=1; AJvYcCWKpHCdF5NpSzlK/3T+tO6lSciHfAZsI7hSwA1UvB1+VS4K4XYj9mq2mqdnpoyLptpo5ObaOxHcPEoArm5u@vger.kernel.org, AJvYcCXW1Yg+DGfslLLJV7ShNx3EhJTF7qTYus3mV4EbEv4zl9zAyG1yq1FtNhnKJRYI5hoNWJn6hsB2+ANu+kHD+vD3E+I=@vger.kernel.org, AJvYcCXq3wRub2ZZZg0NYzpSVAtDKQ8eys3PYrjJoEZxFgjQnkI+BjGRnxEkcrVqpz12YadIXIbAFLR6sXg/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3XhOPYMjl234X12NmfC7BLceu8RaHbdlz6TZ30jJD74GqyVNO
	7IPkinbhM149vtBNzNiuBhiqJVbPFNQlEg/MJo1INkAMAeaGzEY8
X-Gm-Gg: ASbGncsAnkA34RTKn6wgqx9GjmWYUHmqbrfhhUse3v2l0XyJLuq2gjL5RrsTAwrUVrP
	5KuzOj/u2dsV+iMA+/H3E/NWYmbaqYFIqGDq0Uh+anKZxOwHS303mfhkSbOU/LOBUKznedJwfvU
	1eY/h5qa4WH8iRqadF4Uw5PvoHgsaE5K5SONiPRSwsPTqti0W0FyOkcVpKY2BvHnUm9eA2xrrM8
	q5V4IODi0lKTa9T70VOJKFR9AfiLbFz/c04NXx71vAaa8VJ9QqNaBQBVINWdbhiPB5b5JuPoVMh
	AQDrzgG6hC2J81pSl4uWY7Kjuu1hlAfNADH8DzjuZvAGeTyFBGqriknLfUEjT6MQPPYXJNihKY5
	18Q==
X-Google-Smtp-Source: AGHT+IH/AsMNaYbBvPxCWDSgZZjA1ZLTc+PqyHoxHdTOXb7RxYggVLAoaNgvJxCHflzGwmZgt2iujw==
X-Received: by 2002:a05:6102:3907:b0:4bb:c670:7ef4 with SMTP id ada2fe7eead31-4bbe1290387mr7187891137.3.1739376001101;
        Wed, 12 Feb 2025 08:00:01 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9636904sm2335213241.3.2025.02.12.07.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:00:00 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: soc: samsung: exynos-sysreg: add compatibles peric0/1 sysreg for Exynos990
Date: Wed, 12 Feb 2025 15:59:42 +0000
Message-Id: <20250212155943.269-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Downstream from the Exynos990 kernel source it has more sysreg in
flexpmu, but for now only those two will be added.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml           | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index a75aef240..777a2c458 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -25,6 +25,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
@@ -87,6 +89,8 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
     then:
       required:
         - clocks
-- 
2.48.1

