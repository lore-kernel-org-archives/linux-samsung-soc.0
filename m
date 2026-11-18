Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991405;
	b=Us+1SFvgJz1R8kjlD5YqvgoYv4+qIZ5TPse/ngNByz1pKEGjtZvXAT3k83Q36E40DMV2
	 8PYQOe99NjfepUnQYvGMz3uipODxUGrjHVW7nrQddGcNyewMZn0aOmRloCAFnbSlzfuBg
	 GESYVNCU5uI/APBzhG6ldD3PzLH2Nwh560uZbTfgDihjav8u2muH/zn3wNR8WSVJuVCdM
	 RgCVrL8EHlZDOImrvJpuumgR321Oa7aQLRMUThknJcTs7Nfg0FgqlSL1CdEdMRdRzZA1C
	 nd932VfEEXLCWil0rWZKf1FX3mhr0sO0ScDD5kSRVCS23Up2mjuo2zjQyhC4ZBocWtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
	b=q44G4pBL1ioTzLisv8llmhp5mal8EZ5x6cHy9kA4odVha9mPxgVNmYR8OyTsJk7S4t7F
	 jYp7tKLd4TkLhmhB0YVZFxd5TlAsuCS5SsvDnzu0/2aR9+QPRzZzYR9pE4FtoLVybsHQT
	 9dCWI8PkykswJJxkQqmnzpl2u4NIUla5DIqkajAe3OTiKV3vzhaJofsi8PlrffbJ9uuaO
	 qCrxfPvA/gOoZXmhw1GB165cf15WETcWv8j8KqGyR6LxmrXZdRWDjVvmiIr4gcXeWU/sC
	 XwHyYpPfn5khry0znMgML6IU/UoX7BYKt7u6cHLjob1pTXl6A8hTQQFi0v31WGLVR/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjW9wJMx;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D06606A32F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 08:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D06606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjW9wJMx
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1096150eec.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 00:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991404; x=1795596204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=RjW9wJMxBIaMicc98otnJOiMl0a1Yu3BFmOqdcpDp9B5AkZJr5Hox6m/x2IrOo4xHC
         IF+3eFwuS0Ymf+BE1X1VGW9jHnvT56gUg4zmnV3298ZZ1IVExtqDffg5jaOEm2bDowfz
         rvxkclyiwP1y54h2htM4Q0SCk5iW3rt5klpywKPH7QLiqw1jx+W6Y+i1qVMH6pHekANs
         FCGXtZ0H9OA29PD0YAKTCCgWoWQZgM63xd2OwswLmRypebAUWriQ34XKT82JzXRE+yPx
         /ZnSEtE7WPP9lUPOWdknOLhpbrA561rFilQla9YLThJMPlmjDo5JT3VRx2V85Udt9PBC
         QfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991404; x=1795596204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=APY1KXP+BecfyR2YQLLSZASHw03RdptE/ArAjHvoRdMtP2natByn5CJbPptqxAxJkx
         61siAXyOl9HUnGfV4kLJaIr29Rm36QnL6o654p1XKLXAZWgUqw9UfHk8+/twyoO87Lm/
         dazlf85aGEx41LsJR9EFpuBCSEhhwpqdKJwLTl/sqv7lo8YptzfS9xULDMTQv+Vwz3XB
         fw3YboGqbR2C3tNQsO6QPs2JhIDZ2KDcFlA3/ahR2yBcbKOotndG8eK1R5PCDsELH7rD
         yd1AasZG+z8vAO9SuPdA2N9NoyLC86VHfv3IJB2ihuGw80T4EhxXoUGpD3MdgrCF3nUm
         3kIg==
X-Forwarded-Encrypted: i=1; AL+hErF/doOEI4Y0DlEdQ1HCJ6iaYT2pTD0qmllBTAYk/Ps+6n66973jf47rdDFHQR5R9UzJW04es6H8I1tNzfYPsZ5WvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95ZDGId4gOwB5Ik8UHtIVN8bAdtABNXfp0EBtqISpNJ4XM6unl
	F7A7vHYhBnK6kixQGitmI3PTSIDTdd18Ayuzgwci0aSwNLA57x2B6xKI
X-Gm-Gg: AZFdTZeP0CxK+4zT/ZgTK6mw8fH0YuE1+TACD7/12j0vHWg82KAj7aABuB7d6s8BgR1
	wJlnlWJobbaAb57mgmsU32tkFBrUbM+LA7bhS6+N34t4LMB7RxhQ8Uo+nEfvwg/2+7wAZFMAfGq
	eJZzaBNTjebars1KrthcRY8ydsZJbc61oByfcWbkv1lU4MH0GCxrZ/DcA5GUzBmPcHt+LY852is
	elIWAMm4u+N5TJd2AfjxPnvMDIf23S6fH+m0Qx/AfWXxo0LZdxu5Pdlv/pG+ndxZOrY43Eft0G3
	POfmM3WnJho1OH4kPdWW230TSg08u/cf3Iq661wyDHFbyivad8PpSPOc/+LAVhIx8KzT/twK5Ss
	8Bdqwo3J2DYpZoeBqjYbv4PdZ6kAckdUq+iz6po4/TWCTkzc47RJiT95w5p+sW9/s9T79TF+xsJ
	B9YfZ+Z9xYsDCqwNeqP3//GCO98OrC34K2g4UneoYMY2EGBP2rg8Q035EaOl/Vk7m8OeLUOvyIh
	a9uK1V6w3JeNrTMEo/EmV+GySQfcr0gyQzMLds1pyhBUJ9423nhJaGeWlWWrYjjL9+MhyNQXzjL
	dv4FWUwmv9+Nc1ewURL4qv8tW758hCKiLaDryvvNEMO8VGgIZNhQ0dOCRGoJhCeio8g7Fobz0zC
	lOWrS8A==
X-Received: by 2002:a05:7301:6f0b:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3828101fb1fmr2002654eec.7.1794991403757;
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Date: Wed, 18 Nov 2026 15:42:59 +0700
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-upstream-greatlte-dts-v2-1-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: Trần Trung Nhân <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0

