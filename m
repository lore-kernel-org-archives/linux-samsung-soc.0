Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033391AB6DE;
	Sat, 15 Feb 2025 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739618851; cv=none; b=VP5LhMJjqyw2E3Z2qFO41DRvYjsSeq86p3wRcYPdRQbPk4mKV4VgYtz6dw2tiBmdnpjFjAt5hUd/GrbSa/CwH2c9DTjmLXhnlGOQaOAZyZaecBDydfc7dZohRGQ1jsv8YLE5gvK+zyz54pS6hyDZ5rYHa91PP8gYNpyoUtyIIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739618851; c=relaxed/simple;
	bh=nCypo+z+38FUyuc6zOr7sOdDKKmqE369lPjs9U9ToWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eO8WRnhsutrTaz7T+8XRheS6EIMxeiJsYQjwKQ8AmoD16e9h9gEKWx0KASwoMEkF90wZ1ieTUMyCc2p2XgtPhwteZSYWpDVpcpxbVKULGYcVhwsLzqgXV77SOxVZbfcowsO0Za35v0cDdQJyfSUXppax5sb12G3RrXesz8reFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDEXZTCC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDEXZTCC"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f2cb1ba55so1199764f8f.3;
        Sat, 15 Feb 2025 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618848; x=1740223648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fZwehbr2XrJZtv4Jz0Zzz8OKa5r2/2zkv+U4vpu6Nc=;
        b=FDEXZTCCvNNU/H3OB8ueLp3wDq0F/nAxnbVIDsfzhHrAZopNLGQrnsc/hB+yAwR02+
         pTpy8Nh3/hnfA1Qoo+8Xyra93d7G8p5cULqGMAu3ULPvIXiUwvnHlMTav0qEGPPvyuAU
         qRfStkvFmTYwN7UHLI9mzqv7bfekprGMlhFh3aVd7iHzG7xrdCg8KR4+Z01urLUn0Ir9
         fHXoBF/T4h05lcdIZyqdNbtTtGWlOv/1268ayP48tSS8SxAeTq2hDcg5x9qv/OgkDFXq
         /76CIcUP/QVXrwwqWzXQbr+uXHqNfwELoueZ7xZ+EaL1znuKJ66j6hw7nR/aYMpTFDt8
         Idlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618848; x=1740223648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fZwehbr2XrJZtv4Jz0Zzz8OKa5r2/2zkv+U4vpu6Nc=;
        b=ADOwLIcwluFFHQbW3bUqHRxVmnaQlXQCTxTAvI38SAGkleE3xFhmb8ReJUZoJnZ1M2
         AemJ6AVJYVXxQ9iyFyFctQLlKmUmUt4O/VuLpKAVwfxu1xMVGVHG1MnODRsFBpzZ2cJy
         xm4Gwon4v95kNEYGeZ62T7j4jNKQXddaUNg4lBZsdIFDuU6NbF/jTaZcFIq4pRQCK0WY
         K1/8Ompu1m23Hn2zGmUJV1OU0kH4sKh0Pyl/Inn/6wKmu+BOx7gNj0pELLbNNOEnUu4P
         0Nc1LAdvwlDY1lnOiypIhujFAKS/wDMmxocvB4mnneMnuLZJfjm6w7o4/+IUDpppJaO3
         n96w==
X-Forwarded-Encrypted: i=1; AJvYcCVqcD6/DNvEG/1KV3ZxofeQRey/WxwoVZRahwoughJmbtdHXtRefDqpk/lg8l8/b7cyAq+Nmlr0o5L8@vger.kernel.org, AJvYcCXgRc0aP0Uo6niCV+6y9/CoivXXL1z+QranEHNo0djbvMuwPHymwyFF7AZ2YNTd71w6kf2N2VCVUomZQge0@vger.kernel.org
X-Gm-Message-State: AOJu0YwD2pXDjVHudmL+1bCQQZflKl3Dk32NHR0s1LYVoA9aUfmTuoKY
	TesADH9BqQ/ubwuJlL/mF6BtkvGQ9OLdCMqQTobUwHm4ZT2BZha3
X-Gm-Gg: ASbGncuyf8/P24gmcCF0SdbAlQZXvU9DosnMFKniz8mINgsD+ZpX9VrUvecWMAXX+d3
	ryoS0R9c34JhTZDhPBCYOEQv7po4xocc7YRiixFaOJkDzpN4h1AhDJwgHadz1sHW19TkaX2Sc0n
	6Y2fI5Kr80ODQRERWDzlFDjA2barc4VqtqQr7o+tc3l5wfpv1+geDpaYo6jNndCvT87LmaHr01v
	iEBMohG33hB1njb5b1IjSRtpHRPIUsy0UAwXnl8JcfxuSSaGjMHWT9iV+Pjfj1tJclhHDRCdJUw
	G5N5sRfJnqgaMlg0XUz0ukrVSQTN5qJqsk37v8QsHD9cDkIPHPdpfV8y0LdPTUsQN3g=
X-Google-Smtp-Source: AGHT+IE3Ax7YXeQvW8F6OYKYkGqRzPswCt//GHzqdwNQdkl1VjsLn/m8bKPuGOKW8aziDaMWyO8gjw==
X-Received: by 2002:a5d:47cb:0:b0:38d:c364:d516 with SMTP id ffacd0b85a97d-38f33f50980mr2888564f8f.54.1739618848008;
        Sat, 15 Feb 2025 03:27:28 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:27 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings: soc: samsung: exynos-pmu: add exynos2200 compatible
Date: Sat, 15 Feb 2025 13:27:14 +0200
Message-ID: <20250215112716.159110-3-ivo.ivanov.ivanov1@gmail.com>
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

Add exynos2200-pmu compatible to the bindings documentation. Since
Samsung, as usual, reuses devices from older designs, use the
samsung,exynos7-pmu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 8e6d051d8..26bdbc3e2 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - samsung,exynos2200-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
-- 
2.43.0

