Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4242749D5
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549150; cv=none; b=NYKPXZRYCCGksIoNpGuIeUcDo0xx9eqsTo1M9IGXiCalql93Mc782DA3jdv+Hbrg2P7n6R05mwh67YVXoOXykQ5X1jJn1ZTnQ3CceCVSiBae3WNJ4ADFzuVWEJaMeI5oz3GmGeCStuaXpOFoKPpyMe3/zcik+70cjj9SIrhcA8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549150; c=relaxed/simple;
	bh=phCIU7qXQwzL9ywXevhpCuLOX4bC84K3Yg163SS2Jhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1wKgyGVLtDoIyLyF107LbyZ63Ydzw8joGtQ7zdvsgyBfd3krWQEKcplm90pC45bvOeXkR4cGb8yQ5i8RksVoOZMnpNKtY4K/8w21npMT+Tmd1lnCMhDTGTJLunPjfVMpuZTYujkxweR/h+12x/cyBrFVbxPzSV65uLMqnZZjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBDkISE4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBDkISE4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3d12c5224abso168841f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549147; x=1757153947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lc4VvtndTdQUwu9NAMxU40diYp84hx+fKTxM5CnEC0U=;
        b=qBDkISE4rNvm6z2ws3zYdpEkoJs5FkfrcwKPndZK/qmYbtU5o7qk8DRH7ucRTGyMk6
         i+4e3hJl3v1YLG/u23OqBdvXG6g2m5Yd4o9l8zL/3LPzIVUlEXWibqhvQqRiOUifF1Pp
         b9qO79VluTGD3RWRvWLtep2BVHgAgwAVdASKFvsVe2pISMV9B9sW2Hy9zXm+2nYZ2mow
         hTigNAOMggitrsxbw/4lb8toItcZ8giBsIKEytmW/Ry9GaaxorJuN8AVGuk6Na/Tuc3w
         y+B0OiK+KBx8SnaiM7xqggG5SG7BtOlDyU65REClCvHA9LD3bRqdy9ky3REbJGFFcZ+Q
         M8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549147; x=1757153947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc4VvtndTdQUwu9NAMxU40diYp84hx+fKTxM5CnEC0U=;
        b=nJubuGiX1YXLM7vDqGjVFOnZ0uoYP8kfZATWzJineYZer62WqC36PSvt+ajjnmoN9o
         y118SNRf3FmWUozyxGCFHo51Vac3S26UyBptj3RiTc/ehjlcDKVC7QFQ8VrDMbUl43Lr
         hNCTlDoL+HumooNPelx0caE7iZxY/6Ctd3A6XwxmAlJOVJEnXOD4CH1vVcgQGwWIOoKw
         1kggaz9Wd+cQY03A8XHjadkG+hV+1Zrw8p9a6ttkBno6bNbRWxRlN7VYymGac3FEdI3m
         G7ioyirhJCQfhqu2yQfE7ODJGfnCF7mSNkpfaSFZyo9C/OA3QfdM/ZjnO85UdJvz5VXu
         ZUpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrt9A5lwUlk2hZDbEB2AG3xeJ8Y3vGbpsVgP3Tcyx5rxy8N1adicHScFVaxvCgDu7iTnnx6sIwaiSz3y0JSmXzYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYe1WtXAaOiLLkAul4BmmQWi6qXhw4HVX3uvKLQPk9wgM+5aEE
	BtPhod3gDJQl7O9x4Y6fyO5JuF6tlXsD/lq2JdbkojkYP+RbtDrqxCY5L+9F4IOOEUQ=
X-Gm-Gg: ASbGnctggh2hqbfisRAu0oP3XkztCkfUnk6ICLZ3+rSEtaKcLjwdwM2HrGxwKIHyLPE
	TuTNpax4uqjqnBIshCAcNeQlb3HB93shkKkCsJb9U+dSCDDVJ99waNtadlBlKaeaPC4a215BSou
	jCqGbb2T7lQ7LSPIpV3eBpjW28sKE4UrQNuRMUj+ury/7RgjmLX77qkNMSkMLpJYes53JvAplfv
	xll/nnpwGozwG7/UoCP9fGNGYO+WpDWpRYjhBWf0NymYBQ9PrIPBj3Bp4NdrCvN32NpVBUqjpko
	kkqoULGIYH+bnjnw9Ow+UHvHQ5Ot8q9I/CraOiPvLMHW9IombJqIeOmo2mvlmSV8AjXaFXQakk5
	m/bCYHljU92yY3Z6SB32c1sl9cSfKV78M0LJmtgg=
X-Google-Smtp-Source: AGHT+IElyjWIDdnRLs09FR+6PzPMYJ0mBBOSNWeVs5b3fm069jnqc4HgASV/Qa+IsKi3cpsKc2Birw==
X-Received: by 2002:a5d:5d0d:0:b0:3c9:1b91:71e5 with SMTP id ffacd0b85a97d-3d06606301emr1956916f8f.7.1756549146595;
        Sat, 30 Aug 2025 03:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 12:18:57 +0200
Subject: [PATCH 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=phCIU7qXQwzL9ywXevhpCuLOX4bC84K3Yg163SS2Jhc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostATWdrpdUjx7iDa4Cq4mMsNQm8U0vKHMo27y
 uln7YNtvyaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQEwAKCRDBN2bmhouD
 1/u9D/91m8aRXiwMrNQqYcDCDbp+fzpNTIX1p0ufDEiWmRJdp4r9vOLcLqClJ0ZrIN0QPFKfV8A
 ZwN7RWtY9x658v8E8l1eosqy3gwhoba2WgKC0cZpVltv8wEqCPATPk6Z4wNAl5ALIIXDSM3blgW
 FFoLip9pEF7F94wca7cKsdIdLKtkOiklZ3c7c8EmI11uiGgV/rm3JtbTaUdtZubMCcNoj7/KF3c
 R9fP6FnjwFbXwUC+DmDegoOBKKmdMvioZVjsFX1RDGhVwULF5J0A+XtzqYVFJFv5LsQPrUTNyqK
 5eIyaXy20Qmm50YIauobjAYV4JSwL+4BMyQt2L/TIx8D7cy8ZtFybxjbJ8/vp+pbhU4vbWG99K0
 xmn6JzcqHSt9uAeL+majTJPB7v94/DLdXRpbzFMQ6TPvTHHJRrjB2A8jmiqNXGvstRiYPNIBSP2
 DqXlm2K7X8uaZ/Xr7F6cWeCRy3nypZ4G/xZFD8klLD36PDbJJJkhoksqaAPcV1OfZJIhrkrj5QW
 omWsoukJVFDZw1nBJeZOnIb1o+fxpzHsyk58xPOTQBxNRKl1XhioEzQLW6m6BAdrTVkxNvVOpfV
 lRXtKh/Mlqcm0Hes1AsZ92NTSStjpD/H6651y+S7P0oyqZgrrAqfobIQXEidlDzAqsYhK996DtQ
 /ylTuDAV9xIAy5g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Properties should be always constrained in top-level part of the
bindings, so move the samsung,cluster-index constrain from if: block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 53fc64f5b56d33f910395d32b35e0905b8b9aa53..445c5271879f002f2b05645a0e748dd9be5aaf72 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -49,6 +49,7 @@ properties:
 
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
     description:
       Index of CPU cluster on which watchdog is running (in case of Exynos850,
       Exynos990 or Google gs101).
@@ -104,8 +105,6 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
-        samsung,cluster-index:
-          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:

-- 
2.48.1

