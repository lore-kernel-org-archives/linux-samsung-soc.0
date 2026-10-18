Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2D940F721
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Oct 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327508; cv=none; b=kszKc+A7Pf5RZePqk4nzWlvI5cfEeZwZrgPR1GiQD4NacZra4w1mt52OHkA/bs+xtiRjfftFOfmJmMkE3fSNTz8sTQFK9Xpb+HSn8eGdz0gwbLb7oR19ct7Nr6wWySql+ZrmmcYGDBJby1HI5zIWsnd/MonmoQvW50ZqBLBzgHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327508; c=relaxed/simple;
	bh=GJXPUmb1nhYAeZO1jC61HU5DtD36Hl8QiqEPkhTkC2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQeEqWi017QXf3pAeCvXVJ4TmTptmtp8gZ/1ye/JvyOh9Z6UoIoSD8fleXAbDjaomRfDHxYxnR91EgpRlf3u8vqLXDpU+BZr98B/QL4DnHxsjg2bNmRsdmBuck1JmZQ1CLZRwPp2nvQi4P21UEbjkvyUsuXOmxjNCMs2Dkf3eoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCpjSDEn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCpjSDEn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so16027595e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Oct 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327502; x=1792932302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=;
        b=cCpjSDEnY2FLf1brAYERoTqbIwAW0/Dlef4t08UL0FgjquvEf9ZdWx9prn0Pjwz6UR
         SJsVmQYN9aM7SPslYbJE5dfuHbOjARXdmDb4Pnq7QXc7ijTRlHo3QuQrR7NYLsJAo51v
         hGq903aETabcDmsnxr97btcyzrHSV91patwLIkeGG2sjq7cM9fii6yEaKFsqutKXsS3I
         QSeCfg7qzBb8T9BAl2ZAv7r50Ufsfrve6CO5AXeyJyf8NmZq8qlL56DHs1cjGG0zaw/o
         H94aFzhYn6uySGZG4F+xWtwxMLfYKNYD3RpXXMiPqEGX/uzIhLpdIsZu7EcrVKfl0+Sb
         d6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327502; x=1792932302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=;
        b=0zwMOZkfq0So8zpihuxfHfsao88TUptKnIS6BGN49S7gmTvXtoOT3SN9fx+2ls1kBg
         5RYfxf8J6xwpaRqOF2bAu1HalAwAsPwtCnvX/VIIOAUSnF3siH2u7y4jzTHGKEPnZic9
         LkEGNcLGaBafN9a+6djDUXRXOsFcT2w0kRqHCxCDwHl12hkj9Lljl/NSUMXn7WQaNKLx
         ui67BGLT312kYnIysGJKS5yzF7P9RycklYPDL/vndKKaaWszjp2uciJkLdhHPdYmuWYi
         8ErSboHx8Tp8dd/KI63+xetP0m0nlhAhvxm27xkBASOug/e6KGAPB3NgMIRcpygAtTev
         PY/A==
X-Gm-Message-State: AFq9FYLKTvE63siyJNubac17Ow46N2XB4xgmbqd+XnyFfytoANkfbT7B
	mleBAXxHL7qHPSI182MHbMQXJzHL1wec7FaHl0qzHNKc7c/9if1bRTHP
X-Gm-Gg: AYBFou3rlCxNg3fLsljyWTmVg/6zuG1DM5SGIGHO8ZQbcf3t8KIL6dgHZzWfO4W0r8l
	Ygxb3QYiqBB1Jg0bVheNt0tYNqB7LAezB74VtTiWYWkvpO/a6J+zKZsf+6FKRFziR8a06Hfv5Ks
	QoAGr2FdfTW1TCL23fQ2ABTsXvsHXN41fCb8rdfppgmpS7pfmKsIAxPqnuq8YxwPrIOsn511qGz
	gRjnd2LUD63N9g5ZqQAwroc+/NRswxI3BYyYmt7UGE6HWvy/ooRtPyr5RJVn9Ftu8fgSaGn45mo
	u/wwvvebdPt1sNJZ8R8eFeNKNLJ2vLDA/WAE70tnZGWosdzZxWx2+tIDVgQbZCC3NuKAY88TGtX
	TFPhfbgmKcec+MsZfhZvb+eTPLly2nAe4IgZxfUrjZ44L5jWLAO/ajQ/EcbWEeInxQRbW5XsusR
	/G26eGy9E2rgSwJqjGj1B9nwitePNf8Z+W/HHMqQUiL1vizycueXUqOTA3gQSPG5n9C/c8Slnie
	fx+9w7eS1ZInIcXgNKEk0pwwyo/osEbUqyPSoSox7nVwWw1RDqQPOPYgy5qKZHsVHNPTMPPylVv
	XAgvv2051AVvWab1TpqOi3b4izM9IvcxpkIG+XQkecoJtgHHM/hbScut71nX3nZqsQaF6VeBFD7
	ZuAadhsoRStxgLI1xPbGCL2E=
X-Received: by 2002:a05:600c:848d:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1e722a360mr3167745e9.30.1792327502114;
        Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:01 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:58 +0200
Message-ID: <20261018124459.3026-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)

