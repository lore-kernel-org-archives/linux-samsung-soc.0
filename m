Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A332F76D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838278; cv=none; b=nRKLdQMXog6td5/oVBI64VcOGJRmCH/OvtEs49lyn7ExBbYd8K71aPBvaSsp6TYrS7JAzHm8biqgE0caSHmDxvnnd+gZspdXQ21smXcODyJCkgAdAYXu5zPNu2qkU5S7z9sK8s7QGbZ7kl8td0UOWx7R0tpDn3FpkAzHqvVRw1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838278; c=relaxed/simple;
	bh=Sa+/EIvgfLeQ0GYvhvwXdDpmw3zds0mNO7QpOW7aJP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfj3tXLsAxjRNuEXgpIggZAQDh95AWztEjMhpqtKqT5IssAF1lk/zvzwZVbn79tNs7b5aJpTOhwesXEHjBIqLWOwiAfzkW2hU01iilrtYiq+0SC5KJpSSWvNE4/4Y8StbXn67FF41abA8OI3rrN/O0qfa7VlqvPO1XiZDaIrdJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+Imsscd; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+Imsscd"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so13008446a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838272; x=1767443072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EsAjr4P9fU1lByYIXjwfOyDc8iScS+Mv0Ho5Wv25Qo=;
        b=q+Imsscd6e3Io91cQKSmMv0AG+p7pknEnMbtNQPVu85ElFe0qpUPeccsUfzPzW5gNm
         3kW95v4PIALX8ZRw9IJDkMuFdFslgB9iaISpxjCgFKj8EaUtikf1yWzuAJed+wDCElFK
         XFTCNNH6S7q520+Wr0xyD+92RSGLFfTmLQHNMYDQw2aAYZe81rLrDxONAwboxzu1i8AM
         cm+9l6AUuTTVN84Zrm7O7d3GTFZUZ+XS1Rr0WNjbL8JI78m5P+ItVAe+nfQUd4Yl1/hn
         GWErdSDamiQJm0did2yucRI2NYHEaHIjV/9+b7WK9surdmEw9pPTSPTSX3CtVVyFdwmY
         BO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838272; x=1767443072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2EsAjr4P9fU1lByYIXjwfOyDc8iScS+Mv0Ho5Wv25Qo=;
        b=rx6utEjU0rselyRQmrqNr0r4VUK2uMJwVR8WGTtdnTvAbAzWOGN+l0hikDBfuapTsk
         m/g/GIJnWMSPsN3L0ER8VNe0weJe453lHiAtnsso3IeRHUmwm9b4tDHA1zUIrV6HykUo
         cUnqGSobdibppfrZ5Iz2ekrzGaaXP3oBihJTEmIwPS1ruRBMiDssLoGjCqqE98bfBWsO
         OC8paez8TKjc77RWSYonqHsi7P3S6VrzKHp7ObfHc6QHbhNxFyzjHM9f5Dp8kz9UhpqY
         jTytZ1jYuGU592rVVT9EBKtQZEIYu1DcdJUZwwuUsJD91LuVos53B0DI6hPVEOnxTHZ6
         Kz/g==
X-Forwarded-Encrypted: i=1; AJvYcCUn++xr72UZtMmeL64Qc6uu5zAKtwjb77Kgu3LmJ34k5irWEvpN6CtUn/mQN0YqQhjMk57J/gncYDKiZxyyBeF/qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBwSrR+mqaX/tyF899k81orPodKUE9eAfR/a6TNeE1pi9OcBBA
	TdMFw3xPyOXn+K6TuvBKMQgKoF98pT5gWZ5q7Qwp8qhcl0IhUb84SvmOnEZE247e3oI=
X-Gm-Gg: AY/fxX4nSZwLl8q0ZyGleE0uj3iN716r1cYbuBIdOccFpY7eZvPOXriOVPD3xqnDfxV
	glEt8aao+OO8zOFArszcwjxNMtPCSL1QBiMzVZxPfA6CuU/+dYumEioKjTunw3LnfREmgeIG5c6
	Ylmm+m2GE6uopgw+tzuFkPL+Oi6N63dwU2QFMTE5bRKkTeqCDRjtbz4PpJznkgKYaIqd1fSe9+9
	7dLkvNNet44WthsK8fwMI1paTBXoLSIoUf6nEg5xt4xr5TiaCTmvhG1bI0DuWUQf0hcd7fVUaGW
	2wsdCUsp1ehlzb9RUCKCOhiqUTeMBpOGrlhrx30G9KcAR8xjiTXBMC9NmYmlCwhpfABA1zeoQoe
	mVvphPlYD8lCxGekIi70o1c4OdDpplKutBr76jcJWW8IxUMiRNS2fabnHy3HsRFejNikF4OWtYr
	QP0SgN/De4f6CpSk0y/6auTWWZ2WCh5ja2BQ9n/B7QuTDhLiD2p7RuMunXBhwnMhM1RtsTQbuZL
	+Qy4A==
X-Google-Smtp-Source: AGHT+IHjKhYBTBvWqO2W8/12tTR4DWjtT3htxTA2IN9EmSRdLTSfBMLtisk7LyXjZOtzhcPGroxtMg==
X-Received: by 2002:a05:6402:1ed6:b0:64d:1f6b:f59c with SMTP id 4fb4d7f45d1cf-64d1f6bf81fmr18185315a12.32.1766838271649;
        Sat, 27 Dec 2025 04:24:31 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:30 +0000
Subject: [PATCH v5 08/21] mfd: sec: s2mpg10: reorder regulators for better
 probe performance
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-8-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
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

Bucks can reasonably be supplies for LDOs, but not the other way
around. Since rail registration is going to be ordered by 'enum
s2mpg10_regulators', it makes sense to specify bucks first, so that
during LDO registration it is more likely that the corresponding supply
is known already.

This can improve probe speed, as no unnecessary deferrals and retries
are required anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/s2mpg10.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..aec248c51f366359ff323f421e453a0ec1d1dfa3 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -407,6 +407,16 @@ enum s2mpg10_meter_reg {
 
 /* S2MPG10 regulator IDs */
 enum s2mpg10_regulators {
+	S2MPG10_BUCK1,
+	S2MPG10_BUCK2,
+	S2MPG10_BUCK3,
+	S2MPG10_BUCK4,
+	S2MPG10_BUCK5,
+	S2MPG10_BUCK6,
+	S2MPG10_BUCK7,
+	S2MPG10_BUCK8,
+	S2MPG10_BUCK9,
+	S2MPG10_BUCK10,
 	S2MPG10_LDO1,
 	S2MPG10_LDO2,
 	S2MPG10_LDO3,
@@ -438,16 +448,6 @@ enum s2mpg10_regulators {
 	S2MPG10_LDO29,
 	S2MPG10_LDO30,
 	S2MPG10_LDO31,
-	S2MPG10_BUCK1,
-	S2MPG10_BUCK2,
-	S2MPG10_BUCK3,
-	S2MPG10_BUCK4,
-	S2MPG10_BUCK5,
-	S2MPG10_BUCK6,
-	S2MPG10_BUCK7,
-	S2MPG10_BUCK8,
-	S2MPG10_BUCK9,
-	S2MPG10_BUCK10,
 	S2MPG10_REGULATOR_MAX,
 };
 

-- 
2.52.0.351.gbe84eed79e-goog

