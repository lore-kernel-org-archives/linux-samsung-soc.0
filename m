Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0F433EB00
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555109; cv=none; b=C+IowByrI5BOUrKF3R3I7O9B/001GqCCNK49vDvwJ4kAyICPSI40vv0CKZIECHqAJMT3znANg9NXE299WwpCf30ESCnmEfPaKBGQQcmGIKOYSLVKbqQ1X3EGXTRq1/nfsqm5N433S18QLECdN+soc0g0RoDHYWzcKqyCafrM27k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555109; c=relaxed/simple;
	bh=AghABfkarHqDZQKCjjyiZmDcR7FwtgnGUdqMcOQ//v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsA9RF8QHXjg9BdZ2EfoR/sY9su1pMAj8BLAaMRvifnXR1R7D4CdtjiA//bce64N9XZm3Fad7i4QmD6ZQAMcnbc0nLmPVfqSwpv/pJBnR7XAlh2Xg11OViVWnBDQy91aLjxJNrg7JVJ8ydk329Uk800tFCILFuii4ft7Rkt2Vu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPaj2LfF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPaj2LfF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so9821945e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768555106; x=1769159906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+AGXRtrMXkyrXKzRmoE9z026WTEqpV4D7gQD8MxXK4=;
        b=pPaj2LfFQNsV88/GHrQq8j7NyFSfU/ZTDN+4B8nBIYcZJrzTPueWLPTs/Q0d1gyv/c
         HgdMyYHx8FLjkpzE2hY7VFzLJSKVDHDMSNa42+8Y919PDLXNcAJOOW8jrU9NM0z0c5o4
         FvXWiuzEtD6EjoYC+U1BUyQPd2te4/iiWI43aai+IbYvMOYO+ii4DcpPGFqhWUo0fx9J
         DnAqW2ZeVyRho43aCwDPZrtXkPsUdcW9XHNnm1R00tYWW5jJmTzPJCvJa72QG84mYyvV
         424yZJ8tX3V5N/hjMCH0pRxE0qZ9m/edSu5OLEXRJ7UNVcViOY4YPedEMQW7eEoyWAG9
         2mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555106; x=1769159906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+AGXRtrMXkyrXKzRmoE9z026WTEqpV4D7gQD8MxXK4=;
        b=o9+8WA9PPLg5zxdoYc5MPcOUTQKAGBcRLKSVStq4UiTOyjZ8bG1yC81BgNPb0KPeCB
         2+Kn0QYZ7CjWMATW9BvKcq4h8dAG6DU7uauqrCZZyEY4nw05FGStfOcl5ec4bDZu/26y
         g4O8jXCwQ7xkg/tMnMV2NHs3O5O9WOK5dXhhmigYktDokDWRZNI2Py5jPSYdls+IJcQB
         IC518DZBuaQZN6ybfI7HP5sU3IJoLrgouVwsza13qf3XHvDgE/79jtK69v/4yN/A8RtT
         bf5ZqzHidrj2YQfeaiHhgR/DlYLor2d04I/MbB2oLkORKhllsKktCoxTfzmVI329FaZl
         ZjuA==
X-Forwarded-Encrypted: i=1; AJvYcCUXbbop7UzjgLKP3hnTWk20cpBsPfiO8lay61edBePwu7kln9zJZNyUbIdvcxY1iWroqEdoZ32ZcM20LRrixZNrbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3C9wnRiBZClJQ0O7/uq2PphDttAuMaFyOhLnhJwbienrvZHb
	FrdcEwecnc0bilSGw2a4+3D0D4xDR+NuBWlL5arZ9ST/rhO1Ug6A0/J4P0MikcX0mBY=
X-Gm-Gg: AY/fxX7GyV/J4b+8M39U79KKPi7VmVBrk3+aFSx0gYWFjGJ+0n3zCDaN4em0cpNZPFK
	yFTiKeOMz6g23r8H51sB2tgyWgUlZGBNkBVuYSjj52NgqZgAywJU4SaMsr3P+ImdV8XNk7MKVlY
	MUH1Hury4u27gVAfsL+lCtEYRKK5ZjMXDRw/cqSkUC2etqEmHd9cldACXFLwBWLhqhjrci/JS+w
	B/8erakdOtQVpMT2VlVszMAcF/Pm8ToInGEvIzINQUDkZK4auckoA79fYT97A6t3RqIgUl9fr55
	/Ngpg84PQCVGNBXW3XOVklVNCegXi4QZqHH9lpkhuD+JOos/Ujx7Zflrg4TELBDUK0pJ0ZXZatm
	NPfymHsWRgPg2eXrPRWyvsB2eqEbNuawYrqeVI+7cYOfK0l+JAZHPctHAZjyAYIYJoPEeXKw6+4
	hS+PpTidJ5uhaOBDqP1w==
X-Received: by 2002:a05:600c:6209:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-48023ea2fc7mr6725565e9.4.1768555105706;
        Fri, 16 Jan 2026 01:18:25 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071besm87551575e9.10.2026.01.16.01.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:18:25 -0800 (PST)
Message-ID: <d3dedf5e-ada3-4d33-b1a5-7556ba80ffb1@linaro.org>
Date: Fri, 16 Jan 2026 11:18:22 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
 <20260115-slim-denim-potoo-cad9cb@quoll>
 <200d34bf-150e-4f8a-b400-2f54863502ac@linaro.org>
 <e2f028d6-774f-4773-889f-7d56b833067e@kernel.org>
 <fcc5405e-189d-4195-8db0-3acf35bbc0a9@linaro.org>
 <26d86470-aaa2-46e3-9940-010a903df4fd@linaro.org>
 <0176a63a-6b04-4e30-b718-847133882050@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <0176a63a-6b04-4e30-b718-847133882050@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/16/26 11:14 AM, Krzysztof Kozlowski wrote:
> On 16/01/2026 09:50, Tudor Ambarus wrote:
>>
>> Because of the hybrid approach I'm arguing the ACPM child node does not
>> fully describe the hardware, and it's just a firmware abstraction.
>> So option 2/ would be to have just the TMU IP block described with a
>> phandle to the ACPM IPC:
>>
>> soc: soc@0 {
>>     tmu@100a0000 {
>>         compatible = "google,gs101-tmu-top";
>>         reg = <0x100a0000 0x800>;
>>         clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
>>         interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
>>         
>>         /* The "Firmware Phandle" approach */
>>         samsung,acpm-ipc = <&acpm_ipc>;
>>         
>>         #thermal-sensor-cells = <1>;
> 
> Yes, this one, I think it's the best representation.

I was leaning towards this as well. Thank you! I'll start reworking the
patches.

Cheers,
ta

