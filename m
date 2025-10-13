Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FDE2749ED
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364898; cv=none; b=JKmLFNcNEUJsWxLQN8jseH/cqxS1HMR+nPvwxuHgI35G+Bx5i1BizYSEt+zr0d34fwmnvrIZ657wuQ6qSlhFsFB0MdXIJ6A0XrWoUa8b4bI9xKToBCto6anELlN+l0l2ldVhrp6l5J1c23jsNBbB1BjbzUsWhYy/eet0D0qGwUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364898; c=relaxed/simple;
	bh=LrtS/QWSh262AIfz0Rm9zWkyxkdrbmKWBb/AyfTa1hs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJ8qU1/OPFHg/81TcrK3390+KPBhpKlvIaHZOdZ0I/lslVtDPVsvhlyPzq3sbjRJVHNIrtzceYpVGg8YNHvl1RCAUN5U8ZOtNSEtH9gTtTgTFBX3/5ramn0VJ5SiYEvD/Lax1XkFn4vvjUYkdCDihS67y8vY+sWkPwc7TUlREEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SuAki+bU; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SuAki+bU"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57e03279bfeso5318036e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364893; x=1760969693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ytl5LFG4k2lvKI1fHaoSkPXZntuyxjUYygC+V2GNf2w=;
        b=SuAki+bU1+sqx91zjRb8n0EEi+aIjyMjLemVQFqsrIJpCHciqG21hNvV8WEtkcKM+o
         vHvQC2hJ540h5mhQpavdS0PHWmnynxTuPOf15tH8Y2KhQVesWzck+u5y+6Q4YKaQ6BiE
         zbeixceW/BlfyD6aRiAVkeWSPbm7E32Fw4zlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364893; x=1760969693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ytl5LFG4k2lvKI1fHaoSkPXZntuyxjUYygC+V2GNf2w=;
        b=BXYRzBI0AM3+sq+xTBx4dD9ad97f5kacH/xKe5hIvlLc5g1mcwzyHL/PUYyq1sQZIg
         dTVEb+OGo1j7TCMERYJkth/DlCx6hG7Hhg+4dxIzqvhHZL1UkIPl/NnF8lS5OrJWwv07
         +I5IdnLihmjoO2bsRZ1hlwNLb1fSoEC5b7OdoIGXgFGbDuSgw0fH0F4aGabDWx8FGJ7D
         jMT8KyAGLWklv3bFcyn86+AWfH3IVBJZhlb+XsKvaJsAnxNQz9aLuMRizWTqNUjN/8cK
         JGM2zXe9oucdv+/IpnVpKljf48flkvYmXykHs00KGRn05eqU5uEPvfxL2czFpDJUkcCF
         CJgA==
X-Forwarded-Encrypted: i=1; AJvYcCXP9kc0+IGLwHOQ29v/B8+t9URkXEndo1LotdtCNuy3nL5eY0HzZ2AGQ5c/FcUxvuaMv1DBkhW3Z6Vm8PS7woRkWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUSoPmpTIfJ97Ohk7htCfEIRqrJXbuGt17O7fUIOMk9WLCd8Eq
	YfIYedPvNVbn9hvT0qARiYKm+Z9gl9v00ZjNpQNiF7jbcUfqOIsxPi/oQglqbg85Fg==
X-Gm-Gg: ASbGnctEOCbBjNBnD7tFH3uT9UBHeVP2AJeDt8SIxujXVObvja9V8cqlyCuyiiaz4Hk
	I70q3yowj0GbFedQVRa3Mi5KVBetO/4La8nwiqNnI7uJ3/KTVbbC0sQYf0eTOcVBvlszpTLR6gq
	BL+gKmw1VnoFJficXtZgLUfNnZ8rntvDRxFjhqlOqkwHovcZj3bu/Olx/kv4Ei3jdlFkdlTNtML
	yW+kBxyni85Hhg4xivCSgGvNt85+xVu3qhGilQb6vTnRwnOO/XRFR2IO0awSU1s7mgncCdUgDzW
	Kadc2lPNDXl+xpfGAm67UBajx3jer95IUZ1qrCUelNgRtggBhJhjw7E8X/JnTsVsgS9ydh5q7eU
	uEGUhV5FTAJLAD+XmaALK95+n4UxxKqHPaAInHmUGnLGojsaFqy2WOuAmPHdcI5ZklHWwksEEI2
	h8JfAtx+PXfgdtAqdU6QaYbKjDeAFp
X-Google-Smtp-Source: AGHT+IGVVbL5/vtkpaQMJQh0k7ML+5P3f5T7fpLYmv9ZzC8x6SpLBLD8o5pL52MoM0M8VLfq2lDuFQ==
X-Received: by 2002:a05:6512:3d09:b0:571:75c8:43a5 with SMTP id 2adb3069b0e04-5905e1d36demr7120769e87.1.1760364892853;
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:45 +0000
Subject: [PATCH 05/32] media: ar0521: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-5-2c5efbd82952@chromium.org>
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
./i2c/ar0521.c:1113:31-38: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ar0521.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 939bf590d4b2107c6669b83903028744de1c2b30..f156058500e3dce5d7b5b831bf8ec4056e49ad5b 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1109,8 +1109,8 @@ static int ar0521_probe(struct i2c_client *client)
 						ar0521_supply_names[cnt]);
 
 		if (IS_ERR(supply)) {
-			dev_info(dev, "no %s regulator found: %li\n",
-				 ar0521_supply_names[cnt], PTR_ERR(supply));
+			dev_info(dev, "no %s regulator found: %pe\n",
+				 ar0521_supply_names[cnt], supply);
 			return PTR_ERR(supply);
 		}
 		sensor->supplies[cnt] = supply;

-- 
2.51.0.760.g7b8bcc2412-goog

