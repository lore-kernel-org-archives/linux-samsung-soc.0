Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4210E3A1BC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Feb 2024 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706808149; cv=none; b=qQjTU/mIv1wpsfSdkCWU3zep4dyrflBNp+XKfz9/4hj/447x7Xc9pd7Ot1p4rWRl7STP48f0Kw1fPsbvM31PVkHp4aaTj/52PrrBu6xSs+DoD50z6bBjWH5gcWZV/wRrfnC59IBMen7ORznhdIrWptMzuAfSVezBC0tUyY+NwZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706808149; c=relaxed/simple;
	bh=52w61SL9U4SK4WqY0kMb5Iy12v+xHbJ4FGKmp75wAto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vFst0A/3vCp39RJekbiaRQNKBprMcyz7OsSam5G/woV4S2LHEIjLLiobczLs7srpgVm0zMEO7T/pt0mrYca93UnjE0JEgtnNqC44BljtcJRAeC/DJY/+4nGmbwgf17tFRvpuW/oEBj2qgwloUQ8FwmHq/47M9ZwacskkNce7bPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMndUhjz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMndUhjz"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33b189ae5e8so402562f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706808145; x=1707412945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Olzs5jHBV5th4bf/0xR3cFxQ7USKSVC7J+wiOfI31K0=;
        b=WMndUhjzW9TQPcwgkLtSGOWirOgslP/EJhR0OoeAAP1FsB244HQjLdRuM2GwSh0klD
         LBETlFV1GPHarU9wLt5xQPWt3QIhhoQ/3+oFjJByZymuhKl9/nryjxTXnL8oMhQPitj6
         BZ6gEumtyAUjj2pB2ZvG21dlyC70X1jYWUp6vrtmKadgY/kqnZ0M2ulsyQqBuOHXMYV0
         dKXbgfE7cb3WAAuQu/PVIEupH237b0zwQ9vA+LQ3wmQZjoYC0qfDesbarI2u5I9aSz8N
         G5UFQdRGen4X+c5zEDAGp1V2TXsq8lopatBC0XfHPn8LWX4Ia+dhuljTpg2WTybBtUUP
         sUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706808145; x=1707412945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Olzs5jHBV5th4bf/0xR3cFxQ7USKSVC7J+wiOfI31K0=;
        b=M9ewYqcoIb8NWSUFljuk+xI6ZfKfGXNjTGGWZ4W+Evs7/B7czu7x9vmDb4foRfy2da
         fBPXf7ypsidQSKAHvH2LC2hJcGrnXwZNQjsMgQ7SoCg8A0pOZqWiwx4hZtPQy/T5RrzV
         qXurOS7ZXCy04oGvWMBzYzRprkJWbSYEOumEf92gmY8zteT9JvEC6DejfdXWHKpWCLsV
         bTlty66EhhmL+t2Wx0lzmd7lSWPbneMA885yyZMd47boUouxav2dFiikJ/KOEi/9cCAi
         Bzofb20FPKkvv7sCdclvNKfqW0cuEbTTIALaTpRulNykUaGn0ht1+sjs1rZVZhYgZbUI
         V2eQ==
X-Gm-Message-State: AOJu0YzMc4V1pVehfHshV3Oq1YrZtWjM29T7OSXhnCEoYmp/pTLFXnSF
	HEZLpvEPGcSlqgVi++MAHlriqQaiS3LjfPDCd3gip249+lwUSLwUYV6/nT/0/JI=
X-Google-Smtp-Source: AGHT+IFpmBY54yA+GRbMJhIIQPcZ3OaDrFdyCo+12N3dtJyiP8+y6KOZsPaHG6a6biOb79hAePH7Dg==
X-Received: by 2002:a5d:610b:0:b0:337:9d3b:c180 with SMTP id v11-20020a5d610b000000b003379d3bc180mr4025840wrt.4.1706808145483;
        Thu, 01 Feb 2024 09:22:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXAyBCUGeofnISmWVvuayh3uWyPjp7ReG6k3Z7Cg4Ixith4cEy/8G9skYPPoXvjaLvnvvELl90LT/8UIpCz+FIb2gNldRtIzSIMfa3zk7ldRWyj2S/GtzBd0x+YuoVwvsOVeL2PGmo0wEhKpRxxmj/ldV0D4/uICodrORh3mxhdKB7LhY9oZtv4MDLlmsfkWgnIvH3MWc7BIF1NWvp4PR8cNidJKPAfyY30tqwaMQdEMX3vopapymYiwLjgaF0+XwjKsKzGej1zgHEy3qOZJMot+uKeLK8Fk5xv+Ky6qoeoG3vdIyBY7s3v/TpMUCL9k/Y+Q2a/Zktg5Ubhfb1cz2arRAc06pjbJ2+UBOprShdj3dGyr5U9/EdtAmwNri8XqoOBAxt0PgH6XrYoVvRuvvWomLMPJkVwkb1ahmIujePs+3YQtV72NoeQHmvbuUQBOR4EhVAv4d+iD44CS3frSGvzy2SuoeT0IoKkEdmoosiBqeAEumgoRDYMGlktdk+hDmpW+FT/YtCfdh7hTG/FyXjq1jqQOdKhH29mOhxRvqd1m0BzPDYACSx/if5FW+tylTs=
Received: from tux.Home ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id f15-20020a056000036f00b00337d84efaf7sm16733582wrf.74.2024.02.01.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 09:22:25 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org,
	semen.protsenko@linaro.org,
	peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	klimov.linux@gmail.com,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	arnd@arndb.de
Subject: [PATCH 1/4] dt-bindings: hwinfo: samsung,exynos-chipid: add gs101-chipid compatible
Date: Thu,  1 Feb 2024 17:22:21 +0000
Message-ID: <20240201172224.574238-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "google,gs101-chipid" compatible string to binding document.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 780ccb5ee9b4..b1d933808b6c 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - google,gs101-chipid
           - samsung,exynos4210-chipid
           - samsung,exynos850-chipid
       - items:
-- 
2.43.0

