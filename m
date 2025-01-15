Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C58143725
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957474; cv=none; b=sgUJtgxJ/x4njV1WWwspIvRdE7+KijCyz0O8CZMmZ+66mFpaz7A0/3p8OvWR2reaihDpOdeV5v2kqGxmDl/AhqBjvwc1yrOll/zxq9gdDtrt4vAMzqLon9tfiwhX8q6DzROYcnsbiuBUIpZkaofCugWkX9OI3Ut9gr4lhmKjm9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957474; c=relaxed/simple;
	bh=QUweSS7Ezk07GROe4ptc2JCbOPNeoO1DPWPu/QS6yU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpG1mT+N5yKkIjHJkapShIPm5Y9rRfRFKm/2SPFap+2Sej9SwAdwAw2wJpXgfy07VTibGGf+XmXjs40Vkhtte13eFpj9HFp5iWU/RGWCr+RsEuhIkkPlYv9V0jdxFDq+WxBiZhxjuLd7juF0Vua/0Xyhz1YpGrxbixO/XI1ZC3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LS6aV9Lh; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LS6aV9Lh"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so13286378a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 08:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736957471; x=1737562271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=;
        b=LS6aV9LhUAkX5U1c5UhixWlk6gEAEMf1gedD/7ophK1/eCyIQRA11A5DbwYGN3zWyK
         4x0XXkw0tLdvu05r8O+DvbW5pBj/ZRFy5F+ClA/gW30vylYJkz7Uo9PnFwVUspXxFULt
         J3Yl3QcpULQ9u44mt1MKA4HXeVke/0N1Ae+Am5v6FKvdGaehluNDpcZsngtFYNwrwrvp
         jENiqZsC3Q4i+98M/g2VLhnQMVihUZoAOAnrT9TBdH5L3aeJKxCBFov2HsofbCEny+RO
         Ir1cli7m9aCAr14otitnBxgYeb6i3Oxw/9ugB+TVibkEXJGmFVkFGVOfugVDL+h8AvL8
         XXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957471; x=1737562271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=;
        b=RpAbI8w7wTdjJDtU65iU3sDjkISNCxi21zD4DME15l+qXN6mGC4boR3RGFhwS70nCp
         FLwYYAn4OtUVE+ro/c9VJ32ROpmN1w4awia/lDKjyiXYnK+PKZ/10btMLsoY5B2GWQtr
         R8J0YebTMxACPVeWKJcksH3XSW7gzRoxcYbceIbeJcIc0i/XL03ahBK0Yk6NaACsngtO
         9Dv5A7j6E0w6X4hFkLU51eeFt+53qNM/6IskHTjyJYzZbQtesSae8nDskppH2LFnYyfg
         Wjpxto+oysZLEhe4K9J9PxtJVdRNS3AhrgLA8OOojF9CXNRnjv5YLoiAyLv5ntTDAXoR
         uRAg==
X-Forwarded-Encrypted: i=1; AJvYcCXEj5CYGwveEppSHT1AmTnPEIaT2r0dbv+/rpNGCUbGeusUXvoauXl8/4FIxPkJVphdq0AFWAD+f6wurB78I+9rBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDJVLQD4aVsTaZzk34lQDv1icQO5SZLxLEer3MF8j3kwagHEDR
	YPMHMH1AZdU57HTWwc9SIPLEQYEDVJYBkS1Btt95Gs4MsdeHZrNIlrjQQwYm7vv8+uX5Gw2sMSe
	Pjn0=
X-Gm-Gg: ASbGncuP8wtluadcEl6Peeqqmw97BGkvvpJNjgMm3di6RTXLe4MtmHsR/Yn5uc1t5R3
	GTuZpGIEi2vVZqU/BP/JlPT/p7oFLQ+GkfXoRTUu0IUAnJ1ULZCU0nqR9YKBrAaYH42TzUROHYw
	82UIVleYArbASpUjYUXg5gL2jaTbQ/UWcQ3Z8IbkoXzGIYxNdmyJ88bhjK7T9ZujDJ3UPX6w+LM
	8NzFIn41aLgW6MihkW1iS9j9hO969H6F4URtyhrAqaQEAv86A7cEI4a/RrTE5QRIn+ajQS+zxtT
	IdJFAdyaCuWF5su9+/XnIM1Cc0MuUIR44FPx4WXo
X-Google-Smtp-Source: AGHT+IFGVlW2mK15C3vwD83ymqly7SGDcdZjGDfxtGUMODDwfwmSvKBHDe930bRBFlKZrwP2V54i3A==
X-Received: by 2002:a05:6402:13ce:b0:5d9:f0d8:22e1 with SMTP id 4fb4d7f45d1cf-5d9f0d825d6mr625838a12.9.1736957471141;
        Wed, 15 Jan 2025 08:11:11 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a55f9sm7416232a12.81.2025.01.15.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:11:10 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 15 Jan 2025 16:11:09 +0000
Subject: [PATCH v3 1/4] dt-bindings: arm: google: add gs101-raven
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-gs101-simplefb-v3-1-52eca3a582b7@linaro.org>
References: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
In-Reply-To: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Raven is Google's code name for Pixel 6 Pro. Since there are
differences compared to Pixel 6 (Oriole), we need to add a separate
compatible for it.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/arm/google.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index e20b5c9b16bc..99961e5282e5 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -34,10 +34,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: Google Pixel 6 / Oriole
+      - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
               - google,gs101-oriole
+              - google,gs101-raven
           - const: google,gs101
 
   # Bootloader requires empty ect node to be present

-- 
2.48.0.rc2.279.g1de40edade-goog

