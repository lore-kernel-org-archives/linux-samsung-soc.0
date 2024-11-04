Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B318A6C4
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Nov 2024 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709944; cv=none; b=UcZVN85UOMRMh98o05J7MWIBUGg0CLpncwPr2PwMDvtKXp5efIaRhTeo3DRJb4tpwzsHExpBGFGPnD3pdSfc5Rtww332JtceerGLhiqUHVwKvsdX/jiEtIrGhgAlYV6MZ4yGeL00/FC46BnmD8WVnL2GiPuMBTevwdv8LSnRjm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709944; c=relaxed/simple;
	bh=UBEDZPdJjCTA4KZUpdfMW6fHq7esRaCALfSfkeB2IqE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lepM2B2Q7EvtUi+8Tfovo0avB2ckqmxYuFYL8DGcgNLmVIQxZ6LMaxyV5grU4qlObXI4rkGZkMIncBwLryIi0pp5AZnUG50+XfBwe168jG1dEP1wUTfcLdXBjKywQwqKsGEhaT+HJr2K5YjvQRMea/5WSNsK/oFSokw6C1U932w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=kPKsPlw6; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="kPKsPlw6"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-720e94d36c8so878640b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Nov 2024 00:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730709942; x=1731314742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XCdAosn0hUVlp01SX9nqFxjGER1OMRbiVfMoy6WTI0=;
        b=kPKsPlw6s3emFTt7daqR2gMHNqZNY7usC6mdG5v3dRZsdrI3PxpN85dhV1/xtES77m
         6uhw3A0EfNNxIaWiMcXZywSdhOutac2Ln0VEbYckQLTWxmfcYLIjuFnkdAaEcJtRP2/K
         1lcqBjy8iDG5z/hpBr/hsuuHE26YBDm4jRm7wO/Uz71RUARPwr0KGEEg8DD6yWxS0RHd
         rTMqaCTXqmo8QEOfjbYsA5lsOFHK4s9VH3MXXM8qRwcBC6FGlJTDCYVhLJpDhceYdx6s
         Y623C9FD7us36V+9F4IOlH/JeyT9PyefITNo/0A0Mokw9ZsZXOxPXoj252jv+jNb2Vrr
         ikhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709942; x=1731314742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XCdAosn0hUVlp01SX9nqFxjGER1OMRbiVfMoy6WTI0=;
        b=R2GZfldrZ6fOaulYf8vDYuYj/5eO1wOmM5Pb9aHU2cAubLaoXNilzgYszm/USOCxOh
         VwNPOZu4RSf7tqBYO+PCwWhpl1D7e2gq3WdyrrJScBb8IzZXKCciwME2PzDvGxzfwgtP
         REZplSFh7DTdCwxjC2Eh9wH3jF2I2NV2oe3HwDLCHSxGFj0/WDR8dUStf8hNJQTJd6sh
         U7wmqP9Ln4dBKrd9K342GZ38NhTqTKNN/Ljuyryn7edQ7YXjrRXlxM1oAEHMNhgxDbrO
         9Mw0lZ0Pnca2bTx1zMJUrAvZMCk4NP2WNWNg9lmjB7XP4DNBNiuXuWnWXdTH8NrEv+pX
         7aUw==
X-Forwarded-Encrypted: i=1; AJvYcCWwBJNLOB7hr+5P/Z47JirA39OzyVR2HbdDnRoVcIi3fLJBQREPfiV0+xgJOgKvSoo0ZzXmsmVHZ0unQH8aRcuyDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGiGwMdmA109j5tWb7y8TB3yTHizQqpCka4aWmrRDBkLO3Yn2
	sEpehA5nrATCrTYSVdD3QVaiHSf7FxDTYfW6buzrKtDhIWhqPrSvkJCiq6aWB21ag61qhOk4t0a
	nHF0=
X-Google-Smtp-Source: AGHT+IHiXWZPPcp0AxyUPDH1xp1GtNVDcbeVwmq+iICbvpxwIdCRDdmEYCJowpJtkGVtM0qkw9f9wQ==
X-Received: by 2002:a05:6a20:4f08:b0:1d3:418a:e42 with SMTP id adf61e73a8af0-1db94fabb1bmr19591908637.10.1730709942023;
        Mon, 04 Nov 2024 00:45:42 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459fdee2sm6541941a12.58.2024.11.04.00.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:45:40 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	andrzej.hajda@intel.com
Cc: linux-media@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] media: platform: exynos4-is: Fix memory leak in fimc_md_is_isp_available
Date: Mon,  4 Nov 2024 17:45:29 +0900
Message-Id: <20241104084529.2113302-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fimc_md_is_isp_available(), of_get_child_by_name() is called to check
if FIMC-IS is available. Current code does not decrement the refcount of
the returned device node, which causes memory leak. Fix the bug by
calling of_node_put() at the end of the variable scope.

Fixes: e781bbe3fecf ("[media] exynos4-is: Add fimc-is subdevs registration")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index 786264cf79dc..3bbcab9eed6b 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -178,8 +178,9 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 #ifdef CONFIG_OF
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
-	node = of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return node ? of_device_is_available(node) : false;
+	struct device_node *fimc_is __free(device_node) =
+		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return fimc_is ? of_device_is_available(fimc_is) : false;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.34.1

