Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B874CB5E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922123; cv=none; b=Z/UsBJxsE1EOcq21EQVS+p2yGbXCHHbVBb+dmo31wmHgEmdWR+quiDC3CjQGK0GopgQU8m2lsSrT/RQzsg7AN73T6NBvSzpqZtwqiVLc5qWX0Umiub/znHBpNBot+PELn9igk8okEWEPB0gBybgCgt41v1U9wwEOE7EQiG6sNno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922123; c=relaxed/simple;
	bh=3OixjCfC/vJBPrYQJIXZMxFyo9r6DQ/0hGmJhx+9Fd8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gXT7ubnu8gQKe9hZKPdhiWiQQvR+UVMfggcO2ul7vBhG6H8iu0VhMx9HRfqjQlH0K5nCX0wDtLDmT166EquBkbRecvI+3cTpKC0oVesULWSg5xfcMURGF3PR5wHBWa5gVk+CfZvIOo2xy+hd17F42qwIL9zytQvwFAv7+9AiDHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJoXbqWF; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJoXbqWF"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cd33336b32so38696421fa.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922119; x=1706526919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJF6RPp4ByF2+TpwJUkUjfXUjHYpkhqnvraoyw5sHp0=;
        b=xJoXbqWFuMXe2YZG4229AZeSws9Z1UCUl3Iuw+AiEWUnPyZAVvZOvMjOPKGpgquxyo
         VdztJcuxHfIV2YRMW2DRkGnXMijjN32JmMKaWG7avPUF+cSp+veG5IZva3LhPLhrVSfq
         WQYQci8D8NMUCDSG8TghY3RZN0f6J62GZ4YmE6z+6YDkBBJrhynSgB3+MuNcJgsDbsj5
         gYDH3iVRvZMmJm8l9nrE+lHiaPCdwmaVrPgdKcqCHaVWzccdOqGyhA7pGR1nUWGN+fOI
         D4RkRnpelYKQgcvkd3MZ462+SXA1zqMrBy0zxdbWWfIiUtId5TmNUodA587bE3XnJ+O1
         gkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922119; x=1706526919;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJF6RPp4ByF2+TpwJUkUjfXUjHYpkhqnvraoyw5sHp0=;
        b=CE9ZuVayQ9pAXh9L+u6XJlkR/dpDL+T9CjZNpxsaDcDOUEnWsq2esLjMaWZryOpaxj
         FW5HNv4TmCxUybs+geN9OfcGDxybtBGq/kGG/HoWAfI5U7Ed8m7geZi6GFs6ASqiyRFm
         UWkh/v8bUX/n2+4B4NJZpDouoFGB6omgz2IMa1gO858HsaeSOWYIvkRjXqMRwcb6ErEf
         TT4YWX2qVvqnZzsCc1Pt3Ldr1cELf9oD9e2oqa89h3XR381jHQPt/YsPhiCH9VKnu74n
         7vYwBN/EwLqL3hWPu6XFtKbSIJCZ0OB0wjrIF/Xr5lNBSBu9ToDd0+zZdS8pAUcP13J/
         Xz5w==
X-Gm-Message-State: AOJu0YzyKaWx/Zr4UakxJV+0KEqt1Yj5uvT4PDeWlVcnwvMVUsUl7ZPT
	FM2LgZN+1u53iGRmW0Sg7yW0wDIukO2PDXUZLavSyMTtQbIpxhBgqpUU2YbVZZ1oimrQBSqms0b
	Iju4=
X-Google-Smtp-Source: AGHT+IEWwHRPP8j2MklwDstm9sjp83vi0PaCTfFzTs8W1vQy9YTYKn67IjFrwor3Obo97PYCN+qTnA==
X-Received: by 2002:a2e:80d6:0:b0:2cd:827d:e37b with SMTP id r22-20020a2e80d6000000b002cd827de37bmr1770344ljg.59.1705922119546;
        Mon, 22 Jan 2024 03:15:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 andre.draszik@linaro.org, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>
In-Reply-To: <20240119111132.1290455-3-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-3-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 2/8] dt-bindings: i2c: exynos5: add
 google,gs101-hsi2c compatible
Message-Id: <170592211777.45273.11208171574563746801.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:17 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:26 +0000, Tudor Ambarus wrote:
> Add google,gs101-hsi2c dedicated compatible for representing
> I2C of Google GS101 SoC.
> 
> 

Applied, thanks!

[2/8] dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible
      https://git.kernel.org/krzk/linux/c/a0f80b86ff53c2bb99662008269096ecb45d7288

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

