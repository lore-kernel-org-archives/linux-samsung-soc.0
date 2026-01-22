Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F10C3F076C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096622; cv=none; b=oiIqFjn8UykwnjljHrssgT6rEz5lTqxoP+TCgeLf9fAt/tPBro+gPgFecW+ylNzgYmA9CkisBE0eTxfvPhsSekYlyPhXtI/avzvWcvDhUWYe5w2f9k6zBM76DGphitXCgEffnwBbwHIPZLRbVNMcHoFA9P/AWvqU3PexTxvjIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096622; c=relaxed/simple;
	bh=sXR9KtyAp4dsOisRc5Qon6HKDNpy4djntDCBxqC+GI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BsSNqtR9JDtAyEjbUHRbUClXqg+wNa8Uu29DRkvHSBpObZ+rZBxiiVmRu1SAueBdlcBMcYeaK2jgs5+nYUJWb73NidpIr0ZHuVe/ZNtt+HFSjZL0mKzL5OcMY57PRH6V0LvNDVHRc1NYzqVAP0PR85Gm6hNHFzFac3TS9yACBx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdBn/v6E; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdBn/v6E"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so1602402a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096614; x=1769701414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae68cN22St48fgKU3R1GMDois55LwnfaO6xzCLCshFk=;
        b=KdBn/v6EqIeTCV0UdT9q+AgE02o4VVKrv7hKTsCcR2+tdPqPL+Hb4sxDWGxzCSjp8R
         qw6glICslciKi8oq27QwqFUJzDyKlCyHPgjyhU/cpGgU885YZho+ihVUE1LX7Bby7UTl
         Ojbp1F/OT7aeS6nQROqPHGxxo7Px3wGaKurkAanJIGrjMQQ1Ksw+ZmhKE4n9oRwZpcHJ
         ERuSKPTdFasnuLuzBSfvLjAGyRk4NOQSLNg44gJtcSxm+Ez4JPB/3U53neg0C3JvuUQ6
         +oJ6yGygMOtJDZtr4Mi6qVLNP8QbJqyUaTWUVewpV7ztN4svxkOkvQBJB3cs1CgjDg9S
         k0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096614; x=1769701414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ae68cN22St48fgKU3R1GMDois55LwnfaO6xzCLCshFk=;
        b=v7yRza9zGR/2+ePntQWFCAlILwgjVUJY6cMgVOIoB8VQycaFzlHVrTSNajcnPyaHme
         x7R0VyvP/0kmB/DQLJxd3bRhLSHaq5rFpCm48h3lUzMCT9eICRi4Q1p7wetpKiGUAHlh
         oZyv6K9G3JF7CCTMuiWGoN9MgUgy+aiO78hDXvaB5I0lqZLrULvgEqTgJP2EWCfYcr/Q
         YipwmrWhuD/qgA5jUkW/H2Ys3wQD9TI5wYmHDyd+ldQdMkZCj/DWn+ZnzKc0HqYSHhzh
         0f3Qb/DDW/MSzQKqUDWxM1wOkZ2mAMVEO2W6YKKGDZ2flVAA6LyAQ/RzeAfwn8EkJUJw
         X6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUs/k4bQdCkja9pBnbtO0RaMBFPO1FwA8H3HiyCKWd1+D9Nx2wodn0arfmoWYR8+hk+Qx2yrLSxfFUTDe2ZMq0PtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnaHhRuX78GsUFGObrB4iBFW7mz33COa8pGaFVOQSClnY1Qrde
	O1KKYUpVmlrI6seLArzsxOwpuKVQlPg1+Cf0TJoq7a2l96B6KbMPna3URyC8/W6hf3Y=
X-Gm-Gg: AZuq6aK/IJrP1oM3PDvZdY4NN6DbCOSjQ/RCB0bcRDmpUc7N8CNiPvyM5IVUMbO6QUX
	z/zqL8VQGjPI6+VJrTps0ueu54Jv3puuDkqluKPbKlCAMy0+N8RnOdARczBp+Tm7IA0SY9O83CK
	mBut3q3FUN2sd/nTdkYehTDG4OuiSFiziV1u8vSBpRtEn0oHYcjvThTah4dpjDvFVeZOBklT+us
	oHIQf6xH2oAN4vBH8mxTW6eGrw8cN0O8FtuLKetaNNisqOqEkd5+eDFyvcsLKZv24bjNdpoM+Dk
	I13LskPGzEvZXIUXLUC2Nt/6Jvtiw0ngapXbT48vbNjAIOZ1lEITq/42A03X6UpFmVHKgfHFsjX
	2bPsHz28ulI+nQw3y818S73yvNaYTzblyS2B/ukB8qof2AKlmCzEDNqSf7aJ5gkiWcT4+i/6kWg
	P86cfy7pgjLs0Y2qPUKQTWXfO1ss7y+9HIK5grlvMZXzk5KHte7Q8GIdiDr0IdpRQNxue6m6amg
	oCshWLjLKdpmc7W
X-Received: by 2002:a05:6402:27d2:b0:655:ad4d:66a2 with SMTP id 4fb4d7f45d1cf-6584874b756mr38972a12.1.1769096614097;
        Thu, 22 Jan 2026 07:43:34 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:28 +0000
Subject: [PATCH v7 01/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-1-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Using lowercase for the buck and ldo nodenames is preferred, as
evidenced e.g. in [1].

Convert the example here to lowercase before we add any bindings
describing the s2mpg1x regulators that will enforce the spelling.

Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index d3bca6088d128485618bb2b538ed8596b4ba14f0..4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -75,7 +75,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -84,7 +84,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.52.0.457.g6b5491de43-goog

