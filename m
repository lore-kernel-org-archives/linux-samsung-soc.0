Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E961AC8BB;
	Thu, 26 Sep 2024 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727344077; cv=none; b=KUK3OTgSV0kLOuKZfpZUfiq+Shia3vyhJsAJ+YEQhFq3JWWlVIEChiZwvkAfx/4R/fP951ZAGHDmCQxBPmfqwiR4XQe6QBJOdtPuj6dg3+i5C/cvEu8nT6crkO2r55g2Hm5q9KnkCTV8oz6O/5yd9FSB83G8Z04vkunLHQdEPUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727344077; c=relaxed/simple;
	bh=+y5dIaEAV6sUyjaV2E2BF1doVtTB4Tk8i4VgnMDtrGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sNesNzNotqgVIU98likFRi3O2/8chBEvr2KDa7OaKWjh8jUcMTbHQ53Xq60aGr+yWfWy0bR2c1egjHeNsk/gDhS8IGDWDnz1N/AGCuO3CA0xj0S3OlRp27QBWO8NB8kRWVm+GrjtvL7STFPrzvxg/JZr8cESlVdDvpswXnHAKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZXPygB3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZXPygB3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-535dc4ec181so885628e87.3;
        Thu, 26 Sep 2024 02:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727344074; x=1727948874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDocX/tVZKzpPZS+CkRFcDMxBjoP9yU3G0DgObObyyM=;
        b=JZXPygB3uKhkN4GMtYZo3ZYCaLFnFXVUImrvW+OG1EFtcAoK1huavbGz87h/N9TwF2
         8poa0Pm35kVl8HfYLbAwDwVXcfGk7AjywsMWRQ4HgVB7RbXaRvyt9UxVd532NL1H7pvi
         ptocZU/B8Us6kFFu5z4Hs63bSvck+1FAMsK4ejx+v6ezsO/pM7CPlEH85gvASC+scHnm
         aR/anlTBXIMszJumQ67IpZP6EsEMdwKub2SLZ5RuuEs2Od1IJaVBrzMwh87XdnLyV7Rl
         bENvjR5TURuxti36x4ftNKA/aCeQdX9kKMSgjDPLxL936IpHwwQKt2+pQkOH0AYgDM8O
         MgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344074; x=1727948874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDocX/tVZKzpPZS+CkRFcDMxBjoP9yU3G0DgObObyyM=;
        b=bwLerJL6r7fcvJzaqiUBJb+lSGt1+tD0IM1QE451oIIBBj8xoAWeuYbzNV+Bsw/0oe
         QceM3GcgjGYKj7iRWrVOWKlHaIVWX4qGtII2wCd/LhZIxLxTrOnImL5aBY3+amkA2XyC
         tEYLGBCRalGFf90cEQjcoaxuOK++iWh1jOlGrrEmpW85KyNFGATStQ02pYbd/vDBAd6G
         tVO73MbrM/xdykJ/Spp4huLdGtFdAA4cSYA92XS7MA6QKydVa3jTj08t1rjaJQYhC8Px
         aDoy60myCSO69SxCeoaWLz14xO4I3g7WNN5anCdTInn6CWUO60uWV5NDePT/4Zn92APK
         DpDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYEbZqCAA9rlnVOJf7/nKfi2wai3R3d1giDmqwonIf6Clk/UoMEcAHTRlcShZCBJFpQkWhMBJd8idp@vger.kernel.org, AJvYcCX2ku6kMr2HIwNl0zXM0WY0gEGf6N/YS9zx86hNjdAnqTbVkxN684E4ZQ6qXAi9sRwDmn2PcF3kVgKLNU1hQ1SEOjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJ2e165O7nJs2x7agEvcr0t3Yaf31XLIn1qBwYyXFOc2YmXIT
	amZ82KHMJdYuvT7Rumu15VZTFj1ysVXwiEwW5tqegnHGX284TDNC
X-Google-Smtp-Source: AGHT+IFLac8oKPcjIKzN66vLATjMOcvWhvWIMVJxNVu1Bl1MqnCcQlu3Ie6U/g3N+xLKosf8tds8yA==
X-Received: by 2002:a05:6512:239a:b0:52f:df:db40 with SMTP id 2adb3069b0e04-53877566141mr3799681e87.56.1727344073350;
        Thu, 26 Sep 2024 02:47:53 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a8648a60sm750311e87.199.2024.09.26.02.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:47:52 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 12:47:31 +0300
Subject: [PATCH v5 2/3] mfd: sec-core: add s2dos05 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-starqltechn_integration_upstream-v5-2-ea1109029ba5@gmail.com>
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
In-Reply-To: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727344064; l=2079;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=+y5dIaEAV6sUyjaV2E2BF1doVtTB4Tk8i4VgnMDtrGQ=;
 b=9FI3Ue8VpjtURJG8/hNPG/Ureilw30Fr4AIqE8d/7GajkKeQLkcxnmxhMObcLN037hxdInUSA
 q+Hg4azkMZKAeZp5xSguqDuLnRFo+WuE+LA3QhPpUrL7ZFraMjW3X4A
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

S2DOS05 is a panel/touchscreen PMIC, often found in
Samsung phones. We define regulator sub-device for which driver will
be added in subsequent patch. The device also has ADC for power and
current measurements.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v5:
- fix commit description: S2DOS05 in capital letters
- fix commit description: only 1 sub device will be
  added in subsequent patches.
---
 drivers/mfd/sec-core.c           | 11 +++++++++++
 include/linux/mfd/samsung/core.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index a6b0d7300b2d..cdfe738e1d76 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -34,6 +34,10 @@ static const struct mfd_cell s5m8767_devs[] = {
 	},
 };
 
+static const struct mfd_cell s2dos05_devs[] = {
+	{ .name = "s2dos05-regulator", },
+};
+
 static const struct mfd_cell s2mps11_devs[] = {
 	{ .name = "s2mps11-regulator", },
 	{ .name = "s2mps14-rtc", },
@@ -83,6 +87,9 @@ static const struct of_device_id sec_dt_match[] = {
 	{
 		.compatible = "samsung,s5m8767-pmic",
 		.data = (void *)S5M8767X,
+	}, {
+		.compatible = "samsung,s2dos05",
+		.data = (void *)S2DOS05,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -339,6 +346,10 @@ static int sec_pmic_probe(struct i2c_client *i2c)
 		sec_devs = s5m8767_devs;
 		num_sec_devs = ARRAY_SIZE(s5m8767_devs);
 		break;
+	case S2DOS05:
+		sec_devs = s2dos05_devs;
+		num_sec_devs = ARRAY_SIZE(s2dos05_devs);
+		break;
 	case S2MPA01:
 		sec_devs = s2mpa01_devs;
 		num_sec_devs = ARRAY_SIZE(s2mpa01_devs);
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index a212b9f72bc9..750274d41fc0 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -37,6 +37,7 @@ struct gpio_desc;
 
 enum sec_device_type {
 	S5M8767X,
+	S2DOS05,
 	S2MPA01,
 	S2MPS11X,
 	S2MPS13X,

-- 
2.39.2

