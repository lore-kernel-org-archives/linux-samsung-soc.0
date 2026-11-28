Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873910;
	b=QpYXNOmIpVgTa0Qo/GyARUz0OE8BsGQ5pNh3vVO0IRuNTRA+LuO3JSCBFw9tad4InsWP
	 xAq0KCcFt0I/2Fjb+H1IPVFEuo48uasEha/s6awZyhXzsP6OU8OWmXswgAIrwJmU5OpCU
	 ruCNla/v8fdbXl89T3LXPte+XYDSAwE3C+0CdCDerZcoMyKuFWKv0Ql8q4AInY+TsZdr9
	 Kj/MEAINNql++HuGfF+2pSamtxVWm2rftaovrUP6imawW2BPF/j/EFVGwA/BU0pc/alL8
	 7mfwOYoyLJVevUB5zjak56kG1QsPcfml0pq69hpnldtyRDQ1j0Zx5iimTZM9xFL1DIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873910;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=julNFQe4k6zvG3PDiUTDwkvcj7IM7hay3DWG4Qc4RWM=;
	b=qzQtVkUrJdZq1KTAcN5LByIrxrSUzu/ahbhIgzbpgBVzVY+4s2lPdDTBcj7AQRplyamM
	 fUG/UKLhbbLm/fuDwCuo8dxWjVWruk//t6V7RMGcqrN1CQI87iu+0s7Urm2hIk0qiN0nb
	 5l3MHm9KeO4BYCdJeazOwntTGvnRACvV1qOFwfUdNN+7H+ZVm0I6cbpiN8IsY9BYHiesL
	 Uqwewqw5HWlTTdJtXeqTq1a/aaSKomA1Blw+frf6kLLhMuDU2hjRlXoszwtWmeYWS4KsP
	 GbunP7/1BUU/IJdTqiqGRaDXAmNJ/MKCf1CgpzIOBV28lzvMTPj8m6kJJHrn3YzZlLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=JLb5pQ0K;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72C4606A33D;
	Sat, 28 Nov 2026 13:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72C4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=JLb5pQ0K
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jcBXY6B4kzMlp8;
	Sat, 28 Nov 2026 14:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=julNFQe4k6zvG3PDiUTDwkvcj7IM7hay3DWG4Qc4RWM=;
	b=JLb5pQ0KgTDWTyacj+VJc567xDZ/4PgQK+4aFxKIKKXcGmectB0Zdc8JL0Y6Fp8zekPjcu
	n7Np65f+pxIaiXoXtCtvhS5Z7pAHk9qY4u6LrHdhUXQdLQPnt8L3XxfbO0eppgSXxIUm4F
	JrZta/wXS7wITA/vrT1pqrdVhpmZkkEVStjSZMSyaGG5C0JNOz2fCzGPJFjO3ZPVEY9MWl
	Fm3DnOspQngpS3E5YEjiwf7YbNdvrYjgOLexJxRDB4f6tHmmyfHzRkIjGqCWqeZlfWcO73
	8fAquI0yLJItwe4PCKrb/V4kRx+I7SjLooAnlrtdpoQ3iIFCwGdMeNLMLphajA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:30 +0100
Subject: [PATCH v2 3/7] Input: s6sy761 - add reset GPIO support
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
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-3-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXY6B4kzMlp8

Some boards wire up the controller's reset line. Hold the controller
in reset while its supplies come up and release it 10 ms later, as the
vendor driver does, and assert it again on power down. The GPIO is
optional, so boards without it are unaffected.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 drivers/input/touchscreen/s6sy761_core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/touchscreen/s6sy761_core.c b/drivers/input/touchscreen/s6sy761_core.c
index 0e455060dbc0..c97e0091297d 100644
--- a/drivers/input/touchscreen/s6sy761_core.c
+++ b/drivers/input/touchscreen/s6sy761_core.c
@@ -7,6 +7,7 @@
 
 #include <linux/unaligned.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
@@ -100,6 +101,7 @@ struct s6sy761_data {
 	struct mutex xfer_lock;
 	int irq;
 	struct regulator_bulk_data regulators[2];
+	struct gpio_desc *reset_gpio;
 	struct input_dev *input;
 	struct touchscreen_properties prop;
 
@@ -297,6 +299,11 @@ static int s6sy761_power_on(struct s6sy761_data *sdata)
 	if (ret)
 		return ret;
 
+	if (sdata->reset_gpio != NULL) {
+		usleep_range(10000, 11000);
+		gpiod_set_value_cansleep(sdata->reset_gpio, 0);
+	}
+
 	msleep(140);
 
 	/* double check whether the touch is functional */
@@ -370,6 +377,7 @@ static void s6sy761_power_off(void *data)
 	struct s6sy761_data *sdata = data;
 
 	disable_irq(sdata->irq);
+	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
 						sdata->regulators);
 }
@@ -406,6 +414,12 @@ int s6sy761_probe(struct device *dev, const struct s6sy761_bus_ops *bus_ops, int
 	if (err)
 		return err;
 
+	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(sdata->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sdata->reset_gpio),
+				     "failed to get reset GPIO\n");
+
 	err = devm_add_action_or_reset(dev, s6sy761_power_off, sdata);
 	if (err)
 		return err;

-- 
2.56.1

