Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792451280;
	b=VCgDl1tR981YtZTK3B/pxME8nNp6eAhErW0cI51ZH7o7ZMBNsw0/gm0o/MLuYg2LXp+D
	 79B3vuOr6sBJcVOVZAlACpZkRMSVSVDr8jO1x7BHgJ+VGtAStOrMnaKg6iRK7hFG3DTTT
	 pOVzJOFasiFvtHeRSS9MQQpNUb6RsOph3snKqZlPkk72V1Sb7CaXSVnc+u30KaYBoR+kK
	 6QG99gNBVpZAHxb/TeDN8vDXHhnKxFfcg8lTYIBAs5rnbbtwzqiwXpBaCMr/DxmeNIaR9
	 Vgzyqk1nxVe1BQoA9dmvHO6VkaJYa02cySTWiyM8wryMiw1ybE9gzpHzAxn3Bo9XuQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/15IrbGrSqzjrFkWTCPOJpVsfqAYXsYamlcuLjCS3GU=;
	b=0WoSfTwH5M1P8lVQecv6NgE0mgdUlWXet/hbDW3IcnxQi8pVX25INp6JF5wwktppCwkN
	 6JOBE22i04sStpLbrgyHkbUa5278cQG4fO4/0RQ3wEou5ZdGpoRMenIG6KhBFAPZfCd74
	 ju3TZ75vqX8gUb8d0jZp89WWRTZes13e3OhD/luYfvvc8l3FE/ZoHKf+5xdR0T1W3orqF
	 hYTIU4xQC4LYVnnw3lf0bFD50UBb3FY5mpNrf03iUdJLiQTo4oiGOgiJUeJkSojwE6oI4
	 tNqPz6LcT2K1LghszRCF4KnyQ2skbi63eEtDho+q2lPy/yetwFti5BDxQo+IO8hLkLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZRqGf34y;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B51606A31B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 23:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B51606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZRqGf34y
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso28568605e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 16:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792451278; x=1793056078; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/15IrbGrSqzjrFkWTCPOJpVsfqAYXsYamlcuLjCS3GU=;
        b=ZRqGf34y0L2eaTOSXNXcCgx4ey13Hi7lSgKxcZ0hiG25fHhTSQI1FthwlV2MaYeOb5
         glKUEdq7peqUf4MIHsxgmepWpSL62cxxCalMyUNXAIXpm4/OHELNEWv4/RcRn756OiSX
         3/LVXdjrH1J961z8ZMv2m4VX3z3u+a4HsRcUfXfRnu+wWiSYJMxwy+woiMmcYh/SDi68
         jZNeAy2zgEbYvvqax8+ubrDyE2idFkQRf79iV/w4mC9+K+sV+S7ers84/XK+ayYPU2FR
         QEerbhnp9XwEwm4uolQzzkFRik5aEi7Bk5lVrJo4s/XLChGWFWgoHMlUnu7Yv+aRxfb2
         +EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451278; x=1793056078;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/15IrbGrSqzjrFkWTCPOJpVsfqAYXsYamlcuLjCS3GU=;
        b=XtR6/j/xyKz09iO10ighXHoIsm5qliOTK03I8pYQ47i9ggtGsuZ5X2KXPgQBt/vUOL
         DVRkz8MwOmbEbkoy8HfQXHP4Fd9wm3nE3dUmd2dt/0I5ff0bkl+RU+7xyAlggkIyizEi
         sAHBxi3fnWvpPyoV7c88pDBDvSwowAgLhzCTd9zaME9E/JuyF2mLmdczEgEeNVtotHIv
         8C07OAXJZjamnjAbYJJ8ArQYAV7RSY2oFFA+jDfDnuk4AlK8fYUDkVxkjdtsVqW0k4dG
         a/rFPnR+nBmb9xEHfiqGgI7K9f4WChLojzMOIm0zrfPnusrPGJLd2K9MFRNWkvv6jTbb
         PHVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHMkBOjxG42BRI4MsGCUmg7e/w74EJ5w2yWmd+iwrZ1SXGRkWejBolYHr7vhmG0rPlKgJ1b9bJo4r/VW0OlNhY5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbdnTuMISO9Tep21SKnqGl4xUJFko86ZeS/tW4aqT5nbTdXkMA
	4j359QddTssOItlbrTvWifblzM+5gIlepLEHF0sPD+Yy1BpEI2FtWV+EdR2rvtDTxF0=
X-Gm-Gg: AYBFou3JYNJLvMgNZ4lUYZX6XcTR+CRFLUjCvGBTx2t+yfQDoMxi82U14R/BkxtZwQz
	LxcRaolyHOO04z5fBnO9w0hxn8XMKul42i0qyLiDZ5vU1bFX3W9Yfs35utTi9XclxJLOl1kp92w
	yifeyHBrEFDa3gIVJwRrxWjeCjJt89N8v5EuqCP0nRxUYpR49LaKOcGtU+/5L+TiOv3bPGfjAUt
	QU4Pt+lIimI4zSlT/95H7C3KeBBoCwBGQeOQl0VZrbA4gzLxsgz4tIeQy1svjZzh5joKuJ9x5Rr
	Gvh+OjIfGoeB1Qu2iPkOQyztwgPPbvZhTsOfg0PX87/b0L0eYrJYkQ5VjB0La9WaeFUeqX6r20Y
	12cnkuGwmHJA0raKSEX3/fWc4TMTUSo+oKPQ7rxlu/ttQ6ZE6H1EEdkUCmU45NujvY3jUWPSWnZ
	lyRGz0+TOVVtLxBtP40oJ84ZSYpO/OPHei+ljBGIli8Omx7R11h917BYH7TgZ1AInaqr+jSXLy1
	OLYs8YqAuU8e8SJewKc/pntZYUrxA8qETxK1bryImqfIS5SWxT735xjwZXy6A==
X-Received: by 2002:a05:600c:5494:b0:4a1:e0e3:7fe0 with SMTP id 5b1f17b1804b1-4a1e0e3802emr144230465e9.12.1792451278361;
        Mon, 19 Oct 2026 16:07:58 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm4083445e9.1.2026.10.19.16.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:07:57 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 20 Oct 2026 00:07:54 +0100
Subject: [PATCH] thermal/drivers/samsung/acpm-tmu: fix platform_driver name
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-acpm-thermal-drv-name-fix-v1-1-71f72280583b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMmi1moC/x2MSQqAMAwAvyI5G7AF16+Ih1ijBmyVVEQQ/27xO
 AMzD0RW4Qhd9oDyJVH2kMDkGbiVwsIoU2Kwha1MYVokd3g8V1ZPG056YSDPOMuNXLuG5tLVY2k
 h9Ydy0v+7H973AwXwlsNrAAAA
X-Change-ID: 20261019-acpm-thermal-drv-name-fix-e7c8af5c7b52
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.3

The platform driver name is set to "gs-tmu", likely a leftover from
the downstream implementation. Update it to "acpm-tmu" to match the
module and driver file name.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index f9802080acd7..4b89a2cfaaea 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -637,7 +637,7 @@ static const struct dev_pm_ops acpm_tmu_pm_ops = {
 
 static struct platform_driver acpm_tmu_driver = {
 	.driver = {
-		.name   = "gs-tmu",
+		.name   = "acpm-tmu",
 		.pm     = pm_ptr(&acpm_tmu_pm_ops),
 		.of_match_table = acpm_tmu_match,
 	},

---
base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
change-id: 20261019-acpm-thermal-drv-name-fix-e7c8af5c7b52

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

