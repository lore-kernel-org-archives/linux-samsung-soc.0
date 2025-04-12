Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902FA194AC7;
	Sat, 12 Apr 2025 20:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744490003; cv=none; b=JRbt9cwj58qy7CqgyKIim9NWPtY2v/JHoOAIfFbXKbTIn6s6UvrZrUwgOzK43xuqpi04/RCjUm4pv/keFsR8ZaQTHSt6DLnc5Ar2SivxVrxEOpfxrdH2otYIRk4LlTULdUDWi3OMSw54tsWHVest+i5Ll3ISwX0VcDCAa8fUx/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744490003; c=relaxed/simple;
	bh=wTfDddhnNBbCQZ8iQkn7EeQXh0ISlPAsfcCUkIsxQDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8vv9sCI8D++4AhM4QFdBA0Vqm2hF+Vlo6i+LWpkaJAtn4H1jfauRxAzEs/R6ryRCrhVgBRws/oOORuSGuKPrBuqp8YN0mu+2QghmccgpWXbIF1x6PBz4Acw5eSBh3TZgg+mZHB77joVAGcmFum/UH1Ya8MfGMMCzhHglBrx9mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICgBfN2W; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICgBfN2W"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1872090f8f.0;
        Sat, 12 Apr 2025 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744490000; x=1745094800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46R1bm9dKulR4YsPDWRT51COLzcesWjSu6sXIaCGFGs=;
        b=ICgBfN2W9aB6kHoqmBbCslqQF+cyZFQxD8+WlJVEL+LTvp6FfbFKF9lz5ig1m+BZP1
         /Pfal/AucFksLCOcBzN/E5+ObVedD8zq81ybnXoFZEMA86pBmsvVkzkmh8n8Neeltu0c
         FFDW0sBxKFd/QBD71pZK1HyA5vIdcRWVt0FO1OpqbSEjKbtZjBvrUvSpiWt2VSBOOf4k
         5cfnBRQ2iPrZSvACjcroq8qLi/pfkZ9Oync8SegxcFoLSoWm1VBhrAxEMAmDg0XhVBeJ
         1hoUG/SWgBsTxCOEjF6SaBGj5mWJWrJAKGIkkKSiYwwkVClDj4hLIAh3J/pMzcKUmjYr
         BKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744490000; x=1745094800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46R1bm9dKulR4YsPDWRT51COLzcesWjSu6sXIaCGFGs=;
        b=JkbWst5VpK6AjcCzBPt5zuTolAshYPGXD6XgE8ykS7S3LI3JOMxWKmvYCMayvJ4R8j
         Jib8LUFu8bwaCFt5pi9XXEmHI0Cj0HtIvXBSgqHC7DeSmwgsOiWra5Usj1PtbpF7YQWJ
         SOqma11UK2WLgJf/11phQLv2Kgd93/eBeuDpODCKpfIclZwAQ9nxjY/PFgpxat+IU7eJ
         09HtOQIG3QzT5Aq4EW01jcI01Hmn2tYiRUBpWELBDUBLSX1bm0eVpu1s5tq23zt9r6dg
         WEJ+n3k4dR4jIR8rkmTr3lPX/Jg4UP8ie5XIdWH2HCVU26FGZsFaRChQZ2OqmXp6PLFV
         ejxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTugMOZRKaucDXRhZkUlTV7cndT/DRE8c9C9Nn2amNv6gbc8FmEk1Rep30fG2RZs5P/DmAv+EnSB62@vger.kernel.org, AJvYcCVSoL8iwOsrVHtsFC4e9CzeK++eDOJhNAYjYJ723Lr6e9NmTxqF39J+Qlxfqh+plTq9oVLHBmiiXLII@vger.kernel.org, AJvYcCVuUvzveaphjafGs+1Pv0WKAFpQxbouritYwzLuQlTK87Pj2ZXJwC78YBD0kOf703+Ep5+4CbqGOBvTg/+G@vger.kernel.org
X-Gm-Message-State: AOJu0YxPziGnnNAjoz4Zswu0onZ0KiuLV3IreifcPvMtuS2RWgqfgSwx
	F3JqFVBH+bqDR2vYec0jPwTDpwJ+P+0taDGHYXShplRlNMCIs2th
X-Gm-Gg: ASbGncv8UMFIM+PD2K+Lged/E1vIzKujU9F+pDxGAjsZzH5ircm+/hkWgsky3KYwcsj
	xDxoHBJH69Mn6gaXHc6RqjrAsX9TKbIVQU45BdDB25K+UVvSD23F7g4yBySXfgfvXramZkcBr59
	9y/3EmSswXLF9pdByGssN3bUFPpHSmNGn7c7BCzsA4qkiapeLztPpNavAdpdBRkCtnJEMvnPMtf
	702Coy2FmO8ZkUV0Y3SorSkW3mGy24UI7nUz0wjvcRx2NTolxkG1XrP/Aj+Jr72hcovLFsXGIpo
	H5/B3zoNneUlguzpB96+yRVCsshcseX5OBm0UdLTx9afRvEVSGmiRdfMirpKGKThys6BIUvzzSH
	0p17UBB8K/gQsNViU
X-Google-Smtp-Source: AGHT+IF5pUVNX7l4LDbQfqKU0oCSpckbyV59TxP/AwG/AVqqo2BVRvnKLPfh0mBKyn4QvG1zIbkAog==
X-Received: by 2002:a5d:5f52:0:b0:391:2889:4ea4 with SMTP id ffacd0b85a97d-39ea51d33c6mr5540462f8f.9.1744489999701;
        Sat, 12 Apr 2025 13:33:19 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm5941896f8f.76.2025.04.12.13.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:33:19 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
Date: Sat, 12 Apr 2025 23:33:12 +0300
Message-ID: <20250412203313.738429-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
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
index 256bee2a0..892545b47 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - google,gs101-dwusb3
+          - samsung,exynos2200-dwusb3
           - samsung,exynos5250-dwusb3
           - samsung,exynos5433-dwusb3
           - samsung,exynos7-dwusb3
@@ -79,6 +80,19 @@ allOf:
       required:
         - vdd10-supply
 
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

