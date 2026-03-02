Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B0F383C9E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Mar 2026 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442447; cv=none; b=K6RVl37+J06bfTvegaglk+UnIstA82TezYb37frbeyJDuZaW/r1Y2EOtPOfWbBa9GI5rts/hdmUpqV9ipuWH1sVmw4k1WQHavt7SS8WLwloAJ7Zqf9qdMeu8FccuNr2C9Bl1H9IJ14Bv6D7yayTFrhz4HSlrTye6zztd5Sz2bPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442447; c=relaxed/simple;
	bh=1Hlh3tnJvRQvGvsfO4Noy/pZx4WjfAthD2cgeDPBDSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQTS24NyFz1TgNhGKvsltmJJ/090r+rKtNcjzzhcQSYWWGEK8laVihnriXxrZPfKqd85PV9cEE6eQu9jmrIYYX0SQLWwcIyiN5xZzn+pVDGgadHqhhHf5EyKOP72k9+cKc2sfCY2tU0/EK1or3wBqiKAYhXREDXmEk0fSADVv18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEfZ/9Yy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEfZ/9Yy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so35606415e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2026 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772442442; x=1773047242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltNDP6q2mUdMtPqpRgX6YzMyjY4kZxSKj4nBNx4rkj4=;
        b=uEfZ/9YyQsBmcX0cM+Uk0yjd09CVydlp96acEAYG5n6jM7w8s5HuZ//F/umP3rL0oT
         jsHdXRduiMNSeNK0XmylLirZKnaTPv7jSlBjobg9ORNfa0Ni7Y/Vp9xM1QZj7oRofn3C
         rkMDEpAAiLv+nnFDqWLYJ6L25VilF1jq2qNlc2q7icBXlvnmsM8gMrDoKsA785a7FtrW
         ApWcYB6yah325EIQ/e7O/zCkvitLJ7yCqjugL1N/Xqvd3TY3j//AHel6CS3mq/xs3cGf
         32LsnONpzlHt7s7gKGoij6I5xz1ChkL+x+SY13nttIFkEtmtfqhVJwqmRqDj/NELca7R
         vwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442442; x=1773047242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltNDP6q2mUdMtPqpRgX6YzMyjY4kZxSKj4nBNx4rkj4=;
        b=SUOSWci/HkznRqkLJXsfhAx1rS1WUd4+cUDxcXvjbireK3LaWxwMctDgAovXJ1+2cl
         YjO0L8bkoV/u0bNs4PGxeoUNnVvORSXGS+OuJGfTutvrMFUxliMtpaorhJn6poWZbmfy
         QmoP/CKzFbLmps3aJJNHTHSiqdHkbbItRog/xL6vSt1OUg3NiREwBbVSWlMaq9cdBGOL
         G3jIvBZDFZHiuoypXrZ+xq6x1zu7SaWPzmOS2ZcN/ZKewbNY94QcZ6401QkjLW1N9fNG
         VsWF+x9auRUFnI0+JM1Y69sfomEsb/FRXg+ynGERWDAY0KXEEzOip2GmDvWCt064fplu
         e01g==
X-Forwarded-Encrypted: i=1; AJvYcCVE2lQa+I0S7T88Trw7i6JJajMV4N+jIMxnHw/40gn9cob+FX1GgSWJZhcrmi9YrYV0IjYAjmTpyFkoMR5mEFfaXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu1pxzpFQUQrr4GrZ3dPqVEZRg6yusJH8YocW6C419LN2mJafv
	p190uMIdWwnC1y7eD9fYM/D4wmdgFIJ4wBFKvQqwL3CRnkt+44JR/JlTIuVYEPYDrTg=
X-Gm-Gg: ATEYQzwDb/S1U26lZlIpy6uoIt7wMAGqXtft6xoE2kxHjE1XNf3P2S6qTLTcLjOIu9J
	Fq6bU5CU75WlGoLwmFf+cU1jVrPIJ9nScUZdgX7ZXtAMs2GDfRxy/VHye8Z2aFmlu86hnPmtWVb
	miBYuqXEhtQ2hwGjx3hP7KnOpMh7QunhepoJ1aQ6Yrj++xp8SSblKCltURpT+/jVueLnUHKwmj7
	Tm/cInpZhQtJnRftk7fbESyVeEQ5AVzPX3nMwOrj3cFIYyAEjH78ThbQN/N+d77+FDhIwvAd8oD
	ERVfRtuwlVuzoJ/3Mrwfz47Jpbz2P20U/ZFrF0Dpw6koIgxQrARwhuBrZT4YXXY2DWT5Q94De27
	hsw7YB4kfO2b7CqLZ9Ma7o5dIEG8QYNY7mSxCXxDy1LPnwH6R4uOJi0eDf2fQa0G2Ofmc0H0w3M
	Pc4da6SOuy3H1/hkXpq84qYPltFasPXO0=
X-Received: by 2002:a05:600c:8289:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-483c9ba7cbdmr202248045e9.10.1772442442277;
        Mon, 02 Mar 2026 01:07:22 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm271364845e9.15.2026.03.02.01.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:07:21 -0800 (PST)
Message-ID: <b1f5be90-62eb-4482-bf42-f331739733ad@linaro.org>
Date: Mon, 2 Mar 2026 11:07:18 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <DGR3X53FPO88.3C2UO0HGRVQGF@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DGR3X53FPO88.3C2UO0HGRVQGF@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/1/26 4:57 AM, Alexey Klimov wrote:
> On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
>> Add support for the Thermal Management Unit (TMU) on the Google GS101
>> SoC.
>>
>> The GS101 TMU implementation utilizes a hybrid architecture where
>> management is shared between the kernel and the Alive Clock and
>> Power Manager (ACPM) firmware.
> 
> [..]
> 
>> Sensor Mapping (One-to-Many)
>> ============================
>>
>> The SoC contains multiple physical temperature sensors, but the ACPM
>> firmware abstracts these into logical groups (Clusters) for reporting:
>>
>> - ACPM Sensor 0 (Big Cluster): Aggregates physical sensors 0, 6, 7, 8, 9.
>> - ACPM Sensor 1 (Mid Cluster): Aggregates physical sensors 4, 5.
>> - ACPM Sensor 2 (Little Cluster): Aggregates physical sensors 1, 2.
> 
> What about other non-CPU devices? Are there no sensors or implementation
> currently doesn't support them?

The implementation currently doesn't support them. On GS101 other sensors
are for GPU, ISP, TPU, and AUR.
> 
> Is this implementation and ACPM TMU support exclusive only to GS101 SoC?

no, it can be extended for other Samsung SoCs.

> IIRC, mapping could be different for other SoCs and, for instance, last
> sensors could be non-CPU devices.

right.

Cheers,
ta
