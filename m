Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB71C84D7
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Apr 2026 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432533; cv=none; b=IWKO+aMrXowoOjb6V7rtXobT+OCA+T/QAc/3Y2GUKVl2Gva8FDSfpwywtE20PQO9sI1wkrzBJ+7N6L1mtsSIySg91W9ajOckGadT/F4iGPyBOOpqy99ZDu1BLB62LYHOc3OW92T4pUhFgFse6Qkn6fIZX7ei7EOU3LpYx2msqjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432533; c=relaxed/simple;
	bh=LX0qWu7Xbd8TT1NvBOE97BzH3UzHyHp8aIxB3oRV2iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zqtf/yhvUauSPxwlqBypM1WhNyiRF//bk+rX2SWmIKjLSSkxUPQQRONSW2guIQ4/DgBFCRvuXb9Wl8YvTyfoiseve+9+lZHuoOJEZrrkxGbNkrCmeqTCEL3D5TwL2VuEfRy5paLPPToPfd+J7zGkUYx35KR5c3ZWOCSPL08r64U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fGYXAHpe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fGYXAHpe"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so4874065e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Apr 2026 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776432530; x=1777037330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiSRutZE2i6BYCdYYnb6mg9P5OvuB1XSyhcSB7iODxI=;
        b=fGYXAHpe1Soi9YINpIgSZWLTi0aHWdHeqniatQYcxVVGY/osBdF+OfGFMELkn8ZC2S
         kbqy3Za0da5vNOq0qF8yGzKgvNErTWQExc4GnlG4ODFp2Q0lfKV3WrXLKcE2DUCOkGA5
         v69RB/Tzs4dmgp7TGA//CWuCznEqEVu/Nlg7RodmWwBDhRswLkS7t2xJYJMWtFSeNBml
         MkeCcmqxj4z0sI1JDYEUbAparuCZe4k/tNVGtzp1idM0OWB9qYZWp6me00EqOx41bNTO
         H+elb4tbHxGNVpAHjyQiWNuHhp4JiUoX/3mQ3Zhs1aqO7LtZlVzEGa6eSqUAd8GeJJLY
         hodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432530; x=1777037330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiSRutZE2i6BYCdYYnb6mg9P5OvuB1XSyhcSB7iODxI=;
        b=GlygzKjBEHd6P2Osf3FEo5u9s4zo3lVvDjGtUbXtAHyuJXxwRqEkKf4gea7b1ipzxz
         0RSbZOyR9/DI9UGQzMRXGhSX2j+FysuI3bqWjHO3agm/jZ+8mrxK17SejNy83SPpHGZl
         n+gmci25pwnV8ixajvEWeY26a2YC3gcKY+LAvoId/lNpnuWp8U1KyV0b9Umq2vuDO8hk
         dh49Y0WutDuXQhsVtAyLMen5piNx1pPL25Bk/JLTfQv1W58UVNHsXYqLVzMrSnfFfO68
         oAUmTlghEsQqknhnDSN2Jsf/nGh5DZyo6gSx3K+xBkSjlz5QJTop8XP8c2cnZ8R4BA8o
         r6cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+F8slIdcf5NYBpzRXrjrp/Z2GJVbAPdDz++KFJxZArYriE8l4+/FKNFH4zBV7okLoH+4fWylAC1J5I3ev/NjziFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv59ELjXhwO+j1F0CraFN2iDVkWx9lyqVc03jQ3EezrSl3vqFX
	qTpTSM1wTdJeghMXaVYqBUnSKyNJ8x68Gyu48+do4TIPecHn8ddK/AuU6inGQtu6Wwo=
X-Gm-Gg: AeBDievsnn/1kMmdn6svW6kN1PpDSYrj/UeZP0WGn1iaMi+sXOOOMPW4X8qTdWfNxgL
	vsNrZ5r7Y0f3zkzEEuJKa82L9ppdXqQeWFFaSkWS1oAg9Z3ElbdVkyFKgZYpW+qufO1rOU7mTUk
	+w4T1CU/pH7a9J7AXoiRwExo5Hbsn6ZA3B55McUK1or5r4zjBqAMw5omnuIlrT35IsCQ6Z1Pgm3
	Jx18rsspYk+Ckn9crg2rqpXHyT6VTgRxgDkEWzs3J3hZ5LgaEAQ0ikULlXwEKaBbcL2Lf9bS8Vx
	ADsS4+zQu1V8qDSnOPz/kje49NOsUw10C7+OmtC2fDuh7Q5MDtsz9Tu8Dy1N1EiSBty2gO5d6hH
	B6lZ1yOtnOR+HJEDgbIaTsrImdDAIaqtqxYG5b+7USBPcnAZe2skBk7eouLU8BQvr3p/vQyeLAu
	sX8VkvLOouOM5VLPfq45BcOrfR6yMEmYboy6vGq8O+zw==
X-Received: by 2002:a05:600c:a318:b0:486:fdca:ea8d with SMTP id 5b1f17b1804b1-488fb784662mr31297785e9.25.1776432530464;
        Fri, 17 Apr 2026 06:28:50 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm40049075e9.11.2026.04.17.06.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:28:50 -0700 (PDT)
Message-ID: <3a36821a-4a44-4f3a-9f0d-5ce521b323aa@linaro.org>
Date: Fri, 17 Apr 2026 16:28:42 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: thermal: Add Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>
 <DGUJIFLIOK7Y.1Q4PZQU3MOWTT@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DGUJIFLIOK7Y.1Q4PZQU3MOWTT@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/5/26 5:48 AM, Alexey Klimov wrote:
> Hi Tudor,
> 
> On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
>> Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.
>>
>> The GS101 TMU utilizes a hybrid control model shared between the
>> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
>> firmware.
>>
>> While the TMU is a standard memory-mapped IP block, on this platform
> 
> this ^^
> 

okay

cut

> Is it Google TMU hardware block or Exynos/Samsung TMU block?
> 
> My understanding at this point is that ACPM interface, ACPM protocols, etc
> appeared on Samsung SoCs before gs101 (maybe even before initial SCMI
> prototyping). It looks like ACPM firmware, communication via mailboxes,
> TMU channel, dealing with TMU behing ACPM, etc are actually a standard
> Samsung Exynos architectural feature, rather than a Google-specific
> implementation. I can't say though what was the first chipset where it
> was implemented.

autov920, exynos850 too can use the hybrid ACPM TMU approach.
I'll generalize the description.
> 
> Given that this is a Samsung design that predates the gs101, would it
> make sense to use more generic name for this binding to reflect that
> it is Exynos-derived? That would save us from generalizing things later

The name has to match the compatible. We can rename it when other Samsung
compatibles are added.

Cheers,
ta
