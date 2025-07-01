Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC92741D3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370592; cv=none; b=FJRpFaxcYj1cmeJbf+xEfV2Csh1UW78UfBrXZmeJzE7GpWQyWVB0beIPO54oudoQi8L9RrHQYvHFvzYr/94BmAHVaIx68eirutLTYH5+GRGS8IxpxGCy55Jq7njNQWMRGhfkUZWorSXEj3+Npz+P+4Ao7Ms+Jyi2+1u1oFN2adk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370592; c=relaxed/simple;
	bh=/liGg8Z1FTCCY6VxUUiyw/vjJxQXpm//lBqgX9kP3dI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYWNbF/fupl7xwC+z7nhcYJP7ARev8Vg89pqp+Ys4fIZBV6mCSrXwQsNJzT2c40p6qjg8IOxXm/Sa/upZx4isrGifljiVTB/VwDk7hjRxNbpdPjDV4VX/YXCdRSvA6WdI8urhC/Z/ZdwnMS+k8wJ3Q5JKgr19jQHjoSwxLaE+S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FAt+xAG5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FAt+xAG5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4011844f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Jul 2025 04:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370588; x=1751975388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnET98UW3q4Lh5roGHBULYTY/QH8nhGQbEQwpvTzKlQ=;
        b=FAt+xAG52I+Eb40vF5gUQ9IEb2I0TMRUr7ORsEUTC4j0wZsyE0ki46Ve4fICZ7qraz
         UsT2GV+B/3Cr7C2NIhUhY5Fs7rrpi4seHAey6dD+j7sOkUxPDJT6xZXByf3a9UHsEdJe
         YicK5t4C9fIv/hnw5dsWRYi5Pguqmm6JYKuDnGVfbdDkV9/tg24/jZ+jh2/dye0ly/LM
         rdyVmyxfSW1w2CaUY4xbvjhsZDXNIFe/wHEtwYi1wOYesomk41am7uTJrITH7LUEla7i
         FY58qamCS0ABA2Iucmt0i3sI11my0Wr+WrVcbv/O5EyE+aralJJVWqh3fmXoLnBGBDMk
         o8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370588; x=1751975388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnET98UW3q4Lh5roGHBULYTY/QH8nhGQbEQwpvTzKlQ=;
        b=oBVoIMfjZ/0p2jEQBt2YVKrwEEaxHI0UBnJWKwpJhf+SCRDP7vDL46a1Or3p1SflJ5
         KOHcU2CTnUYw7Zml2CRUV3VdTfmYcWtWn/52TOofhzmqAYFZ0VGb+ldFDHOzNmFTkHk9
         tWTA8ZlNuPOt54glpUlojhYUqNlek/VPFnToeD1qJzgCBHDfOyuAs6Gq6UzAUx/trjz7
         dEoJ55I8Wx9co28vkyx6Pjwjy5omtbSQpaJ6njj5yiSCmqKi+1uBpgg+8sCkSd2EOEpn
         Fff+iGkW778++rNLfWH5a5IaoBCLtyR22Bdcz/U9v3JOc6IqhAGXanUKDOEPC16OAXbB
         vpBA==
X-Forwarded-Encrypted: i=1; AJvYcCX4G0Y3ehof+LZg2lSv6L/obSk+3bHmfw1I65TIOki0SyOglvkNLmekKczoEtM0/wwve/89wzEHsP6ncGGCRnbZ7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAZHI8gaSUMP6lKPsrtZnCUrBUqXwW7tgE/GGg0/FOKd92GQNB
	KipT6PiN/tVjzy+PlnzRtfLilNOBcs7KBDezueK4eKPzX5H1dYFRt4K0O9XuB2kFQ7Q=
X-Gm-Gg: ASbGncs6NScYadjoi4Rj455EFnxAR9SXqSApUZtwTUFgP1FozoHZUTRnKe3Vpf09LHG
	bH3kcRD75/Qq0MSBkl2dGq5UinzYVtjZgwIUZuZlaUrI9exc/J+KTdonoYnxBVjn1Ha8HbEFLN9
	kJOATSk5KkabmDU/MKzwJsQoBjoS+2KEmYzhGooU6y/x+hxVOftYxeXXsUaFOxGRDiqS4Jow+Zf
	Zw78ewan0iRsym1Y/Kk6LPMJEqzIwucekxeX5Sc/5g+AB/CkprMckM678NBujX9tYkbbzpBSpkq
	VtNUkKNysEHleGEthjcTHEGRPm4wO84fvoPYjVsNs7dzmKtyUTqicQ==
X-Google-Smtp-Source: AGHT+IGzD4Mf8syZLNv6toYxZEcYHBpzR51yBNAd8gDbc5ThQS0t22Hcfo27kXGUE7z0H6MDx9Amyg==
X-Received: by 2002:a05:6000:104e:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a917bc827cmr12012983f8f.44.1751370588497;
        Tue, 01 Jul 2025 04:49:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:36 +0200
Subject: [PATCH RFT v2 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-2-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GroFk8Q5FkhtN365brFZHyh2tlzBuOR036y6JYVpJP8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tXgR8SvDBadENlz3jrMIRT1uq7RXKh2WvYk
 h5qNXOpDVqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 coMTEADCnHYB6sIGGMnETNsvZvTMFWuIKl4hmd/MJvNwxPLxGSAQMY8Iv5AMkfa5y+vpFI1CCqY
 ItUhoMYuoZhgWZbuPp2Mp5n0k8rbZuR8xvlNRmRl1okJF5UfkBUZXNU++yE1OnFkKqdIqdjvCLe
 GjiCZ6d7Rlyj1eAiztikmz0X+a3otxj88gBbJ4Xce8xldqreAt9psxwTt5Csso2Ed7CBifFCkdF
 jggoFS43tmUKiEgQDX7QrMdUz2ZzWcEnScXzxXCybwChAwBm89CNC8nwDIdpkwv8SVpTXLjoDBI
 KMUo59dDIDM5JlVQG+hOvEGn0KwXwdOdUdIrxjC4jmOy9P1SZBQDpuQjGQ0KrkgWHodvsobzWsH
 gDboc9/lF+vhA6cb8JqlW8b7efovKfPdgzryvGHU1fDAuA67fx0uaP1uk03sMdjsfcXU4j1+6Q7
 4H5UPNqnJhXS2ZtONHUnMHHoFdOdp4IAIYgS/FnZ5pgZ6uCrwPYP8TizLs+7MfaBP+Nd9x1R97L
 oOZT8GX4x5AVOWvC0Ja4EZ1AhFD/ohEiCc3qE6lmHkvCWSrbW+5CJ0l34b9FpQ98tneqIecRGmp
 QaIdfjYq1PniianL9wOyXpiG1asjjQzvnapg1liCMla4LDxUDlrFW7xii6z+3tA1lg5iASR+GqA
 dHRw54sQZ++x2MA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
module, let's add support for getting the relevant values from generic
device properties. "label" is a semi-standardized property in some GPIO
drivers so let's go with it. There's no standard "base" property, so
let's use the name "gpio-mmio,base" to tie it to this driver
specifically. The number of GPIOs will be retrieved using
gpiochip_get_ngpios() so there's no need to look it up in the software
node.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3..f66137caa245b14e6e8dbd043243224bc47c9609 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -737,6 +737,9 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
 {
 	struct bgpio_pdata *pdata;
+	const char *label;
+	unsigned int base;
+	int ret;
 
 	if (!dev_fwnode(dev))
 		return NULL;
@@ -753,6 +756,18 @@ static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *fla
 	if (device_property_read_bool(dev, "no-output"))
 		*flags |= BGPIOF_NO_OUTPUT;
 
+	ret = device_property_read_string(dev, "label", &label);
+	if (!ret)
+		pdata->label = label;
+
+	/*
+	 * This property *must not* be used in device-tree sources, it's only
+	 * meant to be passed to the driver from board files and MFD core.
+	 */
+	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!ret && base <= INT_MAX)
+		pdata->base = base;
+
 	return pdata;
 }
 

-- 
2.48.1

