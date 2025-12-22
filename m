Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45348331225
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421038; cv=none; b=oi4a/irsVvcwAdf0Abds7sHXKAIELWexlakylulbGPivCfs6OXq9WBPPQodgrOiLKPuUH3Pg7fsx5fQ1dY8DckpGd1g/SlBMsK1LvhUN1JDtmOVqfF37BpRhmaVbiMy1NkjugoN0EL8DKBodHCVD5y3vSBBM6sZ70U9uNbBhpa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421038; c=relaxed/simple;
	bh=mA3bEVEGzR9311lzIXbM9ZlcwGq5dWk+rNJx03paffE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUUXWiteJo6CdzG3HI78OqKmp59qxdiLvRyAYRjyB4GbwkL97NK4Nj8W/jY6GLzzFqqziYkzf8t6OEEEXQe9K2h/rBC1d4oNFJrSBTfnk5wyWeEAX/GFQZF0a9FIk9mrY16v1hpt/hfIv5/h3Mj9l673NkFXLKlkjbh/4J+eqZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wW5oDdjj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wW5oDdjj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso27653825e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421034; x=1767025834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQLcAW3D2Pl+HMLn2UT+UCDz/+sYmn/YWfptB8decEw=;
        b=wW5oDdjjiBylmeGuFMOQWgCs9OsIAXvlQjCcbEk54cfbD1ejSw8mT7liIWW9fwdtyC
         EiG83LekU0aPUIqZ46Ds5ivcoSBF5D6HqUwbms6k963LLn99HZzEO1m0hbQfeJIs1JJ2
         Gp8qcRCdfUsaFN50rNEbpl+m8QLRZQjY7Ua3pQYUxhu4NHcgdVuRHyU7piXra9EDJwuO
         gPoVvz2Mmi6G9Yelu034HhFD3XIoNCs5MSdyVykQebKxZ8F2ZinZF9OzftoVn8i2gP65
         lBFOz/zowXcjH9ym7zlpccEwA5xv2FSpl4iTup2Cbq98SNvswt2LJeFrwWCBjDguYok9
         babg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421034; x=1767025834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQLcAW3D2Pl+HMLn2UT+UCDz/+sYmn/YWfptB8decEw=;
        b=BElzx21SNgAS4x/iikUMPmRsRmwKIjyBNsr2vKnxZIrhyw9rJdkXYM9sAWu1IO4zVH
         qa39ZS+g6trAV2nsbwM5ie6O8FhZaEfAl3KDw18wKnRw51azub9qt2jVW38N4lyQewSj
         WU5ekayQskPbR+DsRPDk/aw6E4V+6kVL/WUdyNk6S0UpuFxIvBw44wagqe+QxLO4wYGN
         I02mdd51Ou+6IdVl1oC4GngQljnN8RAd9BWCOEsCqe7UEOYa31gaYeWu4L5oXDivX7Au
         8jtI+N3mpR7qyHRAFA5GzQoY7a5OxbjYa3EZepR/4ujN/BfwXnuF7tx2i06I3T5MvZsk
         oERQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbZ5fRVsTUhntviyA4W1fIOraZZI4JLUP1TtM7HxrKSJxYJ9j6/bmlMPL0dTHwCm1oLTMC5469bgapIYd+/4M8GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxnWHaDMK6TGQDleumb/KjyxOCOJohrV6mFgOhv2scCp/gfNRM
	eOQbQ4SqinNetTYPzZsxF9mKQqNdRV+GuZNjST/E2bPbBEGEPf+CSTgb3CTWruFpPWY=
X-Gm-Gg: AY/fxX7fbNq4M4P1TNx4f45bOt8vxW3HpGBR+P7+hByYI3TeXaczb8Ea3ZAp6ogtj1T
	sOJc+wMTPZzAiSWA14cgaLeYweUm19A8WPezkzk7gC4Yof9gcnmWXCJ9pCuXYKZsm/6JziV8hAZ
	XdDWmY495BGk52LC9owvnnO38gw7W3+ADxWrNTN05FKT+Z9vJjCDLDrG2NB22CSJXhCucU1TCy7
	WV/2jaczQ9byHf7NN5lY8GjbLm8b4yYq8Fr1yksyHoYLyoB+p25Xeg2CJTgxgTNX+jzhosupQgh
	scsUxbcGCQVyarm9NVGa5GTjqDV4ih86VlOP3gdVZTpIDgui7NmBkT7MhGBKbCYQrbyZCvdvd47
	AG5aQkheP28qTx2hgKvUrkoB7Nskiv+8BffZXW3EppZwyQa+qbfEQIeZkta/YAQJzJcQTXiZufz
	woyxO3oHf53aq8oYOwcuEuFX4nJ6c8TIg73262uwqoDAwZnLP08bj3NTo7Cel0bvNS
X-Google-Smtp-Source: AGHT+IEeeGdexdjgsFvULlja6N3RSPsn/5O1yANNDtE7dG770/+tSXgL411WaHfHcQRCeiljSozLIg==
X-Received: by 2002:a05:600c:470e:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-47d1954778dmr112796935e9.14.1766421034505;
        Mon, 22 Dec 2025 08:30:34 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:34 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:06 +0000
Subject: [PATCH v4 2/5] soc: samsung: exynos-chipid: rename method
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gs101-chipid-v4-2-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=1400;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=mA3bEVEGzR9311lzIXbM9ZlcwGq5dWk+rNJx03paffE=;
 b=9DT1m4KO0p/kJ7bAFDLOVuYZey7dZtu3ttSsg9WmvxKqB5+1VqyH7CXF1OZsCc5WVsy9YXSg+
 lE5k87cyBMtBcWb4gu82Iviz/x2SUYjJYd6U7VlrSSayjOIbJxIERUF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

s/product_id_to_soc_id/exynos_product_id_to_name.
Prepend exynos_ to avoid name space pollution. The method translates the
product id to a name, rename the method to make that clear. While
touching the code where it is called, add a blank line for readability
purposes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b9a30452ad21c326af35c06a341b28491cee6979..88d264ef1b8835e15f774ff5a31f5b3de20f74ea 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -71,7 +71,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_name(unsigned int product_id)
 {
 	int i;
 
@@ -150,7 +150,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						soc_info.revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
+
+	soc_dev_attr->soc_id = exynos_product_id_to_name(soc_info.product_id);
 	if (!soc_dev_attr->soc_id)
 		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 

-- 
2.52.0.322.g1dd061c0dc-goog

