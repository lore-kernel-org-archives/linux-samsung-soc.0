Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A85F40BFE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922115; cv=none; b=BXDiM8dMi/ZUqPgYvhNxEvuHx8eiRNYSU90CEAwdxc5DbfswQXdDmruhVTQ+lZ/muyRjfzXhMwkQItuBWKMYYzxJO/xd3YLAGwGDLlZfVXok4o2zP4TR+MNs2+NSD0/IcLOcmhaqp7donee7PvTjGuXiqOxYMMRqXXb/z6aM3Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922115; c=relaxed/simple;
	bh=airGui2G4THNM+DNbxdncbidgaRzT+yLBcqr+yEOIxo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NOX+PTB9ang2Y/PRhmwv9512AFBizEMIs/rMS5cvKhSv/VA8ERqaXPV9Bouf9MbwCgncqvTHNAQrmjqIhrnkAX1OPxKpGJ4P6A9ZTAqdJMlNl23A/NfFrCdpqoDsd0sVkSM54SwENY4g0hBp82mPlyebCsJ94oCroHq2ltvTUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAKIlpUk; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAKIlpUk"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55c045dc47bso2298462a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922112; x=1706526912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHHE/yIzAjG5ptVoS9Wcq4EbLykqNcWJXRY/7PSYcP0=;
        b=dAKIlpUkbSP9aTGM3tDQju8SsYo5Am/N87Uc5K3Z/z0PU/BMFIkbpvlviDQ+P8A0HN
         nppeHbO/6EqF4CUH8oWC1ZsqyRJfX62/HHpgtJ8YDqE8G7j1rU39K8oyXWl6PBI300rT
         l3+r0hPTfZ3oJLhJ0eY4tEggUaSFKcmZ6Oko8EiMaabjOHf7PTp+mxlM8wbW0uuOw2o9
         HHzdRy1MeU4ivBZIyCEknNXER2Jh79kvWovk0XlnBirRE1nJfAtr1xPDtbIiOt7eVjvI
         FX45izE1frbu6hJSOUogh6e1uYeU1QuNJ82Tu19657NNhwtJLAy83Ru3YIwAAcM7oGky
         3iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922112; x=1706526912;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHHE/yIzAjG5ptVoS9Wcq4EbLykqNcWJXRY/7PSYcP0=;
        b=LaCkCKu3qPFbk0v7vVSbzckBHH6P8RxyswgyqcPzd5I8HRCVUwdmEYYjViwgl1rwqU
         DsDc3QUI0alWAx+S62IwidC1lNnoBSvE05MwUqdqq44YC1OY94Sy2aTYKPmOz+1T9yuh
         BvNkfEONW1Ro+aypI1hn4jSzI427jS85yNh/AGuCnT+BGMAJWMQlRKoOSV8ZfqFywUTZ
         jGVBA/LcDIz1z0VzxtPRqLe0vLI3OMJLF2TNqULE/4dpdz0W6oE9bP2Rfps0izPCpeyg
         2LV2Th7EG3XyhaSbgB1ioVxQmkiCbwlijEv7nfq8r2+FGqkNY21cEsMQizUpPL6axgyM
         Z9Mw==
X-Gm-Message-State: AOJu0YwKEA8uphuLmogcPeIsSKwqXt8JknoRLp2y4AtlZFa2FVzqiGMK
	jJWsxUfddEcSaxlC4AgNQTABqfRfNFrQtMlcmjgV8BFSBkFBElhe4TyhIL1HlDpTudDppBvKnAk
	Ogdc=
X-Google-Smtp-Source: AGHT+IFazBg/Kxcqln3E/jZS+4mozxA58v7WGcPxFMJVPmxmaRwO62vkGJUx+s2/J/k2BoqAex4U9A==
X-Received: by 2002:a17:907:771a:b0:a2f:17b0:a193 with SMTP id kw26-20020a170907771a00b00a2f17b0a193mr6125034ejc.14.1705922112040;
        Mon, 22 Jan 2024 03:15:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>
Cc: robh+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
 linux@armlinux.org.uk
In-Reply-To: <20231221230258.56272-1-martin.juecker@gmail.com>
References: <20231221230258.56272-1-martin.juecker@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: add accelerometer and gyro to
 p4note
Message-Id: <170592211066.45273.10327831011421754797.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4


On Fri, 22 Dec 2023 00:02:57 +0100, Martin Jücker wrote:
> Add entries for LSM330DLC accelerometer and gyro to the p4note.
> 
> 

Applied, thanks!

[1/2] ARM: dts: exynos: add accelerometer and gyro to p4note
      https://git.kernel.org/krzk/linux/c/497b447cf89b87c8fb0d0b27994258ed18ac355e
[2/2] ARM: defconfig: enable STMicroelectronics accelerometer and gyro
      https://git.kernel.org/krzk/linux/c/213b755e42e2e7127777f74d2174bb4843a9b03a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

