Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700276035
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720452348; cv=none; b=O9gaxq7ljp6dsxddEENvu3V7IJqr/pUmsZiXbK7StLjGckn90KhPgdHsi3alj5egvVOHkNTroIaiKHdk8ExlcW3Fts8s/rGMzFhirIJpQ8S1OYJftBYprQrKNMeUjOfyL5fczjHGJ7t6unLQI+sKGIeQYMXsyPxwPwf9N3HWX40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720452348; c=relaxed/simple;
	bh=3cKgmqEVGt8q2CTHgrvFHLBcawejhnoFyUrF9+MUxJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HyW5kCZZ8a2yyrlbG4Zwbqa4XVVTjh42n7PpE7sw8Nxwjm6ls3Z0vUl7vY+9nu2unMj5R4pxSsBMd5ZJuqBy0zX5OcuBU4+TrLlIC+DenhVPU8EhgCZtPD22xCiJ0q9KAcE3Vd5pI1P8NVrzAh0qJmMi7dJZdFkWBf/jh0TzUtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xWoGtFE/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xWoGtFE/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36796aee597so2666596f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720452344; x=1721057144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxLnRCeU+EqpNAy0Jvkl4K/sbu89YzVgU/Uvsw3uIWA=;
        b=xWoGtFE/v1flJE2xln43tVavhQXQ78jR2x1rW/5LQIAWNaLSkstN34NVYIF9x7GHJg
         aLuhewyWQBg6r3qcenG/AImDrW2vqruo78DL4oBZPb6I4LsY6IaGofI2Z3nrdf45WG9v
         /Wvfo8lUbzG2O2TXA6BrgcMuEjhnR7iYIiExyAaCDJ/OWTM14dx1aYVbB8/lol0aiScy
         lsBmuzUlLJdtbDm9UtGIlIwuzOPuQIyXeySOpw21RESh0TQ+9riM5/uxnKoX1BZKnTBF
         KGRd/JvWNpmZE3V7mi4UNf42Jfx5TqJU42sub1Creb/4Dl2QU89SaDjedD/h83MsszDs
         lZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720452344; x=1721057144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxLnRCeU+EqpNAy0Jvkl4K/sbu89YzVgU/Uvsw3uIWA=;
        b=DQW5WQeMM8mJueoMKXNM2akI6qprBOIIfA/vIv96jWJwZNB9q1kw8g3IjEVnBZ14lP
         SUE9aUvcQBJogY53pf9sS7AuaA8o+yKhokUqS9YKVH5goCRmyDyxWVc1r7x5sFiZTvr8
         bpZNOebQdBjtZbSOsvWsqX+JtpghVW1kQ7nyr4XosAD5KW575EwHxRevjhVKDzLNmNO9
         yZ79WTFHXoZrod3QmarzOnvCBuDFvjnhTrWctu9DnH8zDwo0LeP/nZ80IAOWP4+bAulA
         /dDAtZDkALdLSoo/qW69b1pPQoCZQB6vSv/VJRChr3CW4+WeGbzV1MNeJXlyYdx5aK8r
         h5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVeVWcEjGYtZaTMyeFZFxqdx25VqotnOz1RjJJPG9YhFfWHfNirp0D1fDAVJ+5BsnMXOcW6LO6nfvOxiyImglMIX37EjzWNHTQQ89nsBoA7l1U=
X-Gm-Message-State: AOJu0YyAwfWXLQgBNo34f8BlUwBOo8ia+XbVo6Ww/ubknIHnNjkCHQpK
	CDVhYA026QLlMhJKFHXbmjS7ejcpggK/XhlXBTcz5+FLnfhwd8DjrvAZZbROWYg=
X-Google-Smtp-Source: AGHT+IHd7fqF8B5P4VY8J7zLJ8fjAYwf9uP9yVMxmmT0lxO3YzRDoOiqoBcrGcOV8G6UPv4BvY6sQQ==
X-Received: by 2002:a05:6000:1d1:b0:366:f8e7:d898 with SMTP id ffacd0b85a97d-3679dd66b3emr6497613f8f.50.1720452343445;
        Mon, 08 Jul 2024 08:25:43 -0700 (PDT)
Received: from localhost (p200300f65f217d00930e0db224f9e8ed.dip0.t-ipconnect.de. [2003:f6:5f21:7d00:930e:db2:24f9:e8ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde8904csm65276f8f.49.2024.07.08.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:25:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ARM: s3c: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Mon,  8 Jul 2024 17:25:30 +0200
Message-ID: <20240708152530.19306-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=3cKgmqEVGt8q2CTHgrvFHLBcawejhnoFyUrF9+MUxJ8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmjATqWZuN24gvnk3bH+irRXO1vjJg8Gn4enmWN aJEAWb7fQqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZowE6gAKCRCPgPtYfRL+ TpC6B/0RoSWQvf7xWlCc6SRIUPiAMir6pdkemADeUTEE7ljWaRq9gpruaztg7i0GDJWnecUmgFM WC41nLZDB6kVHl/jKkz/MxokgUextKKyHHCjmripdaHKMgthQjXXx+0IZ04nDf6/Ygd0ij33hzl crnB+G6P3ZiOmpRKKCoRiUUT0mw9J2u2SeO8Ic4xQsMVyxNufnejpqPZ5eZTVoZC9uXRZvbohfK V50YXQ4j9F1uPXsy/bOwAZHRS19XJNDypqE1CqRKXl/PcTO/3LDm9p2ZvmfzOCQIFp++7NEP4Xs 29adrGDymijtF3u6IajFHrfXu5/A3ANB1TTcJjgWmQFs76qp
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The wlf-gf-module driver doesn't use the driver_data member of struct
i2c_device_id, so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 2de1a89f6e99..4ffcf024b09d 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -446,7 +446,7 @@ static int wlf_gf_module_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wlf_gf_module_id[] = {
-	{ "wlf-gf-module", 0 },
+	{ "wlf-gf-module" },
 	{ }
 };
 

base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
-- 
2.43.0

