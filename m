Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969738A709
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 17:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744235; cv=none; b=QgHuzXLwL3D/Ua4OVDrwbT5gQtGoBpfJMAd9UQkd8ng97UJyiYwhq01KGmwZxlKHfvvsU/GmHl42TclwX2qavNiqvhxN5tjWgwwj/LCzDWDlqnw9qQgbbMnXBwDvbOhLT4pDfA0hJ4av8W6tYXfnDTOfZM2bhaOjY1+P/CFIlpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744235; c=relaxed/simple;
	bh=OQpJ7IYnT8xb76mOab+nkkVlDX6VAyHoVT/Zn38Uqtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMjKtryfrqudNUnp6cUcdto1tQiN+kVbOd5F8Ux6r4/gCezlSKRUa/wSwabSbbPPXQiHB+r5s1iu8i5TMnebe70YGF3Axe3Cq64K3OT/M3c4bbggysSQCCRwm8cLqh2h5oLvReM8u17+dr/SWlFXJ8O4bzTTODLlW0kWIeBqg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H2iRf1dr; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2iRf1dr"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b884a84e622so1011270166b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 09:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770744232; x=1771349032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Odlmn82b7E/WniPHvp3dlBNUvvTQqWZ4svWbjlixDwQ=;
        b=H2iRf1drW++Dxbc3QVrziu0insAA6KgKplODOGVNMKmwSp/EkxdigcDZEXqtA+5ylX
         BQv9KPhW7P8ehRyOGS1zVsTgaDfp84huJmhP7p8VBtq/vgK7nsW9MqAKwESPZg7z8+xb
         HiEXe89ND4iBxQrt5aNtJl449b/dTndisSQOvfnxsdw68rV1EX6nyBs49e8S+vBTtrWY
         MCcsjCaYNU2f5o+Z1DBlalDiftTOIGF7njPSV+NpXHrQd/qGuyJb9Yzw1y9q42fKd7Ba
         qS1prygXsfLEhAlke0cj0DQiuW7a0DPGoaEAvYWobq0g5pDxzTL2KUJCab7m7cxiWdl+
         oQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770744232; x=1771349032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Odlmn82b7E/WniPHvp3dlBNUvvTQqWZ4svWbjlixDwQ=;
        b=oRYyQJoWxjG39nhnTuOey1aOoQdQ0m9S1PUOkSL0velkMVTqghGjlaGdoFVIcqrZLp
         iwfWW72tZKW5UYSJD1tC1oCoBkXTvAkRk7gZQG+p6PjCNpUh/ZaL1h+tdkX9utniH7VV
         22uOEh36LSRy6v7O0BwfC2y6YFTk9kWmWYAfUdW+il7BFP5fByW2VoJuI9ie3bNP8a/D
         vfrUqccAm9r/zJRxfDUIfxn/QiJw6q/rNGcdbk+T1deGh/2yfgJT4ZY8S4EO1952yTUj
         /xLem5a7uQ9AEy0JRARWW4ltcORFtEnBky8ak9BGB+K57Ok1dPVRP2kyCOVuRsgtZTIR
         43MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbMJBCPlVB3IzeEpJPw9qUglgFsWwFbvZVagIf6Iu1nevrX5FPtk8sJ5HM3Ox72pgiXl9VM8bd7sbo5c41NhJZKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyF4iHfNKjJUFbYqO2yAxL/V14dTh1SwbEV0P8TQy2LWo/5q4g
	K9/lYRF5qu6Toi2wdhCMIHZ4PT7gkSjFtWlIGC5TEWo6c87a70xq19oUD/wuVv4gphpivwTg+u2
	VKAxTjHg=
X-Gm-Gg: AZuq6aLCyGs1KVB79RHmJSBl1IFBgk6E2tMC4SEs/SAoaJ8qS+zMJFCieboL9tRpeqg
	pvTbJLk/TOz9rFrvleZUM/Ye8p/21hnNldh/VBMHNLjnKV2yJ0qfUDqYa5FmX4vRIGG6ESgqcGa
	RDNGegM9UMY+aQaHnYcgs0w8Oz9OKiMEKIRrjbL2IX00QS2bFEbSZhS5/hQqSVrFXx/7bKUm5Vn
	FuGfD5aBG4tmn9FHI1xTNpH2UbpwrsRLWfuZLosvHr5pQCZ7iGErvfxrZ7Yp69sfvXl+CylEmZ1
	N6/KHiy8V1Y+xHczg9kljW2GN4eOJ6CtDrPiiow81bKyD0DbK20Ma9Rrzrd67Aht214Wd6c3Lef
	qKFTt8leMijYqCEAOJiVsaAlqItdza/YDxqN/peW1rBuoWUgQHwZz7pA4+0GBDo8tIiT6bEivJL
	62wBc1WNaJRwCYbZwB/iUg2M6QxbDdIhKyo7sNfok51yNDtaFaYNC6qeMlWqPkXnm3TNztqvdDF
	lKMUtrI6hQlXgBI/x0k12SVnLdK
X-Received: by 2002:a17:907:26c7:b0:b88:5957:2d65 with SMTP id a640c23a62f3a-b8f54565497mr184444466b.37.1770744231978;
        Tue, 10 Feb 2026 09:23:51 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3ae99sm565533666b.60.2026.02.10.09.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 09:23:51 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 10 Feb 2026 17:23:50 +0000
Subject: [PATCH v2 1/2] regulator: s2mps11: drop redundant sanity checks in
 s2mpg10_of_parse_cb()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-s2mpg1x-regulators-fixes-v2-1-ab3d3457f1ae@linaro.org>
References: <20260210-s2mpg1x-regulators-fixes-v2-0-ab3d3457f1ae@linaro.org>
In-Reply-To: <20260210-s2mpg1x-regulators-fixes-v2-0-ab3d3457f1ae@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2

The sanity checks being removed in this commit are useless as earlier
code already checks for all conditions, including all error cases like
out-of-bounds conditions. In other words, the code being removed here
has no effect, as any potential error it could catch will already have
been caught by earlier code.

The checks removed here are also incomplete (as they're off-by-one) -
they should have been checking >= ARRAY_SIZE() to be complete.

Simply remove this redundant and incorrect code.

No functional change.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aYmsu8qREppwBESH@stanley.mountain/
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* reword commit message (Krzysztof)
---
 drivers/regulator/s2mps11.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 2d5510acd0780ab6f9296c48ddcde5efe15ff488..2d67c5c16f487506a2e9e4b119f33faa846269f7 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -478,8 +478,6 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 			return -EINVAL;
 		}
 
-		if (ext_control > ARRAY_SIZE(ext_control_s2mpg10))
-			return -EINVAL;
 		ext_control = ext_control_s2mpg10[ext_control];
 		break;
 
@@ -503,8 +501,6 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 			return -EINVAL;
 		}
 
-		if (ext_control > ARRAY_SIZE(ext_control_s2mpg11))
-			return -EINVAL;
 		ext_control = ext_control_s2mpg11[ext_control];
 		break;
 

-- 
2.53.0.rc2.204.g2597b5adb4-goog

