Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971076;
	b=azn2Zky+MJWdBJlaUU0Un7Qo8/mBhXu0ZBDMOLkEwbHeTgTj52txVzIcXm7/lJpv0j+X
	 Odzi3XwmsVkEd5MIBwyAuZvhuiMVkuGBr6yTcalrDFC/bNryLWqaCNzzdGig3tgOQncgK
	 sSEjd12sUL3gZrMWvOgE1GI7eCJ6GdMMJi3MDy5n9AXLk87Tz8payi6o5C8Zij//cQA0K
	 FKdCY6QKJsEvGwpYI88Bjcl6T1iyoOLB4z0i4l02/OHNrdPnue2l0m2WzV+UcaOadXEFr
	 tplytrF9chDBBN3Qjcm9+dZJgX0CRqK+vdO97OsVY7rCs3N1JZbr0F8BaKlm9PKvccA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/3GymnNJZRM/VrW+qCnWfq8A57o4eHJ5rqxoxFgvC4=;
	b=oW/GlVZ5tL54gsGEvFd+FICfAgFBO1lqf7pbrSZo8YLt9VvLHNCbU9tbIra9eWyZlYMw
	 flcOywXHFKnSUWXZfK0J/H5Er7cYMcM1a3uBNIaUqsU5pNBYqJPHGiBBt6L2DKTlF7e4p
	 FcS1Rk12AK9EaZIN8NohHvQW+ZB59vVONcIidUTZB1BkjnfNv8QrIQLzF/PFN5bZX2iv+
	 RK7P9F55Xe/KrB9sA+azXHpSASta7pr/sDNkHbPYCEx/gKxKUutYMTkS3bgKZf8XHBcSX
	 qS2aTfnnFovJQjPPtkY7xYmT8B+gYL3T0G+j7s0MuCjbvNaqzXocOGzQqPxO+oeT/ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLKJBcOV;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45F606A329
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 13:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB45F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLKJBcOV
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so376966a91.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Nov 2026 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971075; x=1794575875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/3GymnNJZRM/VrW+qCnWfq8A57o4eHJ5rqxoxFgvC4=;
        b=pLKJBcOVib3l2IvbEA0fuRpzWS7HtxZFSOMT8uvd+t2Gig0EeaMFkEJrROdqrf8GbN
         5Ez2dbXsBKz5TLbIUdyiOMTgmoZpKlaH/qa/nZvmyhmbcn1bSziNwIEuJCqHZnZTqbgL
         LvKj+kaNFpY5qE4SL55AnobiEhBwfTy/p7h/2fGSbVC89y+BUqJ6WdLgXrjmrGW50xls
         i2CP/DdiZMlp+aAj28N2uAijrmnNKZPNvSe7guccM0MhNX+PZQtFMDtygIkuKxe99dRJ
         5s4MU7SqE8ZrcNwXi2dJK3bvXEQtZYjjoHWuglDx/cuhy8JmOIyBexYLILYcz9ylynaN
         iNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971075; x=1794575875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/3GymnNJZRM/VrW+qCnWfq8A57o4eHJ5rqxoxFgvC4=;
        b=0UxKIAx3pjVG48rU0rxc+Bmx+XIkme7L81HnE8Hep5SKg5pFYjzlHEsUYfbYfNj/f8
         AyWdkAZ8afAGLu5UFvXiQamAErUuU+yNnfudQFbvvjHH4Ua7+n3oR/hFw8e9hsntW5TP
         h61wtFJwEO9xgJ57ofci1OgCrjYyTwfy3+8B4+cwWnJ25iU9UROREjOkSs0uFO0anJvj
         GsBz1F8lHVEPLvEZcUUM5S4ZANu1Jr2QiRgnDV+InfgaKC6u2722ToEj0Q0D0jpiCUv2
         FwifS04UDKhngi9GQ2Yeybx1m/Vfg0BFFSEPXhBysrpeyKaB5M8c/876Db4pkISSN1bo
         XYww==
X-Forwarded-Encrypted: i=1; AL+hErEt9Aj3B2qM6yG8clppKicBxaooD0TW7D63nzYHH29V2hyGpo1GSWzMEI1RZaM8EgEeR6/aa4Y8RIFVgA33lDo7Dg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wd756Y+TyOvZ48DGG8aeIP1r90o4FiKFFhcqHMqNgCyrexh/P
	fscPg9CIuPV+7XDadzpGOZlkoOBTxzss2Lvqqo/RKyD1zsnUfwzRR3X1
X-Gm-Gg: AYBFou1znkPWWqLpkMNX4L8AUvI+uS1ny4I6AA9B2y5is1i5ug44ruOucQCNzOFixkH
	hKfUEL5ASl6r9hxzrY4hZhF8UigzctD6riFbM2TWEYuBfOIkGqXwNsTrzzk6nXwl5t7T405dJpY
	chi+vuagz+ZOCR2uJBR+g/y86EbSI5hrSrg7RCGfUAVdqIrYvtSaaCPUc6IKjy9NzHpgIjzg5sG
	6DIMjjoSe18c1+NNWmUPPdT0K5RzYisCfBtPYF4tiZv+MW4KxoCN81YwXmANoID54IHMja/O6aD
	PZIFelmGKi/XhDGgDS6+WAjmuwDLlvPkVVWJhFGo8P4OUhXAF7j5thjkyn0NAQfqLMmrwLVECgz
	VBEqRld4vIothFv3EfIdNZHh5sXNXy+d/G9rYVzPMgO7SXrpxPELErKWdJUoJY1vdo3zp4N0GgM
	8m4+dKlJ8sXy1Mo9XUlB40cu91bMJKvGRazQkHG+zedHg16v3Y/tKlgHypIeGnLEYLplNq32vxR
	sBCG7k00RMJl1ujMu6gHhTsMOsi4iMdMedMq1NajV3cXu0gZQ1V6XTaQ5vNo32fryMwh+tDF9GE
	IXamU2eRojc71dhYmBUIgU8ECBHU2WL8KIXafzV0qhcorubxhw==
X-Received: by 2002:a17:90b:4c41:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3b0db6fe1cemr2426041a91.46.1793971075070;
        Fri, 06 Nov 2026 05:17:55 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:17:54 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] extcon: intel-int3496: drain ID work before its GPIOs and extcon device are freed
Date: Fri,  6 Nov 2026 22:17:26 +0900
Message-ID: <20261106131730.2633139-2-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106131730.2633139-1-hj351016@gmail.com>
References: <20261106131730.2633139-1-hj351016@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

int3496_probe() registers the debounce work for device-managed
cancellation before it acquires any of the resources that the work
handler dereferences:

	devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
	...
	data->gpio_usb_id  = devm_gpiod_get(dev, "id", ...);
	data->gpio_vbus_en = devm_gpiod_get(dev, "vbus", ...);
	data->gpio_usb_mux = devm_gpiod_get(dev, "mux", ...);
	data->edev = devm_extcon_dev_allocate(dev, int3496_cable);
	devm_extcon_dev_register(dev, data->edev);
	devm_request_threaded_irq(dev, data->usb_id_irq, ...);

devres releases resources in reverse registration order, so on unbind
the extcon device and all three GPIO descriptors are released first and
the work is cancelled last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	gpiod_put(mux) / gpiod_put(vbus_en) / gpiod_put(usb_id)
	...
	cancel_delayed_work_sync(&data->work);		/* too late */

int3496_thread_isr() arms the work with mod_delayed_work() on every ID
pin edge, so a work instance can be pending or running at unbind. The
handler int3496_do_usb_id() dereferences data->gpio_usb_id
(gpiod_get_value_cansleep), data->gpio_usb_mux, data->gpio_vbus_en and
data->edev (extcon_set_state_sync) with no guard. If it runs in the
window after the GPIOs/extcon device have been released but before the
work is cancelled, it operates on freed resources -> use-after-free.

Register the work for cancellation after the GPIOs and extcon device
are acquired and registered (and before the IRQ, which arms it), so
devres (LIFO) frees the IRQ first, then cancels the work, and only then
releases the GPIOs and extcon device. devm_delayed_work_autocancel()
still performs INIT_DELAYED_WORK() before the work is first queued
(queue_delayed_work() below, and the IRQ handler, both run after it).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires an INT3496 ACPI USB-ID mux device).

Fixes: f94a5becabf4 ("extconn: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index 7d16d5b..40774fb 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -130,9 +130,6 @@ static int int3496_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data->dev = dev;
-	ret = devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
-	if (ret)
-		return ret;
 
 	data->gpio_usb_id =
 		devm_gpiod_get(dev, "id", GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
@@ -169,6 +166,10 @@ static int int3496_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, data->usb_id_irq,
 					NULL, int3496_thread_isr,
 					IRQF_SHARED | IRQF_ONESHOT |
