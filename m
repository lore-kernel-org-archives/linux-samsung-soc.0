Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E2342AA3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852593; cv=none; b=OlvjaxNJ9hjLsJmwcCNA4GPS6ClLjyhztI9CimSZFBFlliaXP0UMLjzK/FFIYedsR9lsRu+YFoGSFHZ4KEFnhy6Ne+JXczfAraWWzhoqo72C/yQ0yObtn/jbFR3sh0Y+KsuQT+Nr/pRle+Pjc3R7sr3f3hls56JjGLRysukbtl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852593; c=relaxed/simple;
	bh=2PS1aw7dfUT0k1FWYcqJDnEg5AxccGVN6SkNj7bMjuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U3tb74n4MyVXuQRMXHfWmigAkO5lAZZdEq3kqX3uyD6tVOcaH/Tbsqg12OiglfuePjd5EXC5OFOmJd6OShgjnIAUqr4K8dRuJZgMJmTh6Q+shjO+UfeqGLVJ11+YKCnB9syyj1fYUfEmVAaPNmMnFbgYjcRI1bu5pUzHe66MQwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L922AMHs; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L922AMHs"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78ead12so1166148566b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759852589; x=1760457389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iDWqoWfueHqY1DQn3UROh93hmAu+K7Xh14JdQEHAgE=;
        b=L922AMHsQ5AJuI4epf0tAPOTsp3RJtAOWMo36afQ1pEbLGwffIShfXVmlPk+lLQQ93
         EeBXopkUAMHLZuemTVYSEJ7m6jnIOVXykOyCs3FEBC0RlVwTrxkJEke+nEDN4W+l8P0u
         aoA9rbAVUARM1+xA/n6y583bzIQ7LWOgAX0H/5SbCLYHdr5fwZYCodBd1+ZZeurkrw6A
         Q3/1Xwy02u/BVJ8rroIOgYduqg082iHUNr5enYcJeaieueNxmVgNdxEHnlVE03tLzdb7
         3TE+G3s+NmYwfC0d2WY46vBYIir3+5fizW/8OQuh3f2Xd2kH0Yt303aTmFk15RzrS437
         8bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852589; x=1760457389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iDWqoWfueHqY1DQn3UROh93hmAu+K7Xh14JdQEHAgE=;
        b=w7gbCO3QFXoPuJ4MWByKEMjslmEXsr1VSrvoPgxEBxaDr+pv0SXruWJOYXl/YmbIhy
         ZYILrhnvzeYoOMiw+/q/YvS+azXL7sA9VcoTKLkl14+mMGYQiYYae4yn1BUguaIurRaB
         qcexgGzaEEjZBTjsHIWhg1Ks+hZHYBudV8lCCGl4FBNl9ILqvLU7c5vXLn4pJSuLZgLc
         vacO24ENnWttTkEuqXeUS6FYvIwZTIyyGy9G5tukggTOfNBjOXJ2jfI5Hm0VO5t36AMh
         qrASdeiCuBPKrgj7kSjJiPnTH/OvkEwmbDLsHn9G7HpPerW2QNdhcAX/xbMCcsEzLOkR
         kxjw==
X-Forwarded-Encrypted: i=1; AJvYcCWX7spI9QZmjt1dJX3hXlh9+iq2vL0S/SRtM4LwcUZdsIZWTsIce7haTLtgIxAr/yQ2pwiwwtt9ct4v6iQjE6XabQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdjnXX0+U9mR+y7Jvof1JBEhrPPMvTSipOJUb6jXoR52oOHDtw
	rvcIf/Nsn6w5MVcC2a8vnh+Atb1k8JrAL/GkOuClBoqxOargG1zQVTCBl/S6tyjm44c=
X-Gm-Gg: ASbGnctB14I6Zta0X8ep1k00ghax5efMgfz3m1APLS06bBUUEK5QqMRJT90g+bFaZF5
	rbV7O/l9M5dszegZ23TCjK2Wdb2NTfpjnPdtcv7L8Cn2BM0BkJCjT/ECrIbbk+G6C1HN/Bx7zM+
	LJiK2JNQ9c1BzrG/b8PLvjzkzKbTmvbnBgmCghJ83KvkjPM7v2ESwNCD3D8npT9w5A5tikn7PPN
	rr9AvdaAcm3QfiEdJ03vKn1Ia09RlLyZBYSeJ/c7QIkJxWR+vIM6XSwguGWKglUdb3jYZ98uThj
	41W8ay7NBOgBm3qtz9kCzCciK/qciq7wSw0RGCDYIqBCO6fW9Inn1xQddnuZoeUKEnkJ+3mfjx6
	FLgOzinCLkkqhR4jCZ0TOeW9oQeQDoC/hj8awa1dxTl+ZztHMJoo5YY0vjrLzdGP0dd0UX6i+7e
	MMxJ7DQwYmvDWfvY4kqu5PFG4TqpeSOkwJsxKHRK5P
X-Google-Smtp-Source: AGHT+IE9IcJVSPedWcpAGpdnmJW4z9APNCOE9dq2vD2s6GXK/hxjPEw6IveEriVdGAIUqOpPhoFZSg==
X-Received: by 2002:a17:907:934a:b0:b48:730:dbb3 with SMTP id a640c23a62f3a-b50ac1cc3eemr13165366b.32.1759852589395;
        Tue, 07 Oct 2025 08:56:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a5dsm1428820166b.85.2025.10.07.08.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:56:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 Oct 2025 16:56:28 +0100
Subject: [PATCH] scsi: ufs: dt-bindings: exynos: add power-domains
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-power-domains-scsi-ufs-dt-bindings-exynos-v1-1-1acfa81a887a@linaro.org>
X-B4-Tracking: v=1; b=H4sIACs45WgC/x3NPQ6DMAxA4asgz7UUoBVVr4I6kNihHuqgmF8h7
 t6o47e8d4JxFjZ4VSdkXsUkaUF9qyB8Bh0ZhYqhcc2jdq7DKW2ckdJ3EDW0YIJLNKQZvSiJjoa
 8H5oMnx21HLxv491D6U2Zo+z/V/++rh/PMByuewAAAA==
X-Change-ID: 20251007-power-domains-scsi-ufs-dt-bindings-exynos-87d3ecbb3f4b
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The UFS controller can be part of a power domain, so we need to allow
the relevant property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index b4e744ebffd10aa237e01a675039f173e29c888a..a7eb7ad85a94e588473eab896e48934cd5f72313 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -61,6 +61,9 @@ properties:
   phy-names:
     const: ufs-phy
 
+  power-domains:
+    maxItems: 1
+
   samsung,sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-scsi-ufs-dt-bindings-exynos-87d3ecbb3f4b

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

