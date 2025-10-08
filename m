Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3202298991
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Oct 2025 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759933077; cv=none; b=C8xdP5hNQSCcnJbS6QPzqr8UJtodhnqCk+lOYPUk/g6jEEnFTiPQM8sz0RXjtWEXSl3K1TW7zhaTzuxwQzzddnImNElBqvg4U6L4W1DSGzVadH10lzkIeMe8SCnoKbWebqVTJlFiLdyBwQSHCNOZDhRlERhe62wa6NXvrY5J0xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759933077; c=relaxed/simple;
	bh=8b4Tcv567R/kaA9VnSrKtjEgbT3r1bB5GN0b0RJGt3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uzpSPkx2Z9rGRIYpxYrbKXYMAWfzFly8KmHnLzxjDzBkwEOKU2IrAYK0gHKstgzsGKBimcsshEZIgYxme1AdCuQMMpLg4gKOotxFmhFaa8CTK8mJ96Xif9WXSYpD9aEmyO71IynU27atHRF+7l+B2nwR5mO9n1OUDpK4Q4Vp8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEmKfN8u; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEmKfN8u"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b4539dddd99so1171335166b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2025 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759933074; x=1760537874; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Mgl8edq5RLxNSk2dSPCx05BkpJ5f+Ni5BOyoikFEM=;
        b=cEmKfN8u3h8Di2rKsa6FW2JDyYS+808R8+KEIk31k25m/lFiq+pWB7vICJaGrkrI0J
         KQ3ww/4I5Gt5Pl5jjvIpqH5KoxQBja4cK2pbuoU53L93XipTY/z8dWM1llKm2wfH9FaK
         FTl3qdMVD7CLZy5Vl2ttdLajEX5yfvOik3964gDqPivGlDvF1l6MnOwpMdcTjWi/lq04
         GFLKV7fIyqzFlei6qeTpdprqpro6W1vf0ywoFrt0hq0jlMA4neGN4WR9iFoSuPOqFrS9
         3QBQSjDfZ/BSdKGcZrCSY9euh3AEQzmYMcd0hJ1w7CEDA6SZZXXI+NrqUNjOwGYe0hbx
         qHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759933074; x=1760537874;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0Mgl8edq5RLxNSk2dSPCx05BkpJ5f+Ni5BOyoikFEM=;
        b=Fs9gMx3iVhdrOiehIz0jkLHO3JV24ywzbmwUy1225VzZnTZ8+aHXU/7L+sfn6r2BCr
         vzhhJCZziKabWa1LieT+Iu6h00IlKM7ry943ByjAVN7nw+JjB29Sh3xdfiJY3U250xei
         5LaYYWR7GFaNLHpmrmTdKej+uy7vwdjWqcqE8YWe7xuCnHqI4Re5KRnpbYgKU70plRu9
         jOftEjGQjHMDUygKGtB7oNmGa/hM3w5myLYTUL504YSBxygpOmYz8g1P4wlFUNzcNKh1
         vmhI0LF9wxfdZBGvlNMFwEP4L/H0Kns4ATiR8QgPlfzc44KJ8qOCN0hSjiHVqNzZnOQQ
         XqWw==
X-Forwarded-Encrypted: i=1; AJvYcCWDxEGEXhDlQtEZLioqmYBTaDvcRXH2oK9IkU+t1ECcWniH1r2do70h9dHiqdmPxuNdaG5pTR2WXAbGeVA/ZANNvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy17G93t93314ndAUnyEa0kTs4VUyxJh2cSS+NSAs8H4Cyv+cqv
	0NZpFFD4yq8F5gzyavsuW8Qn3TOhDbzQopHQViMgs18/6BRnJE2vbzJNEiLtPvosRL4=
X-Gm-Gg: ASbGncuXXDpg0yaCKSqKXXn+9PA3eL94IOexutAX3YMda6Z5awwrTp6ETMcHASGd2lk
	ItJYZe06mwgu/Jt17SJuzHxpkukhJwnoplslvTKmQPW1ipUUJBmNE7uj/yFy7ezW0ahdShy+Wo3
	XAtvMUFakCoA4/2N0Nm5SPs9+iVa5/aJ+3EaW0+QJZC7bKNb4GYIxg5/JXePfSLI2MwGmbtxgiT
	T8YO76m/scKzQ55NLBBhZ+vg9I5KxM0+UTZvvVTzo+qGwHFWDfKOyK9JCydXHHrLWViQmo+++QE
	ijwstbgF+pn1/amglALlKLgCL74sZugeV9MUhH4gzswRdrV8i5rFCyvsSadWmql7EdaeAVwPJ9x
	Bdqm4o9jlQix+q+C7YRviFSi/Lmy4prSUm37Uz8Pg4OwNAIY8FHMhKpM7EZATLZeSOStfXUz/R0
	zsz1vXSxmOCVc7YlTahoYBhDsodSTznCc84nGnOL/I
X-Google-Smtp-Source: AGHT+IEC+Khx6oHHPzc66dMG7HFLPgpbH+NvJ4gD7eI0FKThBdRGPlHYqDkbnKuylc90hYn877bNzQ==
X-Received: by 2002:a17:906:794f:b0:b3a:a16e:3db8 with SMTP id a640c23a62f3a-b50aa38733cmr389753666b.20.1759933074280;
        Wed, 08 Oct 2025 07:17:54 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ea1sm1656287366b.16.2025.10.08.07.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:17:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 08 Oct 2025 15:17:53 +0100
Subject: [PATCH] dt-bindings: soc: samsung: exynos-sysreg: add
 power-domains
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251008-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v1-1-ab41c517dec6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJBy5mgC/x2NMQ7CMAwAv1J5xlISqFD5CmJIYxM81KliCq2q/
 p2I8W6428G4Chvcuh0qf8SkaAN/6iC9omZGocYQXOi9c1ecy5crUpmiqCG9cRQl0WxoJaHFyRb
 NyOumpanNKmfsic6XYfBhdAlaea78lPV/vT+O4wcZQ5+DhQAAAA==
X-Change-ID: 20251007-power-domains-dt-bindings-soc-samsung-exynos-sysreg-5dd349912b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Sysreg can be part of a power domain, so we need to allow the relevant
property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..c27d9f33d5a0501018aa3a52962a59257b723fa7 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -73,6 +73,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-dt-bindings-soc-samsung-exynos-sysreg-5dd349912b0c

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

