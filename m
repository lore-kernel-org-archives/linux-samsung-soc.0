Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E459A3B19AF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Apr 2026 21:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856504; cv=none; b=OhbRy4fOKuFLfkkJ93ggobbi2MQ3qUXzje5b4tjZoy+AhUzaQtz7eaorEYT0Hese8VPvqneq3W0k0Ns+8U73Enxzog3DhEliw16pQj3FPD69+1jlTepkbnQj8dFn895YWBny1evkZg2kmY6DFPuMD2tUc3Cx/Eeo7mB83DHc29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856504; c=relaxed/simple;
	bh=7bHBiz2FGouoPssWj2GGr60uUjn38M1Yrc9c0+M3U2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baYcZYH0zphL8gIyiIAUPmLzQ5wa8nKT8ma7dK3UyLZXmVR3w0++5LaVQirAdvb5rKXove1YuAAfbwHqQH4OOD0mDJwPrO7MawK3ppQg21Afthuk9UqDsPDxUvVC8b1NjgG6x3btxFTpGxewQ7+eUyQae9bukp+ZOnAFaqQpDIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9xI4Va9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9xI4Va9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso1946300f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Apr 2026 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856501; x=1776461301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3wqhCT2PYrW184+42077Vlk22WDYcJROXdpI32jLbM=;
        b=h9xI4Va9xj8Tnwxho2l4gtf5DdsvTHXVih5ur2Z/Nygq/wvbRCWV/3M0qkqJo5/Iyd
         iF/ibMs+ZDdThcMnM+uVUAxEIl4+qgvMSV05VvpXPLG9gVrrZqA4wBvUWXn2WnyIK1i2
         hQv78/3PdLDnXVOaPoVDv+0oKVvqbxjkglV1lyKTobZa2dGO/hFJ2OwHwWvg8Nu9sQ7O
         ZRichqXjHKu9jXOm9EazQlHsIw45Qcys3kMqJBv7aiMgKQS/i0C2wppMJNlKSjdoSCI+
         h1PfzduSP4R5ICgHbBWskLNPgRMI+A1dvdzf54www1sG4DWgEyjAZeqYWIJlJmrmMabp
         g28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856501; x=1776461301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l3wqhCT2PYrW184+42077Vlk22WDYcJROXdpI32jLbM=;
        b=Ua47bmd6UtkahfdbFsF+TgWY+F9xgGHzw4VXn1Gje8Vk/ExcFJW1vkNSPcpE0nc+Oy
         MJZZE0rGvslO75MDxUYuzBeZUudUbHPrEIsemP52PjeRO/nVZ+/ybNYE1ZFkq+tsaWsu
         y4KxwwQ6Yfp/GQA5kAKRu5Vfvm2esDSNrlh7wyFDKdmNjJmu332p17IrO6HIjUrHTXUA
         Vvl3bAn2VwmvZvYnX+BS80xw23LMMWbCENQ00VSZ4S5BckR1zAhtEJHmKhBJOlauxaJ+
         CScm4+C5xvDllp7Wy6cRPgtjbT5GckR4j9f+S2MaRlxhswcW7ORcTErrIHHhn+a8JRfp
         rR/A==
X-Forwarded-Encrypted: i=1; AJvYcCWXYDAm0/pRlzVVMjRYfryglb6K8V7Wd439mnRwheO0qaLdnw9AjV6Na64KQGdy4H+9C1yMfanwKVlz6TYbPJeuyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCqaUFWU56GyyzD1tSueb5BGnV9Yg6+Ax6S2DzG3RlMjrpHAYQ
	M2s9ZzaDOm5yiUQ4fdXv+orXgw0gku3TPQtw1tJPvKYdaUztuwGL0cWa
X-Gm-Gg: AeBDietkLybU0Dn1F1mpssdS1OiyNGmWoccasG/d6ARnCa/PuFM3YsDmhNAxRFhlB7J
	iEsapJJkJk1yxYWm0PRCyQ6QTkWFBhE40fpeVYs54ftDua3xqz1UJqls+IxB/X36UXrYvVu8M6O
	G6RKJPl0bVL4RM6FK1y7TUTlAbKP7n0DnIGU4zmyWn8aX5cFhmDb2l14QA0kMs6EaUiAsiPztAb
	4Ic/V8kyr7nfs4aKXmOO2Ao4b1zyS0bCWEdHGUnq4TcHLCDsrLkA4FPyL9DQjzW/lhOfTr6v96j
	d+aRUQ1NWQrRMEz5zeRuXS563ERN7Q9zvD2iWUGo13+x4uLA40yV25+O3lscFwAtvPLH8rDwUUR
	fbkJL3QMV6D1QGXCiUPg7ow9KhxjLmoDvaSia+exbqilzbS2TOHwxVmbsW4osuSSFoC24wJP0xb
	SrWFs6NtKjrp/cC0j/HqgZYmZsF90jgdrJ7R/9XY0PGtebNhyGQm12tUHi6nE=
X-Received: by 2002:a05:6000:2489:b0:43b:8f04:2ee1 with SMTP id ffacd0b85a97d-43d642c4ee9mr6929982f8f.27.1775856501227;
        Fri, 10 Apr 2026 14:28:21 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:d356:742:cb75:6153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm11205992f8f.27.2026.04.10.14.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:28:20 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH 2/3] drm/exynos: remove bridge when component_add fails
Date: Fri, 10 Apr 2026 23:27:58 +0200
Message-ID: <20260410212801.413827-3-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410212801.413827-2-osama.abdelkader@gmail.com>
References: <20260410212801.413827-2-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

when component_add fails in exynos_mic_probe remove drm
bridge before return

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 29a8366513fa..5e771b236bf0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -437,6 +437,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 err_pm:
 	pm_runtime_disable(dev);
+	drm_bridge_remove(&mic->bridge);
 err:
 	return ret;
 }
-- 
2.43.0

