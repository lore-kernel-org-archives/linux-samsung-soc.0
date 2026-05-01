Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3242848C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 May 2026 19:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777664437; cv=none; b=KAhaUYLFj4Rfwq62t4TJNapRt6p2ItwPjs2UKv08ILgvH+GM/TYmkpZedghz1MsoWjZVqWvselmT9RcYfX0djaGRKB9TzU+vcoc6G3lc6FiW1CBY2CLs5xIYAu4zP3VGf7OHOaNoejPjUawnxHLOs5zotDY2/RzfIJsNsc0TlEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777664437; c=relaxed/simple;
	bh=E9GFsmnekKsH/6xM/QZ53TOVyqAnriWM8ZLZsUdfH0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHjIzy3jv0rZ0T3pKVrxQ2vXBdaNb4R6ZKdRYhtd5hEI8ojXJB8pC7h7gTRqwGzWw/fOjENvnYTwcpYbsMB0KL4ATF55FduB9/w4nBnfCsaUNXrVSHty8UkYGq+IpHDMhnb45mwdOAgKBLNy0X+f2jq+lMWGxZJJMn+F+8LJLBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ra2U3c+0; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ra2U3c+0"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ed0a45e970so2707123eec.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 May 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777664430; x=1778269230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8+F67fOWD2tr6DD1heUFiUUyHmOTJ/tbCdix11hm8s=;
        b=Ra2U3c+0J/UdYQhUkAJV2m3CpiNxw6yLz25j3pF9agkdm07D/EcHmWEmiXKoY106cx
         PAKOJdhnlkTaCEsFAoXNCCd2t7lsi7llhbbi3YiaJ7/8hl2vH4q8Q0j1HXdax2DQWd9c
         Qgl9JaFD5/ydcqtef1w8gIM6sxS5JOitIisQRO6wsVMP9JrSqn8f96/0miffMH3Tf+F0
         yL68d1ITCeItoNEWu9m5wOsq6EGY3jn46TCxDE7kehrESPT8FaI0Ljs6srR/npKKecwo
         wsltWoF/bT5jaSU/gYYqz1REZ+Kt1HhikcXQhbQKizB6dMPObb7574y6Ssn4gBAv1lOK
         +kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777664430; x=1778269230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8+F67fOWD2tr6DD1heUFiUUyHmOTJ/tbCdix11hm8s=;
        b=U1zIEFB/tpQe0NhYtW33/RzWEdrVw3flxWyFOk++IevR+y6aQaju6yAzVDVIdO+HCS
         DXbuxv6/zexVtRMEn66AQlN3HUp3vt63JhefqvV45g+TEVv6JIGA86MTl9XhYVtC2IvE
         7YjGUehcBk4utdoDIDmK31SJzFoPD6cIiLDoq8R4bHsEBzEpeNTkwAbdQ4cduOl5QvHR
         +iPuInm1lwD+p1m83smVAMVMCvsYgubPagA7aWgp3SHmEuL03QiOJnR1D7zEtj5pvz75
         Th3wLcpgwH8UTPR/elh8GKcaNtm77bfIxTKNzi8J976noH7rT/L3IUAf0QfnpeyBYcMb
         01DA==
X-Forwarded-Encrypted: i=1; AFNElJ8cpoHOW9acFBjhuXnEbI/q5TfqjtKma/xIfAOwk6audejS3OENeE+7LCqMMIuzRCXBqwSC7Z1oyoAR81LPsgNh5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpe9Gn3NlXbcuVG/CAZTZlGIYPqf0yN0hbXvp/NLPkDh0K57F+
	iMQaaTjh8reTP9AaRgqkTYVNOfv416efiiLhGY1nucQSh6NEwg59lxTZCUQ9X9wvmQ==
X-Gm-Gg: AeBDieu0pL1Fe7d49vX4S1spiFpLbKBtgx2ZaEOWHrpeIQBbL95tCIzuvKmkYEsRSbR
	sOoSNN8FNskPiZ3WwoLAkwBAj7QmWGmjzUWMu3VjJrsdNfqzBkW2I5qgxjTUAZ38x2gnT8o+tbT
	oE+ugeq6nB1p8MvujHM+BrmFwwhKdRtsqNw+M4Du8173pLm/fhLaeSpZFHpFrR8phWYGRFUkSO+
	KJuONDeUluu0BymWSZfHmIZ5KZ3gEZcwvC/hVHlmazFrx4mqWJ+naHT16QQfg7o2QuZ9q/4PYPP
	Q9s/DBo/CxoL/ILdsMAfosskQCwCUCKu0ISHKxkV8YWatysaiVKFNc3iY+pZO7R04ikxiS0neaM
	Sgf6h2BbhNYkyTq9qrwBgiwePZZ45qkFmu7EAZ3RnZX+v6eJhfZPv+bUhqFWFqvzQT/xWLA1JnF
	dTHPx0XaRH/6MPTF9kZq8LQ4yL/oLx1MNhTkDZg5KxpPz0noudgdNO9X+TXHetMaeqkPvmqLBOE
	FeK6AoO1xmjPpVO/5QrVGxdhpo7p4IWClPr/h3+ZASUg9I=
X-Received: by 2002:a05:7300:6c12:b0:2ed:e12:376d with SMTP id 5a478bee46e88-2efba5a7316mr301846eec.35.1777664429125;
        Fri, 01 May 2026 12:40:29 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:5e5b:112e:7ef4:6fe2? ([2a00:79e0:2e7c:8:5e5b:112e:7ef4:6fe2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b390df0sm5587081eec.17.2026.05.01.12.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 12:40:28 -0700 (PDT)
Message-ID: <d5d36882-5356-4b7f-a73f-70b8edba28d7@google.com>
Date: Fri, 1 May 2026 12:40:24 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Reichel
 <sre@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-3-76f59233c369@google.com>
 <20260424082639.GI170138@google.com>
 <fc767096-f39d-4088-b3ad-cc85bdedf36c@google.com>
 <80599996-00e9-4e6c-9215-cf1c33a861bf@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <80599996-00e9-4e6c-9215-cf1c33a861bf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 4/29/26 9:59 AM, Krzysztof Kozlowski wrote:
> On 29/04/2026 02:29, Amit Sunil Dhamne wrote:
>> Hi Lee,
>>
>>
>> Thanks for your review.
>>
>>
>> On 4/24/26 1:26 AM, Lee Jones wrote:
>>> On Tue, 31 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:
>>>
>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>>
>>>> Add register bitmasks for charger function.
>>>> In addition split the charger IRQs further such that each bit represents
>>>> an IRQ downstream of charger regmap irq chip. In addition populate the
>>>> ack_base to offload irq ack to the regmap irq chip framework.
>>> Please reword this commit messages.
>>>
>>> Using 'In addition' twice in such close proximity reads a little awkwardly.
>> Thanks for pointing it out. Unfortunately, this commit is already part
>> of the linux and linux-next so I am not sure if I could fix the commit
>> message retrospectively.
> I don't understand why you decided to put this with USB patchset. We do
> ask not to mix subsystems all the time. You made it unnecessarily
> combination of at least three subsystems.
>
> Do not do that.
Thank you for the feedback. I understand the concern regarding mixing 
subsystems, and I apologize for the extra overhead this caused during 
review.

The decision to group these was driven by tight functional 
inter-dependencies that I felt would have caused build failures or 
regressions if split:

MFD & Charger: The charger driver relies on new macros and symbols 
defined in mfd/max77759.h. Additionally, the MFD driver handles the IRQ 
chip initialization and defines the named IRQ resources that the charger 
driver requires to register its handlers.

Charger & USB Type-C: To avoid a regression, the charger driver needed 
to take over charger mode programming from the TCPC driver (where it was 
previously handled as a workaround). Merging these separately would have 
created a race condition or left the hardware in an inconsistent state 
during the transition.

I see now that this made the patchset difficult to manage across 
subsystems. For future cases involving such dependencies, would you 
recommend providing an immutable branch for maintainers to pull from, or 
is there a different preferred workflow you'd suggest?

Best regards,

Amit


>
> Best regards,
> Krzysztof
