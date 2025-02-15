Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23282748D;
	Sat, 15 Feb 2025 12:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622901; cv=none; b=N6vKFQHHrVlXzpUhMGmngclJIcwafwUZJOlmRI6DgwV+DJ7Q/kG6wTQv7WMh9Yq4RIjLpb3eQYxZ8WeNyGIIoFjEJ5WwpbHkEa2MLBJM0ZLVflRVu77D5ER/UNhK1SWTrIs1opb7Y5ZjNBSPRF8TVNOxHhYLq+CCD9dYq2vbtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622901; c=relaxed/simple;
	bh=NUFAFHjmOoZGZZJ0qwhpYLvrFGiJm+5vDgqQuk01ECs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9w6mZe2pNKBg93jLPtuFVRv6DXc+Qgjoz2wygygQtDCxfiLeQ3g83YAp1ihrV04fz55N8pqQexQk5XzfSsjnVbrKW7vbvslBxPutDEWZYSOAEWeX+a3zt6G3I8EsUd0thyx4KmTSSLVeNxFopUJxsdf8FuexaE5V9oCMx8wHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJX9oRQI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJX9oRQI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439714a799aso3452305e9.2;
        Sat, 15 Feb 2025 04:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622898; x=1740227698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPOc1krqbrMo4NAQ2zRjkO6jdWzRpPpaMokHxmTWog8=;
        b=FJX9oRQIPyNVk9roQ3xE7jtMJbg3X4pM2I+92GpX56t1+8wIhHR1XRPu4LTng4axlF
         tVVIxzQM5daYLSaAEG+WwruvVBDjaum7Mhb/4AXNJhE7yuBfoNjVXXhtDiDOfjljdJ8I
         sOzjuyvYcMyhqHOnst6RYYDGVme4V5YE/XVLPfoinn20EAEwusV9UJGR9bVu07C4j+wx
         T13WMpcBlkpki1V0lqSeASe9COiwJm9dXTdXsqx9KsCMC/b/lVX0GHokROuM4uWXajJ2
         zwmbaL5jNtd144EOK+3xgIXgND7kQLV9ULolWqvuf8kVUEcQiTsWMJQKmSZBgdnPcGxn
         xfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622898; x=1740227698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPOc1krqbrMo4NAQ2zRjkO6jdWzRpPpaMokHxmTWog8=;
        b=hRU+XdBDfYJejcodbyHAW+0haMRfW0hvlClAWR8TVSLCGq7e+GrIYf9FizEUDZdVPB
         clbgenoRNW7VYu6fPoRP0JS3tOjO2CKy45l1pCOZsg0kOocXt+XjJSa6eRw7I5Ihqs7e
         bLLPE0C1tPsrddO+ORSPGjtr/yBmPdDLH65Jis4fHPsQerN4/o/P4sS0gO84cIhOBbxq
         nWrx0r09u3WfQq7ELN2w3Ji5YUJdSRCJ2S42S5gsVI8t63Iz9t1e0i21EzIvYIbB3F1G
         rfPGS4/9rF50npLwKRe8cgIdfOr2c0swjOppMfkMrn70WVMcBen5ue7NEDRIxgPwF1S7
         ZomQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM9J7GuGgwqb5TXSPOIYB0KpJyq5zh6Jz4IzC6x0gYh0cr+gIi+h5ZTGl/G5F0SENbNPgK5xaVHtxA@vger.kernel.org, AJvYcCWPF0GghWKs8jkRN+fEW+hhZOW9Lqpq+ky88oZkiFxm+7ohcZf7DpobhZO+Z2kSGR4RasjsD0eCp0Xr+q96hh2npzI=@vger.kernel.org, AJvYcCXXYtNkOM66ImYaSKrLjaBbE4wN6sF0nzC8Noihux2H358sLLk+yUDjvQh393iAG1zvkIe0n9I1VrNhOJDC@vger.kernel.org
X-Gm-Message-State: AOJu0YznQHN93pGB/InvCXR/cVv3mIjvucFUac7kpB693gbQwSsFKZk/
	ScbpDQQRJMHAVB3nSFwZXh9OtHia4IVWGs3r5/PbXmEoxwV0NzHs
X-Gm-Gg: ASbGncuOtA4QUIh0z2SfDdbVMvKXtt3L7l9OSiqi3Fcbuffz2sytKBt9JOxH5T6vWHM
	jDtS1jP6HS5ubewczzkxt/3vmKcsTT3u+ljqIvCJaqwJPqvb/USWVi/3p0nnRryd6YR4lXwZO+u
	YVNqZo3165n/t1ugzzfKXxhCO0XP5GwjMwK0xeScnvkX69KERrL5OCQ0cN2bgUNGKCygNhLqxLX
	pyr6FdesrK3/e7zOQh8pN7Jymvkyi/tDi+iK6K590RrHdokcme2LyrLXx/TedckF9SDO/ZJDl4D
	7TQilyPFC6ofymzGd9DuA5xcDdfYUgAoiycFPW2gjt9HxKFDxtDTilk2xvSJyo7aypo=
X-Google-Smtp-Source: AGHT+IEhPLK+WsPaa9GLkvxj6OwZ2XOSLjFNoGpwy2XICfLLz9TO+N4X1s+PXqKzJ8UTBok1AIkixw==
X-Received: by 2002:a05:600c:5102:b0:438:c18c:5ad8 with SMTP id 5b1f17b1804b1-4396e73950dmr40069915e9.31.1739622898147;
        Sat, 15 Feb 2025 04:34:58 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439615e543asm70846685e9.0.2025.02.15.04.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:34:57 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
Date: Sat, 15 Feb 2025 14:34:52 +0200
Message-ID: <20250215123453.163434-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
the existing Exynos glue. Update the dt schema to include the
samsung,exynos2200-dwusb3 compatible for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430ceb..beea8e78f 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - google,gs101-dwusb3
+      - samsung,exynos2200-dwusb3
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
@@ -73,6 +74,20 @@ allOf:
             - const: link_aclk
             - const: link_pclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+        clock-names:
+          items:
+            - const: link_aclk
+
   - if:
       properties:
         compatible:
-- 
2.43.0

