Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330DE32E139
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603723; cv=none; b=fa9rZnl/iZsHlbrpgxl856kCjvq/rjAWctyEIoGHQBzcCHUX0T6sb/7KZKkFLD9rkVEB4oINfoxhO3pVitFCilGribG+cKEROLc60fNYwAWTB5acd5coPhv82qrzf8MZExMr7aWnzr5I7tFB4/fCNRTMLArRUbBNyPuFii5UhyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603723; c=relaxed/simple;
	bh=gdA0sZvZ0YzUA5VbllhyP/LA1RBGbn5sCuJW2ofmkv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQhWF/Fcoog9tv1R/RGe9EAQUTjWcUkHzK6CKKcy/0zRUuUzYluoD9g10LcWOx6AWhaBRDvVyiNKfrG16RVHWKPnFQVmegPFdeeVdgVNdtELEI1OXusaj/H9iwmYGbkW7ciXSLPteHkrYGTT1ZGXgJ6q+ujPo94YDlcL3VAZy4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfpL1WuY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfpL1WuY"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7277324054so2266558266b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603712; x=1768208512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdm4unydgK85s5YLaStWETQ4AILRmGjAlJ/lhyhIAds=;
        b=dfpL1WuY0jAcr/AfgQScMKsRnyEZvVotB4yzFf1kMJrEcoliiu6bpT4MYXcz9u1XHO
         VssTyQKnI3vJefNQI9P3KIaIyM7FfrCejcuNBfGmuOLYZ39Cb8r1Skml+55IrOlpTs/c
         0K93viX0pjYkp0JO+2eTdDc96NZ/cVLYf8RCKTML8YE19ag2mVH+IzvG+Mjre66YV7NT
         7F8f43ttC9ETjO9uhJx3c98/+n0UONOutbmuS0dwnogX7FiLBx4wbWdKmQfyAw9KdtMu
         RO/ktw2oTr8SZoJx6GCpSbjIp4kaPH6MelY8NRqwcFeSuVJIFElk5wXH4bSvbZbTubdl
         adGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603712; x=1768208512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bdm4unydgK85s5YLaStWETQ4AILRmGjAlJ/lhyhIAds=;
        b=FBoLT+IKHSN58oOwc4bAQ7TmlIzHngsGJqoo7Z4fDzAa5sQ7jUGngLB2nZ+QSJr3VG
         Pwrvt/jNwaxD4CPHT4SCpmReR1mYqXpIooBLmdYB+dgEJ871h5nmUwGtu3FGPB8gu5tm
         HxVID3wBbZ7GTYyOxxZwcg8MpqxAF7SkYIy8A//A7DK+QKZUzxJfY2QWHm0xe5ZlJDHs
         hSejoGOh+u9YViaG1PELpcXBk/XP53QzcRpFkCT191V5ghtRbu4psiZkJM8bWy0aVcYg
         y7svUctFwh81eXpAOcBlMKZTOSl9J3MabLHMSMP3h0sz4Yt9/JzRAbtIUWClVw8vbJhI
         34aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNh67pek2I0fuHOpH6WoQ+uVSaYMp3lq8tehDxjCveHT5wiyi1cL63EZQa7ET3GK2EdOvPWkX/rO2GOr14k9Dhew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjbY01DAqZdERQcVro5zAPrIDE1IaOz29faEP813o0cjEYoGm
	B9WieNfiY9E82bPbTc4wlNTsDbErHyxRnrVUGtCSBDC1YHkL1y4kOlfdMFVWmCSdP8o=
X-Gm-Gg: AY/fxX6cfZ9pGCHGsApCE31slJWOA/VfbzB5pmZ95lEvpbVYRjm9TLh2eNBW4Q3T0cG
	Bzyk26cVdk1RmN/1QgMeFKEQGJrvDZa2Ip/YWEyY/wGSd/nGKG5rAP1BmsbYIHdInCAkHFYAeVu
	egD88KkXevUa9TXM4J5cuG1Or6mndw4J5/oS9n9tCcW3MTKG5NU4FFLWiJ6aiGbJPBT0lRnDMLE
	IVfAtEamyAhthUVir387NybE2AcgvVyWf9S5Wn+QBR5rGqwaD6NcE6ta/WLtPgG/B9Y+OMuUkuH
	eJYVt5UvNCyoqjVUp8p/d8o/UFgx0K+Jhbw6q1tCKhMVdcwCLtJZ2AxKQOfH6iDHmIIwX3XWW6B
	37QHODcCjcRKkFcyK1fS/+9znkCaBNZrV10zacEwqJmaR2nVW/hqGQOcEp5hfe5PQ6MnmZQ8hAr
	mAGz7frm9gToSygd1VtdQF8FERRJm+e80r+MBaGnyMQRKhuWSrVJe2qa3Jb+FlP4bBrd4zetD1M
	7/z/w==
X-Google-Smtp-Source: AGHT+IGpEAwTdgiIFqYVLwZr5Dshta5wUiaNkwk7GiDRbOtmpc5D7uh2c6qY0I7WpfIMYQ7/WqMhpQ==
X-Received: by 2002:a17:907:847:b0:b83:c81a:197e with SMTP id a640c23a62f3a-b83c81a199fmr1121260466b.24.1767603711921;
        Mon, 05 Jan 2026 01:01:51 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:51 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:56 +0000
Subject: [PATCH v6 20/20] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-20-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 4a9d70947f17cb7520e0e820d3d1b9eb370ff600..2d5510acd0780ab6f9296c48ddcde5efe15ff488 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -362,7 +362,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.52.0.351.gbe84eed79e-goog

