Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1ED84A3E;
	Sat,  4 Jan 2025 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736008163; cv=none; b=ZtDDtBY39ttIhP9SoO3xT2EQ1fngr3w8WTuVm6X72y5We39avGcLdDGgFoKbVb7OBZtVcZ6DtfoAXIhUfwjhKUXF43fNUJAQ8fZ46BbBOXpOwLOwVV4SVu4/JuLdI9FssQ2Q9ms/+1AZWt56c7hvxsxZEkDUWO8lz7CaeYwRMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736008163; c=relaxed/simple;
	bh=w8XOEygCyfF1nqqoiswzYDyxM5Rk5n72U8o9B7g1qvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9yOM7XHObt5mVhQznrLrwZWuANVP59THrdbIp/G7Nj2XdQNAeccWQjBBJr30xOAIrKZnLgQ4PB606Twvei5zS71dVpXOoq99luQxDJTI5D26FX/wSfnwRHJjnWn5f/SAgKdfAjjvF5OSy761jlOFxPFe9Axp2AHl9wb/zGpHTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEJdfqcc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEJdfqcc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso89558315e9.3;
        Sat, 04 Jan 2025 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736008160; x=1736612960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSlNtFCEnirtv+C3yQQNe5++1QvQ4uNDEpVQcIjAKhs=;
        b=dEJdfqcc3F+rtbODJFXYPeQS1eYy9K4ynoCQRqONOiiDF2c8rxondPJqTKu9tWr6cx
         FIr84kU1iAiljFpxws1TxuwDcv1byVcm4eas9VNSHBCtiDsm9r5gDbnn2+ofmeqMrnXg
         KHtWj+OT0Q7eemSqrOgtmk5u5XGuRzmgg0sfIFjpMr/+8kS5E7r4VucNfg6/an0V9yRK
         h1yMyxxX3VGzInXJcpwZpH7q061CnilOQvLsYHl8Xv9TGgpkAwAjWqnFv3V5srygr3a4
         Cn4WzEVelDoWHmglbt8f/UpiCc3ToTb+uaJK2L5x7t2ABAbpGD96/BDI/30ql9nVXjKh
         tEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736008160; x=1736612960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSlNtFCEnirtv+C3yQQNe5++1QvQ4uNDEpVQcIjAKhs=;
        b=KiJ3VECeFXzJm7/+hMBfIwqNsltIoHJkQIxsNzZsgaJiurbtuMPpnGNyh4F9XjUiD8
         m/Pdvu11qjcIhGMB7z55RlJgI7eYzxf7PaGDg2xT0JvTnj7P9+TQaiWY+8ak4ByMAlkj
         Nj9G5EsD1tZnDjBADAY/1LnYwfaflrlCYCt7BsWvYUj9YgAuzGwXOgpvbOcj6nsjQ08C
         QIvwKfCnRq5a1yqs7uMwAgXSVvLR0KMdE5JAmKdTIPSwTZah16+DqPCMVU7AflB+X2D2
         7ttagDW4tdawGTagTvt6dzrmd+TlXCwBCxhVOp5Q7uewQXdkJYZCnog5N+8PsaVOh9Tx
         z3LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg3Mnrw94cQa2EDYLuYS9fx4DDZXVL5UrFLps/1DHtjAiWc4IEwWth/umvP7G93+r2f9XS0Yo75QYhwvVIA1SO2sc=@vger.kernel.org, AJvYcCWsvpo1msQz9YIqkUAtZmPqbpirmGrZPyjmNIWXqjxzNzDz31rouL0egxsoWjnia4ASDZ0RFaQx3xh8gyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCdbU8uJIoaEtIqtyiyZ+59PAKs3PUdn5+EjqXUlje4HsIYOY8
	/UMI/1ITAU4rScAnGPQz/Gn/WdWGSm0UM2ObGFBxcgyvvNY/skYCyfr+Qw==
X-Gm-Gg: ASbGnct756x2QIqBQyrvwcQUwwIKf3NsftsiDKGn0DTWYRyFCSmhh2mgJPF5LUHyM1S
	br72c68FV1rgo+FpbWebJqocjjmVbLU9JzXOP5WrG9uEkkF/285cvp3NvEBccEsgolBx701CshQ
	B/sumDEzIb7avOyItUy1wGd9hsIYNqFAwE8VaUIG8sx2eBWY9KqSNz6Fkh2aL76UTvT030Dbiy/
	/eNuaJVNR2c/tZjqqSlH9PDRYGec0xcr0PoHWwJS0hXPmNP1FbFVMIz7x4Zc+Q0DF6AfZw=
X-Google-Smtp-Source: AGHT+IH9lA4rF0WDY1qh8cdz6wgrOJ5I2spF26AUuuTbh/HX9dlF9UotV63FVNTpwKfmfiezduNw5g==
X-Received: by 2002:a7b:cb93:0:b0:434:f270:a4f0 with SMTP id 5b1f17b1804b1-43668b49981mr400164535e9.21.1736008159960;
        Sat, 04 Jan 2025 08:29:19 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm522807895e9.29.2025.01.04.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:29:18 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895
Date: Sat,  4 Jan 2025 18:29:13 +0200
Message-ID: <20250104162915.332005-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos8895 has four different SYSREG controllers, add dedicated
compatibles for them to the documentation. They also require clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 3ca220582..a75aef240 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -21,6 +21,10 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos8895-fsys0-sysreg
+              - samsung,exynos8895-fsys1-sysreg
+              - samsung,exynos8895-peric0-sysreg
+              - samsung,exynos8895-peric1-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
@@ -79,6 +83,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8895-fsys0-sysreg
+              - samsung,exynos8895-fsys1-sysreg
+              - samsung,exynos8895-peric0-sysreg
+              - samsung,exynos8895-peric1-sysreg
     then:
       required:
         - clocks
-- 
2.43.0

