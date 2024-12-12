Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA6F1D9A63;
	Thu, 12 Dec 2024 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734037765; cv=none; b=L4GGS54JiQrRKMD5/pJSqkQ093eCK83OsmoT9nJ0gC7qhfb/bRXVtmzgm+8/q25Ae7hz8Q5A+jnv4fL1yOBOZPl8XjhzPGTmgneiMFsbZPJhvxJdcrDNIz12PMTWSRxBOW/tCBdF2qkoYQF+QoaPQLH5OdW7PAsdiOYJaFUTlzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734037765; c=relaxed/simple;
	bh=W96WZYcRWJBuUyWOrDs/OpzeK6jPnXsbm8DFk91L+50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUEAK2cerKiBQndx9pPKzJqOLO7jM7r/trtrCFXxqTV1vLEBNqhUbTVVjJ4mzew34FUZS4fxDU0YGDrw4+3m4OYIpA5ZolKWISkx6hE3JE5fXGKxErCxDaf6Nd/aYLxXTXzzsJkC8H51kmyKfQbYi7jhobfOMMZNiTdi7VVFwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOEa4k55; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOEa4k55"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso1532614a12.0;
        Thu, 12 Dec 2024 13:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734037762; x=1734642562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LcqT6RFZpU+AfgSkhVCNBVs2JrpNLGjbQouQLx+w/k=;
        b=eOEa4k551qijmYes88K/qD4FICIFMwwO+q6D6b238CG7DlYEUrRJbQDMAV8BBFrD1c
         D7fQPoF4esFr/DPRWp7nGlgLQ5GXQUm5ErDj+QjNXqMI15h1XmU1nUW7CPk5rKXO8gry
         Jn322w4i0MuToczoamKvlBqA5zZLYhWkOoBqE+PArhooUW7oJUQ0VypI5MG2KMx12NNU
         Q7HttACQZNnRG5VAk+DM+Ixqu4kLKXNIcrq0CEx8a649H50Bqo/eeKRHpD3J31PtI+MN
         sP7YkuZyjVhb60TnFME9WrlnH3o0i99FwSTuMP4jklKU21fwcm3mrGyagO0iU9JfDwny
         2+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037762; x=1734642562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LcqT6RFZpU+AfgSkhVCNBVs2JrpNLGjbQouQLx+w/k=;
        b=k9dtXDEJBXNOsORo8SMm031MVta0fm1RDMzxeyFk0BkkqSubC9zCb9a+k3TrtdS7nY
         6mTCikHYn8Z2q3MUHw1O+Lk/KaW5RwJlh5MvCBkVgnZhicrsXNtbSHOf5R96XKvsCUkt
         xXWyGclHii5QuBIYKH4nGzI4CvTFnCDHkNzo/W3M3xAxyCsEYedytf3Besp2aoFjikTm
         km8uMVfQ4ksKsiGCkiT6OIhMgNyqfEL/TwzdnNtA/8mPMPx7s4KBkZALMHwn4Qs3ailg
         2ehF18e74zYWjegYA5dt+841lFqq18rJucNl/akqjdrKkYHNWG8oKuxOkbZazgUgIDme
         P0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaMxNtKl3B7JgN7Xmo1TXmlZ1DPyBHFys79DhJ7/5Dd+gUOQB0ZSpufDf57gHYgIfN/jKWhOpa+VOqGGyR@vger.kernel.org, AJvYcCUxbMpa6GifutuuPfNG9woPr4yp3zAVWnis+paK86Lgo8w9vUtHPMwkSUcnWlQDqHHNoA7Jk0cu32cc@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5ZB3icwBlBj+yMJv4tMHxdYLrslDlk0SAGBl2V585yMAeGlp
	vAd/oX6V5MRSgBwKoH2hPSAuq+8h32QkgIpB5T8LGM/efcIH4aoflUZUEX/V
X-Gm-Gg: ASbGncvyZYDF0MyFlxLk8NqLT/tdPZHhrszE5mHfam7QUcLuhnJP1rQjgUDWWeAKPsK
	ZyYGorKNaXb1ZniuEUHlTmQmILt+19bBehu4BxbsDZzs7u7yAXNrPh8dQtdWpIPKAQLetN2RKe+
	0Uw68RnAqgMHvDvepneKX177TboBLaNqxsSimLG4aOO0gOylYe9RvFt1mUdJz2db3Yr0wfQs1S4
	Hbi7v8jNX/+vBZJoOju7eelt5MdoqmWXOKX1rKEaslFtfQ3GtU098OaRaJ+f8djk/J8
X-Google-Smtp-Source: AGHT+IGNLsnyopvoEGCAoELFMil/bI95Bbi59GnVO24Tgss+SOkt2jDXgVFqyCrkWQppUAutiI/wVA==
X-Received: by 2002:a05:6402:210f:b0:5d1:2652:42ba with SMTP id 4fb4d7f45d1cf-5d63239e3damr1998287a12.16.1734037760215;
        Thu, 12 Dec 2024 13:09:20 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d0f93d54sm9232348a12.68.2024.12.12.13.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:09:19 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 12 Dec 2024 23:09:03 +0200
Subject: [PATCH 3/3] MAINTAINERS: Add entry for the Samsung Exynos SPEEDY
 host controller
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241212-speedy-v1-3-544ad7bcfb6a@gmail.com>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
In-Reply-To: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734037753; l=963;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=W96WZYcRWJBuUyWOrDs/OpzeK6jPnXsbm8DFk91L+50=;
 b=vQxIcKGQNSUKYi5s6WONKZzJe7/plvG1ezTM9BPeMsyvRV75HipNqBcJuId8xUxGH6I1S6UUp
 OCguhCtHIWZDUKzeIFbJZLqtbTahyjdWEuz4elHnfQz6LuuJOWduonh
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add an entry adding myself as a maintainer of the Exynos SPEEDY
host controller driver.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf2dcd4e0261785add520b5eac747ceac523e112..14041c5373df76c7a7093f106dded1080b5d8664 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20754,6 +20754,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rng/samsung,exynos4-rng.yaml
 F:	drivers/crypto/exynos-rng.c
 
+SAMSUNG EXYNOS SPEEDY SERIAL HOST CONTROLLER DRIVER
+M:	Markuss Broks <markuss.broks@gmail.com>
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
+F:	drivers/soc/samsung/exynos-speedy.c
+
 SAMSUNG EXYNOS TRUE RANDOM NUMBER GENERATOR (TRNG) DRIVER
 M:	Łukasz Stelmach <l.stelmach@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org

-- 
2.47.0

