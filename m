Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C515575F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733730193; cv=none; b=B2sM8Fml0Ojncz4JZ+n082YwiKA+ZGoEBtsUbuaQ1PGOyK6NW7qBDcfp85jd+mQX3M2PT6B99X1TFjKp6/zA6JbR4Ctx6Vj1P/OteK7ZMnwiP4UAZaibEHXSknki8Dn9JFNatBrAbYzldrwC3bcK4lXJXSiVv96CH1ooNoIbqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733730193; c=relaxed/simple;
	bh=5SUPyYL9CLudvKpRplV8NotoHf7mZ8aBVuxAUdV5tFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8wHimNBqPkjqouCpDWRzEGrDZD6fLx3kw47b/UFYPBZio/CaHdR1DoeKqiAtx4VlzCGOKDOazWWhnUAo3h1/DfEBKE4yR5BFV68wqzSYa7bJ/YuJ1mJPDHIcG9sVK0mUKrtBuXn2t4vAMYymAJgQurNte3KX2DiSdqifrHRMCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vcLgJyR4; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vcLgJyR4"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so4472427a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Dec 2024 23:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733730190; x=1734334990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5SUPyYL9CLudvKpRplV8NotoHf7mZ8aBVuxAUdV5tFI=;
        b=vcLgJyR4VELldb8Tb52VP7YVuyTWxg6iKMf5pqR2BAR0VwnL2xcG6uDsNeHFIX4ehh
         c4lA2HXP2kreeBRYw90Q05sHOyCyAcogbhM9Z27CWOX39VCs83v/pg5WWoUH0rsIAj6Y
         MBN4J+NI8+C1wyfTYcuZE+/rJxvWmFqZqndYOHeiCutoqjsqWEz74nJ/dBV8s5qZ7sb2
         9s35XBO+FRlLWYnI1ZeEkSB4u4m9KCmrseRt7pAHN8iCUdluxfor1Aybz+je/uO2K0LC
         kfCNLUCDYO/u91xjIpbZgVpp8U0Z47hmH0GkFipndIp3fVy3n5HdvO+Je8Cs2Xr019UB
         k2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733730190; x=1734334990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SUPyYL9CLudvKpRplV8NotoHf7mZ8aBVuxAUdV5tFI=;
        b=TNkEhl94QZUN5qZSFpnpdy6iEV0kkafyTgIq6qViwyBRkjmCWCVy93PJSI961BoVaM
         ntKyxHRdQv/iEosS603egW3WjpkoZjJYdg3VmvcZXqeMLLNKXjW7SyIXvIgJqiM31xjt
         If16G1eCYOUJSu1bGTDE+KekqnEovKkcVSaoc81IzxsGZ0nymHsVC58y4JL9W7IBXAK5
         6VfDFWigL22BP7y5UMZkS34QQNAm6UwFkRBv66xCTjaeR0G4FHOgJk4oBs7GizeKpTFl
         zlg/xkL0cjLElaw1xB5Z2Gf+6fIR6fcwLzdaiikS6qpqJ8JPY4HNSI6HZTYyhNZHyph7
         Lp9w==
X-Forwarded-Encrypted: i=1; AJvYcCXVRCUeyVviNHgjQXEqpqQq9LB2rdIH3rMtDf3NpzSfSrbL/TtDKKkHRGjNoAR0IYS7LZqGrUlA2HW0pJtLYnCGxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxz0MCIALEOr8HLS1VahiizD+8vtGHAlZSUOnTWtgSGxTfP643
	sBpwjxiRpCg51P0WHID55C0yGy2tPLMUGcwSo9pIUSQiXPaAsxhG/essc27pgro=
X-Gm-Gg: ASbGncs+M0XTcQDckD7AnHwz6zuZVfQNQyW7a1x3vsSzLz3r0DbjcwwOdRr12cjp9wi
	rJ8Ud5gh4Yxl3ufwFuxCHqB6jyUVXqRCTWBqkkvlI/Dcg8o51yInGKyG5g1rG7BFtwdZzu3tim+
	XWl0YD+XNm47PODAx6OM7fSuYf4oJePIIO9Cmjhhisfrkyu7oCYU46ZwNoOWuMvfy0xAva+eisy
	XzF/ZEA1oTqXl4X4CH0ZnhvM8GKOa2BSYfx3kPh2rMXFV2TSIZQZVZP+g==
X-Google-Smtp-Source: AGHT+IE4Pfx3VtI619bsbgSpgxWDTPFXq9jVrwkrA/qIDqOtyMaYbAKpFXJ+v5CONhA6hibvHdCtAw==
X-Received: by 2002:a17:906:32d0:b0:aa6:75bd:eb5 with SMTP id a640c23a62f3a-aa675bd0fc3mr426902866b.57.1733730190277;
        Sun, 08 Dec 2024 23:43:10 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6845ab4absm133840466b.73.2024.12.08.23.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 23:43:09 -0800 (PST)
Message-ID: <07a4942c-023f-495e-a4b0-e451c949ad80@linaro.org>
Date: Mon, 9 Dec 2024 07:43:07 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynosautov920: add DMA nodes
To: Faraz Ata <faraz.ata@samsung.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
 rosa.pila@samsung.com, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 William McVicker <willmcvicker@google.com>, kernel-team@android.com
References: <CGME20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83@epcas5p2.samsung.com>
 <20241204122335.1578-1-faraz.ata@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241204122335.1578-1-faraz.ata@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/4/24 12:23 PM, Faraz Ata wrote:
> ExynosAutov920 SoC has 7 DMA controllers. Two secure DMAC
> (SPDMA0 & SPDMA1) and five non-secure DMAC (PDMA0 to PDMA4).
> Adds the required dt node for the same.

typos: s/adds/add, s/node/nodes

Hi, Faraz!

Have you tested DMA on ExynosAutov920, did it work with the upstream
driver code?

I tried enabling it for GS101 and I had some questions that I couldn't
answer, and I moved forward in the meantime. Would you mind taking a
look at:

https://lore.kernel.org/linux-arm-kernel/e4089855-aca9-4993-bac6-e59370cf7954@linaro.org/

Thanks a ton!
ta
