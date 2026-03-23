Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F833B19D8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280280; cv=none; b=mesvb331/ZqhG/NcLAXEfQ8DS3R5F0QY8U8mxmbH3jOqaCPc+KdaKqpWm1WdQ91XEFH8z4Zm0YUiDtziMaZGEkdrTUTst41RCpV/p/cwAnQT0f1Mkl5cUKsOtG6jtx52h6tLJ/tx9+RDMVPpUw8i7MPqoCjBL8S/WcgBsewRok8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280280; c=relaxed/simple;
	bh=fle84fxG8v7Y97aLg01gA8qEy/l9d3XHUYPOq+DwHDc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E/quU8tkwafuMwzsVidFvPl4HYq5GHgNxVRVUvD7JMbDIrnEgLLyTe+PiXW520Cr+P9cjryRlL9gOxs5bxBj7GiYSLsPr5YqyRs1wVKoLrTxAR2G+tjiRVxHr+gJmYEuRX+q946Z571hbFZ5+w48dC+5gvrh9w5/8uSM90ylO3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egUpfqTR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="egUpfqTR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso2913332f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2026 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774280277; x=1774885077; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+799mjtJ424ayaFpNGDyPK5HSrH/GAuIDLlXAToI0C0=;
        b=egUpfqTRHKE+79O2/V4Ji2aR7vL7UMIh9t7S9dRhdZd9g477MFSpjyfSL3n8Py8k9O
         IH5eXHNC1dk3RUahWyOum1/5w6x6z32uyD4drU9wdyG3ePJzZHMN6BAJa8G+yEthlnRc
         6zRE0Y1fx32QUR+Am6Z852U2Auh19QCL6+UNJffxPUID99oMKInD3h3XKjSSxj7Or+PK
         xD5v/5Mt3TtJNaJgMxLktjPZBgyoicn9Kr+7hvZZ2ehoG1dWe32ETQNAe+8GbqsawK5V
         vCjePb7Z9mWDv9AvdgnO9nDSQBQIEemep03UrxnR3E4FDh6jEiQc3jxD9LuYA027lesL
         qUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280277; x=1774885077;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+799mjtJ424ayaFpNGDyPK5HSrH/GAuIDLlXAToI0C0=;
        b=MMJkJN9rvExHhAB8TId6j5drZEI9uCtfeatTbKb/FxANh1UDn5HI/zSL1Keqy4KToc
         p4NIT6oPyMYVpUehyKWw48YPxQqGUOmlKOubn0FxK3JeOz1dB5KQSqpIc2dijz1a7uEM
         22Hzb/8p5nCgGCrQO2DwdxvLEM/I2VwHylsAELoQ7gJcJyu3ptG6ETvq+tOkt0DpQ3RT
         q5rR5QcfDNGAAauC2P2MZ72QwaJW+Bckr6t8G5xGBqS9G6zVQ7BZc14z1f+4cWPIcGUC
         7IGy4fI1lHuNCCJUSmilvv/EpAtY6LNAxO5pKyLk5Ojt0FOauc97nH4Yc8FoBhDGGvcZ
         CxWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAFBmTEPltAzuKdRqqJKgSdQDbPbPP6GKHNOPCSJFnjWQS4vVc1s7rPra/Nj+4TPbzF88lELYvPOYLMByCsYVSTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/znmiI+2j9n3DWHVs/uek1yVc5vPXkfiAwlEgPC4NrCltqD9r
	LY8O4V2x1eILVf9fzRBCEYV1V7td8PsiowTmG/zbSsbue2a/oJeI4aG3Zu2x0Wyhlpc=
X-Gm-Gg: ATEYQzyI08ytP++Qr7gIzUDJLfzhMgcUZ72yaUumBey0OnX7FBkkyauJk4du/Ye8lut
	ElAheU8LIrhmS7hXXCJF/T8B23KGtU0MPBtldLLgA2rmcE9zXhjj7K3jVaWo57cSI10wIZS2+IO
	5u1nh1N01H7lkjxlzljJm9u4eBFXO4Qjyea1Q4hp0a3WmU/aYsd7zY29DGBOq5+GK9eSkc6vQHz
	Ef1g2jO77KlRS/AkWlAh3qlg+8ch2eOvm2oqPho7mBiORq4OUbkxa8itBloWbI3ol6Gqd6B0DLS
	NMrNYxIWQuqZL8OPt4MdYfvnryIAZ++92wmzoIMW62q6SH9WFdhyyE0+av56j/LgbsijhZGXmpz
	skb5tkzs30nN2YMx3z3s9KmuEssQ8Zf/lpYlFt2Y9oPJMyzC3M38zaWXieESw5TxLitcvYiE4K0
	z7g1d9mv5zPi+HqJlYsVP1T8AnSGSINwO9NseXtIIiBwWZbVLCX1rnSHZEefogjv/+zbtJHbqoL
	Mgj6yuu6696
X-Received: by 2002:a5d:588a:0:b0:43b:634a:8ee3 with SMTP id ffacd0b85a97d-43b642755cbmr20095191f8f.34.1774280277500;
        Mon, 23 Mar 2026 08:37:57 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm33324552f8f.14.2026.03.23.08.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 15:37:55 +0000
Message-Id: <DHA9V6AKRSFP.357L2LIJ2X96U@linaro.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
 <20175026-1576-468f-b68e-4af18d22b875@kernel.org>
In-Reply-To: <20175026-1576-468f-b68e-4af18d22b875@kernel.org>

On Sat Mar 7, 2026 at 5:08 PM GMT, Krzysztof Kozlowski wrote:
> On 26/02/2026 16:47, Alexey Klimov wrote:
>> Add pmu_intr_gen node for Exynos850. This hw block is required
>> for different power management routines like CPU hotplug and
>> different sleep and idle states.
>> Also reference this node from main PMU node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index cb55015c8dce..e3f4fe6ee118 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
>>  						 IRQ_TYPE_LEVEL_HIGH)>;
>>  		};
>> =20
>> +		pmu_intr_gen: syscon@11870000 {
>
> Does not look ordered. Randomness of this file does not make it easier,
> so assuming this will be resorted someday we come with a tool, please
> place it after @11800000.

Ack. Thanks.

BR,
Alexey
