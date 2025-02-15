Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8652E1ACECC;
	Sat, 15 Feb 2025 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624712; cv=none; b=u/sTVInFAeZbmckarI2F7YJ+NxWnG2pUln3pxBTtcEUQSpPtGinE0qvFRhicvJSY6TTqvln3NRzy/vaGkxusEdloxHp3jtgjeorsnVt7o1powVEcI0Ql+dghv5bl5wZBTy5FGxADi7MR/+38BoggvlvWvlGx8sEinqEjLs+rcAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624712; c=relaxed/simple;
	bh=VVtCCsm6hYxVOCPWhdOyuBG6lUz0FoomELXCpk6gfTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6fLS6B5+FxUopk50cjITgu/oRf1RPTiWC4ym6WP+hyRErdxjrP0hMVIYEWGaW8Uggh59UOER++hXaTUCZJoyHhloq5qO8LZ1IlylNx9Ag6vqFCSm9dnG5CIEohJEBXN0YhvBl8PspGI6oh1w2g/sfBtUZzCt+Bous/wo5stbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8eD9hoW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8eD9hoW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f2f391864so786628f8f.3;
        Sat, 15 Feb 2025 05:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739624709; x=1740229509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJkUcBGJ2XrtMHGjrGHFAv/qEFzrxk4oRJjkh26EYFY=;
        b=F8eD9hoWaa4iiNtewilEd0NNOTtyVxQGjXrOPjLHicUOjtP52BD/2nxtk62WmP9ndO
         mIYRn1ld40+Bqy7TTv8Ii5w8Ri7CzEIGNhWwIo3OwO6eXp4QwoaDeL8JHXaSQdm3TKNi
         6q7S0Elw3g2QzJQQk5X/YXiM7L2ugMjC7ionWgLWArBymXJ+cVqugsjIsCLMq783uGt7
         uzNNDxbh6vkLGBo2NJgDbbuGE6625VEmVZO49S90pFSosiRqrZp4n8kJ0PO79FeVWgze
         2KAESqnFDKbSCrzqtwS9uwqO4OcVz+fthxD8jW0UJZ0LhmJyGefLpih9Olksm84w3EKL
         AKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624709; x=1740229509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJkUcBGJ2XrtMHGjrGHFAv/qEFzrxk4oRJjkh26EYFY=;
        b=nDqyZnhKQmfEAin3x/4sxzFcUUrV2QESpGdsQ9bnVD5jiPJquVC8FblGas7/T44aHt
         OghcRyYmXd/1cmGAowVZhgne6a4VpcebXDG48WEwcQTpexxVdte0oPr/K1HjMvRS5cM1
         nZiE7XcioNRXCrEKobLfue/7AwNMe4Hy4vTwqtK2ROXD8x6CkpX2pDyftk2oOj24rAmW
         HQM//bselkt3jj1K84JFGIig8KeS9VYiwIfjklCwDJyWvnl4mlzGKYmG30gZ351IBMPi
         D0/z2VCBFvOPtP85VhgXACTaOxH+nibxIeMB35bERWpx9HKnit2NU91UpjXwZ378k7Wf
         x31g==
X-Forwarded-Encrypted: i=1; AJvYcCUze+/K96HzkJMSkLxlRCmD7s2is/jVHQRLr7ilUB1BCOi7JBowECPEl1gjFR3B/6egkCL3dexM4ZkJWSTs@vger.kernel.org, AJvYcCXf4f3a66qUxIaTt8P3sM7hcwClvJJdhQDlD1Pv7do5GSI+fS3qb/t/HwtQTX0DwOAHcKcRY0R/IXtD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sU6oGCLuJb2Xkaj2W9X1FAn8ziHx2NFZ3IcrFy6ImTtY0Y0K
	yMc0Cit5TjVcA19MEoSGtSi2zESTSpwh0gKvu/4O3Z/jHl0kdaUZ
X-Gm-Gg: ASbGncs9djR00SRbvVD1VxKiLn8VsLK5o7W2XiRNl2disnVFiNHeANuNC1wUSJWKrXa
	VS/TJBpSxGEbZErMZvp/rjx8IwTTNJFxq9Jb7ug/qnzwnxrQo6aJMDx3KpEXJmXyCVCYDoIoN4n
	8OW/pwVHmhrDkkylpBGhTpg2NnSw6EbqqEpaSStSIVsUM1yG9P/QuHxTRCiUonTUdodGBugpO3L
	Z3ajivASGD8cYnKPmqfMw///Oeh3RGBOJRgHr++ixMneU4pZa9U4tvlDRMdpHQrTDJFRa7ckt8l
	bcfzWudFkp9DRHQ0zaYP/fo1D2xIkMaVFhh3jb8QwlT5f1lYFT1G8+jZ9JDIHhnuxzs=
X-Google-Smtp-Source: AGHT+IEgflkKzAUCj8W5Z2pQjpOZ9PiAZlwT5wElROQ7KOpjT96Z/zQioxZ5pGDe++0gjBBqasmnaQ==
X-Received: by 2002:a5d:598d:0:b0:38f:28a1:5017 with SMTP id ffacd0b85a97d-38f33f1b7f7mr3137551f8f.9.1739624708720;
        Sat, 15 Feb 2025 05:05:08 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm7091418f8f.1.2025.02.15.05.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:05:07 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: arm: samsung: document g0s board binding
Date: Sat, 15 Feb 2025 15:04:58 +0200
Message-ID: <20250215130500.170738-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S22+ (SM-S906B) board, which is
based on the Samsung Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d..bb3f6a0e1 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -45,6 +45,12 @@ properties:
           - const: samsung,aries
           - const: samsung,s5pv210
 
+      - description: Exynos2200 based boards
+        items:
+          - enum:
+              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
+          - const: samsung,exynos2200
+
       - description: Exynos3250 based boards
         items:
           - enum:
-- 
2.43.0

