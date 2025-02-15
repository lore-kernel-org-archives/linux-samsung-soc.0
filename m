Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1821BEF81;
	Sat, 15 Feb 2025 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739618852; cv=none; b=mzmPqzSvVKB3DLHA8MgFBWJc/meQc9EWGtCuxHKdZRilckdDb5PDRkGOHSbzL0W6yCaCIOSTKqQJsWCCLNEe/MWUz8e52vlZXGb4jMBqy6ezUkLxi9w4aN/whAevJ1j3yV9V6gnfrcIYR9kCMVNToHxfjolPxe01xFWM7p54bcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739618852; c=relaxed/simple;
	bh=hDFT3R1NkafuHHKnMV6ri6Yg+DF/cqL0W9gOZT/PEwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2bVsSzErGKUqi975sdIGFpubi/i1ak/1cUyM4obuOKK7uM7McxvnqBJ6LAZX5zR6hcw6bIyJRF+YE9pMZkWjW8gkgP4O2ESEVGaABgl11FsgQIsYw0YEnoOEWUiMC7B5LCUoxzJNxWe2RGlTwjnsBNcixigrr/pm4D5o0gbDC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG+UcIZ+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG+UcIZ+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so30588785e9.0;
        Sat, 15 Feb 2025 03:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618849; x=1740223649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwU+wFyXJQi0hqoJaIM7r6tnW9Ar6H8YYGxOtFUe+P0=;
        b=FG+UcIZ+oaH/BVqZtxoa7xqpFBRgGX/nedH5cH/5c/TVQEw3jmnkkQe2cYW9EKMM+F
         NldX3yWfVmQ3lghxFqI9LURtK9ahNpQ0nVz0XVIOnqZRNfk+APc3nx4LE075iQ800uaU
         fEYU9ChysscX8y0QPoE2w5XVNatOf//LBgvkDqbu73hZx/0g8XBf/CGQoU20sgCa5ZND
         EbCwRT3ykUQ9sEijosnXSOE04kzprtipQX78f9ufArsNVmqo7YmyH6HT2DRKkLpZfXt2
         kaIaFRpTr4g9UND325z49dYWK7K7nI8Wc0Xe/gKZbe9qGrBP1FA+93vQSIHokfXoGTaD
         WvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618849; x=1740223649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwU+wFyXJQi0hqoJaIM7r6tnW9Ar6H8YYGxOtFUe+P0=;
        b=nPmEzpttB5pEM1xURmV1riGwpT+pSuMszdHTgi0//Z1iBg4Fo+nIDlmVEhF1oR6H3c
         UvcmjXblJNRfQ5xNDdIgDbZnTlh9eUlY39weNzNktVH6CehbHaldeOv1xoSu2YP1rMTz
         M2wROrLp8xAIHgEA6bITo9LY1F8Ne8OJaunOntWlclN3e4M7FEmpOvttdy7OHJoF9NuM
         nQEy1tPHN9PCfR9ZsZ8Ly54UhrqvgCtft3eZNWE2WNlV084pm0cMnEPhWxL6dVuWP3NW
         wE2SHULRQp7KEpKHvvyGG8Mctaxi8Ebq390dDU6yKRyPa7n9ryNAqyGDt06fEyvY7b5W
         QcaA==
X-Forwarded-Encrypted: i=1; AJvYcCWDavBQYFaJU3S8hWz6o9w8DZGNYXGwLCZtyk/Gblm/TD44rhhcmhzN80QjRurvldA29/u3S7H5kD1sQDoy@vger.kernel.org, AJvYcCWbh49tG7dnhd/8bpJ2lCCbuPH6yG1sSONlsU+cUmo/RW9z1dRyApS+O9/PjK986Ghh0JLI/ykONp56@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3dlzrkMJHecRLAN/xDarlObCQpRZKOA0q4bRpj+CNNrSmKVvp
	3stAdyyniZ61wsKyx0LcYwnFU+YgGiOpaLMdW/3E7PwuSy277NDw
X-Gm-Gg: ASbGncs/kWMqZ/00PeNZ/yeC80UZcEyMXHD4IbafaBJhmMXw0PqGeJazfCEsVvYXXiU
	8MWferT1ehDMR9vmZNqCZ2uj+glMW1Q9/i/Mwyfb3MDp8Su29Ez3Aackm4DM8gtkIYvVdqpvqzX
	hba0vjp0IEzseGF14oaBzUNq6ytoWENYGVyKQg+klQPrfAZ86HmwfbcfDPWT2FTti6Qk6/dAebN
	EhWvlC21ue6qOjH4glZ7BbaF/oB/8TFMfxZOhkHMTiboKLhSuyCAW4C0iTaC562pxUQNxl33i+Z
	cGoua1Z61sVNc/J0UzG8vnHDnJJaw0UXW3M0NNxTVpBcQUtwJV7wKCH5Wp1MeG2edHM=
X-Google-Smtp-Source: AGHT+IF4n8AmOTtj+1S5OjZ4itompRP3wfOgr7Fs28mEciaJBF8YijODsGkRdhjtKcnPESQs3h3Wjg==
X-Received: by 2002:a05:600c:4f51:b0:439:66ae:ed0c with SMTP id 5b1f17b1804b1-4396e6d7b5dmr25896605e9.1.1739618849145;
        Sat, 15 Feb 2025 03:27:29 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:28 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos2200 compatible
Date: Sat, 15 Feb 2025 13:27:15 +0200
Message-ID: <20250215112716.159110-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "samsung,exynos2200-chipid" compatible string to binding document.
Since Samsung, as usual, likes reusing devices from older designs, use
the samsung,exynos850-chipid compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac716..2a7ba3bc1 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -22,6 +22,7 @@ properties:
           - const: samsung,exynos4210-chipid
       - items:
           - enum:
+              - samsung,exynos2200-chipid
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
               - samsung,exynos9810-chipid
-- 
2.43.0

