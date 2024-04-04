Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35D3129A9C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233587; cv=none; b=M0lv6jCXeulijj2kEWXx72zQ5OiIj7F31Li2RGP6F1LTnZHpQtQdZ83ENQ6THkD3zvwSoJA6VHsyErKKN1U80CNkrdzDVa+kaLDgefOV/OA1q+a7XdT11rD3DrUWMQ+539oJgUNl2tjwspQO2VzGF3FVWGb3ZBpF5trUrr/4KT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233587; c=relaxed/simple;
	bh=hmBS3wUHO0mONt4FlN4wFgGGwPzu6YR45Hg+n9iZFDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiDOrlYRDAd5a0QgwFFSPLXDm3HiAGe5rclHyFY0ByHVh3uBl2d3MFvsSockwD46K4zXilg4DGV0F1+U2ZWqK4lhBl2XrHACbq23STQxfhfrpZp8gIiqi9nWwepY/VdUNPVh7lsfUi1JvC6iKjTPloSql0oOh7+booF/5xrZobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gMVIZZWi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMVIZZWi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-343d2b20c4bso43296f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233584; x=1712838384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXMXdhzuoLCLynIjoXzQvanMKsFRKu7E/3G3H+50quM=;
        b=gMVIZZWi1z2FkhN00xQ+9vw0OIo8cysxMi1K7veW43FyRARjY0LAKrwqdvWOL0ACmQ
         h87Vk9Z67FyZAJ7ooIL1l95eXG7TZxG29nqqc3NHBOte/N/rn2VKTT58WkEsLPq4UjoP
         tbKqE2eNEF8UGuTfN+R7d80PcLP0d2tP8CTApvdkXUEbKGyLFuG8LyiMp7I7C6ZAfsOZ
         fmZ+pwXoB/TW14/ree+87TxWxgAY4U6jCEOTYu7e7aqmE2nc92+brfKiEwCHbgyJLQhf
         LdqplzbB2SiIi6COgJNg4zBIesqMqEV32VxyjW10sBS801e6atOE9FHCgcxmP7fxRUHP
         purQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233584; x=1712838384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXMXdhzuoLCLynIjoXzQvanMKsFRKu7E/3G3H+50quM=;
        b=bFrwC82pODPeIEMR97Af7Zwhzgysdmxwtxnu0or8c5gSF7l3EtyKSuJuFUuv3ZZN7L
         ruSLULJV9G1IRJsOXyCtsGshyZmELzOv91mamPlwzUCudjxWUwF5hjq1poIMMW9bN3bz
         2oqVQOxckl0hDjjxqaNDQ6MldKWmx0v+AvszITCHo1R65J5wugSklSPoYPU/OnPmBMVC
         BYcNMatETwdTsIIPsTV6P1WljL87bV/XCK6ishuiPCiFl8yUdV10mQosnb6Iv3U38T/M
         0vrN1KGnbXpJvYFhUH4CYscuF5yj2zARqTaYTJY/OKTShJLHCj0JMP6e2KzsMQZKS4ew
         2hVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfEG3ADWY7t7bApwgr+Tb8e/jYR2umRjpJD+P1Wr5LOEhYdw9pUuCW5CctireKMrdGPwlBLK0OBA7QdCj7biLSnPKpAfVnNp/MhMBCc+Hs1Lw=
X-Gm-Message-State: AOJu0Yx9ZdCQv3JUiSQIdYRoOdKADXFKCzz2HSIUxtLXMwnD+x7i8UsB
	loF7Oix+Zl85qFvZ9LnDKF2zQe5lVRmgjhBUj5xV1BHABrEztuUO9nxufPDC9zs=
X-Google-Smtp-Source: AGHT+IEApEjUKboR0OBWLDTAS6Jxlk1eQTEdQEi/Xza6SHa5181j+IZCoUEpXbG45sbONQ13Dr267A==
X-Received: by 2002:a5d:60ce:0:b0:343:9189:e685 with SMTP id x14-20020a5d60ce000000b003439189e685mr1644596wrt.48.1712233584399;
        Thu, 04 Apr 2024 05:26:24 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:23 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 02/17] dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg compatible
Date: Thu,  4 Apr 2024 13:25:44 +0100
Message-ID: <20240404122559.898930-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update dt schema to include the gs101 hsi2 sysreg compatible.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
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
2.44.0.478.gd926399ef9-goog

