Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FE7346FB3
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311620; cv=none; b=RdxbugccrEd3XosyttUon0n9T4QtT3EwdbB7olCz/sqdhSRtY64y384aHXv4MJQ8IpZmNa/1A8WTVrJxuCeCm9PICRq6fwjjiwQOHTd8ql56G4fqHzuZuwNRAFv5u0pwuz+CsB+VNvj/iybgDHi2XvZ1SvEhxqXZosjHme8TiIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311620; c=relaxed/simple;
	bh=DwPp2HkWQO6qcGBPqXNMiD7gLL4HfMQuCnHnKBFbtEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHNLEuahNfQByrIK0lm4o9fCIfRcQXp7qPMZFpKADhKFOlxJvrBi8+Usju0b0+S2x5zVgE/xof2GWl17+EzTffMpVjaS43iiS0SBRVKVhCL5lftX/oFxfJ4ZmqR+holYMPk2r1sCHPrhi+RBoDIzBABSnV4r5hRKkLKZ3VZQvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIW+SEYp; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIW+SEYp"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-86309e1a213so1005532b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311618; x=1789916418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbLN5q31GQxj4DJ6F6WcgB1JNfvwxcLXSAMVbVPmGVE=;
        b=rIW+SEYprNJBHDGyJP2BhYP/2y3noGwTDDEQwPVEnHGUJ4nAmhbFxyOhuQIGEquM45
         mmtmAAkeSe3vf+FmJvDUglwZdRPXxaAnazv9e8mNe0/uip3p+tgc3kC5rKPdS+YxZBBl
         TZagPueOmQU7JXqsmSItiNA8d2wx1Mn77I2pwWQh5XMsoRSG8fLF93wKkjcatIQstpfm
         OHxO1uTgL8B+X9sn/BZjQPLfXArxvvN1FFOD7/tyc036VW7J6q//h+yfk3LMVnAm4ezQ
         s/OAKQ9OlCPn+lk5GXdRCx+ELIBO6Ejzhund2G9SmSN4pIZEWrCl7owDsFnSh2ZV52f9
         vGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311618; x=1789916418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbLN5q31GQxj4DJ6F6WcgB1JNfvwxcLXSAMVbVPmGVE=;
        b=qsiVgMoeRBKyIKWM3f48bLikC/+ADOXIGIPeTuEZmNVC1UDuMFkCODFtNk5+N1zU+S
         hs8/43IRgD/j1l4X1e+N8yi8bOvT6LzA3ZhsFEzZ9+KUHnPOJ/1811EUDC5xorPV9Xv6
         Ir47RH1P8yvkQPQ30ij5cXLJte/RnuDMA0UfC7mWu3Yl1GLyGETAXMr/q2fxPDmZsk+Q
         9Zp3S4KgKg8m0lepZsxo39q5vy5C+kRFMWDLcZt0lt9P5u7zsBBUa77fK+81rMKl84X3
         +LVGLm2nHCNGYS2mf9pabIQYX2rFO4o4BZoRuY//Aoi5aFhc9Hk3zsPk8bAG0R6ObkT+
         o/HA==
X-Forwarded-Encrypted: i=1; AKwUvBx/9P9tXKC3LIcuz+d+g4dgC5OHDZ/MHEXoWzhyO10CQZJRxUBTi+DqjjySOM3xGma3QtvLep4UedegibgVw5n1Dg==@vger.kernel.org
X-Gm-Message-State: AFuF++lun6vsIf1O0sCP4t8EPdenduXPLZOvHvnwc2OulwBNJs5fIgo0
	QerYQh4nTdc5SQN1XA79WAqK+/A0svukQMPIfk8HOEACDZc3+skbpFiU
X-Gm-Gg: AYBFou03beFrB0gk29f8Xd62rS71IWFuvy9ZCMSuMy6uNxxU14cPPOeYHEYgISIdhCZ
	/YAIN7OhHfMTQ+ARyAGZLfyOP8F150I2smQq5e6aHXR5mg4acy6YnxHs4gEgkLVsF1W5W8WpLjP
	qCQCC/+NHvBRxXCtgAXsilyrxmPJVk+5KzdKiSbgVpK7HmJFQJ8a1G7HrYU1qGBvnCS5M0GbnVv
	hPOTkg+BlXsT4InAwa79sSnj3OoPrCIRYEeNLRWE7dMHB1KRKGS5hI967HH5xexLq7dKN2RFnsG
	L24pqVtMRkoXSfpyBgP2PbNkO4yvzRc1+8QGPrBk+09byj4YwzvU5FibiSbpFK4yxT+fgpbQ3H4
	5p+RVYtJGAwrzRObPEJeBpYKzWeGv1/k3o0Q3BTHNF4tihpmflvBkjWNTssf3emWk8uhHzGSypm
	0YrbKFBrBJrvtD5oIjd0jgAh1FlpYRIszqEcIXn6tyriGQ0N7+Pd0OPoOe1itVRLGKAgqAqKird
	/F3Z7gUOMY=
X-Received: by 2002:a05:6a21:140a:b0:3d1:66cb:d49 with SMTP id adf61e73a8af0-3daed46b0e3mr24749980637.4.1789311615337;
        Sun, 13 Sep 2026 08:00:15 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.08.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:00:14 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 8/9] thermal/drivers/exynos: Add missing drvdata assignment in Exynos TMU probe
Date: Sun, 13 Sep 2026 20:28:36 +0530
Message-ID: <20260913145905.9404-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dev_set_drvdata(&pdev->dev, data) early in the probe function,
ensuring that the driver data is properly registered and accessible
throughout the lifecycle of the device.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 0e7b92035850..fe56a48be5fe 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1125,6 +1125,8 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dev_set_drvdata(&pdev->dev, data);
+
 	data->clk = devm_clk_get_prepared(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk),
-- 
2.55.0

