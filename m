Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672742;
	b=HP7m2DLjG6MGYqUfEx0716dfZb+QAldn1PvPhExBMIWZ+xfTcn+2zUUC7OVryIQ/JS+V
	 rzzHpXxvTgaq1Ep+mAaNXaCMcKq+f9j9FcEmYhLb6d0soWTho+8AOYrNhvzj1m+RmqNmM
	 FtNxB5I9L+3gQnZYttx2IxO3m9y6oz48SHMUibBTp2I9tO5U1PIWxO0vt68rWf/ePFHhm
	 kMZlzwIyZh+Nn049C1y/XUe9wtCHJJ83DQZEic6Q/hsPTzDnv5vQCW5/PgQkSl0qGK5lD
	 JqpZzcuivpb57oU2BBCheLwS6FA9DC93uJL0nHiPRuq9XNuJtPZjcEHGsuoAr8wSHRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=;
	b=Jhu95tKnkhk7Ja/X4PrZU6fIEdUcpxksBhyAhJtc+ZBIm2jZt2WVI3fKqlIHnD+/8IPJ
	 pXCebaFXNc0DXD86NLx4vMSdcCG5T/OQI7tu8bc2JuMTutsz8G48cZo+wm6AzTv4gGjIU
	 rt013/x+jzlBeQTIvIvV0wWi47W3H5znZLL9/L7Dcn7DeS8UEH3y2y8v7FlleezEQku2q
	 41y7AIgchuJ34JZRcbDL1h5FNzmgS7FoKNs9M9XQXUYKl/Jm67cgsaVFXaMA4is+BBnwz
	 Z4ych0EZwuHRgwQR6iUoukoBlrTW8hOP6TLl83DR++LmuWNSkOOG5YbBaxrVB1eQ8sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XAsnkII;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF77606A31C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BF77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XAsnkII
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b589050416so999151c88.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 21:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672741; x=1796277541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=;
        b=0XAsnkIIH/J1m0YQZbpAYLj93XQ5MM4Yp6RCzt/EPqp35wqexoyQKwav3soOPNZH/k
         pzFNyUItCpEqqNkwOXnGxX2YNdsAI7fkNubYsuGmZZn7TIgNNJ624dmST1EFCAzn79ZT
         LOLFgy/x1WIoaBRZGucYAMM9JX9xCN2Mx7zz7WJoHRjxMTNb6eu5HnWxafb5+IlNF2wd
         IaXj477cN4KFwqnP/DHYXoXO62owL4GFaDucl5jxeqBzi53SYPHi098CCh3NwwsdkWU0
         gROe50ilPRpXDIF6UcVqKWhco9aepPw+i16NxOi6Hm3GKl3eywLEyL5fOfz60bLfkDWi
         k5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672741; x=1796277541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=;
        b=rjdIhHbYF0ROHQzN4nI+wzfBUDaytRyFZCew8vdNDMj1JYbyAikrV1ckgS+XnQznk4
         GeTLjucgz0RSWh3X1luqw9runzvya0rDTyBTCDRyZfUjBajojKfIEhHk4Jofso3UezKL
         zxP3s+YPrjwgnzUbRmrOt7frBCL4tGs3HizwXUw8YrGOmWMjiQE2v6O5mlAoNDwmvO1s
         D/q93aBruazPLdXtdDC+cmVIQ1I9/pSWJOxz3tY8MUtQ7ksxi/84N1SKU0JMsUSADqoz
         VXWZOp8JqqhwC1bz7kj05UT7ctdBYPb9502fVc15F4XfHa7xqviYaXtgq5bY/IA4un1H
         fgWw==
X-Forwarded-Encrypted: i=1; AL+hErHMA3iYQSmg0OzT98qL06hs4A+4LxtsbC+YmQzhDrnmCRw3YIhscmKQYngkqtdNQw63zJds9XRhalw5U/qwCsAMLw==@vger.kernel.org
X-Gm-Message-State: APuU4Z98TU8cUENLORWfLv78B2yFRPSmqODibGvQObsd4ygq5/ZEGlwn
	Zr6J9+2vT4doJMIB+OEr1BmUdz7ExdxYU7i2TkjBYhJ/eUYUi/GUfQiTrm3cPO3zcg==
X-Gm-Gg: AZFdTZcWFp5OaxYFfK9R6fobM+fulW6BhCIIrjeo6l9uomIdLB/KvJSK8BujPEOm5GO
	Chj9LvNbgmUtd6bZeaJQNGAOINnq5w9/GI8AVV1CKDyuLwqIfsEs173JHeyvLjEzdqCOjqhJgRJ
	P5JxwYKoqd1ga6gLvvn5F2moQWuLKiXNbn5qbPFsiKs29hMNRQAEAde0Fa+P8l2+0X8i5H9QLSr
	OwL8HXlsj1/GZQQ+uUVl0UEnXCFlmBEQxbjz2HZSyeekB6zjiQl0T4QdUl91udH5NBvuHLABUaD
	dOJW0JvnJ5K/YHVIl8I4C/w3zWhFp7seqep3vKtMMwhhg4g1BlPyb/ywNsKD69dWSwOLtNOj1W6
	IETnH8yaYlP8iS5mzwKRB2IokuBISoRu7wb7d91hlXAyKBkwi9PbO6FUjC+u8ERcaA0KAqGjq/9
	zGxqFb5KvVQEyIA9HkYpnZpLKE1TsYKqoYAx6VVDC18ftdW9APc9/6A9XJAIKqF4so5BGf02c3B
	be7cUWLPPwcPwE4w8hIQIY56MyUfrQGHV6QGbY6pwZEXYmuROyNeJ9u5ErnAZBiToDjKnS6H7KH
	bRBWgYgL/lDZp4wRjukFSSP5L+edZTwcUUGiI3+OgxTFkW/g8L5K+I1NH2BSaffzHug=
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr18022188c88.19.1795672741112;
        Wed, 25 Nov 2026 21:59:01 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm45249439c88.2.2026.11.25.21.58.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:59:00 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/exynos: hdmi: put bridge reference on probe failure
Date: Thu, 26 Nov 2026 13:58:53 +0800
Message-ID: <rc-b1-20261110-vc-19-b220c856ecbb@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hdmi_resources_init() ends with hdmi_bridge_init(), which takes a
reference on the next bridge with of_drm_find_and_get_bridge(). That
reference is only dropped in hdmi_remove(). When hdmi_probe() fails
after hdmi_resources_init(), including the -EPROBE_DEFER returns for
the DDC adapter, the PHY and the syscon lookups, the reference is
leaked, once per failed probe attempt.

The sashiko AI review bot pointed this out on dri-devel on 2026-07-16,
in its review of an unrelated exynos_hdmi patch.

Drop the reference at the end of the probe error path and route the two
early returns after hdmi_resources_init() through it. drm_bridge_put()
ignores NULL, which covers boards without a bridge on port 1.

Fixes: 2db0d298f22d ("drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20260716132919.A3EA81F000E9@smtp.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_DRM_EXYNOS=m, CONFIG_DRM_EXYNOS_HDMI=y, CONFIG_DRM_EXYNOS_MIXER=y, CONFIG_COMPILE_TEST=y; baseline and patched exynos_hdmi.o, no new warnings.
No hardware or runtime test was performed.
The path needs a bridge on HDMI port 1 and a later probe failure or deferral, e.g. a DDC adapter or PHY that is not ready yet.

 drivers/gpu/drm/exynos/exynos_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index d67a493c8fe4..cf570be8fdc3 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1997,12 +1997,12 @@ static int hdmi_probe(struct platform_device *pdev)
 	hdata->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdata->regs)) {
 		ret = PTR_ERR(hdata->regs);
-		return ret;
+		goto err_bridge;
 	}
 
 	ret = hdmi_get_ddc_adapter(hdata);
 	if (ret)
-		return ret;
+		goto err_bridge;
 
 	ret = hdmi_get_phy_io(hdata);
 	if (ret)
@@ -2079,6 +2079,8 @@ static int hdmi_probe(struct platform_device *pdev)
 		iounmap(hdata->regs_hdmiphy);
 err_ddc:
 	i2c_put_adapter(hdata->ddc_adpt);
+err_bridge:
+	drm_bridge_put(hdata->bridge);
 
 	return ret;
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
