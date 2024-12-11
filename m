Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD691D0E28
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733903407; cv=none; b=e/PhMxvoEnEqjVmBRA3qb1Mm/M4UOWb5CB43pq0SchI76YtZqQ4jFT7zxktypcj8tZxAjdLnwTnJdXH3W/Tqu2yQTiWxnKCJdg3N243MMFgHlgONIrdjyaJdAbo02EPUrB2Mif8mS0JT/n32uDxk1n8Pln7VXc4k9Bzrm9fxqgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733903407; c=relaxed/simple;
	bh=byCXBbBMkzxnWu1JfDLHLINiG67d/FWoOMVk8Wzbj/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X+3tBxdEMK7Rd5pqmdXn0OJnbPK30uTBxmP2uWcxmTRPT1giN66dpiqE8Ia9icb8jAlOe/zKPAp49rwXbwe1oNzmnEeKu/SerU7lmatl5imm/jWBOIlEVnCkDBcSA0SnC7ab3QGbqMZot0PuJdpZvMubWojvtA3xOLTNJFG/lQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GkF7aFKk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GkF7aFKk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434e91ac3d4so3084005e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Dec 2024 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733903404; x=1734508204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR5y5SI21qqr719CHt05ra6RVhCy3LYtwxpSH0rstSA=;
        b=GkF7aFKkdO5PjXqskM6RTWdDMytEhzWlRZ1cY7fdOg1j2e/6oWK87FJZCAQksCoVhz
         Yo47J7d9sr9HoUV/h5jfgekgy3sSn6eBJQtnmebqivIntV9McC1ulLyEKTETwUMAOt4E
         Y6dje6V1rvmdr+uHZT4u1JL2lh+4zc/YJEN16+clgvNsB2oxUCYMmTuwYgE7xeppCFWU
         n1JUA8P779Fa03pnH8yxRqjUrrQe/ijF/nr6OBpyA+nknYwDfcGxkKPAe41FKll3eMWj
         wGY5mppFqG+jDmnOW1fMTvwAlDINV/mSkh1hRQ4TPL6Y7bMClARdoFvNt9MoZmnAKe+u
         oSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733903404; x=1734508204;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NR5y5SI21qqr719CHt05ra6RVhCy3LYtwxpSH0rstSA=;
        b=hPTEE/+KwQCoiLgF5uqQZosMU98M1ov76Mboi7VTIpvByWMEG9uKsFL24atinmUJQy
         DSV9EBhrbopjwqTgycM2sFlPUCA/31NUOQHEwpPuYj6tArGMuwl9rxy+Rjv/Ku2YtvuE
         k77ESVBc5NJjhe8YZp4u99QJ6eM8PdSLrFmnylGMjfKIxpgwSsrzR5722EwC+nIXKU1f
         TR2EoKilLnqqR1oHnwGvP5WuK93WhpJf5LVdE4sFcNBH2iH3ICB+Q5+xMW3FDfwpI9en
         dJHpSkpWxRZMpjZ+MErHkn92eWZF+zPXBeX54iTNdv2YFhpjNiV8LlSbZR4WaXM6QPwS
         JMtw==
X-Forwarded-Encrypted: i=1; AJvYcCXRIoAUXR8/fcVh9Hc/+nugqZ3DwfV7xehsDyZz+iyu71/fSQwzDZbR+I3yIDKuA7LpyG4EjjkI2V9JgLFn1QK44Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfndo7CyxvMqSMP2Cho9/X3eSeSwH8bQmqoDqQHGYKHT/MioXi
	EPuGGlVceFHwNY+obfl7VQ564xgcuUtSKkcEx5Z59mdBqYbMABrRTIrKOp8hcJY=
X-Gm-Gg: ASbGncvV9XJZgFUMH/QYYX3dKpjrlbJuiqU4OganTIV9qp/8rvQ7ntFLRAJKkvC2zKv
	cTFlpyeTEckszLRrWk+COk0a9dt6nxNunsoERxll2/BZAqxs2ZiaTeoktIffUaaPBmFnzdvqHN4
	NSDGown59W0YfetDuY4U81JUYeKEtiUJmD5RR8t1+44maXIo+7scnAonondtOPILBAcwdaUE6es
	8KufxdmCaxQKDVM3RtVit+9NFt2xo1yP0kLMonOFgZ+ltYy+JAaCSx/J6f6g1vBL2/zzA==
X-Google-Smtp-Source: AGHT+IHzOkWDq3KGGPDZsVQbPi+YFqSrAVZOEWrnqAZJZ2wtM0+/RjpL+t5H9Or+bcHPIqDSNw5ORQ==
X-Received: by 2002:a05:600c:1d20:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-4361c441982mr4065105e9.7.1733903404111;
        Tue, 10 Dec 2024 23:50:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361b6d6ea0sm22222385e9.16.2024.12.10.23.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 23:50:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Taewan Kim <trunixs.kim@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20241206025139.2148833-1-trunixs.kim@samsung.com>
References: <CGME20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da@epcas2p3.samsung.com>
 <20241206025139.2148833-1-trunixs.kim@samsung.com>
Subject: Re: [PATCH v4 0/1] support watchdog for exynosautov920
Message-Id: <173390340180.16989.11837691973342827218.b4-ty@linaro.org>
Date: Wed, 11 Dec 2024 08:50:01 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 06 Dec 2024 11:51:37 +0900, Taewan Kim wrote:
> Add support for the ExynosAutoV920 SoC. Basically this is almost
> similar to ExynosAuto V9 or Exynos850 such as two watchdog instance for
> each cluster but some CPU configuration are quite different.
> Therefore device tree, compatibles and drvdata should be added.
> 
> In v3, the first and second patches were approved by watchdog maintainer and added as next-git.
> - Link: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=grep&q=bt.cho
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynosautov920: add watchdog DT node
      https://git.kernel.org/krzk/linux/c/41979b81b22a35322817733b15407167164be58e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

