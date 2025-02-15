Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF11581F1;
	Sat, 15 Feb 2025 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739618850; cv=none; b=aLmdG1w3cobZhoRAkqNpZ1Bwu3LqilATBWyff7u9C9Eg2rwhGe8aDTj/+eAzg2d2NyY+UeBG67qbXDoAHLWsq1sSZ5L5xrgg2n02SRIhuw2Yddjzn850FcdflVPvI/VEQqqI6XFVNTQIst2Er94l1C0FnP61SMBpyYeCf5V7i2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739618850; c=relaxed/simple;
	bh=RCQ9OXnQjZ8PuY2a1VapX9QCyvopm7zwsRYiH7hPg/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiOr/uLwgu2EiyEEBkR+eNBMWj1NPgIK9fAO687DXA2TxkfEVr1vr1fIBxqLqWwT03ObIEu4QhJlqEal5b9RKD5vSDLT+W3We5F4Zv7dk5o/o9UFnJT63Utclp0PDTrbu4gVuvyKy/R7grgI6OQd1G7r2R2lB6IbprAVkaOhsGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RE+M7O7w; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RE+M7O7w"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dc9f3cc80so1145321f8f.0;
        Sat, 15 Feb 2025 03:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618846; x=1740223646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DmAs2wGtl9vEWJRiZkcgsHExUr11UX/ugMzfbiEXmE=;
        b=RE+M7O7waPKCTSev/2OKs+9CBlbdaCqIvEumA10eesK7UfFFXA55k7MnpMTNF4/mYm
         fX2FJQ71k35irv9eC9Xd6Kxswccq3lgjfFaH+dmjHH4zREPTHWes6dXiAzssCcTFy3KL
         FgfAAfwJeefRBqe2/SafHrACgxOyYZ8bYNYMCw9JZbEXQJjEeRCeKhadUpucBDiwgxHn
         /YZ+AJw+bAoRWaLESkETwBAQt9WG6tjc41ujCc6U+IB0tnW5hheBBxiKR10eYOFk76NC
         BgX+5qwehrQmlO3h1DWKC/XuPAecM0l9sIW2FrRZmE79emX0Gt2YH8yjf4V2eoppsljZ
         0OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618846; x=1740223646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DmAs2wGtl9vEWJRiZkcgsHExUr11UX/ugMzfbiEXmE=;
        b=gZ1d2wm6lPw0YkjLGCdo/DUXZ45EefUlREK+ZGAnwnluHJTJrfuebFiiTqa0C2b59H
         PO1ioHEbeLLZHnSFx22FfX1S1hyINVfDIprRFGRoeb4d4Rd8Ah6f21TnZczzl3euIRkZ
         WLvnyq3nv8PLQcWgUNYLEURiEBAb8Ij/GpFzt9UBz+tRzJDMfemridCupDjX2vj1UgCP
         EGczsLnxm/u/PiSp5lF1n6pxhLV8Y3m21Q6CXJJ1eHR9Q1dvGg3CMx5Eot3V+AXMSFUK
         cTiyO0nfWvR/XAGmtbZPLyQ6yFjqx4TEc2zdDHIjtp0N/4yRvc541wKsQhtmR4OirVhz
         047w==
X-Forwarded-Encrypted: i=1; AJvYcCU8oF0y8gzMacK3NaXPWF0rgRu/ZakhCk+nMCJw+8Sx2G+bRxMvaKkTo7ucIlWdCSSS07PToSv+s/CHubAs@vger.kernel.org, AJvYcCX+kUeq7C0ZFvsineGNtxSHCfp8i4POwz8sPtUw4Y996jVyBPW3ywNF5CEd4cXt39fH1dbP0+GStrty@vger.kernel.org
X-Gm-Message-State: AOJu0YyOGQNnl59C1hr7muhrTHObbrf/WjS/QkUUGQjVwPdscq4broUx
	zTxPpNngcAVVH3fcB/karE/V1Rbq4XJ5hKSz7wT1Mr2nEIBv+lIy
X-Gm-Gg: ASbGnctcrHFo3hfo739S/uMWOqeHOTHgIubcbpg34wYJE2NJY+8nUFndC+IZGXDaZTD
	ULnoii/WbEQQB+d35/IDSdeQudxw5BqXd6DAmJJ5k6m7uGe8fnNAMbDddz/gRWzLK4AetGF7/Go
	mKDEKWK4vMeMjZNfhmtlYXyCSqqtTKBheOAC0hKv0j5MutlHXHEgwpoF2Iu7jSrqMHnIK04rzLA
	3eNNi/Zz6p65qWLb7Q2JeZyn8mSYmRDCRExf59mamrdzdIHL5zdMxgUZpzpgBVnThyRScNZd/Y9
	xZ9ltwGHFTZCoMApx+OhLmZtKNI9PczdqCvPp6ypDQmhttmsiud9AMt0jE5b7ceZte4=
X-Google-Smtp-Source: AGHT+IE7a2sueUAqNgZAS1Q33k9cLqhxbcKEupKB0HO0iGFaWtbsbspOPksnP2rof9xnakewMUojLg==
X-Received: by 2002:adf:f4ca:0:b0:38f:2073:1493 with SMTP id ffacd0b85a97d-38f33f1c7d2mr2371971f8f.15.1739618846445;
        Sat, 15 Feb 2025 03:27:26 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:25 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos2200
Date: Sat, 15 Feb 2025 13:27:13 +0200
Message-ID: <20250215112716.159110-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated compatibles for 5 of Exynos2200's sysreg controllers to
the documentation.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index a75aef240..d27ed6c9d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -18,6 +18,11 @@ properties:
               - google,gs101-hsi2-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
+              - samsung,exynos2200-cmgp-sysreg
+              - samsung,exynos2200-peric0-sysreg
+              - samsung,exynos2200-peric1-sysreg
+              - samsung,exynos2200-peric2-sysreg
+              - samsung,exynos2200-ufs-sysreg
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
-- 
2.43.0

