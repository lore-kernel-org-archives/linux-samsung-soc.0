Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945FD1EBFF7
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757858220; cv=none; b=d2IOh4yQ1+7BJ6PU85Ft/FKE+o2tl7pdAk7roTT8GQcBJ2gUbFFL0T8Y6Yt5k89wOtp6FRLxRwuXQyno3j/SnecE+DBd7EnU72flmyWzvydmoTeZbe+7hrJycHud7NYD5Ti13pCX6Pku0C7qv/LYD/XeSFbC53Nf4WHaOTXN8kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757858220; c=relaxed/simple;
	bh=G/YgUWwYgipT54ZkK5S7t4iIid/jh16TP1NiVGcDIfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqLXxxhJnPmbw4/gKr5VvfjaBnbYuWZh/ZLWmEbBgdl1y1a0VTTKd67vyj8QePApLdvDarN10XLHpt4LbRZ2XtR7+zccUA3y/JQaowgL3k1LPVPm8fOj9+NRhkKUHr6v0B6tF5WihHGpQBoQG6Tq/NMvfc9IxuNUJ64eP1yttpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHR/9HUm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHR/9HUm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so20943995e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757858217; x=1758463017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=aHR/9HUmPwzCarHoxiVPUS/JKdRy83Hp2l549rHvBav+G1aHNjN8qNTMr40oPOfbx4
         +/pXMl/O8BAX45mR7VNJdalKpzw/ueWtoibME1WjIYjIVvfII2wtNIOk6BUyhZ+huHJU
         RP4zk1sttF/Fr3XykCaT96FjN/pzMD7cacDdbisKuIt2+/xBjvtBdlyUKqeN76Js32Yl
         NbBQCkiQ2dLlPVZWvlgDoQWdvkP9LbJpQrdXsb1Q8Fv+DPHKbmfReTMnQnPiMW5DYOmx
         H/POhEFkC1UL76iwgvGaYxf2baU6iK0r12ik59DM1mohymEmc9ZjME7Cnch6pQPtqmW4
         UZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757858217; x=1758463017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=NYfMgVy+bOQ5usu8XCz6hgCFo64UXAKyPqvMlv4KNGpbHEjqS0VyIoX+ztSoGGa/Vu
         NO1+dD8a34uvCQ/WOHfvxglJB4usXq9/Bz0fcLxbyMpqWwh7DIPORd97R9oTrfTQ6aru
         Hdoj+EstRbk1pBztu6T4qAaZJS66e8GZpkFjPetDsPvgWwfDo7QpMu3cEATvpGRA3mL8
         cEYwLkPLoL8QtuIO3EzUQSqNtqo5N3RU0FFHgwG7dVcdJazw54gi9qKIuPxmFfyxl2jF
         Nqz2YzhmY7NTW4yoW7aw454eQEx6WJDcnZwUr5+Y3Y6XJs+HNPj/AEctGEeqHhvAGI41
         fSWg==
X-Gm-Message-State: AOJu0YwssFM3JN3ZYuLZ/ThTpP/uJFw60m1xl/GqwC0deLxUsYGCqi+e
	+zUAlE7EXSSpvt4GlUCZUPc80JHK+UQsQMzKOerLeAC4MSgxuSy5hHX8
X-Gm-Gg: ASbGncuVrhz4QhUZeR43X57yLXo2sYPjIo9PDXQogSA7O771KAXv3o97s+t4HEKk6EL
	DoF1Dt4SEilHlNP7ccST979ReUgbREdQkVfuH0pYJIIblbAIPTtHe3BW/qLEy1X6OHeK9+qcj/B
	NwBZCn+Wt8XWib/AfQcDtUHg1vN1mRSmjxGdW7hNz88noqCj0JM4Coj09fXMhTjXWAu7xv6xJKi
	/+brV7i7yPTf3d6sfKyr92Wb+Byn7QOFE18IXY1EsvrLq1I8p3QEVXX1XbfdVeVmSJhb3wCefmb
	6P2Xpq6Vej89dTW+OxaS4GvQadpe4176g21V3QIuIO7J9Fq5UVvV65o73XG/K16PFOJSJr8DYy8
	7mGGacR+AZkrmoo2H6KEWTxDisHzxIYxbvxY1p//GkZVQmAlgOe2Bs6HPlxDd4RjAqfzYwVQq1Q
	==
X-Google-Smtp-Source: AGHT+IHB+VULFKNGf84XS/gc0CK50EFtBdez3HC/85lxGgum+zb542w5P3i1LGfQ0Av13zEl30jWvw==
X-Received: by 2002:a05:600c:1387:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-45f211fc2dbmr82961965e9.37.1757858216790;
        Sun, 14 Sep 2025 06:56:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e84de17f9bsm6740887f8f.49.2025.09.14.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:56:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: usb: samsung,exynos-dwc3 add exynos8890 compatible
Date: Sun, 14 Sep 2025 16:56:52 +0300
Message-ID: <20250914135652.2626066-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the exynos8890-dwusb3 node. It features the same
clocks and regulators as exynos7, so reuse its compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 6d39e5066..6ecbf53d8 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -21,6 +21,9 @@ properties:
           - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
           - samsung,exynosautov920-dwusb3
+      - items:
+          - const: samsung,exynos8890-dwusb3
+          - const: samsung,exynos7-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.43.0

