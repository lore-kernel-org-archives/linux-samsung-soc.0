Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F9848986D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Sep 2026 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524639; cv=none; b=XEKI6XFrqGKKoNlVmAJiVXX/hga+ECqzuM504stfc8AZfZdYKxpCH5Y8ixIQ3TjGDTHi5SX8ifrt89uq06rcVA2sxw5sdJGdvgf9n7d1Ac3jb6qvCmD2S0hRmchgNfTzWCtC40FgWfxaSRu0XImJtFjKXNusnuIBTjmaM4L8PdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524639; c=relaxed/simple;
	bh=poUlbWaja30lXHDUeBcKx00bBCGEmEtOhGzUkRYmC9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0romd5DsrIxwFRPiaBnv4CdvCBEwVIIRlLR4ugvboEfj5vJ643cK8uLksbNF04S/XzILVAZwTVrpV0m+Hv6w3R0LZaMrLx0M5NWj9gpvEltWWV97Za2LH5PGZZKjAlBuXPJVVrV0klZ06hSGcIkGX7jF2ncYGflTGSH7lETAd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCmzjsUh; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCmzjsUh"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f4e729368fso874034a34.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2026 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524637; x=1789129437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBQDJXUvrfsElnYU1sGgm0rYGUTrAevC7wR86kwakV4=;
        b=YCmzjsUhfZtgsLIqghQPD+ep++EHtwdMXoEl0il3TFZClIZSC7POHWzbLCtSqmyQw3
         lA6oWk/FDGKoEgOHp6/GK1T6y7BdDZKXCBP2jR74ASnydE2o/mJbMxh4qILq85Oni9qp
         obUTLY3dUiYjmPnEF2kT/jLIzH7cq/P04lgQlUCaORti/vzhsDBDEJ6OQ3Teh9rADjzC
         u2IsohweNDrvSFC0DEsR+QjddvEPLRZLS0ANrQeyRCQ2928llmT74ELXETKVShgviHOC
         KPPbo6B4PmfQCr2tI2YEg/84I5dgB2m2+o43Feh80nkKtLwBr+3+96CXgw4E6Yz50qdQ
         GuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524637; x=1789129437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBQDJXUvrfsElnYU1sGgm0rYGUTrAevC7wR86kwakV4=;
        b=ALvPgDUkEUvAbFoqFPtvj5dRnIHiOLomHyjJX+ZYDBTjRdYub8lZCEjUfG66wyQRl2
         z7EKfuQAcGkTHrYARmGREj0vsn5JT8k61uB2Wn8GyFHzG/GLboXVzcBpoY1kZLcpz48M
         PJzjXnXhULaNfcd0TLqm53JjHdtwJqUJlOj7VQTUeyE+AbMbaZJaajZ2L3+zyEjYY+QG
         sbzHc4SugYb4aIDBo5DJgoUqiN7gBcmLUFUTLSmUEMlDyK6WuGdSuxxzGbTDo+F6j0rb
         xN6KocBklAA67ilXrfKffh2mRoLvKPsSH+Mxca1C9/0DYXdB4kCvwKJkw30OudRPF6+i
         Xw8A==
X-Forwarded-Encrypted: i=1; AKwUvBxM4QXa4qzrEztigS0SToMxVInofIeWCqurlfXOr2dRsgpzEJbsJeCQvEwKxrwhGnfJnsFz3EMQGp1RTRH095dzdA==@vger.kernel.org
X-Gm-Message-State: AFuF++kJcyidoNiPiKv+bNyugGdtLpnGSphVUvwtS8ATZaPErJq4Tpwb
	QvMQUgRSTOzWmExy9/NLWgb3hn84zhsgyaXV0IlqQ9as2yDZVt4hgDy8
X-Gm-Gg: AYBFou3XKA5Tu/jw/6fuCb6morwcMBVa/ZITs/vEiKWdHHEImm45KFwrqzRnzWQuG4D
	NjqGNgJSyRnNfu/fTynYYwA1Zt64X+Jd6zFnKUvhZJ7W5IYW+7m7ltoHf/fKeOW48NXpyPxImqk
	OKTWvhBiyGU7vyPmhjYvLP99CTAiFcU4DCBTS26ucvYGv9CT1URupylISAj8nUrM2mWS+bQm3g5
	pXvaBILeEkafOxCG7Ve+P4jzG9QxX+M/BCeQHJtgIzmzm5UagMSDI//WKRMfTo5q37zFJ2Xdvy2
	6sTOIokcAGd8au9acTsie7JVO3ZTRhRMyrK5bpbazfabDmOWVJ1QnUbWeo3XH1OJqgNyk9cx9sy
	8qcxnfbQKgYeCscSX2WHPZxekNTf1Nc4tGwNPMAp/QFPZqxAjWNI2ciKwhF9heu+fT5/Yp9Ouk0
	o3p3ahQh0te80KZYdwNk2j5nlgLRBQ4UgQo5tiLc435uWbvHVO3K7SmHuxNlmegiTPDl02o9L0M
	Px4omb1gALr1QI=
X-Received: by 2002:a05:6820:162b:b0:6b6:8fb3:5841 with SMTP id 006d021491bc7-6b6fa4e05e7mr4184999eaf.6.1788524637290;
        Fri, 04 Sep 2026 05:23:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm6209359c88.0.2026.09.04.05.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:23:56 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] i2c: busses: fix typo "retreive" in comment
Date: Fri,  4 Sep 2026 17:53:41 +0530
Message-ID: <20260904122342.30456-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122342.30456-1-hemanth.selam@gmail.com>
References: <20260904122342.30456-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retreive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 15e14a6fe6dc..b52f09048055 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -968,7 +968,7 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
 
 #ifdef CONFIG_OF
 /*
- * Parse the device tree node and retreive the platform data.
+ * Parse the device tree node and retrieve the platform data.
  */
 static void
 s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
-- 
2.48.1

