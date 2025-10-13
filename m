Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351326738C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364900; cv=none; b=p5G0R9AgJyJaTHv8KopSAsg6JdqDcnp7DDcziAQA4mWZmZDiUq+X9UzmROaeEd/zJm9jUc6bqR4A/czn3hAJzAvI7x5NlQe2S6DSqs1Yk43iugCkg2rn5soIDEJ+oo9eFnjd3Z85N5v9gqz1SW5QFMbyczSRYcZtxLI0eUE9OSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364900; c=relaxed/simple;
	bh=EWbKp6zVXKla0AyI4Ib0EFYpCMHe2Dydv7j+omIlI14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXE63WmTGOyJsosstdkpZlnDBPTTTv+ZoJszK50nggEJVaom3U6nPQIM515uVP+H2fa89KD1Sj+bMeJgF8+d+baH6NZTYL8pL56hLRl1edxlNpV0RsjOm2MjrYttf+oYu6abAUViEIA3gzv/32veo4Ele1Mn82977IZ/Aw7VH9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EcCgmV32; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EcCgmV32"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59054fc6a45so1057015e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364892; x=1760969692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDkvCYuJbKI5HTEwyE65VkdYWfgRYyc1U+blXUUQVgU=;
        b=EcCgmV32a0HZiXFDs48CmHwrDNUra3ZYW+Wy+oy/Ht6eVil+Ec7Zv9cYLEC7SJv8qJ
         KBkiBXHRv+q2REcjasnsufbfhFeNofaCaBBDW0Bz88I4hUS4OHj7oV79TNdL9TyDv/e0
         c38ZPmus3+8/WQGqx3zZAj1FGQbEZZdxpfzoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364892; x=1760969692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDkvCYuJbKI5HTEwyE65VkdYWfgRYyc1U+blXUUQVgU=;
        b=lNJJr31M+vTsVVrfFUHTcsGBhHIWX/6abWJfbh4uRHyBtwOuziqPouQrXg6hrXiMPd
         qswIn22iiW4G/Ck1jB0sMoWfvanb14oWLe0aPq6YKfdBx1B6isV4lfOssu2bj5MDTiTC
         bPxy3B3EigAInxs0XpG88dddwf+1LOoFoWvFvFFQiu4/I7Z1+08otFTUt0EHFzpf+cqW
         AMQAQ61U8uF/UJ/i1T4oVHyfWvkXUsODGC/n4PSib5VzYBNxKqDgcxW1T+ppG094aHor
         XAoziECaxogkLum5Sa8iHR/F4ETGQea2K5sW6ECehJXoNSwV7pwT8CF2NFYEdEnF1KMe
         QRbA==
X-Forwarded-Encrypted: i=1; AJvYcCX2XAdnPEWJJz8wUi9JXhujbhwhTrHxXH1BtuarheFilNcbKXr3kXPyPuN/dJY2VPcGjwWA6kauO6bdc62fGPKefA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtLkZh6/pRseXW3PbClvHcj8hbZNrCtQV4fGmM2v7vF/obRFlI
	Loq0jcU9mxFhcIqhgoVqXppdrJk6uANqvQYBlVWl6taiQ1n9qweFIza4PlwsVsEuxw==
X-Gm-Gg: ASbGncu3UaXvR4EONQUOsnnH+JcXnmJQlj/cohD9PspD5mlWunt0QCQsT1O+749eg2B
	/YtFl5WDT0yQRNC4W414J3n4jAm2ZqNMVZbF6pMP7otrIJjEHks6HwP4oj1YZS9z+SccP6d5JJR
	3uzhwiQldrBw2wztEGR+Coq2ZfsEqGosSmwprBrUh1T9G/Q99d0vSw0QyfEry+Uej6sU94loQbo
	ocanTfp3JbfaA5jIsOl8LswIdRcHDn5JX7c9Utkygoam3VYftpnAsU37m4f1xwm0qna7oi5qMYa
	uwTddUqHFz0kevozR7TWYbZVbetP+WpUBOVYD+OLWsmKue1X6SAqFV5AfsAfHQZsxU74vwgJn2E
	rLlMDoHjC8RJpw9mGyLifI9oWMUyk5mM88ng9aMWWfPblj0lnMGS0a8FONoHMF4DuN4/bCa8KBB
	/qeihawdg8QqFQu+9tUA==
X-Google-Smtp-Source: AGHT+IERp0UGzsms3m0FKqLtDNsdKrYzy/yeu64vwUTfcVOJBQFfqT4aKP9avdaubkT+3l9KavisJQ==
X-Received: by 2002:a05:6512:6192:b0:579:f4b3:bc3c with SMTP id 2adb3069b0e04-5906de86e2fmr5500248e87.55.1760364892337;
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:44 +0000
Subject: [PATCH 04/32] media: adv7842: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-4-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR()

This patch fixes this cocci report:
./i2c/adv7842.c:3470:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7842.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 9780082db8415a3d65860666d0dce8399f57e4e3..a35077178a0950090369e17b4aaf9904da041a00 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3466,8 +3466,8 @@ static struct i2c_client *adv7842_dummy_client(struct v4l2_subdev *sd, const cha
 
 	cp = i2c_new_dummy_device(client->adapter, io_read(sd, io_reg) >> 1);
 	if (IS_ERR(cp)) {
-		v4l2_err(sd, "register %s on i2c addr 0x%x failed with %ld\n",
-			 desc, addr, PTR_ERR(cp));
+		v4l2_err(sd, "register %s on i2c addr 0x%x failed with %pe\n",
+			 desc, addr, cp);
 		cp = NULL;
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

