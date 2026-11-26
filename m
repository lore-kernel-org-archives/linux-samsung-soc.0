Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705310;
	b=5hKE4ecPzEADbJkDJcOBSKbt0/dbmUFNN2pNmoaBeg/tlG4VedXMtuzLF5k6Z0fiFjPS
	 3IhZSleDDe6SlezlSvFPC+dyYmVJg1p4evllkKgPz6ZPhoV8JmD4PgTbQpi9Dzo2OQy5+
	 lWXmxrXMF+r66hAMZqLs+qtAcz+u6YdxX+N5K7352PMmBWLoUtam11611P9sIrm0PW54l
	 UJo+fPVPMDJnGRuRiflWcMac6SnVMABKdh+K6oXorz2X92xr6TcGvzjzNRTYnMghHMjF/
	 gDUN0bsVNpkYlSqZNQCXXFFHtv/10WpDiAcu9quP7NgDRRTs5Z/vafWbcptVKfypDjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9pYcO5w1lWnU3LcG/lV8xW3siO5fUaDfkMFhAjIz8xI=;
	b=5kiCDtSP2Xr7pGLXus+G0b0kDWBmkclz14BPXR2o8z2DtUkgMkWorGnHdg7PUTjN7BXa
	 POEznOt5NxaLacRnbTXxMKJ5XYtNo6sYkiZElra5hnUgV9lZkvZl4lKs8/Rvf5SlG5tuc
	 nDPkiyibneBIZsqtqJvuaz9m5Oe8rM6d3HgDhD1lH4rRSHxB5IeqVM96Dd5qXhcUNoDdC
	 utqHsu1HN4SVvy4oSazjb1KrL06x4+L+WJhm1+iYBzTI9B6B9zRveuIQbYcMcSf/6npc9
	 13yCNLuJL8ACZot8Rg3ZM5yZ35DaCGSbOdt8cAp0Gv4StsCerfSe2iVz7pTYpUDk2RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mGdON0z5;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687A606A336
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 15:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6687A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mGdON0z5
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c51d158acc6so18870966b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795705309; x=1796310109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pYcO5w1lWnU3LcG/lV8xW3siO5fUaDfkMFhAjIz8xI=;
        b=mGdON0z5Hd2gUiYXS+tF/sU4H5tRqVTowVDdto0ksgy9JEQhONQYVH1Rt5nx8L4xnj
         ukoUh93VXrojd4IOz6idsh/09361GsT+h7sDiIWt1vQ7QTd9LamPcxkPIl8Stz3bQxck
         wTIvIhtJGHKGlvtNt71ValTst3GOG9fMLz6BCFzT7Ck+46i930sDGnRklTBTyZ0LBZCH
         jiTXzEBfUDgsTFjT0+Yh6uXQPKh8pRnbrmdgAPqUF8lCskQ06Nnm4QA0rsWdXo7YanGs
         zH5HUpl0PCr8jJnsrOcD1jPY4o7DzWgs644rj80UXaEo24gnzyTc44VTz3NJfOFkYEfm
         qOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705309; x=1796310109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pYcO5w1lWnU3LcG/lV8xW3siO5fUaDfkMFhAjIz8xI=;
        b=siPS1dKYLTogjJiUoko5vy44jEoJK0ZvhrJ8EGpCl1VoqSALVgLmct75NiA82mSO+u
         9+loAz7snRWLy2Gy46/PUiltAiPYIC3l2umlsqDExaSH1OecL++DnOZq6KfkGInxlCVB
         cPprm6FzbXq5iocRlYfoVysQfjynt8LQJ03GfFH/LiM4ibgM8B7L5AfkzYtQY7IKJCPj
         z8QJtenKuhMSn13b+ThIlVtnxpr6V3LhRkE8G3G8AsQLtjC9YrITRp+IZhJXzIfjzoUE
         m/NWm+sqNjMVvTlBfo5Fd3JhKdabABgLknensPwG9+wVjuBei4/9rza+B6x2Yn/neu0l
         wbIQ==
X-Forwarded-Encrypted: i=1; AL+hErGvpg3f32Raf9looQyfP+jWzSBcr/7MUPk0v4sfxF5PoTlaDFK7mkGP+UHfoWW5LjtpigPhAbbkcNiK0mr4ZvctGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6SBU3Alxk/9wt68t5FH7xGl6zSWiW/YoOcV7fV4aUyKjo0jZW
	AQfFV60Car98ReJbXdCkGq/UyVBIRrNyTCyEFWmmG2EnD5BEShkSnpeZISXBuN+ptS8=
X-Gm-Gg: AZFdTZeNoznGWB8D6NQpaavS14SGzVKFaHJI8wciF7TlNT3jyXzBhTnXfiMd8C9vvNI
	l+8yKYSqsKBjdo/DK6tehZGcB+IUciy1kbrBudMoqZzEg9GlSB1aEtddr38LWH1JiHXNTPcJ204
	w4pr6eay6+0L31m1MVo3qhRR/MME3FwiZd/hmR/zlUi42i3q5MjslLyanKRWbXL0v7Rs9J/pCaU
	+u9UjRTEBGeMq7U/2PKkJG2afIPLwNXMQZZ396yL4jpDxPWbDrUuPhbOuyrlH7QtVeL7hIpA3NH
	A0Gvf7+fE3JI9rNqBmUP2LVXvVQSsY3g/dWo2q6A4jaLy89RLdub+9V6T/ZHAhLz8fVDn120GiG
	JD4bypnO7hLXAzLShgmm1M7fvBXqJRzw22TmiSt0GvuuQJ/ypmnzqu2PikzTkINSxMgqzQa4FdP
	q/FdMAOeB4nwibiKkNO8yTLQv7fvOcOJh6KUHqoqdwXECwsV44uHZh2bQ4UZq+xas/bfKba4vsn
	TzsVoR3XL/LtJlZ4WXMQXm6nRKeZM/RQIKQc+4L2zuvA2hN4gsVCHuvZESRfGLDu5zxsUw/pd8h
	mNZwrYOkhqEhjGwHbJ7enwK+wsu+y3TUQcTQ2w==
X-Received: by 2002:a17:906:d54d:b0:c51:cbde:cbd7 with SMTP id a640c23a62f3a-c51cbded0bbmr129708166b.17.1795705308647;
        Thu, 26 Nov 2026 07:01:48 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm47430756f8f.24.2026.11.26.07.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:01:48 -0800 (PST)
Message-ID: <e329ce21-5a24-4301-9328-917d0ae4fdb1@linaro.org>
Date: Thu, 26 Nov 2026 17:01:45 +0200
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: bzolnier@gmail.com, krzk@kernel.org, rafael@kernel.org,
 daniel.lezcano@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
 <CANgGJDrnH7R9aTXhH-nj710OjwNcUTfpxE7eWGSP=9a3eoUnug@mail.gmail.com>
 <4adc1712-3608-4fd7-9eba-79b129c67b77@linaro.org>
 <DN586284T46G.271ABU0A683IZ@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DN586284T46G.271ABU0A683IZ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/26/26 4:50 PM, Alexey Klimov wrote:
> On Thu Nov 26, 2026 at 2:43 PM GMT, Tudor Ambarus wrote:
>>
>>
>> On 11/26/26 1:51 PM, Alexey Klimov wrote:
>>> On Thu, 26 Nov 2026 at 10:50, Christian Loehle <christian.loehle@arm.com> wrote:
>>>>
>>>> On 11/26/26 09:16, Alexey Klimov wrote:
>>>>> Hi Christian, Tudor,
>>>>>
>>>>> On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.com> wrote:
>>>>>>
>>>>>> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writes
>>>>>> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clocks
>>>>>> independently of its interrupt mask. Setting it to 0 C limits all three
>>>>>> clusters to about 200 MHz while cpufreq reports the requested frequencies.
>>>>>> This was found through trial and error while tracking EAS regressions.
>>>>>
>>>>> Cpufreq reports the requested frequencies — are these cached values
>>>>> being reported?
>>>>> Or is this what the kernel gets via the ACPM call?
>>>>
>>>> Requested frequencies are reported. The 200MHz I only deduced from PMU counters.
>>>
>>> Tudor, your thoughts?
>>> Is ACPM reporting an incorrect rate or are those cached values?
>>
>> Both. I checked with debug prints in cpufreq:
>>
>> - scaling_cur_freq returns the cached policy->cur.
>> - cpuinfo_cur_freq gets the freq via ACPM call. The value always matched
>>   policy->cur
>>
>> So ACPM reports the DVFS level it was asked to set, not the throttled
>> clock. With the hot trip lowered via sysfs so that the slot 7 throttle
>> engages, on the X1 (cpu6):
>>
>>       zone     cycles/s (perf)   scaling_cur_freq   cpuinfo_cur_freq
>>       68 C     0.85-1.21 GHz     2802000            2802000
>>
>> Without throttling, the three agree (e.g. 2.19 GHz measured, 2188000
>> reported).
>>
>> It would be good to specify in the commit message that the governors
>> don't see the throttle. Something like:
>>
>> Program slot 7 from the lowest hot trip. Above that temperature the
>> firmware throttles the CPU clusters on its own, without cpufreq or the
>> thermal governors noticing, so the hot trip must stay above the range
>> where the governors regulate. This matches the downstream setup.
> 
> Ain't that mean that ACPM ->dvfs.set_rate() call doesn't work?

No, set_rate() works. Without throttling, the measured frequency follows
every requested level (1.80/2.25/2.76 GHz at the cluster maxima, 2.19 GHz
for 2188000, and scaling_max_freq caps take effect). FREQ_GET returns the
level that was set; the throttle is applied by hardware below that level.

> I don't remember all the detauls but I think you mentioned that
> downstream doesn't execute set_rate() ACPM call and does the SFR
> (mmio) reads, basically what we have on Exynos850.
> 

Downstream sets CPU rates through ACPM as well: cal_dfs_set_rate() calls
exynos_acpm_set_rate() for ACPM vclks and caches the rate in vclk->vrate.
cal_dfs_get_rate() returns that cached value and only asks ACPM when
nothing is cached. So GS101 doesn't need the E850 approach, since its
firmware implements FREQ_GET.

> What about clocks and corresponding PLL clocks?
> 

Upstream has no CMU_CPUCLx driver. I'd expect a PLL readback to show the
DVFS level too.

Cheers,
ta
