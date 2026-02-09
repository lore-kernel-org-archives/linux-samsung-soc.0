Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED81A2545
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Feb 2026 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649671; cv=none; b=H3bgcAFxSCA51ZQRPesj5F9+i6qWKFaHxod+AkgagQ2SmzY5r4MdNwzAXcc5RD4KDy/sCarJmeMZBElQXq+rwZ9tXCgpI3okmXXWK1pZw4j5DeUAYHj+URNLLwrmOnT8EPWPK1mG+0nYAF2V15Vhdcx/vb4oU9YVSYkThJVZ+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649671; c=relaxed/simple;
	bh=1aMw8Is6xzQAjKxx8Y/fAWaHPHVx99dGNHrMrCe7gRM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bPm5d33PEiZ/YapDoyn0jgyDFKlsMYOX4GGLdoGGtst2yTXqRu30y6s+yUPg7s7JvdtQPWmv0jXCzqrUtaYWk7W+/q7giEeRXmMRr5TKHBcbBtqGt24DTdCmlnefgeT1KbZmvVmXuqNwqgiId2MM7O1RaPTrtgI4vrgtJPzJCY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fSWlUUfH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fSWlUUfH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b885e8c6727so465212766b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2026 07:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770649669; x=1771254469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GbFUaZFDyeM7KDy2ACOiFFmkLeiKzMZPJyF2qbC0XgA=;
        b=fSWlUUfH/c24DrJWoq3e9Aczk+hvXoMdrp2jFdJj0Yqc/og62ToaN/+cPmawXfOfIk
         2UD7DJPrmDerttWeSWMo5whJnz+IoXEP9HyMjcypYvyQxKx+WX9YlNYLU2srvpO48Yjp
         p2y1RM00+9P68WfO+3JVW38CSUs+1YVTEq0N9gZAjH9+wJ238ezCnqQWFI3CSSijJ5SY
         tDFdXTlDc+05Dn2zcxXB9AZfq9+WBOejzZ3M9QKKSKpIVlt0z5HmQ2m+kC4wOSUcm36f
         y01D1PzUH/PQbHOWQfA4rs+dgql9fEgQyUalVUpK8qWJ8V6p2YmEaJXC/QA15b8xLYol
         LdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649669; x=1771254469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbFUaZFDyeM7KDy2ACOiFFmkLeiKzMZPJyF2qbC0XgA=;
        b=LMu+tNBUvdjAQSHkJunuKZ8fhHgHlnngMFfH4Zrery8V0EX9JQ3+mNzA1Ts2kEXy1X
         17nyWzBL3sZaN7gsMJ+U2iDJtLPOePOOp9G2KV8+Cimne3miOmZqEX1QTmThwB9JWKxn
         FjwdlvGG+V0Crc0BDyWxtZQ4sOrYp1jUKqpUbgkcpMN6GHtDEPYQdOKGw0BJu1va9TBQ
         3C28YWmNhcoOgQwGMK/4m15GGl6KfnvXxV2Dh6ZpXz1heuROVXPL9eHdOFu5xQb5T+W9
         L9rSToEPARqMQf53FiOytE+CymRTnqK3Tails+vIx4NmIDC6x/y7n1jXh1Xr2b/VOpwe
         plGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Q7+gyXEbGadXqhiWk5VPOzmy3uoErC0ai2VAKsUA5lmzHkACyAMY4kHky8XaXORg8fJSf7nblWp4WbS3qJXT1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrhonkclkmAfav1oOd5EobOPkco3ILADSzRoT6Ym+yxXnSAxQu
	dV2XdsZB6cWNODGuAhDg9cs9Q0u/r9JK6jyz2l//Ag2kObBIzxg3AZTfC0LLN34Bsanhdm7xLyt
	91m9gWOk=
X-Gm-Gg: AZuq6aKF7B8kcA7MZLlkWc1YUyn2W6mQ+UWweU0u9Sl4YpTTjX83UyLS7IOuuZgPEDP
	kECOFhw40BOnq/j1L1kuFd/gCN/MkQjZ65wrYfua6rCoG+fQbI1UMfBUw0HImnC8o+4deA/8QgZ
	UO4bDeORnopCnRW8+Zb3/ZvTa+0yI0BqiSBkig1oTn9YWe0MSi+Zm29Do3HuGQaMVfnuUPm+LfD
	OqLPOKnJ/HJ8ZdxLiQvdu0zuSapiN4U7bDy7GidOSZ1jKMNbJ1gjvdqPmkkbMOIgBp2U8EnQsz0
	ah6wtVJE1erK5gTb4HUn6IhzH3kD2A1JCDJa9LZsAgGuc+VnGNnj5aniRczqrzKKO+awV4aJT9K
	XSeNP1XJX8YSufUuc2OwXIThB34fTPyWyGQuSsX9xXV4yaL2srxoQTpV5++9REP2sNZFhVP6Ihp
	heris7ErGISCebV/7CmwxgiTdGsgaXI6owq03RAYKMLoShAiQZ7m4MD4yBxjMH4UKCfcdl/wovz
	rk3EXnAfo+kOdTA
X-Received: by 2002:a17:907:2da3:b0:b8e:380:5669 with SMTP id a640c23a62f3a-b8eba2a5a66mr870164466b.32.1770649668905;
        Mon, 09 Feb 2026 07:07:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae6fa84sm393516366b.67.2026.02.09.07.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:07:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] regulator: s2mps11: two small bug fixes (s2mpg1x)
Date: Mon, 09 Feb 2026 15:07:46 +0000
Message-Id: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEL4iWkC/x3LSwqFMAxA0a1Ixi9QI/jbirxB0bQG/JGoCOLeL
 Q4Pl3uDsQobtNkNyqeYrEtC/sugH/0SGWVIBnJUOnINGs1bzC9Ujsfk91UNg1xsSK6ugg+eirq
 BtG/KX0h393+eFyyslnxqAAAA
X-Change-ID: 20260209-s2mpg1x-regulators-fixes-2087fafa2389
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2

These two patches fix some code quality / legibility issues in the
newly added s2mpg1x support. Behaviour should not change.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      regulator: s2mps11: drop redundant sanity checks in s2mpg10_of_parse_cb()
      regulator: s2mps11: fix pctrlsel macro usage in s2mpg10_of_parse_cb()

 drivers/regulator/s2mps11.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260209-s2mpg1x-regulators-fixes-2087fafa2389

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

