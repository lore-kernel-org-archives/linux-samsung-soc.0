Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87F2C158B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771169; cv=none; b=OO1kGvsa+L6VtvobH1sQNataA0In9T7cl46mFt5qU/kre9iqd1+RJ48sSYQnYk76Lp5TL+msQTl7kKC4QuLozAXUYy+Z6QDLRVAKJ2aUZsxJ87SNhxS7/TFuqByiWD4xWjxl122sIuXgzVabtaugHiHH16mjL7apG8COck5qUhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771169; c=relaxed/simple;
	bh=RY0c8fBXynewvdGV8o0rvkfKQ04xXx5tv1lKWTRku80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1Dz1TQ6eLR483EAY2v8i1mM89fWfQRhtoC85it6fR5O5LduEDWAXoM+s3q398WvbNjtd8xp0A+JXW89ccXQ0+rqTlNy3WA5CGFqUP5ELJPoFXZZB7ot4o8z2ALCGeLyv0Z51avyMwX1rw33ri5L6A7cR6WAzlWunZXFAUObyI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G6sPCliT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G6sPCliT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso424156f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771166; x=1751375966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd8kBKpFzE1gkS+2PaBdjUJKosglaITysg11GB8BGwg=;
        b=G6sPCliT8S57CfjE5Gm9+qItnfKqvtR0z6B1JfVJ8YWfwlPHXFbIGtudhGVi0TJQ3P
         SMIp6j+bGnaMngbFCXdw7BrctkyYkIg1aUKEvK3bn66mEWcaJSVjm5wlqywC/WrtzcnJ
         yASQf9VZ0Tf9xAGogJkjQD44zGBH5R2qVG7qDI3jkh5xQESYvtqe9MMzLkZurhPapyWq
         AYP7Wfr/KbscxWhNWJ2ntFHISsBRPEU/b/4xy+zRPY4+855H8MTqIEsglpfsspslEPeC
         Q030ZojbRVNDrUFlm4fdPXjcIaTHFCJKZ7DQExJtq88zchXkKrg81BAVAK0lRrqdN2oA
         s+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771166; x=1751375966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pd8kBKpFzE1gkS+2PaBdjUJKosglaITysg11GB8BGwg=;
        b=pVjCS/GBB/F0JEB+hjcQcA39EDPP/y973IfAmdLAlFK4Rr22U5KPmLZPie5h+vVdOU
         gxCvAFaZt4qkarJsM1bEet/8X0aqi8fcbB3sAHc670dIHAUcn5RzNWys+rCW1wdP85eS
         GXDq0UukDEjnDUlIxnKx3hDRQK0p1jMzh1sByxmK+ZHM7agjBr8lLigpvCSWZWmewpog
         NkTCceP2cgdzahwiLyAntxu5mPi1/VCaY936rB4uLQAiV0QIKCxhXeYrFJm6h11O3ikq
         mSggX0b5nAijtHkfsJnSRVRJ9AwwHViYA+dBQlQ53yJ38Eq8ORPFeeu3nYyS9rPKBAXm
         byIw==
X-Forwarded-Encrypted: i=1; AJvYcCWmya1O7ZKRXVnKLwqECy04EVII52YL0YHptLhYkSxSzCAn0ZUZfsJfae8bTKbGdIWtjeg8eMaqSFHCARwBzwBz4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKtTrol2ACBHoBKAcU0vAjqdldrLMohTdZ/atHCi4xFspMQh1N
	9jaKpd9R28SiZ9MGdDMwevC4b4fPLJhsoMaLy1WaUdLGQBk5r+Utr9hVQicpW94J9wo=
X-Gm-Gg: ASbGncthdab6CXonJ/vu5U4uupyJb01G2hcTvDaF09/j3nYMNqfo8Tj9bfGSasNPwm4
	t/vTA+BjAduY2JuDoI61LdpNq3+3hV9MLZn+L93Y/1tCGqi7pIBInOpd0RG2nADcgkUaUHJFO8m
	3+5B0vvlVc9s1hGJ+pe2pDe2ryB5+06j/8i0frPobYeR92uijqU/YKvPNte3MniEYD9zFG3O3tX
	UPYvH6ZqolRby3Z1FLObSjd/UKVcIzmulvHF0x39jm4hvnbmS6qEC0rcjjX/idBqXCWNJkiW6yf
	MGU+zNKX5C8QGTmaJdiHnNRbek26sUrkoR7Ls8ZUxmLiahd1qjOWtW87uxeT/7UgQw==
X-Google-Smtp-Source: AGHT+IE6Kv/SU+UWtBM7VJQczlIAMoJFCuFxK4Z5BzTohHnuGX8KwrkAv0aXxfyraOvsIUuEerAM8A==
X-Received: by 2002:a5d:5e8e:0:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3a6d12c2492mr12092009f8f.20.1750771166160;
        Tue, 24 Jun 2025 06:19:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:14 +0200
Subject: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3347;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Zivpm93wsUA9kJXUprjnSmisj2JfN4trpIukMCYvtOg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXsIcX49O3O0Vn7qIBdCdKUO4DSQym+RKCh
 2q7Wf2xdICJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cjKpEACamWQvhV5Ftf344+uLwE3eRxLALSIK12mth3MQwWxcNhD5+2Fog/n4/74bdZvd+wIugkI
 MPkGXKOFRazn94C155pgLL42HxmV9PQDqspEJb/vMcUCmLwRwjkg7JF53m4FVg4fw1oFeyQ8gCo
 BTaaNJtJoGr64Wa4hphvdie37PAHwUUiE2OuG8n0P1V3Ljy2lraqmOiGRDmRbyD7fb5G6De1Y0I
 f6QYIauiTXgLGtvfj4rTWmilcZhVqeX/vxE+6Z0fMqWZAJHhA33Q60Yw9yXx6M9OMBM3wlqp5Ai
 So6eClCTIDjrZEkbmyBjHKled6SogXnR5Pustqqof17csbbvSIQNI0GIv52rLjJYibYQ65QQzj1
 pGbsrN7/DdF+TZhDiMvCHXwfEhzVqMINiYYPoNY5m1XQJE2M0ePdqKOkgF8QMeax5mQBDd4f8CH
 7ebb4+GoYOOEiLUrd6fo9uuxxqdOr8x3244rvEgnl0SEEDfw5kAUD/CPWmO/n5qoyaEvwD1dAvo
 Q+4gH11IglIaHC9Icuto5MmtnPzkUG8d48bYxmaZlNWxVh+6UKn6K7L26RNcK2ES1WxJxsHIQl/
 1ACV2sR9s+iW2TSk9n/naUCaR5pzieOlQ9MI1XKZT3iQRdMjssC3cL0bXzvsNmcXFJ4H1CuiYYx
 2NApTH8Cqa311FQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace struct bgpio_pdata - that we plan to remove - with software
nodes containing properties encoding the same values thatr can now be
parsed by gpio-mmio.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index ef03d6cec9ff6927668d051ca459eb1d8ff7269e..fc2daffc4352cca763cefbf6e17bdd5242290198 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
 
@@ -37,22 +38,34 @@
 
 /* The sysreg block is just a random collection of various functions... */
 
-static struct bgpio_pdata vexpress_sysreg_sys_led_pdata = {
-	.label = "sys_led",
-	.base = -1,
-	.ngpio = 8,
+static const struct property_entry vexpress_sysreg_sys_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_led"),
+	PROPERTY_ENTRY_U32("ngpios", 8),
+	{ }
 };
 
-static struct bgpio_pdata vexpress_sysreg_sys_mci_pdata = {
-	.label = "sys_mci",
-	.base = -1,
-	.ngpio = 2,
+static const struct software_node vexpress_sysreg_sys_led_swnode = {
+	.properties = vexpress_sysreg_sys_led_props,
 };
 
-static struct bgpio_pdata vexpress_sysreg_sys_flash_pdata = {
-	.label = "sys_flash",
-	.base = -1,
-	.ngpio = 1,
+static const struct property_entry vexpress_sysreg_sys_mci_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_mci"),
+	PROPERTY_ENTRY_U32("ngpios", 2),
+	{ }
+};
+
+static const struct software_node vexpress_sysreg_sys_mci_swnode = {
+	.properties = vexpress_sysreg_sys_mci_props,
+};
+
+static const struct property_entry vexpress_sysreg_sys_flash_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_flash"),
+	PROPERTY_ENTRY_U32("ngpios", 1),
+	{ }
+};
+
+static const struct software_node vexpress_sysreg_sys_flash_swnode = {
+	.properties = vexpress_sysreg_sys_flash_props,
 };
 
 static struct mfd_cell vexpress_sysreg_cells[] = {
@@ -61,22 +74,19 @@ static struct mfd_cell vexpress_sysreg_cells[] = {
 		.of_compatible = "arm,vexpress-sysreg,sys_led",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_LED, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_led_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_led_pdata),
+		.swnode = &vexpress_sysreg_sys_led_swnode,
 	}, {
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_mci",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_MCI, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_mci_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_mci_pdata),
+		.swnode = &vexpress_sysreg_sys_mci_swnode,
 	}, {
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_flash",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_FLASH, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_flash_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_flash_pdata),
+		.swnode = &vexpress_sysreg_sys_flash_swnode,
 	}, {
 		.name = "vexpress-syscfg",
 		.num_resources = 1,

-- 
2.48.1

