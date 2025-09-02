Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4CC281520
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Sep 2025 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809183; cv=none; b=T5tekw5ha8jvsflcAbD4V5rdRrT58uHY+zvooVvvcgkr/XZujhNTKv2EQDxy/ZpJ+cDzqar8LiYjsPVURKJHkjBDQgHsI+KrhM4OHuKDV8GP0Hvqy+l7Zm2eOoRbaYgP56GKVbkLGnHlqbDCKwbuFpxxdLsv0tYMln30zJprHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809183; c=relaxed/simple;
	bh=D6kMRVNdjTsHxomh8Umwb4E3q6zvSzEKkpefTTT/TzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FPyhAS1+1oOdPztFwMmRtIU/4h/yUfgVXK7PQqwuLR0Wgv6xPZrGW05BGhe46DkPrXUGEiJNdawStGenJuIh4/0rjI6jqPUgYiis7zK2oF9LnV0GFD483vVSd7cxMM+RPyzvblmwmBtsp5/dZiZev0Z8l9HllHvGbwuwYhoiy0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fHlSbO4n; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fHlSbO4n"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b04260d72bfso32835766b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Sep 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756809180; x=1757413980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+2RmtyC5BdrhVnYkf0pE1bp+20qsxwnCUP1SaL1uDE=;
        b=fHlSbO4nvFRetVrpPRB6bgLDTOjU/qdzNl0rZ71B3InipDSZ1MMMwMdo0PGcfEL5fs
         LFcViE5hQl7oi3c1I/H42PHnYeiW0RuhqNAB5gBMg8GmrETEHccPan1j+rJbMaGascMK
         iKCzMW4cWTyLr91cs1atbLg6ElGZxk3WSWlILzBttnb9qbrHQ1vOBbfwNU05b1Yc7NFu
         MybDLmgRpIhGt7xwGNl86t/MBneCuXcCAA6indKsJqmAb2qxeVk5NCbjQuzqrXzDVBQy
         md6/0xArDSxaVZtTZgD3+dLVg3dnnldtBI2PxQur+Ids+bNhFw/evhQ349llSXscnzJV
         Itwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809180; x=1757413980;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+2RmtyC5BdrhVnYkf0pE1bp+20qsxwnCUP1SaL1uDE=;
        b=cA4L7dApaTpY6hbIuAgRXj7ta2hsOV/X88VQ6u9O2G1WZfiV+z8J2JM5d/5RBwPQpa
         6kbwjtTM9sOdHlEX/sTY6b5QDHPrJikMpLrSenrOAdRsbZKpipz46Gh30aFkhIt8gLF1
         sj8AlMvQSW+dkInKO8L4Ex/P4Ky5sb1O9lELFhhT5+cYOnUKcMIEsrGdTrP5LGPMDeIn
         4K5/UU5Pez1eVwPRcMU6Ft25P7NBolcxiB6LUbR0fzTVo5Vwks8eGXb9XsJdBOCGpGLV
         trlYKFpylC1ZktTPhL5TzOKFTe0wD+Yu0gJh+T91WZ3BUbzgUba2CDwnmpLZCbVjW5QV
         qt/g==
X-Forwarded-Encrypted: i=1; AJvYcCVxiTVoP3hgDIyLCWkwyqfALBfczlQjVjOIJHlxPXyr9pjySTafQZgZ4Jumdi3PDHluWQKY6HfvgP1wTFDubM+jbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWU7qwKmtlAZEaaEfcKX9x9gphU6DT30YjhlU1ZUhL5r/ApTX
	Gr2BpQmQUDWAbu98lfcyMMCN0jU35ZWY00iIs8RcBT3SLYfPPjHCVKTnOcENGAQ/Wns=
X-Gm-Gg: ASbGncssjUc6OCE/2qFZd7ZlME7F9ENf60+3MlrK860mSTomiOHt5YYfEE4ixryPpdD
	T6+2uJwSCmUnHtFzopfBOc3rKpJxnOyYK6bFomu9GShtVtXHFBf2JbaEUtqxbrQ6rTclSKEmthD
	N3OSAPDj9hctLiXJ1G059OQAMhDZcQKrfb0w3uVMQgzLju8ZJt9voCuIj8MShCVcDprpqsrJ06n
	Fvn+mUQ6j3hbF0AJHIISfu3SL5KR0+IAiY5yJF1Lvd777NqaXm6HS7XltA3S0HlnZUvjooCIz27
	QsGOEKiWOWWdH3rueiu7/7j1ZVhQtNXJG5x1Gri8GHBYakz8YsTFOZM7g4HT8tKVTqJuYtf0f+7
	EzptBgoRtEfSmvwacDqzq+pXrnmcV6GzMziWmY92ql84g5fFsdw==
X-Google-Smtp-Source: AGHT+IHAsN/656NaYDyz43thubEPzcHhs+/jF4e7qFvC7WKngX9lMBJC+gCJOclV74lgolxYOi8bDw==
X-Received: by 2002:a17:906:690:b0:b04:1457:93 with SMTP id a640c23a62f3a-b04145702d1mr390858166b.3.1756809180009;
        Tue, 02 Sep 2025 03:33:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0423ed35e4sm516431766b.25.2025.09.02.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:32:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
References: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: samsung: Drop unused S3C24xx driver data
Message-Id: <175680917816.135692.16731223900572881206.b4-ty@linaro.org>
Date: Tue, 02 Sep 2025 12:32:58 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 30 Aug 2025 13:16:58 +0200, Krzysztof Kozlowski wrote:
> Drop unused declarations after S3C24xx SoC family removal in the commit
> 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support").
> 
> 

Applied, thanks!

[1/2] pinctrl: samsung: Drop unused S3C24xx driver data
      https://git.kernel.org/pinctrl/samsung/c/358253fa8179ab4217ac283b56adde0174186f87
[2/2] dt-bindings: pinctrl: samsung: Drop S3C2410
      https://git.kernel.org/pinctrl/samsung/c/d37db94b078197ec4be1cadebbfd7bf144e3c5e4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

