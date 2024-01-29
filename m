Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC6265BA4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706537340; cv=none; b=c4+zzxSyvxkEUnRfFeEBZsuOtcELSjWN0mkyMuXtDLQkqv0v/aKG8YvL0fgXDpbC1htxr0PIJYydiW9VGYVNsBXi/TgHQvrluhVSTSN1kOaEm+bN9+I/nExQevLcax3JyyYRTHxXfBPJAuBlgUMNgq9zzfddAvVouXVfiJIpMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706537340; c=relaxed/simple;
	bh=HtYjkNfO0ttjXsrkH7dPynQ41tr74rYvKIjBqd2n8JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rK3aSXbJ9787dtjWeqrfxa6reJoMoSIAIZqoL8XzOhhyuAWvUXBh+kJL9Mm+usygOwvXmlknpOL03WUZaSXRAagU9vsnCKqzGQG4aR+4kKIl7pCaHCBe+A3tn7qtlKKhoOtc7T7CNFC6EDy5pEAenpsgboUbvjZTzB79qMKMohI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=owA51J+8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="owA51J+8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55eece07a75so1526403a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 06:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706537336; x=1707142136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EVgC9ndqR/MuNvywM9xT1vFd5Ob7Ho0ot1L+E3kxXno=;
        b=owA51J+8tR8TFxLkY9+hx9AB7DUIgBxa9b5iSc3kJraQs9z/+mD68fsPHsq/hHsyBZ
         qB/7MI52zSnJSJJZh+I540RdubV536vB4oopsJ0RmCUPaPTn1/OMwImTvpu1JMS0YoPk
         MmmFvskgg9MPG66y8ng0EvsygefegYqO5Sor7fwa1JiMchO99xAYGpqnzZ68/NDi0nGV
         Nya5hDiQHzDSDJeoo1DLC7J3Y/wYaxZYswXBRuvOlAC5j7cO/zv3Mloi4X+qDgYMKqCi
         sKv5pyp8ds+nP2ujcXMWtug+XiECMVEHAKm8LF6aV8Et6duhQEtoPoV1zm211WkKA5tj
         pt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706537336; x=1707142136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVgC9ndqR/MuNvywM9xT1vFd5Ob7Ho0ot1L+E3kxXno=;
        b=DtjNSwUOj8EjaiOuhtI/q6x8KzHrjnPdpp8gDAlC3vPzneOWOaxtxg4LLf+ZOXkED1
         hCXtuD24Cfi1VOMCp1WwFLBljkQefP2PpXqJNYOSjGIE9yY0QxBDiL9tegB+6MRbo/2+
         F6asZ7bMIU9zDVlsXQE8PSX9U+M6WFu+jKA9hyDezgPJ2mro/n5+FKSs/CgD7BCOvkQQ
         qRlak3HMyp2RAEH59azJmJzffWTCXSzBlK2phCNvhwsqCj929AIwR4IDJZurvmJIp1T3
         taRQoChAAzQ47UHVxuwVbaMQDVUJ0XF8HYHYTG384MvzLBp+7vbN/XvuXHnh2wZYSQKE
         uwQQ==
X-Gm-Message-State: AOJu0YwSxLunsBAPPbzguLxOuY2I1LMW1X6bLpTWWMobAogVnGmHAtan
	YmoTkpfbyQpr8xmMrGdeQeFfTtaZ9+rj//ACXiKQMhTWXUWWaaxIr7Njil4ZRis=
X-Google-Smtp-Source: AGHT+IEfmPLWaM2gz4IcNgfV12bxmfh2h9gb4skOekbcic5q/Q27us3TWRKuRn+sdBiOj3uyGQwyWg==
X-Received: by 2002:a17:906:a013:b0:a34:96e9:f46c with SMTP id p19-20020a170906a01300b00a3496e9f46cmr4382352ejy.31.1706537335396;
        Mon, 29 Jan 2024 06:08:55 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906a29500b00a35d7b6cb3fsm677384ejz.95.2024.01.29.06.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 06:08:54 -0800 (PST)
Message-ID: <e845e0fa-846c-4f26-9d8c-79eccae72cc2@linaro.org>
Date: Mon, 29 Jan 2024 15:08:53 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] clk: samsung: gs101: don't CLK_IGNORE_UNUSED
 peric1_sysreg clock
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240127001926.495769-1-andre.draszik@linaro.org>
 <20240127001926.495769-10-andre.draszik@linaro.org>
 <74b63fd9-bf7a-4a88-bfa9-a975a4f12bca@linaro.org>
 <7d42f80acf7c8bd3882f5ac253a761c71de2034c.camel@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7d42f80acf7c8bd3882f5ac253a761c71de2034c.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/01/2024 14:47, André Draszik wrote:
> Hi Krzysztof,
> 
> On Mon, 2024-01-29 at 12:03 +0100, Krzysztof Kozlowski wrote:
>> On 27/01/2024 01:19, André Draszik wrote:
>>> Now that we have hooked it up in the DTS, we can drop the
>>
>> Your driver patch cannot depend on DTS. Not for a new platform. I am
>> repeating this all the time last days...
>>
>>> CLK_IGNORE_UNUSED from here.
>>>
>>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>> ---
>>>  drivers/clk/samsung/clk-gs101.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
>>> index 7f6c3b52d9ff..d55ed64d0e29 100644
>>> --- a/drivers/clk/samsung/clk-gs101.c
>>> +++ b/drivers/clk/samsung/clk-gs101.c
>>> @@ -3393,7 +3393,7 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
>>>  	GATE(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK,
>>>  	     "gout_peric1_sysreg_peric1_pclk", "mout_peric1_bus_user",
>>>  	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_SYSREG_PERIC1_IPCLKPORT_PCLK,
>>> -	     21, CLK_IGNORE_UNUSED, 0),
>>
>> I don't understand. You just added this clock in this patchset. This
>> means that your patch #3 is incorrect.
> 
> In patch #3 I'm hooking up all the clocks to Linux. If I don't CLK_IGNORE_UNUSED
> for the 'sysreg' pclk in patch #3, then it'll hang on loading drivers that
> require sysreg access (because Linux disabled the clock).

Then add clk_ignore_unused to cmdline. That's anyway recommended for
development platforms without full clock and pd description
(pd_ignore_unused). Not mentioning that we might default to
clk_ignore_unused at some point soon.

> 
> I can not change patch #8 to come between 2 and 3 either, because at that stage
> neither the clock nor the DT node reference &cmu_peric1 actually exist, and the
> clock and can't be claimed by sysreg.

At the point of me applying this patch, there will be no DTS node
either. This ordering fixes nothing.

> 
> Since we can not mix DT and driver changes in the same commit, I can not merge
> patches #3 and #4 and #8 either.
> 
> I had to do it this way so that the platform always boots for every commit to keep
> things bisectable.

But it is not bisectable - you did not fix anything. You can try by
yourself:
# git checkout drivers
# git am patch #1, #2, #3 and #9
# git checkout dt
# git am patch #4, #5, #6, #7, #8

and now try to bisect it. You will have the same problems you try to
avoid. So what is solved by this ordering? Nothing.


> 
> Alternatively, I could merge patches #4 and #8 (but that seems wrong to me), or
> drop patches #7, #8 and #9 from this series and apply it later in the -rc phase?

Probably the mistake was done in the way how you upstream things: adding
sysreg syscon without its clocks.

Additionally:
1. Disabling unused clocks is current OS policy, so why the policy
should affect DTS and driver ordering?
2. This is platform did not receive a release kernel, so glitches are okay.

For this case #9 must be squashed with #3. #4 with #9.

> 
> 
> Is there a better way that you have in mind that we're missing, that keeps things
> atomic and bootable/bisectable? 


Best regards,
Krzysztof

