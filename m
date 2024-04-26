Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D96147C68
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138713; cv=none; b=o1nhF9o7QC4d/XckIoB6p1dQF9RvBJaLyUyYuN6eldh6rxoE2YWbO7ubTzZ4ofBwjABIZqlzUH4LcUqMDKBZbkpoAzKSDUgQKyMpJClVcYwGvQze3pFdilemQCROa+TMC7mzV+n5spLJeEI7T/xaaxbBA/rNgaO+8Sk29bhUIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138713; c=relaxed/simple;
	bh=WARBLKc8IIwkOZR1KT6Pc8Nf7x5S3Qw6DwX2PgELUbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBErQ7D2lSQByG+8xcuKYy67I5LjdrUeNcPHmzuEQktfygRBJCfFb/s0ZuC1+G1lBzZzesecfIE2SvJn1RjWkb4H9ZGxiJAP/npF4YLJdEsCFO0Uthwk5rLfGifKMRCbUlRU7El8+R9UPZ6dl8iN+Rs8IwUi7ME+Pjs8ykRFOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xW18gLq6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xW18gLq6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34b1e35155aso2320552f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714138711; x=1714743511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7YOs9puuo8onPpvdQ4CfanEhu1eADekMseFBdt3Sao=;
        b=xW18gLq6O77muoho41UjwG/7HoYHAiE5MStXCyuH6YMhGfAKd3GoaMyfMG2yG+HNUQ
         6WKNgV6TpVzz0BdTVk78QgIkZPiEtEVUGkW8URXJcL28T8pp7exFysNM6WywDqkWugsI
         0bmTSOyWrnkRJBjLAFA/9WIr1oxT4/Dwkqo8qf06Ht2ydiVxA4mxnRyguu8evuI6H3h6
         CKl/oGcs9uozdJ1t22zJA/TBK29oHM9IoqziQlcLnckLPlb0M3AEZa+SjuwQ79GczqUg
         PSO+s5ssrTNk7O5SMvq2T/pOBgdJ/3iI2dJEIk22mdmRPIqbmoiRANNVRG4IEIh6z4H6
         kpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138711; x=1714743511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7YOs9puuo8onPpvdQ4CfanEhu1eADekMseFBdt3Sao=;
        b=WrywAGloL68CIqD//RWW/2H4RZITLPw8R3zZB1F13UIhfqcdBI524QsRIWvL8WWq52
         S+8XyRFHPeJTNOgh2X8WEjG2XsXmhVgOucYd7PWHLdZd1KcH3TSDmFuiAtDOwWV5C0qr
         UhBPSI+kjcR3aJz+BFwnbMk45ql6MKkO5eRD9CGAuaLd2P6eBt7jlP25fHP1ckq85S6i
         /W1zbq1RjcWuCNZnnErn97TqV3N13THdJ9TroNLsza8L7jiNOQn+Wl4C/LFBq3kIZe3F
         u+0ipORN21ikD1dkEWxTytzs438jE9XUdWE5HR0pCm1Nkr5hymbtc4a73njg4vcMVh/7
         6RAg==
X-Forwarded-Encrypted: i=1; AJvYcCV6pjFu+awm2nx7wufIwO3sKtSvddCR/8sOgqbXCd/UIZd1lV4id64EyNsIMeHD4onA5pFjsOGb+IF4/t39mzKrF7VlqjtOj27IPv7Tvm76zko=
X-Gm-Message-State: AOJu0Yxnc/gruRVCAWWAKoy806YXU8biCmk/wiNKJSyw7E7HEAbbNY7K
	SFIQSYsppB6t4yazdxe31h2+LPZIbcUh2d44BmNI8mxPHVlpwqyG1gXwiOd2LQU=
X-Google-Smtp-Source: AGHT+IEW6lN/nMVbLs2cr1R62IxVhVzas4gPNLfg/YNhTIYexmEWP/7n/0P1dbJmlPX3TjrfE2dhUw==
X-Received: by 2002:a05:6000:239:b0:34a:4227:e9e8 with SMTP id l25-20020a056000023900b0034a4227e9e8mr2605785wrz.47.1714138710599;
        Fri, 26 Apr 2024 06:38:30 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:63cc:9bae:f542:50e4])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm22327689wru.36.2024.04.26.06.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:38:30 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg compatible
Date: Fri, 26 Apr 2024 14:38:21 +0100
Message-ID: <20240426133824.2283144-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240426133824.2283144-1-peter.griffin@linaro.org>
References: <20240426133824.2283144-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update dt schema to include the gs101 hsi2 sysreg compatible.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index c0c6ce8fc786..3ca220582897 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-hsi2-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos3-sysreg
@@ -72,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-hsi2-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos850-cmgp-sysreg
-- 
2.44.0.769.g3c40516874-goog

