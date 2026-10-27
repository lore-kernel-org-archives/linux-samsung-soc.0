Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136611;
	b=PFAf9xJjkvXPovM0KHUr/3Jm40zEn1Oe+EfD39QcpAaD7w08Eiw9PFwQ6TEiW5uwOauq
	 IYLMhWf4MO5zZ5/UDqNx9tw5ri4HGsmk8XA1XUxrQlLB4hSZYUjEIffupJaPf9etUx2E7
	 ZNlIfvkmViD5nNlUef3+kmbuyicAZ6zlivUgoGgOu6hXWvsvyxg8BIRnMJ6Ex4G2IzSVd
	 Vc2hrGbPmXWZkPNjv927qKlMH+CVlodlruFMq9CUx3u9ndQV7B+F8bdVrXN7qtb77EfFo
	 chfaPwfc2z7eKFZIlKuJVmOw5gfZAJLNzeII27MPTRlMhnphxWlcCtFzkb8C30v/H3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=;
	b=Nzkn4e11QGN+TF6d9qWzSD0TuD4+tJx06DcNTdjJUvJhhBT16MNFNx7yL3PmfVaNJ3hA
	 0bFLMt7Wm+HMhtwhxMmKoc6xN2Zww0GlePN7HI58gl4Ia3mlJJucStnZiaDIu2Z4Yy987
	 lQG6Z2r+MT0uoVUSuCpK8WKeV1fINTWN1XjojyeB+j/lnfnKZ3gZFzpEl+q3+Ft3K9pfv
	 ABtecTF6uQJIZxVQg/6bVilh+UXeTyMC2eZJpIHQwFkNXgI1aHqSxIrsAY7aEOH/6fQ1T
	 jAtW5vuSeU7rsOXV0mDaYVZGr5U/ubcGQeACv7dl888dpQYwY0LS9+snNBhU4RWvfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keG5JBZl;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02C606A33A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 21:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E02C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keG5JBZl
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so427851c88.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136610; x=1793741410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=;
        b=keG5JBZl0nTGVltpuTatYIoi3qNoqZou5gb4907/eOMsOuNXtlXGuXtkF0QX9HmRXc
         CwTOyXMEUcUXj1YglbBixDpMchtPd5Ugqt7qKbqoeXmkIdVUiWTeewcsJO7e/q8VNSqO
         aX2DfjcxXju6aC/HViqwYKunrbVbpCAnNPpgEYfEY3UpSRPotskbSw01/j5RKuXeWFHi
         MtRoepAxL8nRAhRnW5E5RMUQ3AAGxyU+xbKDMjyfDmVHMqPk4/JFmmZLwKTDzi0vCB69
         5yE5Jb0D/+s0BZugDZsoNjJm9AZrihaqIYIL0m2YpFMTHPO0xrRdsc1Gj5/i7uuHeCed
         +92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136610; x=1793741410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=;
        b=XhW+bGPsj9Y2NRk5QFWvA6nkt1PgNm0nf99HfugDarRj8eE89xiEGG+JFUwjCfQ+2e
         8aGxRmhBJXMMb+mdXoqCxEfKoOFvImKw717jUeE/7E3dnydjZ5V8hKL5VFYrrtzqgCw4
         hFCpkDg94Kq5CeRmnBg7rS+p4+xbyUj13K8gCKDi45hAzrKRgyXbR02NlgprECNU9Wzx
         Gc6wCec7b9AyPRYGmVUzjFLzIG3TzMKew8rKTLr+RnvzY7btZdXB+UL83JTD2tXp7vXN
         9FkGlV8AzhGr4HFC4NmA080VGx15GbtC+wGafSU4ZzhJxd79Sr/cNe2MkqpMyezWy2q6
         M8Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxLdlMpLVoyY+DkbBzBW6+ipHdph+iqm0EzaseV3cmCqJy0iqFZy8VhDPIXhIyg3cnoTrq5KWUB6/mmF9Wa6NYswg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLHl1aWiRZhDksrGzVl0OLvw/huUxYfyl6YcuESbBOcJq/lqaPY
	pyH+9o+l5nhFF9zzB2wj2D2q7WEWsi22i3Ry6phoGqKj/WJq1jpxzthi
X-Gm-Gg: AYBFou1Yp7+0pRoL3OoQ2II9PgQMaibh9p8+iRpKsbXWDNAiU1J5UEzVQnnvoC1DKqB
	qTyYjFBLn2xotSxDQ4RJ5zkECOS920jDxWi+nD+AerzdYONbx/11bXe7qoGHNb/L2TrhYBsIEJq
	ks5mNQUXNOgXVT6IkVkkVFxZJKhh736gKIll4nyDOUpD23OsDYKL1nEGd4kl1sQZnV6q9W+H6TT
	rpArgNz1Lxq7r6mGy9rrQLfsX/6sQak260uzsBIijlISZQTLVPYEPMjgvioKOFnmFp2UlUDpK3G
	j+jfch725Ch+ico8qsAiz1BegfJtsOlH3julh3nF1rFLWgkpRwEiBLl8Ci9+7k1Hxs3h7gv2kQ+
	lZXZzwoY+vQ35p9CBEytRFWHtWiAd6PgwG6HQiaZmRPkpbuE1XMbmjfV/Dw0nrujYSZdHXmmR7U
	PeDfQgKrEv6zHmY/Il/XZxF7PnvusbxeRUka3d+f56uDaqFumbnnNp4BoQ+IY+ai1+W2QidhuEr
	YcJuWRq0mqJ6tAYZ0eVAB5JezWnOpYzSN1mimIRZGrBr4RO3tXkjh6V0OxXgIJswesuRMjJ5dKG
	8C8Z4ggCK6qtVVCjIaqnYt3s0pWLhM1LMNvV+F8+RNAaSzPcJ5wH9gn3Bvu66UKb8QaexOetDnL
	z1WBNo8SJ2mroQ8rBTQ==
X-Received: by 2002:a05:7022:3b8d:b0:144:c128:4c4b with SMTP id a92af1059eb24-1a6cfde6ed5mr616780c88.36.1793136610258;
        Tue, 27 Oct 2026 14:30:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:58 -0700
Subject: [PATCH 4/4] ARM: s3c: crag6410-module: configure wm0010 interrupt
 trigger type
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
Message-Id: <20261027-crag6410-module-swnode-v1-4-2f885799b6ad@gmail.com>
References: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
In-Reply-To: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The wm0010 driver currently defaults to IRQF_TRIGGER_FALLING when
pdata.irq_flags is unset. Unconditionally set the default trigger type
on S3C_EINT(4)'s irq_data to IRQ_TYPE_EDGE_FALLING in
wlf_gf_module_register() using irqd_set_trigger_type().

This configures the default trigger in board code in preparation for
updating wm0010 to rely on the pre-configured interrupt trigger and
dropping struct wm0010_pdata altogether.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 55f55e9b9a46..440f19d5c64f 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
+#include <linux/irq.h>
 #include <linux/spi/spi.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
@@ -463,6 +464,9 @@ static int __init wlf_gf_module_register(void)
 	if (!soc_is_s3c64xx())
 		return 0;
 
+	irqd_set_trigger_type(irq_get_irq_data(S3C_EINT(4)),
+			      IRQ_TYPE_EDGE_FALLING);
+
 	return i2c_add_driver(&wlf_gf_module_driver);
 }
 device_initcall(wlf_gf_module_register);

-- 
2.56.0.307.g5fe7bd680c-goog

