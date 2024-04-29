Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7404F3EA8C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389345; cv=none; b=U/amLSS6o6fToxZWtJdwzUQrbn2EtAnLJN1SiwxqkwgQpEftJ6kkDbDATva+zFnfnrE+/8P1AAL8JSpK+A2OsdlIS4Lt6P7esFvw21rBrDkGTOpd+/VfBniYEE7n3fDdjjaFZnjZXp+HfTRv+yTSj6AhKyQ6hThTVJm7J1qWDak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389345; c=relaxed/simple;
	bh=WARBLKc8IIwkOZR1KT6Pc8Nf7x5S3Qw6DwX2PgELUbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SkrDSQlIk6Ao2MThOkyhAX3uQeM0Ry+VK9tpZHGIyv9PinalSbQybHNgL6t9s/5RhEOOyGwgwSUqJQUcvrhg9lu2SZ2opuXSL5vfGUejqXIZyu//ZPliEw4ufeiIYWgEy/OV7UkQsO2HJolUXNjQ6CYQSImjpDIK/SmkXPIuWLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTs3vNUy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTs3vNUy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41b79450f8cso25741725e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 04:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714389342; x=1714994142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7YOs9puuo8onPpvdQ4CfanEhu1eADekMseFBdt3Sao=;
        b=eTs3vNUya7bNA5zKpq5cxzIQSNBuHDEUCreP0pieQq2Sop/r3kfOZsVVU309MQ9Q0f
         7pgQTfFHBs3AytKICf15QMgVNsVE27EzR2u3rWOsrtI1/zvLYsiLgqWnki0FdSuYsJuU
         eHTi2RK2/A7VzpeYvIcWhBb8lbwyOqiAcYLcNCynAPUrM0LziqPKCUolszWq8uMIawIx
         l+UKJmavnhKuv3a8kDM53mIaEYkW8Nz0tuPAbTfVASADKbKaNKPtb9PBaVh3USx4O9LW
         GD1AZ+Yw2/ZgyQqgA6p18yLA54bWnVf5YwqXuEir3fb8EBkrSQhDK1Ndp5WOkhX1eBKy
         svKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714389342; x=1714994142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7YOs9puuo8onPpvdQ4CfanEhu1eADekMseFBdt3Sao=;
        b=s0asZgIqQ9SeYtCDDtppsCiP9XNo7w4Jbk8NahmMTVDbtVxBxJahhibIDedVykspA0
         C/eUfLAGUQM3ny4PmNjkaZ7H+/Oaw37ZFKhzOy3xD70HqczYAzusaEbP6lraWefmlLZg
         zXR75OuWF/tQ4HqR0/EIwxyBVoPjDYStr1x6PFl3LxDKMpHoWBiCp5AQO6CBFb6cW6eC
         jTNxApOAomrUc9vEeLBOwEIo/F4pyaDxnaARCftF5H5vrQSEk/vV4rOhQ+w9AVK4f0g5
         pGwo6+pyI9j0aXnDlTWT7sZy73qxo7fi5mO+FXNuJp6izxeQ+ETm7fdp6PbjVYH3cLYD
         ASKg==
X-Forwarded-Encrypted: i=1; AJvYcCVy+Q2qHohMbBjxJxOL3xZc4ygrguLTPsxAvuXnlbPZCe6xW7NQjBYeSx/T/2Yl6SgJ6aMGkq5Qjv0PTDBFti0ATgu9l4InfQVdBpXzqgE9VVw=
X-Gm-Message-State: AOJu0YzKHenhajyc12Quo5P+zPZhSdD9cHIwT6UutdIZOB1oI8f0Lo5c
	H7UVUo+2wHknBJpYNSIEYkk/q6qiNo3ThHt4Jqb6nZiV4MN53R55qGigmnKpqOsPetWC27XIhDu
	dqyQ=
X-Google-Smtp-Source: AGHT+IHgx7Hr77YwfgooYgYOrE6P0eeKNZeE70sQQxjdW6m8A4bLVKtOXlKGH9X3NxEJDcLuotdqVQ==
X-Received: by 2002:a05:600c:450e:b0:41c:7ac7:17f5 with SMTP id t14-20020a05600c450e00b0041c7ac717f5mr381669wmo.24.1714389341861;
        Mon, 29 Apr 2024 04:15:41 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:550a:b373:6b8:63ab])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b0041b434e5869sm16005337wmq.43.2024.04.29.04.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:15:41 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg compatible
Date: Mon, 29 Apr 2024 12:15:34 +0100
Message-ID: <20240429111537.2369227-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240429111537.2369227-1-peter.griffin@linaro.org>
References: <20240429111537.2369227-1-peter.griffin@linaro.org>
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

