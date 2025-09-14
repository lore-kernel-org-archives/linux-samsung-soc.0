Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CA72580ED
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850307; cv=none; b=NjOwMAmH2GJt2ydi6a2g5pCybUebEmOueipMat1Rdba/YKOGosn4vuCJLoRDlW+FxuP2Nnne6py7586gHkyAljQq4bz5TdJvaJczxsY7GeuP6dDNkXI1QFEZyp1cHJF6RF44OYgNwoutso1h+xL9l0jbZ3HcEEi2v/MyO+T/8Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850307; c=relaxed/simple;
	bh=ogSWVbPDpjLlo4b+vc5rGJJ9Kt1VHCymn7/dpTScrdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PB8oMWf0oPBi1lbS98zG7G/shr1UPtbFC2yLLWLLE2P1TcKab/E3lWPheEoA9r9rC0fgRpE3B7ycDg1zj7Oxwl4p7beL6eENjfgBSPOxhWUcbtDi1sXBYtl1on7REpiovlGA+J7PkI30aZBXqk5lE6Z8NJV5iFhgS2n4gAoC0hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMX26hlL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMX26hlL"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3e957ca53d1so533813f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850304; x=1758455104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrnMo8AcgyeVtAkkZty6h5coZF1I0BtRGtERaxF9cY=;
        b=eMX26hlLeMJQUl+9JAc8GKmh9N274eqJ0STTZv/Rcn4W0aoyZxkXwkUYVJ/fnDiPF0
         GHtBxSbog6J7RYYqfUe0i/mHu1fxAAC0LOEmkT2mb+Xt+4yWTRhtX/n1WeON4fDLMCgO
         4NbEaEmy7y3QGXsPVf8lAaHaGDInfVOqUXSPObMJKZSha4R00p2pt0f24ZEAngjurKjd
         6V/R0ZpZ6kqe8KBLb/MIEhytbn2kck02y3qjZfUk94pRCBHloCT2VyF8Q/NyaoRzyIjQ
         CoIhb109g4Zm07nvv6JRJoOt/cSFzXq20kIkkeOLYJYKDlL8536sdbeugzEjD6ozSV5L
         RvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850304; x=1758455104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXrnMo8AcgyeVtAkkZty6h5coZF1I0BtRGtERaxF9cY=;
        b=Sea5S2EBAyp1rInlGRf+bQRAWtpLgmF5kgzbHlr/LFpJrrMXfIcPx+9r8QE/aWd3bg
         Uu9iihFuE/3LUObdeoAtMEEPtWopil/H424fchbbxpxzom9/S3/JCWak6tKKABhOdtBO
         oqhHPRBi0Bh5PjjsOV1+0Guxs2WEBeUG2OTqKWbm8LHNkcWqw48GN2gM0bfsMnKuk/gt
         stSfiPCdalYWT9PXCr7QaVysZ1oFkSG8KZUo7uY5tZMCsydSkeUAOtjHArJkItJpc+aV
         M3VURpyMEX5dVM/wT45scyJI9V9xZj+Re78V040CW21eNMQweI+rYzxFBQpKK0WrK11T
         ToHA==
X-Gm-Message-State: AOJu0YwDBeO8zEzAlXEgHTUKZtYwftcT9yADKrPwi8LMAmBGkMxH9xE/
	zP8O/REHK7v4vwsph2JyM7SjtP+/Wl6eyGvKATAh7FaVLt0eM7FWjsXv
X-Gm-Gg: ASbGncvuUHgYS47UAkCM1jKyH43PAgLb7oM60zRLDz0Ijw134HO4XCU6Y9ErFPsbB1F
	TQeVb7YCUWhPvI10uWSsh0R9jYdhxQj69aOXncKmV/TOMHfntLd6Bu5jdiRmRrzfwAoXT+Pftn4
	r5FDZI9YuVHSPWoj8zyJNBMw0n73H1eTTMVdx2CKiHCeH9esrH91s40hYxAUUNNflQB78YfmcZi
	6N0CEPXfhumXhWDJibtvPBQa4jEWzFQvuwEB6G/hQOMPWVK3eKDgiAtAJhWzuHfzmE664AoruNk
	zn0AxvqQZ+8svgGv4R2BuroO0S/bY3jlJjC1lAdurSQjbtTxWLSmqDqpkTUwuBONb8eXYosuuhH
	EoVrwNlGQV5vDFUFlJYmZD3bmGM2bcMBMNlqAbPXIJS8vEU/RJOrzGGjKx+pqNOEH/07H3J4jTk
	ufffOkg7xB
X-Google-Smtp-Source: AGHT+IESZdZImuHvupg31XiagY9dmwJfZhjEPnB8mK2o9JeW0P+8+vI82HCX5Qrgtqz633EQ0Ul55Q==
X-Received: by 2002:a05:6000:2284:b0:3e7:47c7:9d5 with SMTP id ffacd0b85a97d-3e76579652amr9007686f8f.21.1757850304075;
        Sun, 14 Sep 2025 04:45:04 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:03 -0700 (PDT)
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
Subject: [PATCH v1 2/3] dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
Date: Sun, 14 Sep 2025 14:44:56 +0300
Message-ID: <20250914114457.2610013-3-ivo.ivanov.ivanov1@gmail.com>
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

Add a dedicated compatible for exynos8890.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 0da6d69f5..dcd96104c 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -43,6 +43,7 @@ properties:
               - samsung,exynos7870-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos8890-wakeup-eint
               - samsung,exynos8895-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
       - items:
-- 
2.43.0

