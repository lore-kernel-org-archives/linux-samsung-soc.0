Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607E722A807
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856044; cv=none; b=trXLoRL3TXTp4WNuf3tMgbmGDZXiDgu3qRmn06i40z3d6yi946/K/oThRMPeZ5EPQIsPMHFSO9U97gUjMFE1hM0XfuR3QsuJlRms/v9KDt72zf9HqpTq/zLWKUrXMoPotBpr/zlGjXis2YXAiq6PEi9z7bi4+4V++Lw6/9jdX1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856044; c=relaxed/simple;
	bh=rruUm1ocHEpQZ4MUQAAECVBOSGcNHmVZdbgaderWfw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZRd8irRUCzifETEMxzhvhC3XWNNiEe5k3SQkEWKETRmCEx1yK1IQIMcEOeIs5B9Ef/1MCpErwxSNMU09FzGNGk8O1FILIths9ujhJCD6Q/AAfk3s823YfgfuBTtbAL4xl/Cb/NE5tJJ9q0ta7o+SD1QeEWsfmJaymlCSHGzDeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgDbDHPL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgDbDHPL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45de56a042dso21172755e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757856041; x=1758460841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAG7m9JuJHlEHyVLrilF0p1L19ca1FzfGVRDxZu6tYk=;
        b=AgDbDHPLIqFZiytWd5LyzSqkMHtBXGA82UWkS/u5tJmXGD60lFGq7TejRYt1PeEfby
         1tXlPkygBsaoRHT2H9dJpYq94mcJBDqhC0dQ+fvJVa3AElH8oDRzmJ1+343jS1WHVT4f
         PHEzfY9Irqwi/KVpL47lU+Mn//GWVoZX+Ci4nmM+MyFJR/1afC1huJ1BMubPkU5KB+up
         /1niqx6GlwJeEnBqKwHUBXGMpJMBA0sohIw3ht5swibQ/rjzAgkaiw/F/Kj3LfR0FytK
         Ue1RTqm8TKvqPX+gZL8GbzZLR3u+C0HWHHSl+99/6eOV6j5ic627vthA/PjUbYM+6qWn
         kTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856041; x=1758460841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAG7m9JuJHlEHyVLrilF0p1L19ca1FzfGVRDxZu6tYk=;
        b=Upgfu0wi4zeBztNh4iTJMwyX2wkwwtkXOld8CZtAJL2aQuPH3Mf9iguctOv+P/yBc1
         OAKtWX6Vfl1N+QH4S5AhGXF2AJCsSnVlCG3M6Zuo03NEXHM++/BeGNeQSqROllQdoAqC
         93M7ZX+n7osdXXKW4+OhiBw1DWl6HZG/exs0qh2rOF1UpHJmmRnWHUAe++1uvvjteGfd
         RkpHz2RS9eai9gSF7YUDQJVHxs1FdrlzOQXF9xDYOddiVJJhsRewRhiSaqUmmrrfTOQs
         495/mrfZGnST4qgidQsowELebXMwsbY9g2xO4dm9uAsQAuYKEUrzf+x4k+/uh7cft54U
         Qzqw==
X-Gm-Message-State: AOJu0Yz2FDvYA8KqABU3UTIiaNXp2O2G3vGgFZ07NcTWegBtCytsXBbM
	d2HhMQ/wIADTJQDfFJRTj4mM9M9fo0gE3hUiIPP8bTF0rShfQhaLYGXq
X-Gm-Gg: ASbGnctYgoitczvEx0KxRD1Tn4gJmlL/+gV6/4ZhTcKD7WUuTYwf726lD/y1RB0VsCL
	+9JS+gQ+qTxyWTRdsW7afjkLXUVWVmqciuaK2kxHr1yg2Xh+yqni90G9z7RI7jR5tae2KptzlID
	NIyQdz433VAHT0LTpNDljY2ifty0UOIFebZBvNkv2siDVyl/Nk0HeDBSt5NLLnXKn9bf4fzxpt5
	BrYfZNSIIBrjE3wAwswtCvXj+bJzHWlxlNHkQq71E4Ehgc0/JlJfEYlv47Lj3+zeRW1n+7gKhWA
	HYgo9V/XTBxZUEhxwqpD2scmtLTtlCYHuj5MJfG+744Ms9RLPEgGJmIxu+txwVkBi6IWW/RQM2X
	iIU5y/5LV4PWpuXemkut+wlLlBXnpck2tbuEU2B38UNdNnmOCrTanqPjOuHuzaAv4ssWQeT3GH/
	KGjGe8Oto0
X-Google-Smtp-Source: AGHT+IGXHijtzVt4eJs2ZV02TN6C9aMKH+pvbvhPrJQNoOx9E+tCmvs9kL5J7Zm+EWTDt2YmA/iNKA==
X-Received: by 2002:a7b:cb87:0:b0:45c:a955:4578 with SMTP id 5b1f17b1804b1-45f211f7f55mr62938465e9.21.1757856040463;
        Sun, 14 Sep 2025 06:20:40 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm29595095e9.0.2025.09.14.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:20:40 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: pwm: samsung: add exynos8890 compatible
Date: Sun, 14 Sep 2025 16:20:33 +0300
Message-ID: <20250914132033.2622886-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos8890-pwm compatible string to binding document.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 17a2b927a..97acbdec3 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - samsung,exynos5433-pwm
               - samsung,exynos7-pwm
+              - samsung,exynos8890-pwm
               - samsung,exynosautov9-pwm
               - samsung,exynosautov920-pwm
               - tesla,fsd-pwm
-- 
2.43.0

