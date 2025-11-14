Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C276C2F49EA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120846; cv=none; b=Xd8IKOtRo8YRtxaj0AvlRfw/CvnYm5WCTj8+4MCkcc3UtQ1U3ZOxiOC0f3O+4MH1DDdBJsMg4Qq8W7hFV0AyL+HeS8R+vTAfkghkZ026944+y6nBTM8BuIyrTKwq93E/RG3Ck4g8xYgszKN++cPZjzq55FHbh78IUfR5osOrVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120846; c=relaxed/simple;
	bh=FmJLj2gjTlRUIVzX5Hg5p/BaNu3xSopsXsqdTo3WKhw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eeYy7IzQxpqRsaH0YWqWYv4OvzPstNff9TRnsockQ3irXVcX2r7zivtSZnmnnwzdymldhFPnU0WJMSWSW/gwOuiNybeJWqedlIZBvscJesWhvE51pFFgaRBjCISVvvu+lcoEJqgskKQofHfVvTboyhX65hBzh4xhJcixrlUwQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tV0ie2uu; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tV0ie2uu"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b733707e0b5so281213066b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 03:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763120843; x=1763725643; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+s27uAymnJrt4l84jxnUee+ZrUHMdiTsQjpcnX2dO0=;
        b=tV0ie2uuzIES5zySImNmsXvlzhnoAoEz46ppIqlH6bQTPZoAhrtOPzABj66ai8FNAA
         QNZGIGP8uQFY+cf1LAER8qhhPkY9Rj8bnPEfdcYKQHRAzUTFf7rSds9rW20V5FIQxx6e
         UQBQ5j63OpnVRJRw9rG29OgY6nGU1GXMN7XeDU3ffW/i0+W/JxjtdarOw6QWMPOxnRFW
         Ju4FDDBnjexjCb885teG5lGI8hWCQTh7ctiAWoYyjNAxv9Y+Fz7+Qq3aTiSIx1d6fj/o
         a4pQao168QBcTq65u460EDyL5tKTlEKQti++5bByRS4zJL3yHKJcU/FjEEhe0GAoHoP0
         7Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120843; x=1763725643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+s27uAymnJrt4l84jxnUee+ZrUHMdiTsQjpcnX2dO0=;
        b=s+a7kQrlCl1jnk38PODSXy5NKCHSmE9Mx9BuZrmdmRUtH2cdfaYloEasPQuhM2cEEG
         FADYyFbMlI139vOKVF/tA8oIy75YvWjCRRW9pKZvFuBRYliKQN0+IF1eGWUa1eoO1Qf3
         EB4tgnv7/kDA8aSi+dgRzuv0WMjHbZ4gdYLP4G9YnHwevUg9xqmmYyy1ChNSHZWnSiWz
         uaG7/Y0obFXX7d2dSZIg7qFBIvEex7aLcwnjDxnCH8M212cRFlKAJ5+9LSdEZpE33oE+
         vLP/YK9hA1GtNTr1WU+PGDtdLEwZ4wrZpdjz3FCpuT/HNfxIu36x2yyUD8g7pMZLG0aa
         QW8A==
X-Forwarded-Encrypted: i=1; AJvYcCWp/XiVIh2fnMo2OocG6uKvd6u5xaISMAEMYHsiTyerMVDz3SxDQMDRnTU1YzoiqQ6cyorOMBK+gd4ACOSlDJ/TAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZI7xb9Rj8IzO9Z+BFl9h6n4b3vPgRfeoX5PUMPchpnrglZwSV
	5nb1pLkyuaPcgdFd9o79bmb6y1eldb2W8oVF0bY6zE+bvZdBzwDKvidBa5zEETZFaVM=
X-Gm-Gg: ASbGncugDnKWOrOJjQO4OFa6H+u3yjL8meoynlFTHs/2O0dItmqG4WroFlpCgAjh37i
	0PzljAE4g7DqSV5aNsDth6DNxkGd5i+z+w9JwOEbsQ4TrwVWIBUgXIkLLhmBwSlqtABx9sSZNVQ
	s5/KgHfaoAWWgoadMaImcBaspsaqwNbwS+cCxArreLwXAbPTgWauTjzjm5PiGk81YmlE14O2JSW
	2Ac/6VGoQtgok+lSWiAz0pxETF9y8k/8eb7xvuDmlPtxtva/RLlq0FsiICdvTfZTblagUzDgoY1
	8taAaIHC/pPl02yh9axCeU5jysTglC2Ifm97L1oZu/ARi4fS2TcOLJF3V+M74/nnFpwx985xmRs
	H93Eg6k1JINaBi5qYGMpiiSYO0iRjWAX1UEkFG8C091oCHPLQhLAPoLTEZUrAicD93YyKKHZtqS
	5BZP5EP5fyRfOVN94QedcWK7H0stSSjRCr1zGscpBftHX8rPJiR0w+3P9/oKptJjwoc4mypfDJk
	J8RHg==
X-Google-Smtp-Source: AGHT+IHPnTCBO5JG9atXjpC3DFDHuSHqyX6Plx6mhaARcdXOJUR8ud7LCgaahGyg0RloR+HqZ+3boQ==
X-Received: by 2002:a17:907:7f20:b0:b72:5983:db0a with SMTP id a640c23a62f3a-b736780c56emr277846466b.15.1763120843119;
        Fri, 14 Nov 2025 03:47:23 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm372950166b.30.2025.11.14.03.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:47:22 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Date: Fri, 14 Nov 2025 11:47:20 +0000
Message-Id: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMgWF2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3WLTXN3EnMSiXF3jlFRzA9PURFPj5FQloPqCotS0zAqwWdGxtbU
 AZD0St1sAAAA=
X-Change-ID: 20251114-s5m-alarm-3de705ea53ce
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

With the attached patches the Samsung s5m RTC driver is simplified a
little bit with regards to alarm IRQ acquisition.

The end result is that instead of having a list of IRQ numbers for each
variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
queries the 'alarm' platform resource from the parent (mfd cell).

Additionally, we can drop a now-useless field from runtime data,
reducing memory consumption slightly.

The attached patches must be applied in-order. I would expect them all
to go via the MFD tree. Alternatively, they could be applied one after
another during multiple kernel release cycles, but that seems a
needless complication.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      mfd: sec: add rtc alarm IRQ as platform device resource
      rtc: s5m: query platform device IRQ resource for alarm IRQ
      mfd: sec: drop now unused struct sec_pmic_dev::irq_data

 drivers/mfd/sec-common.c         | 41 ++++++++++++++++++++++++++++++----------
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 10 ++--------
 drivers/rtc/rtc-s5m.c            | 21 ++++++++------------
 include/linux/mfd/samsung/core.h |  1 -
 5 files changed, 42 insertions(+), 33 deletions(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251114-s5m-alarm-3de705ea53ce

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

