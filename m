Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640D257437
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850306; cv=none; b=HcvrmYtQ84H0sSOMPyHhFilASuzA8ZMamosHY3sHizs+AIktHahie0kAPgJqWVVKi1ExwhIlTrZwlIOrTygwdIV2z1eFFAEzj73ZkmEKyUWC8Yo3w4ENCYFnCyFfmaVVphPuqrND2gjFa0jIFROCwqt8NzzAymm8r3UraWJAMQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850306; c=relaxed/simple;
	bh=nnxWlv+OJi30txzuvQA8yOIXIEYLUlnbIbZsAeav1ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPsQUhOqM590mYqRJDnul0rp1Umxzf2h3/XJ1jfxsur7/XfUDgOIzsKjGjAAmnzdQC+OV0Xx63OqsvQkGXaZdXFRl4ZGcXA1JJkbMk1v8fdra1WJtX82Nwkd8OI581in+p58eslEXFNoh5f23nzLyanag2dCIRaz7ftWLI55WkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMmpQjw5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMmpQjw5"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e8ea11a325so1071725f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 04:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850303; x=1758455103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1jxxIyK9Ih5zhWAbEfQ/SUSMwO68aineNys1TdCPOI=;
        b=DMmpQjw5WkJ/wPCKXgTmLTpmIyFSS2UnR/CPcQ7BqP9O7YSaT7fwfsAhWnKp6vVurF
         5xYg5QD7ObwVcrMVXzr+Jost8bI5drLBnISACaYGXvMyISOwJ5DXfO6zdolmbLhHsj4x
         2nz68HO3UNunq3ZSsiGFbhzxQ9jDNRlg/jsshfhsfute9UQhGuFa3HzJQh5Hgk240Cg+
         q1/Mtai3iXDc8UGgWpQq9BdxIYZ7bv8u1wcSVu0DCSIRM8CdImErvcrZC//GmdVhMZ60
         l8McpjVNp6/ymyn5AXmfVYONdMGezd8pDXNJx4JNYkEEb14BAujlg4NHKNgPJ3N719x3
         crzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850303; x=1758455103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1jxxIyK9Ih5zhWAbEfQ/SUSMwO68aineNys1TdCPOI=;
        b=AGxFo9keUNaM9nYcKoAeUZTm/OGFXtAiJWP9e+venKME/v8RdrscdHCigYpjXSyHB7
         xwJ2FZhqBHqt3gHshNH9uWm9NlHtzgBHL6wHou6fBp+pQHz0M/yH2rKK7/TQkUK1HxpF
         zwlDl5faNILlV9ujOIxWcWALdZW+W1p3DEEkHe8VUxPyQaCmG2UpyUf9dLsMa7oKF3FZ
         msbY9E2KNXnFOKuu/OVtkpaUVdacWofXAO29CJ9MSPHMelJ+5hw2+pK7NvpLLiHgXJju
         JVRXDtXmLiz1DdMCVQv5ULsH3eEgwVSdWng2n3az0hlo0/Oi0UB4SB2Trg8eP8eID/9O
         2t/g==
X-Gm-Message-State: AOJu0Yxsr5Weujh0UBWIqH7FiQdTGndpiqk05AbT8s2JgPZVQgWNi/bp
	ZyoQfqMNVptK086RinJWC7yyRUhynSRENlkBpWcFbhKR9M/t1EMnANyj
X-Gm-Gg: ASbGnctrYCfnoriE7rh/hR8BL5Xd/cktc7fTYLVMIBiDIN/CQh+1Jid7uBCDVmrDy5C
	O0fpWLNLUSEZGkOxH9v4MOQiX2W+o5RV4ENwfCPTUXxkCocH9bIix0CKWzW+15oSmbQmdYz84Zg
	oiLgpLXgZsOIMXb5XuyjlHVEIUWP871+TPVXksFUCe5zJJ2C4RT8BkDwNremy6/hLNq2OrviEB3
	tIB3tpBka7wlFMkQYEQpQi9ZlJKJ/DdzlGgpFamPHXsUxUekErnyx+YjZcw+utuJWkQ7mEYHpU5
	/F6uVUE0ZyHo7PnLcsSbbxk27K3571oufJNwkB4CSzc0wWgNI89/s3taXIYisz5s8Wujg53gB4v
	0wqIjwSWxQM2YTTWebXnpSqbRuwLOgkFIl8nqanrtW/q2pYaTZSkrYi/rV3OaN3St86KpQA5YKX
	BZ5iC1FlqS
X-Google-Smtp-Source: AGHT+IE1BqJhX9iGCNG9Rwq5f7XlNdOwfaGHziUaIwwwVkNizVz8cQGq1fatGEsUFHWt7rHYFPM5cw==
X-Received: by 2002:a05:6000:2281:b0:3e7:1f63:6e7d with SMTP id ffacd0b85a97d-3e7659ee4e1mr10069982f8f.45.1757850302860;
        Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: pinctrl: samsung: add exynos8890 compatible
Date: Sun, 14 Sep 2025 14:44:55 +0300
Message-ID: <20250914114457.2610013-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the pinctrl compatible for the exynos8890 SoC. Let the
driver handle our clocks for pinctrl as well.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856..ffd3e2dd2 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -55,6 +55,7 @@ properties:
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
@@ -136,7 +137,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: google,gs101-pinctrl
+            enum:
+              - google,gs101-pinctrl
+              - samsung,exynos8890-pinctrl
     then:
       required:
         - clocks
-- 
2.43.0

