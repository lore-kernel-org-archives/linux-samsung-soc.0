Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7901AAA5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 11:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706270123; cv=none; b=aDC8Lu6gkxBekLDm23cqLFBAu6WRG9RViP7/XPR9jOwHhS/GaEnPF+SIaiy0QA1MGHBG8OKH3WYL2aVUWXgN3JxOVouDbS4ygZchjjtMUBpJsBK4XCGEUQi4WcCCmhqgYkql+/Djwj99fXFqAz8ZTzaG9gW87sqzkr368JghGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706270123; c=relaxed/simple;
	bh=5gQbWGeiAGTlDLAa9LO74fg/WiV7ejSsxBG3mOJYxCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c9Mb76qUg500xdmHpJyhOLtFg4470043IoJzNLNAK6KF7xg3A8+oicsNWS4IETabXil595gVpxROFuWG9DtliyGZ4tdgfc6D4eEoebubvptbAOSmcxqkFsLTKJZfO8+pVTpCEAr4jLDfagLJGuBl7FAkWcL5DnlUWpZwxHYJ3sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sxd04UQZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sxd04UQZ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2c179aa5c4so47179366b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 03:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706270120; x=1706874920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LVcqUTXP/P2WsnP6Y5tfw0AY+HXGkieDjmGHyFGDKA=;
        b=sxd04UQZOL++DRDSLqE5sSLNSGqznkTncIPsu1hCkKzF5xQbuvy3Q8uq8WU7wr/vho
         EVUtYYR+Y2ONL9fm9ODT+OwwPyvnRUhEMgjrzKEZndNVIt0tBgft+yTxgeMn4n8ZfpRO
         Jq6ZbPjBuLtBx8iZgu1HApVTOMJpLJasHiYtoeM/x+gPFi0625Yi7fcCNEmFzi7pgMcr
         O+xGhmVpeZV3zivPNYTRJbsH7DmBPkRFQ7uCf37K7FjZtA2FMi9TumOPK21nwI5yLiLI
         o+EjT9QxrhJxh+XiUXpQgSeXH1yKY4+g4bJy33Gpq4HIucZo+/gRTmVqw0/nXm5ThYFo
         DOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706270120; x=1706874920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LVcqUTXP/P2WsnP6Y5tfw0AY+HXGkieDjmGHyFGDKA=;
        b=ojY8hllE7cIKs0+EOq0mnTcjELkdt3wbyIwi+NeO1uMhjEji7mYMH3c1WsIIJtrI1U
         KmWznoIJLpcBERvQQ4WWRTEcFvpR4CA0cCRPpkYY6bV6WKdRO0t7RPMBwmInn/gRqSQS
         FTqWAuSK6PZUmUpXFjV0mqiGffcF8AVwHjDXASimF43iP049nQGEIlIwCcg5E/j9PzS+
         8Jp8vuABbZAHbYdVxIQlgEUjy65stDhzasVnee8qy/8QV8oZiTe2ZW9oDu/rcj6VEeuJ
         s25gv/nxDERLHT3NmKf0PR3JtLB/kJtgqE+to9q4Vg1GdMOt8SpigGfxCwCDu2NG19+J
         Dk7w==
X-Gm-Message-State: AOJu0Yyvb0X6G7Mu2OYiouX3KD1uWXPwFbMq24w6qyPCeqzQPR7qjj8t
	LWeurJZQuQGi7o31dN7EedIQzLNVK88Dy9SEIF46IiZExfcAmzMw8Vg70l7Q4Ns=
X-Google-Smtp-Source: AGHT+IFRkMZKCLree9XUXLoFwO0IzzGB3sFNqGLLWGA4sB0l0tlaNsDMLiafgrhUecbTMmtb+SjOFQ==
X-Received: by 2002:a17:906:16cb:b0:a2f:b9bf:3955 with SMTP id t11-20020a17090616cb00b00a2fb9bf3955mr628553ejd.21.1706270119990;
        Fri, 26 Jan 2024 03:55:19 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id hw18-20020a170907a0d200b00a2d7f63dd71sm551280ejc.29.2024.01.26.03.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 03:55:19 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	peter.griffin@linaro.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: samsung: exynos-sysreg: gs101-peric0 requires a clock
Date: Fri, 26 Jan 2024 11:55:16 +0000
Message-ID: <20240126115517.1751971-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... otherwise it won't be accessible.

Update the schema to make this obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3: no changes, resend as a complete series
v2: no changes
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 1794e3799f21..33d837ae4f45 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -72,6 +72,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-peric0-sysreg
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
-- 
2.43.0.429.g432eaa2c6b-goog

