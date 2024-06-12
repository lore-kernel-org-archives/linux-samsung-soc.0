Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1476F182AF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208678; cv=none; b=QMkanOxQ2i86wmCeYEKSun3DaYYPEjHfv1b6JuQADOIhBjV1fqVXpSYRK3GwrfdMxkmjo5Y2fqQULkZF5/Ab3G19ASERzVUbG+edwkBV6jNd7h2JW5LoA/KMNerVAB7bOZWR6DrNRY0yVyffo3roVzZQ6gvOnNvVzS+yKaz30hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208678; c=relaxed/simple;
	bh=NBOPa7ixl3YCAqAXNATRNpkFzhWTMCE4oxFIwp0VhQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJlXJFmiU5XYMxzEeeMIrvRSmWUcio26V2zohiSKGFLPCSJVvSviNRv+fh9vXv7bY3xas5lMBo2VO26MRkikOEEON+LTWvW6iTBPYIX0LpciUFgR0KRb/FFKxzEVgeU4QKFd/JCwuoHUnNToqzTnRszNsIKUwUzEdQFB1fqcdD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mYNtb+a2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mYNtb+a2"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebe785b234so34383541fa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208675; x=1718813475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iJi53GLd1r/LDPyYuvwcLLbCQpihYJNOT6LQNKlbh/E=;
        b=mYNtb+a2odk313WybyKu+S6epvrMvqhDm0nm0hi/cwwADFitvnxY1ddPUs45m6XE3Z
         8L7hvcMTaAKDDDXJcEAXY3vpgZa8r3rb36QLfTRtplTUfpfBVso/KKkPFVMi7//5iVfm
         Pq6R+zc8JuU2aJaUPr00C3nc977jPZEsKNG9qSadosxp+iR/jz2Gf86AboKlJH6N/649
         0w27u6gBtfw3vUO8oewa+398dYb9McKKG8iax9jK/tE6X6Y0QUftU6KPZCEAG+uor4DL
         PGHQC4KaxMXBj/kVvVy3W12/gmPwLfGANiFqM1tHajofjuZibJvlBmFCUZi1Esbtl1By
         BALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208675; x=1718813475;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJi53GLd1r/LDPyYuvwcLLbCQpihYJNOT6LQNKlbh/E=;
        b=Z6Ikr8CsDhE6ODosfS1QmXntbeTlJENtXgGG96krAb6iCxdDpoMvB2XmzZNyQ1IlWS
         9lKTkqjB360LeCyZfYFpJnd8xucX4/EH/qCAned7epvbB9CpjEWHuLPFaS7nglpFEx2t
         4XKNLxvJMmFYhInaUYx64FbCCVnEvU8MT2/YlKzvv98Yn+GkXDQtoumTatELIK5a9fVj
         gIELt7SdeUaQUR7hNZaPfC4/xvfGnX6sWXeU+zfou1eku3KisXMtUinX2hZuNTk2YbTC
         9kFEtJR00caL1GFusT2JGGDvNAV9WhbRBx9a976TINyPMi/hsOaEoTTGvPR5EpvN421K
         ltAA==
X-Forwarded-Encrypted: i=1; AJvYcCWnwMKnpCQ0WzythPk2uATl1EcfyW+SxzBQgmC/iMvcLKTe1jHPz0VGuhjs6cEJmzcoYoKgbiDRc/R6IRT+c4zQIORwo/qmMAvzmaBlFqmvGE0=
X-Gm-Message-State: AOJu0Yxn0+fCICpDp85npFcv22YZQ83kk33gWtWm9t+kJ4S7J++2leYq
	6aoJqeVvtZsKUVAzAEXTa7m6Y3h+awT/HgGbvgMLIVHji4SycpsbXiuHzep6lC0=
X-Google-Smtp-Source: AGHT+IFEiyA8PufkPoU3KnVd2ZWI8HOxNk5exq7HEVX1hIx1h38A6807cHqbUiBLKu544kA8+esUWg==
X-Received: by 2002:a2e:b0f5:0:b0:2eb:ef0e:3f5 with SMTP id 38308e7fff4ca-2ebfc9cb133mr15237641fa.18.1718208675258;
        Wed, 12 Jun 2024 09:11:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871f8efasm30598455e9.44.2024.06.12.09.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 09:11:14 -0700 (PDT)
Message-ID: <6c707cc0-83d4-4a00-b8bf-359116331609@linaro.org>
Date: Wed, 12 Jun 2024 18:11:12 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: phy: samsung,usb3-drd-phy: add gs101
 compatible
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, lee@kernel.org
References: <20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org>
 <20240501-usb-phy-gs101-v2-1-ed9f14a1bd6d@linaro.org>
 <CAL_JsqKDyrYBTTcpmoM-LbQUWch_qd3t47WC0yafVJcz+Se4yA@mail.gmail.com>
 <0b594358c94ebf6d6585005a827e69c274014983.camel@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0b594358c94ebf6d6585005a827e69c274014983.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/06/2024 17:57, André Draszik wrote:
> On Wed, 2024-06-12 at 09:37 -0600, Rob Herring wrote:
>> On Wed, May 1, 2024 at 3:19 AM André Draszik <andre.draszik@linaro.org> wrote:
>>>
>>> Add a dedicated google,gs101-usb31drd-phy compatible for Google Tensor
>>> gs101 SoC.
>>>
>>> It needs additional clocks enabled for register access, and additional
>>> memory regions (PCS & PMA) are required for successful configuration.
>>>
>>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>>
>>> ---
>>> v2: avoid having nested else/if, and instead change the existing 'else'
>>>     to explicitly state the platforms using 'if'
>>> ---
>>>  .../bindings/phy/samsung,usb3-drd-phy.yaml         | 61 +++++++++++++++++++++-
>>>  1 file changed, 59 insertions(+), 2 deletions(-)
>>
>> Going to respin this? Because it is in use now and undocumented.
> 
> Yes, I'll send v3 this week.

Yeah, I was just about to send revert for DTS changes.

Best regards,
Krzysztof

