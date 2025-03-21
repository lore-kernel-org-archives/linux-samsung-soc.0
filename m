Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3011D6DDA;
	Fri, 21 Mar 2025 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568492; cv=none; b=RZFId28O3YpoOmBIHnNMT/AFNDBpXs6PK1Pv54cW3LHMxCHmTLF5dGgaPFPU+d3JWygzgTFrYncnUpldZlVpGOXZE7cvOQENy/SugkW1OsBKwRSh8qH/PbhJf9QZ3x6rcPTC4puqJUYD6nCs+ua0BnqNk/v2osQ0u8R09H2kgAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568492; c=relaxed/simple;
	bh=UUYd8sXiQV8MxjpEo5KGRRAHSA/jkWttBP1O0hSmhf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8ofS9Q8DUKJjSqunY6lh9k0mIy03g+deBOS+uOtj9WNAPugchL80IVAonH2EFdkUKU2to7/UvHzLAgLaspXh7RK81I1ML8nrQpNOoLV62yj0WdzdTMMX0RDoC6vls2m+eN8MGXM+MaEnCya2TGaA/5N+W0R+I1YzF69UzQBszg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGyuaskX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGyuaskX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-399744f74e9so1345372f8f.1;
        Fri, 21 Mar 2025 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568488; x=1743173288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds7BknVAdabTLEhH2HFUI1w4pAkvUlVXuhpf4N1Ja8g=;
        b=ZGyuaskX6t4kplKgNR/53r41t0Zn+/j7AmpfDdyRM5SiyZZhiAVetZfLS1Ms+kOY68
         T3V0z9rDqgL+w0fUeVIkE9hRwnpQVSWvAwAmGwM+p2lWgIn+t8tPQsp8zNQlMiYzcthU
         ldtVlAOil+cx06rDLTcUOQiNclF82SHiV+6t1fUDsNi0LXI/vtB6c/lgPcyXPdEWeEWb
         jGF3ciewpimzcrP/PqSLaEYX/QwICIwWcI7Xr/CULzRabj3QRfd/Md/GekOJpgb62SiT
         BgeQCNgZGSWcDqjlKQaiLGyxRP62ZwvWDIj79lGe8Ilyd0RZcswK3XUF8ceG3S5Z4hxa
         fDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568488; x=1743173288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ds7BknVAdabTLEhH2HFUI1w4pAkvUlVXuhpf4N1Ja8g=;
        b=L/EIC8rqWKGG51cIbNALzU5rguq8gbNEI8P92frY+LSb9JOFYP6JglpmZWlOgqaW8D
         LID76h5SjSIC7DtcpedgleH4qmgG2Z1ly1XdQuvtI37iRhuyE9s00z6vtgWL51Rxogmc
         nFu3lGWEElmvIocPG1s7TF3qBV/GvJYu8f5ILRw99dwdyRNFHfvOEKY4nwegWsZMiO6G
         Z/ondUPUKALH8SBAL+u8dmd5c4I0RAvwVm4nIgBl9WYC6kYbMIiAz1f8uNzNV+1U6iWl
         LzFlTurzI78Pz2j4RKvGzeMjY+8yTQHRGos9nzMAmCcyoDisUynpxVgfJVy39kE31RMr
         Xqrg==
X-Forwarded-Encrypted: i=1; AJvYcCXLv4SG/hFBDnB+ngw5vY3mLh0v92qVGQsx9nVEBYRnER+eOwz9Nk3nulYnUi3a4IuR3Eo50L30S3Wb@vger.kernel.org, AJvYcCXWmKxhO4+PUu5vhEPdc+rOMvoZqzHpQPRtmr+RQ5yxRNpnTmpsy4lZSoCK2wDL0kIK8z/t32+AmkbeaVE=@vger.kernel.org, AJvYcCXtAmX/QvKnbEYrBnQ3sX4QKJ0pD8GMO0tqKLKKdCz4wdBT26FFSplizyC5oLJPr1OzkGsNuZ5JrwJD2cchAukQVRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfvhHEf9sL2FFJ6vvpN33khQhyjfNUdNuKW+0sOg1jIT648X7
	yCZeQLa60W92mzo52HvdBK2udHScSiQX7L+cmVQL19U9+tviWGzr
X-Gm-Gg: ASbGnct9YB6YSwur/SEq94YBONY041jeDJLuthzgIwbPS0n8UICGOcH3beN1l5b01Fz
	lidPtJiswOlzaRvqxYvPqiI+zLULZIug5TLOgdUzYTWTDinYHwduBo6GGOOHTdqWOzl6BadFtLQ
	GCvpZRi/ajz4PRLS/wCdiAqEGhVvnPZKBcOrBvVptUKB73eY+cAbOR0ZF85fTEG1GXh8U2XyQCi
	+94RRHH5leYm9VmLCoA68ddg5rOVPhBqZDxg1cSdTv4mZRyxRAAw7WZnPzwwNIEdT8Tnx9bcIo3
	Yy+YlOdP88gw+bU0ss+zEyxjSi1egQTLDpUU8ulcqImM00NCJgQOdhtzXDe1SwdU0clspillD7k
	k7tHMhVhZuJUJJGw2N4Rq
X-Google-Smtp-Source: AGHT+IFPDI/Pf7uJuDugPQUAmhTZQ5bzGZ1oAYjD7fHEX8uEws8lBxGpmn2UKiXShmLLWmp7jLF+dw==
X-Received: by 2002:a05:6000:1788:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-3997f900d5fmr3705692f8f.9.1742568488180;
        Fri, 21 Mar 2025 07:48:08 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm2533851f8f.45.2025.03.21.07.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:48:07 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
Date: Fri, 21 Mar 2025 16:48:02 +0200
Message-ID: <20250321144804.1435502-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430ceb..679088c91 100644
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
@@ -73,6 +74,19 @@ allOf:
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

