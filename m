Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD81D5CCC;
	Fri, 21 Mar 2025 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568967; cv=none; b=J1lvnaz8E4P1RgQqR2jvnrLLGAzBAfaCaEoBtcKFs1quKaYCH4XYUp3B9hU2FBTntOPoOsMfSXKWj6zKsc167TFYLiJ/A56mSMlMVsxjtHiM8Vn70mUGnZEXYAa53JQPg6twk4dHfZYUYGGQQRJ3eFrFIYoeYa9gxuwLeP4QA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568967; c=relaxed/simple;
	bh=5Y2rWrPByplM9s/TOvWue3bi1TPuQhufG9cJL4qpa7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXat24fsma40Cd/+r+PJwFkCEg9/XQVZ6+NVdCgjgb4fwJxLjOi2p2vbVNDLooTEDZE5n6fOEkygA5373kU/BRGQj4dQd3hWoVYRWnSGQzkbISOo2De8S8x6YJy35PU9LLPgNBM5gCtBHn3QgxFVLqiHJv2+46JPKoW8fj1s7Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2/3jb4W; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2/3jb4W"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso13739915e9.0;
        Fri, 21 Mar 2025 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568964; x=1743173764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=;
        b=a2/3jb4W0RREoF7GRr6x4HtCHJuazaIcIDSXDMI8c5GBKcHQupg0698lxl+t+LMNAy
         tFz56HFM/zLVo3kMG5yDS1SkuB1wZnBRwqP7LXLtWMWHYK7hnLdRkNxsgNkZNI2aCniG
         5Y7syHS3aWGxuQXt8qo/VqvkQOctNoJti8PTOUMrJ6dSJ4Fwh8gQM4S5R/N/SHN/K0QF
         cTd6KuwMWX/zehggvL7Qw2E6ET19QsNhCBMXPBpkYnTunAcbWwZRWJJiBvQuEGp2j8Xd
         G/p/tR2xrGP4ChmTTDsgc56hiMT3ewDJ/92jSXcw16bXNMhkiODAer+0Ugf5vEbTS1/g
         /oEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568964; x=1743173764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=;
        b=cUAL2j8e3Me9HDWGIqgEmQ7CtXOxhs/CY3VJJxMb0R8NkU+oXy3DMJ2BL03dSBSQmz
         t1s9h6VGCHRrLFCNXdxYmn3Gt3lD7f2y4Ugc25494BDVf5Bvm8/b5cG8eeiN/xc06YJH
         ZULyiQR4tcp3fK42G8YrRVHfyI6fQrVyR7VxAWC1CffZfvcxVXRZtdkUtMWAagAyL/jf
         XJcaTvXjhZl31xgoAZwUDsOrdmYh0iyAf1SY7i8gBLsOqpNeqSBdi2WI+N8Hcn8wTq0+
         VwsCtUaqdJCz6RSomcyVDUrtA4t6A3qUt7i2AbqJRScgcZ4sPCcZpUffN+1L6l36o0Eo
         wAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEaeaLRGodGbGzHOXvwoPeqhGBnjI1RidmoInwuCwYhr5Us0A/doOE3MaNBhCbH7Y0esCRrQRc90d5@vger.kernel.org, AJvYcCVC3viLFNGU6Ngjzd9H5A4cGXfw0/sd5TTCeHT730q8z59mENc1K7Oz40VYydTUb+eW9H3e14nL2X9sdNrH@vger.kernel.org
X-Gm-Message-State: AOJu0YwQi8VovsHHolulVpfIYRsQwk2/Iv+Ya5sXgDFySoLuzi04opYR
	sPbIoUP5r85ZQUDSnxWTEuF5GvJQF2xpFSgTlhU+dp8HjDlTqXET
X-Gm-Gg: ASbGnctLrx1jiuzhyXc5SAKY29aATKxu17Z2mHUxmjjpiRF4QVai9nY685OXAmV69wi
	AYyZ2s5majhhlf0otWv4R1jocDvUREUUZParzx3Kgu0T7EFJGmwTwk4hblUyg4aGVAW2t6Uz7mt
	fSLtJeKdyBe/5IoykIsDTB51+FuopWyBS6kZUU+rHhVeygbhwkBREza2RymAGiYNUCZWRL9V9eP
	otnAujDk3PisHTKvK6DG/txxEGJtDiwZ0/g0oc5F15iFuajThKqIlnyycNjTK94NT6oCVaDjslB
	1C8GCPY55O1nWvxGKIME7PubxdKXQeE/oR7hJxnemY5Nf4jqCxn/PMxjbq8ypwPWREkmpjtvsRP
	Yd8LboOXT7+q9iaUmFzZ8
X-Google-Smtp-Source: AGHT+IFy7V7yS49SBSh4QivpSyiHP2fZRhsx5j7YhDnnawlKq2OGpMgAznt0LvIAwZuK32tG9Lq3pA==
X-Received: by 2002:a05:600c:cc:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43d4915e6bemr68812115e9.3.1742568964237;
        Fri, 21 Mar 2025 07:56:04 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm29217095e9.24.2025.03.21.07.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:56:03 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: arm: samsung: document g0s board binding
Date: Fri, 21 Mar 2025 16:55:53 +0200
Message-ID: <20250321145556.1436201-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S22+ (SM-S906B) board, codenamed G0S,
which is based on the Samsung Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d..bb3f6a0e1 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -45,6 +45,12 @@ properties:
           - const: samsung,aries
           - const: samsung,s5pv210
 
+      - description: Exynos2200 based boards
+        items:
+          - enum:
+              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
+          - const: samsung,exynos2200
+
       - description: Exynos3250 based boards
         items:
           - enum:
-- 
2.43.0

