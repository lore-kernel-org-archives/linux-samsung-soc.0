Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684B1A23BB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2024 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735551235; cv=none; b=fiS1GrtbqaZ5wt5QCAnbR2XoiZKabhaaWb+p1/lnW1ABEk9jO6i16ZLUhccDO5nrJ+5SimGUJsVYtLWfgYrzVB95XaqCvG95cN8PQYG2cOhmMaN2g8uccf6/uJLNmSuU24wPRPVIvYK8xd2gWO0t2kaWTJ6trXWujsDc3eKIEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735551235; c=relaxed/simple;
	bh=dYwHpSJUhuUAG0fqkuiQHa2k6x4/1UvSqmN7TRAtCSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RunlWnhSziKRPWSQ8ADF/1iCvyARQ8DbftqO3oTU5yGR5Un0ti62MfoQ8vtRQF8wGObv7t96fhIuZ1q/CjTH+5xiW2/3YnEJG2Mzf/lrTBnck7D0BRBk+bIBdaPg8bYETTsMPl7+YukcAHe6PKmumLrEqJJ4x9NQex91WNCnNJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BMwOfNZq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BMwOfNZq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862a921123so6158199f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2024 01:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735551232; x=1736156032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWxCLyK4AJgfk1FfjpH9G6YxLoJtD0ixlqlSrDwjPFI=;
        b=BMwOfNZqxJdxb5G6NDUdiCws70XcndKFjb/Dz0WEzww65LAM4z6/JPYmcZdaowceu6
         syW20bfbOGc7c+04FCab0dhZncE3xFrN9pNtHom2X/700PsjpvIvunQWZI1TTUquUHBK
         nYDSdY4p8pPzXMSAPObVupqR8hMdtxcgjHihnmCX7kJToFjZd/9yNsJ3wnJpAxK8RTBp
         LG8tw7B5s8Z83z7krL2seYWAN4Q8r3Gf1LehCWlCm37nm2Ys6OHF+/LBiQ2rECnq9hCA
         bepDEPVfUvw6alkIv+I424gWQkIRaFOLi4R11Z89VaeCif489h6fO4W6358EEFfbCOYz
         tW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735551232; x=1736156032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWxCLyK4AJgfk1FfjpH9G6YxLoJtD0ixlqlSrDwjPFI=;
        b=rtfljYPPGysFBw0mqry6QHJIKrcK5qM0kvAlKROMumoYbhO5Y7cYowAmK9Za4ptQ/1
         F/IrwOUv8aSdbZjrmw1GtafPffdNYLNmOyl5P0P4+tdxOhblI3PQ2XKphT6g80OeaQim
         w+qG2g9HjkJ4PzUNbMi7GIfi3yGYlcYYhI1FIFk0Wr+q3QUDRNuY4w8of2MEWhRKAC+O
         iDtuDUm7gNyDjV//e7RWeJNoyZyHKo8KGtC8mrv2kVpqItr9f9yDfmPhz/YBK0o7Dy/o
         6XsB4sSmIpAd3X9b2jV/eGUNRCIpz5sVmxDn7o2kXJ/xj0zayJLgrFXV89lDJZlz2QIn
         Gj5w==
X-Forwarded-Encrypted: i=1; AJvYcCWhz7x3tMOKQZifc2N9Ol0BXkU85aga/0qnp89jijzk62ASx8yGhpuBNBZjFbuuu8+ervLxUQ3NQf7zdYYYgaS+gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh5fXN/i2kPy2NUcMiHwE091BJcZnMwpos2tt5EpwMyQM/HXzR
	UBZuRECk9gUgrzmj4HgmQnqyWZ04PTztjZWK8IBxk5tkBIZKjgksnzsgm0lMVz0=
X-Gm-Gg: ASbGnctuQPPObRXDEnuLqZr5aSW1XhL2k/SmF87d4wx0GVbbhNa+HBVIkphjB+VqBr7
	LyVKIMPUtUhURZbZ5F28Sf+DanLaqNcqXZQU4mmtEdSC5Kjgg037QwCSqg+J6AnhEbr3p5YsWE2
	u915a4zwqZhlUBqHujq21xzppnRuP6Qq09L7t/dXB/XQ7O4Ken/dgxbbzH40rCikbyjSu2lE32z
	DmruLEOe9qulcZF4v3DnERQzxXGnswhbDyAqDosqMnXb+xVEx4wyxClwTtNzo89
X-Google-Smtp-Source: AGHT+IGt9+hFPNfKD0vYj/l0vMmTZmm4MtaV//fw/vdTlSexZfNqLe9/5huEQLBsPI/BCg5Yf4wjuw==
X-Received: by 2002:a05:6000:400c:b0:385:f23a:2fe1 with SMTP id ffacd0b85a97d-38a221f92c9mr32375904f8f.26.1735551231816;
        Mon, 30 Dec 2024 01:33:51 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847dabsm29231573f8f.59.2024.12.30.01.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 01:33:51 -0800 (PST)
Message-ID: <d852b956-b61a-4770-8d93-9987a982080d@linaro.org>
Date: Mon, 30 Dec 2024 09:33:49 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
 <20241220-gs101-acpm-dt-v3-2-642d64daa5d1@linaro.org>
 <f5e3d00e-8f98-46c6-8f1a-85a2169324ee@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f5e3d00e-8f98-46c6-8f1a-85a2169324ee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/22/24 11:47 AM, Krzysztof Kozlowski wrote:
> On 20/12/2024 15:45, Tudor Ambarus wrote:
>> GS101 has 14 mailbox controllers. Add the AP to APM mailbox node.
>>
>> Mailbox controllers have a shared register that can be used for passing
>> the mailbox messages. The AP to APM mailbox controller is used just as a
>> doorbell mechanism. It raises interrupt to the firmware after the mailbox
>> message has been written to SRAM where the TX/RX rings are defined.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 1441e9a252c2..6947dd081a0e 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -1445,6 +1445,15 @@ wakeup-interrupt-controller {
>>  			};
>>  		};
>>  
>> +		ap2apm_mailbox: mailbox@17610000 {
>> +			compatible = "google,gs101-mbox";
> 
> 
> I don't think I have this in my tree and cover letter does not explain
> where I can find bindings. Nothing in next from few days ago. Always
> document in DTS patchset where are the bindings, unless it's obvious.
> 

Noted, will add such details. For the reference the bindings are part of
these patch sets:
https://lore.kernel.org/linux-arm-kernel/20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org/
https://lore.kernel.org/linux-arm-kernel/20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org/

I'll ping you once we all have an agreement on the bindings. I'm still
waiting for Jassi to let me know if he's fine with dropping the channel
type argument for the ACPM use case or not. ACPM always uses the mailbox
channel in DOORBELL mode, but this info can't be retrieved from SRAM at
runtime. Jassi suggested that I shall pass the channel type via DT.
While I don't mind, I don't find this necessary. Discussion at:
https://lore.kernel.org/linux-arm-kernel/eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org/

Thanks!
ta
