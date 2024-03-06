Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2BA1BDCB
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Mar 2024 06:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709705381; cv=none; b=Nuf/zALYCsSuACmvRseX/GElSOovCkqE2MyZc1taVCSXRqvBpSeU2lXtC3Wpn8KFVhcU8UTHAvncExiwY9PSFU1E33HCnSjYz5OYW7OYM2ekN2L+xeM+oaf654bwXg60dJ5vk9YovXz6PxVDx23Jbujx75o0G9f1ir/2lU5vQaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709705381; c=relaxed/simple;
	bh=1gq6ypPil2p4oTVWlsz5gSA5XMP5G8k15TtyF/kGgfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGQs7IZjpoho21KlWhaIYXtg5cRfppgsVy832Xv9vs4lNvy5tRCgGDd+OBogj8+wm8YVn0NCl4snpXtNJnHxONieGIxp3V9uajZDl6lQdtIfBUGhhgILObl/O6AAsfYcevAok0nrNXHbQI00jYOWRVhr2m9s8cUN399Y1ElF/Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uOIKQ9mK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uOIKQ9mK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5658082d2c4so8755600a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2024 22:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709705377; x=1710310177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCfscL91sKexfy7B7QqN90h+oKQiAmhmqtO/HzPcNck=;
        b=uOIKQ9mKYsbxkAkxiez1jVgo+X0MPZjyrgpeiEf6UtNWlZupvOjqKy1SCv1s5IEBZF
         8wZdyxmG+GZ6jYhQdhuJXRLzavn9J0NoZ5syMZ4wsRCjVf/Mas4VDMACDP/MbjUeNum/
         ryYvTsMjqgyIxKCgkysVFCSnFwgha3CPIBMtu4oX5FE/Oa72LQe7f7D5nN0BBHoVqeHB
         okEarEm5GawnOr8BQytSadUQCAd98goLyZlj7E+n1bZu8lSjpDyMB3K5Ahto4lk9PL3f
         6QJKF33A6GhoL7AwYHObWPtlKotpa5AeDc+lBbhdb9cuq6lZJRRK4BSNe8qnCmkD03ld
         HXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709705377; x=1710310177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCfscL91sKexfy7B7QqN90h+oKQiAmhmqtO/HzPcNck=;
        b=rn2zQ7tUj1UbRCuWe3VjPa7CGR4gX/emy6NQvWFFmPxT2GR0okEKC/VNzwnUERA4JZ
         h9kpRj0Zp5QOH4ThwLDFFTFtwLnfo/DZyx9DDN44q82/jSBwO+inv4mhsIvXX75iA1MT
         GmHVjIfcXD4V49hqaso+B3vPP40FJ6agSho/a/gTvrRSViSzNeSQFIanoHBB7cSZxbUL
         oHSoY3YkoIZCHL9P17ODr2cF88oMoTZd70CAeOxGWLK9/OXwpAKTmEAcyUYxHnZuM/D4
         8E38cQvnF7d+pgXtgKYCIysaq79voFC5CzJvHOiyqpIQuJc/PRxAl8Q5EoCkXvgrkPLS
         VVFA==
X-Forwarded-Encrypted: i=1; AJvYcCW9MgSVcSJyO/wJtu7dm0g85WMH8TK3Hdw0Cx1jnYfvetd+9BODUe5Esg+cednCN2fOUDxJJhXVxesxM3ElaDHTd55hOzqYOjWHtzo+484ZrSE=
X-Gm-Message-State: AOJu0YzIrsnGrpWXVX8ur/ETdtiB+rKTfBLCvdHEAZi/UHXvoEE4C4Pa
	EZHt6y+Kr2SsuAOwEgrM4ee5Gha3XUWN3NmWo+ox+lc3rrDrOgVzSqC8BbDMpqg=
X-Google-Smtp-Source: AGHT+IEsajMRsmweIyn5WvyQ9w++OfI6XStVJ4Os/TiAuf+ScrCFN4d0Tk9Ax7CXktQpsnHam7SYXA==
X-Received: by 2002:a05:6402:d71:b0:567:f080:740e with SMTP id ec49-20020a0564020d7100b00567f080740emr184571edb.1.1709705376928;
        Tue, 05 Mar 2024 22:09:36 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id dy25-20020a05640231f900b005655dd9492dsm6586938edb.53.2024.03.05.22.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 22:09:36 -0800 (PST)
Message-ID: <9732478c-c371-4db6-b8f2-5623ac733a0c@linaro.org>
Date: Wed, 6 Mar 2024 06:09:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samsung: clk: re-parent MUX to OSCCLK at run-time
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>
Cc: 'Sam Protsenko' <semen.protsenko@linaro.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>,
 'Peter Griffin' <peter.griffin@linaro.org>,
 =?UTF-8?Q?=27Andr=C3=A9_Draszik=27?= <andre.draszik@linaro.org>,
 'William McVicker' <willmcvicker@google.com>, kernel-team@android.com,
 jaewon02.kim@samsung.com
References: <CGME20240306032013epcas5p4932674432fbb49f586ed9d00f006a9e8@epcas5p4.samsung.com>
 <d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org>
 <324701da6f81$ad1379d0$073a6d70$@samsung.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <324701da6f81$ad1379d0$073a6d70$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/6/24 04:49, Alim Akhtar wrote:
> Hi Tudor

Hi!

> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Wednesday, March 6, 2024 8:50 AM
>> To: Sylwester Nawrocki <s.nawrocki@samsung.com>; Chanwoo Choi
>> <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>
>> Cc: Sam Protsenko <semen.protsenko@linaro.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org>; linux-samsung-soc@vger.kernel.org;
>> linux-clk@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-kernel
>> <linux-arm-kernel@lists.infradead.org>; Peter Griffin
>> <peter.griffin@linaro.org>; André Draszik <andre.draszik@linaro.org>;
>> William McVicker <willmcvicker@google.com>; kernel-team@android.com
>> Subject: samsung: clk: re-parent MUX to OSCCLK at run-time
>>
>> Hi,
>>
>> Trying to get some feedback from the samsung experts. Please consider the
>> following:
>>
>>                          ---------------------------------------------
>>                         |                                CMU_PERIC0   |
>>                         |                                             |
>>                         |  MUX_USI                                    |
>>                         |                                             |
>>                         |  |\                                         |
>>               OSCCLK ---|->| \                                        |
>>                         |  |  \                                       |
>>                         |  | M |                                      |
>>                         |  | U |--> DIV_CLK_PERIC0_USI*_ --> GATE_USI |
>>                         |  | X |        (1 ~ 16)                      |
>>                         |  |  /                                       |
>> DIV_CLKCMU_PERIC0_IP ---|->| /                                        |
>>     (1 ~ 16)          | |  |/                                         |
>>                       | |                                             |
>>                       | |                                             |
>>                       | |  MUX_I3C                                    |
>>                       | |                                             |
>>                       | |  |\                                         |
>>                       --|->| \                                        |
>>                         |  |  \                                       |
>>                         |  | M |                                      |
>>                         |  | U |--> DIV_CLK_PERIC0_I3C --> GATE_I3C   |
>>                         |  | X |                                      |
>>                         |  |  /                                       |
>>               OSCCLK ---|->| /                                        |
>>                         |  |/                                         |
>>                         |                                             |
>>                          ---------------------------------------------
>>
>> Is it fine to re-parent the MUX_USI from above to OSCCLK at run-time,
> 
> I am not aware of the exact SOC/HW you are working on. 

I'm working with GS101. I'm interested in exynos850 as well.

> It depends on the CMU design about how to achieve low power mode and clock gating for an IP/Block. 
> 
> In theory and looking at your clock diagram above, it is ok to switch to OSCCLK  for MUX_USI.
> 
> If you can just use GATE_USI clock to clock gate USI IP, you will have a low power for USI (of course there will be a leakage current still drawn).
> Is that what you want to achieve (low power mode)? Or you are looking to get lowest possible operating clock for USI IP?

I'm trying to get the lowest possible operating clock for the USI IP.

> 
> You need to takecare about if that clock is being shared with any other IP,

It's not shared, the entire MUX USI, DIV, and GATE sequence is dedicated
per IP. GS101 has 15 USI blocks, each with its dedicated MUX-DIV-GATE
sequence of clocks.

> so unless all the IPs which consume this clock, goes into idle state, you can avoid MUX_USI change to OSCCLK.

Since the MUX USI is per IP, I guess I shouldn't be concerned about
this, right?

I'm trying to find out if it's OK to reparent the MUX to OSCCLK in
normal operation mode (not low power mode), in order to get the lowest
possible operating clock for the USI IP. Would be great if the decision
is backed up by some info from datasheet. Unfortunately the datasheet
that I have access to it's not explicit.

Thanks for the help!
ta

> 
> 
>> during normal operation mode? Experimentally I determined that it's fine,
>> but the datasheet that I'm reading mentions OSCCLK just in the low-power
>> mode context:
>> i/ CMU ... "Communicates with Power Management Unit (PMU) to stop
>> clocks or switch OSC clock before entering a Low-Power mode to reduce
>> power consumption by minimizing clock toggling".
>> ii/ "All CMUs have MUXs to change the OSCCLK during power-down mode".
>>
>> Re-parenting the MUX to OSCCLK allows lower clock rates for the USI blocks
>> than the DIV_CLK_PERIC0_USI can offer. For a USI clock rate below
>> 6.25 MHz I have to either reparent MUX_USI to OSCCLK, or to propagate the
>> clock rate to the common divider DIV_CLKCMU_PERIC0_IP. I find the
>> propagation to the common DIV less desirable as a low USI clock rate affects
>> I3C by lowering its clock rate too. Worse, if the common bus divider is not
>> protected (using CLK_SET_RATE_GATE), USI can lower the I3C clock rate
>> without I3C noticing.
>>
>> Either re-parenting the MUX_USI to OSCCLK, or propagating the clock rate to
>> DIV_CLKCMU_PERIC0_IP allows the same clock ranges. The first with the
>> benefit of not affecting the clock rate of I3C for USI clock rates below
>> 6.25 MHz. Is it fine to re-parent MUX_USI to OSCCLK at run-time?
>>
>> If no feedback is received I lean towards propagating the USI clock rate to the
>> common divider, but by protecting it with CLK_SET_RATE_GATE.
>>
>> Feel free to add in To: or Cc: whoever might be interested. Thanks, ta
> 
> 
