Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26351AF0B5
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Nov 2024 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714496; cv=none; b=EB/ik6KElx4onxx10snJetxyt8vHQAw4i4cH6rHqZNnU3WCwBqOfqmq7RmR1l2naYm1VCtOSw5+O0twT606EKq0R4nuiKMKJ6x6e/TfaP/08apDnv0mgBEslJzyZZ4vW7mX4lh/D4QeWlW9lmM5UcY3+JEBR8/Oxl9za3Smo9Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714496; c=relaxed/simple;
	bh=Zrm6drnbKRKxiZ6HaTfeQdUj3MvizoBOT6103YXttp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DUqVSgIND7hq/TYjqxkzzMZkxxHlRPwsH5Ii6Kra/c5ELZKoEp0ZnQW1q+I/3/KozxaSz3DxmbFHmCs+rnlgCFuM1x16+K0a1DibS5i0UseDnsIK8tqB31jn4MVihyL/As2cXacAa1QE38Bxi83sl+L8RSh1F0TfQ2W2SE4mtoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=rHLkj8xA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="rHLkj8xA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2110a622d76so30026425ad.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Nov 2024 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730714494; x=1731319294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uu/Hn4B1CLfNhyVjR/ZehwHt0szyrEKv0cT8lqo+PuA=;
        b=rHLkj8xA+05SpbFnj3N3igeR7q9pxHK1P6rKg3pQM2QOmVwSCpbwlukmq+zVch6aOC
         UL56GXy3AjIzG5wTbcmYrtyBkiSstwsNdCyFLV2uY/TvIPUn2QOl7nwd+/oMPFFs6/SN
         UCpdgArv95pi2deaeONPAuRDAdqEabIw5p4UxRNPG1uXi6t+58BtPAsDC9owv5BGVhEO
         f4Ns6De/5vJVRMZbA+CmDIdrRACzVMqTPwhykxFluPEeR64erU8zRxVMpaV/TIAxmUQ0
         R2MtVQottBxhKo0htRoFvYLTk4VssAzzd3tvx84Oi3vWY7v6t+uLyIfrslAY8a0hzHJr
         CgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714494; x=1731319294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uu/Hn4B1CLfNhyVjR/ZehwHt0szyrEKv0cT8lqo+PuA=;
        b=DU+h1BaiA0g7JjzGEMOXYI3GH3tBbc3oyTqmlOqcb0kA6nUqTqOtrjd3aTvFpcTv1O
         5poEXbQVJkg4J0i2Rc8I1b6j2G0z8YDiT7JIMwip8HqQ7otXbWeF6TQYZU1m9fgXjKAP
         398zEZtTWZfH9r9dPyruZLKu7FNZcEtuIZn4mpwaO7Pv8oi1SvtDleqpCXrNJDCSgM8p
         lS/+lNt/8/8AZR8dcEVjrkn6n+L8b8MF56XdNguX9mzg+KPaI8s2rRKkCK9aaCLTfdRy
         pApUxKpFzWhDATPH+wrGdlfv/Ja05RKHV8PAPgYv03BiwCl2J2f806QGMuOte5QP5aJ9
         XZGw==
X-Forwarded-Encrypted: i=1; AJvYcCU7740/Zo9+sUS20CoI6z1uyJx7xtMgrcdzJk5vzRaVGTqTDm+F1kMf/pgpbhnd5j/V5qzOocsTQ0YtwXJgKoEzZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2tcx6cm3Ajv6m6GkdsAEupJAnIMGknYO/7Dh6SWGJOhGB9xBn
	F7t7bXHCji1cuoUTyXsx2YJrVn4eQqutdBQzIk7qu5+900kWBl6855tRl6T5SEo=
X-Google-Smtp-Source: AGHT+IHgX7/J/LHam24dB2LrYlnkJ97J5eC7SoQThk8VahXxNPfsknOObvyGLWAwJi3aMDlk5RiHfA==
X-Received: by 2002:a17:903:230e:b0:20c:bf43:938e with SMTP id d9443c01a7336-210c68d3ee4mr460851495ad.15.1730714494225;
        Mon, 04 Nov 2024 02:01:34 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a5fe6sm57325185ad.149.2024.11.04.02.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:01:32 -0800 (PST)
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
Subject: [PATCH v2] media: platform: exynos4-is: Fix an OF node reference leak in fimc_md_is_isp_available
Date: Mon,  4 Nov 2024 19:01:19 +0900
Message-Id: <20241104100119.2173052-1-joe@pf.is.s.u-tokyo.ac.jp>
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
the returned device node, which causes an OF node reference leak. Fix it
by calling of_node_put() at the end of the variable scope.

Fixes: e781bbe3fecf ("[media] exynos4-is: Add fimc-is subdevs registration")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v2:
- Update the commit message.
- Change the name of the device node according to the naming convention.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index 786264cf79dc..a50e58ab7ef7 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -178,8 +178,9 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 #ifdef CONFIG_OF
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
-	node = of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return node ? of_device_is_available(node) : false;
+	struct device_node *child __free(device_node) =
+		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return child ? of_device_is_available(child) : false;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.34.1

