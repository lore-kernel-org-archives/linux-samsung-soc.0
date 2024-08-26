Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538913DDD9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2024 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675741; cv=none; b=rGsty+ld6sfpBfUqj9nLcm4cSiAXKXJjFv4d7KMiGntS2ue1dbuz77Yom6RnCjVlnjdq0gWHHmpyp24aCRMmOIYZ1Fh/3Ts6+lYIxYWGB2dM/sMOChkj4Y9aEEE3QjEyoYoP0dRm36bluQ6BIJrL4Id0fu6aDKcgCA0rp8ktfXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675741; c=relaxed/simple;
	bh=DeKboTFaIRylI5cauzCxni28LIIe4ZjJTqGzGYlOr08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nvgrp2oHauNiNYEAwjBZELQVTgtFtnaJmqJlJchhAsQYI61POp8aRE/OZPdcX9kWcF7BND+TAn5knTWi7ZVrRicx6j2bfZyExsKJcaSKNTi8/Zy3ldi95Ee34b5RF9dRQ4+drZY/w1irmqxZpzHo8ljMlhzVGiN5YxVxplHFa/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qNivducv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qNivducv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4281da2cdaeso6482985e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2024 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724675738; x=1725280538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjbU7iYaf5gNBv6BUFQzfjGHnybRTGE3Py8s/+lGcUY=;
        b=qNivducvmpYCjxiwStmOrbsbCS6NuBarghvk+Pi+CPEt1zJ8qhxgSVIyT4C2D9YM8w
         gghK2BwEoGlWU/1s9p9QD9Y76EemFKokOY3MPzff2mmDZY6/6FdEOagpxX57n1yujZ/g
         SIa900s8y+PyfhE9NNSi6di9Ik86E+G0u+mcQ2UAAU76KWwFN4F+4HOsdt30bIGrjGu7
         BxIGt5Zp90k6/u5+tmOB4t/gpbCxU7XyI3q8qr4JZbm7+cAcfDbC63uSNTvU+gx6gjll
         tyI4Z/uzEXt33pvxjFySCUvTGcCgc8ewLbobqz/cjdalb0jgeezreONfmzSahYAuqyvN
         4Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724675738; x=1725280538;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjbU7iYaf5gNBv6BUFQzfjGHnybRTGE3Py8s/+lGcUY=;
        b=l3Osuo9tVby0Ttu+eb2eEdFiPp1hmJlgIg1th2Ah+ObHw46rKRJLYMDKPL9gzTOjR/
         mmO9LGr2EKPdam0iMWjhVljB6G1KvsEgK2eOPMhTBFDmpMQlQpxCuZziUkveBniE435M
         1HIeHbpH4fzt5HPBmKkkfj+1RLOBLOT+qV5gattmQxpE+AmBHnjGC4w3B6/GKDJYnBoL
         RQR3PVs7KM2HruokYBdy9COWuzYBkWOZKBLWA7Z1ahhuYRkWAlQA0k6iw45bfyjVV1VC
         e+BUQVBOurzQh5ePJJIT4L9abLbl/FCXgy9dXm/s4Dmy7HNCfI5BnItncjCVhb63D5mw
         11YA==
X-Forwarded-Encrypted: i=1; AJvYcCXnDFDWwxzMYDbUYIE0QYY3efen4S62DohxcbL4p4zCxxaPq92g55jifudHIBCC8NJhd1HrYCYeSRKAv3Dt16721A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRF7t0qgziZtQ+UmabG9zkEFWmRGPLAghRJzkZBqfcQe7R7ix
	qohUfOJQQhTTM/MntsBmwj1c6SKcmvZX0af5/cV6+GOTaWfkeh7D1m0J3kjDnLM=
X-Google-Smtp-Source: AGHT+IGdjTP13X5IrWLlNDrXyTJ+ob2cRg1i3qlAQ9iN9q2w4Z2poHnIMKCtuwo9FYF2nia+vxYQ8A==
X-Received: by 2002:a05:6000:402a:b0:367:95e3:e4c6 with SMTP id ffacd0b85a97d-373118310a2mr3659561f8f.1.1724675737954;
        Mon, 26 Aug 2024 05:35:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730821a898sm10658048f8f.96.2024.08.26.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 05:35:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aakarsh Jain <aakarsh.jain@samsung.com>
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org, 
 hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org, 
 linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com, 
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com
In-Reply-To: <20240808134432.50073-1-aakarsh.jain@samsung.com>
References: <CGME20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111@epcas5p3.samsung.com>
 <20240808134432.50073-1-aakarsh.jain@samsung.com>
Subject: Re: [PATCH v4] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
 binding
Message-Id: <172467573565.54173.12707172575604889412.b4-ty@linaro.org>
Date: Mon, 26 Aug 2024 14:35:35 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 08 Aug 2024 19:14:32 +0530, Aakarsh Jain wrote:
> s5p-mfc bindings to json-schema is already merged with
> this commit 538af6e5856b ("dt-bindings: media: s5p-mfc:
> convert bindings to json-schema"). Remove s5p-mfc.txt
> file.
> 
> 

Applied, thanks!

[1/1] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding
      https://git.kernel.org/krzk/linux/c/259f5082721f1d17b4e5b9dc2bb430821afd95aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

