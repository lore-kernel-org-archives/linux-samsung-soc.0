Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2334220E316
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742362709; cv=none; b=WWPMc7OjE78SOkjBDhuLUGsBcyhOZES411VyiCvQqKub4R2QxmSmCKJ+akBzPzzM1Oh+aH3Nr7qGcmuOItlrUUw/2jX6KACTF8UGy9ipb2wwPGAhYuFvL+Ya2/CFiUg9XX8pnFcCrFKov+5lf2aZ+pK21ap58FPCq23T+OYy6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742362709; c=relaxed/simple;
	bh=dYbD7ElbtMWIpFpO2nDHVLUAiljWLpzrUTfbbZi5d1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlNX8gx+cziMe6c/uDYej1gf7GlX7esh/rVSQ6lTl+TpjBIE9w0b/jESpL+w1ORZ4aInpumypts/eEl539O6F4hRevkf8lRO2t2pjcKm7XyDLGOik8fzE+ngIfdUtDLTrw5CgIz4vfMjuf7ccFhwwmYalWBg6OcvWkrgylzFFVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s4/TiABS; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s4/TiABS"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so9065756a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 22:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742362706; x=1742967506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sus4gSJU+xZ+2CemlxDEjCXjhG8aiYHNZQAdXRIuTA0=;
        b=s4/TiABSlL7xkudnYgpV4ffy7tWa6pC88PK81xsL/ST76y7TAvGctOFc6w2RjkRzEe
         njxCVPUw5o0Njb2GAieMnquk7hqhHPWVgnrlytzMX3uSYJUZzhNmPLv2hC3NzY7NesGP
         +EPMsDzfC9F5c2Ctfw5rnGrWCuKUhWj/V7Wf/BjbU+Ma+ljkh2IFWoA0EPGf2qnWIpcj
         eJHQensgHr6VV/Ov4Rca6pPAv3/ALfW574VSQY75vRGfGocA/WTBALGS94kYzgV7M5Qu
         60wstPwVcH8XdxBh7Pvt39msviMgMoiQFBrMUlsLpr1XobDFrfuBrFmQ+qe5QWDmfQ1E
         k2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742362706; x=1742967506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sus4gSJU+xZ+2CemlxDEjCXjhG8aiYHNZQAdXRIuTA0=;
        b=nGz+/4cyBI1txRZOrhsnWOCQbl66Ha5k6Bw5TVFHzNOnbUicREnk+tG2TwIEIED2l6
         fbBv/mWyBiSvG91prjdKaJHCYw/6Vp34/FYmkxCdsXbRNljgGHQE36zgsmTL1eMJOm1k
         GYl+v3s5fecLIWDi8mtjqI4ukWf21GyOhLe0XSDhIHYx8lO66/fCwolgulVAFhf49+J0
         wk79eSCTXxBfpRcnR/I0ZlOYGXDFkz+CDEIRxyODHKBZsogjsg0J373VP7mHUNH5Ye1A
         EvuHIm/lFLZvX0yEK3phXW8B1kiStq5wxNqPl3yNWJmP7JkoX+WjNG/0p7nO6RaRl0FN
         t0Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUVAXL3KvJG7vYBlJOae9Tahad9Eh40fv6NDkINqartBEOqrr/1ihq66OXqZ8GVk7Lkq4Io+rL9zqqUfCDdJZt6Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKWO9TwvAyi1jRDWR/iKMa0JfhGLmeRuss4qHc4dl7K9+SnJd
	l+PKblhLdWcgskVTYfzARFxSvDIK5E55G9MphfTf75Irh5Pn+YaFUsf+9Z6Rp4Y=
X-Gm-Gg: ASbGnct0WQPOZPtRfxMTqax6TcTl9SJ/grUeXBbyLygcJJ0uvn3+J4QhdZQMU2yuNcA
	dIVTMfCh5bXUYe/PweYiduW8pkyKuvb/RvK7pKQv+3+jsWXl8COIQOcyW42ePuK1Ed6XJFrefBp
	fGcplZglYwfPt19daTVOx1oe5DHi9dV6tdMLn/wsQpvZ/F73XhZNhlsgNWtn8IA5PB9mBtV3sZH
	ogOGyjPhW/ny+cmWDibGfZmOZOa4FlTzBtC5N6UB4VVGWU3yXWznvSGk4zpNVvpo6FKkPX3e5mV
	3vWYOucLvxQlT3x0TfmOahZsgUq1exGWayEyUCqqP8Yo7h6UPHVXF/B/M0+/BPEO7o4Spburgii
	OABD/oGZOHANoXLRgsPuQaUPmTwuMHP0KlYPVSzc=
X-Google-Smtp-Source: AGHT+IHrn2C9WLboMGGXgsOlvqqsrQueINwlBYIC5HbnjUBRvOCY+qEiAJm+UPf+gUneCwQHFhXSew==
X-Received: by 2002:a05:6402:2106:b0:5de:dfde:c8b1 with SMTP id 4fb4d7f45d1cf-5eb80cca862mr1173125a12.4.1742362706356;
        Tue, 18 Mar 2025 22:38:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e6d4sm8511817a12.9.2025.03.18.22.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 22:38:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 19 Mar 2025 05:38:24 +0000
Subject: [PATCH v2 2/2] firmware: exynos-acpm: silence EPROBE_DEFER error
 on boot
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-acpm-fixes-v2-2-ac2c1bcf322b@linaro.org>
References: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
In-Reply-To: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This driver emits error messages when client drivers are trying to get
an interface handle to this driver here before this driver has
completed _probe().

Given this driver returns -EPROBE_DEFER in that case, this is not an
error and shouldn't be emitted to the log, similar to how
dev_err_probe() behaves, so just remove them.

This change also allows us to simplify the logic around releasing of
the acpm_np handle.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
issue is in linux-next only afaics at this stage, as driver is not
merged into Linus' tree yet
---
 drivers/firmware/samsung/exynos-acpm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..04c73692383b17ace33e95ce9534101bc68f089e 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -680,24 +680,17 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
 		return ERR_PTR(-ENODEV);
 
 	pdev = of_find_device_by_node(acpm_np);
-	if (!pdev) {
-		dev_err(dev, "Cannot find device node %s\n", acpm_np->name);
-		of_node_put(acpm_np);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
-
 	of_node_put(acpm_np);
+	if (!pdev)
+		return ERR_PTR(-EPROBE_DEFER);
 
 	acpm = platform_get_drvdata(pdev);
 	if (!acpm) {
-		dev_err(dev, "Cannot get drvdata from %s\n",
-			dev_name(&pdev->dev));
 		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	if (!try_module_get(pdev->dev.driver->owner)) {
-		dev_err(dev, "Cannot get module reference.\n");
 		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}

-- 
2.49.0.rc1.451.g8f38331e32-goog

