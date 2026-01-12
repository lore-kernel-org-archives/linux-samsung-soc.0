Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2913246FD
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768246666; cv=none; b=VkRhja2wb1y1O+Xl+6+Nki0NJAMfpulh9/3JlHqDjk8n69Wm8ej+nJ9BhQLZsRPk+bwneYqSj/ktjuCYQkNBcNwLF9jo3weFIfLRyGRcLc1GZirwyTmfFtZAf3jzXnx6rsMIzDvFVyoAgkrZdXhKM75mjZ9OgWYpFme558a2WxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768246666; c=relaxed/simple;
	bh=kCNuLKa3OcBY6DWrPNqUq+zuzLUQGDhG7wkIuXt18dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1DOqUnf7rXKiy4vO2kBrHY1JVZyc6oG7L+p627Q6Tg1cFtUFKJaXa/vQGfHlznxe2rHLegJdgneyzjlpv4LEjIyV4V1vis+OwZshaGU4CKEgCOawgxCMqSVj8RQYM2Izd46Be1RkkFLzg18zZgB/8tm7NBm5UtuylxijmqEzfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=30Hqqb/Q; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="30Hqqb/Q"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b19939070fso6576991eec.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 11:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768246663; x=1768851463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMKzD4neKMQA/a71hLZaF9K+onAvp6LuTb7/ocIRVF8=;
        b=30Hqqb/Qg2M/DClti7RHUsO+bjKz5um6j/PP38je7T6hzY+F81eKQdpUUe90FNkYZ9
         K6NxlxJuym74IBjIuqdT6q5bBk55d042HV7DOfmdi5BxtX8UhsYUagRCVGpdbF+4e/xo
         wsRwEjty5yIG/FyYbaqul+TVca/ukDii1i7ExgICs9o7I6RribQekPjhJyNx5eZcUSbo
         cRdBcXSZfQQ+KTyiFN9ACq6VmBunxro3WsuH6vasiw1tC3pBfIhGyPk+qOFaME5eMMvw
         6Bnwfy8uIqF9++ZkPerBWdrBrLXYBfy0Vc8SPfS8TWv7FYXmbhqFD2bMx4cECL2icqg+
         XlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768246663; x=1768851463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMKzD4neKMQA/a71hLZaF9K+onAvp6LuTb7/ocIRVF8=;
        b=VQz8kw09WlPRPLOr3y5cjpjRxwwmy2PaIDfWCDzKuJfV5+kjilTlRWZXDsyOsJwaMx
         VsdiNWSVs9qUzp73wtqUNVE0fvJYNkjo+fvs90q4AF2FICKJYnIRJM8R3H5XhqMmENE6
         7urLQ1wZksb6wvB5qVYp2PXnkXLwy+3Wt3Ch7JQBA7a5p0i/8oWQUSTfZcJ7/3PxuB80
         YUeIplK1I5x8rckUh7reAS6C8MRPPE2V5bOFulBe40yNO5APqbiNHrnKDT/k0RPZRn5b
         z5w8TIxD8MMsanKP9ToSX/rFc+qX1HGdfL3iOH+mfmWTRSjvDfQ554gNTrk4zy7fWJGT
         ayfg==
X-Forwarded-Encrypted: i=1; AJvYcCWBqKh7uaju0EP6ycyUq/CyypN+8PQ/IQD25kBmi5j6GCmYSOh74Io4xZG9xQwvkZWPUQVTkoJlVR6PYgpGLbn0nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBO1pyFXuflCJ2XWNWzuJV41Mz/ITHt7yLefAIjoZBz8iNX/t2
	wkWhjADnLgnjiJNmHEwLxkMvF5rI1xfoRP9di6aG0scyc0EOnjjKjVpa97hNCGEZLQ==
X-Gm-Gg: AY/fxX66DYK3KXG/+xC1akRc/F3ghZpoRKf6i7wV8GzZNpuvfQMgZibrvcnWer9GQCK
	W042o9RwkwKA6fP9D1tc3btclIN5NFWUK8MAvwFM1Lum9+RAbj5hk3qmCqIwrn5nbA0rnaiTrh1
	ZaiHkDMye8lJuKfdsz0Sjsrn3i+L/gYh//lmeKp+diJfDmR69q2VSDEUdN0rLAUCmmbtZwzj6aJ
	uKSUFZxzzYqILNPK5M3Sw6zTgkoDUQkOHIigqabDINyEaUjHz3dEC4BV4zGyWY3nJnNQyFxXUps
	xAnBLNpRc+BQR3FAcjk0JRzKmw3249dJ1H0cgkvWXbygerFfJ4oNespWcDkkeerzGO56ayarNob
	9cuSuqdNaq3x98uRlT+waQgpVPNY4Oo/T64rOeLuM6POgnGSbIxaYeDMKpRwDJ/ismDPUM4Ukz7
	qX66CGMm2v5Fbqqxop8oO8RIQPc+eo/hIN3PBg57nr9zX4obpi7S2Hcr8kovQlX+n4IzlP/ggwi
	EO5LFxSNg+p4g==
X-Google-Smtp-Source: AGHT+IEmezECFIaAtAhii/tXhYAvteHOsxJwusDFq7+Qy4kltOc3o9BThd5irNt42thvcdsfukrSaA==
X-Received: by 2002:a05:7301:29a5:b0:2b0:3d03:37db with SMTP id 5a478bee46e88-2b17d2e2b29mr11583342eec.35.1768246663076;
        Mon, 12 Jan 2026 11:37:43 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:8e84:2c31:d2b4:9c1f? ([2a00:79e0:2e7c:8:8e84:2c31:d2b4:9c1f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078d818sm15886663eec.21.2026.01.12.11.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 11:37:42 -0800 (PST)
Message-ID: <bb9b9afa-0bfa-428e-9372-549d9ba8603c@google.com>
Date: Mon, 12 Jan 2026 11:37:40 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] power: supply: max77759: add charger driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-4-54e664f5ca92@google.com>
 <298ca35590d2180fdcf334f94964b6110e17c606.camel@linaro.org>
 <50c29a62-1fdb-4de2-8887-0d551eee5ec0@google.com>
 <255d7726-6758-43ed-b35f-db14726bcc9b@google.com>
 <2869d309358f27652289c40810ca36b2ec155d1d.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <2869d309358f27652289c40810ca36b2ec155d1d.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andre',

On 1/12/26 5:47 AM, André Draszik wrote:
> Hi Amit,
>
> On Tue, 2026-01-06 at 17:14 -0800, Amit Sunil Dhamne wrote:
>> On 1/6/26 3:41 PM, Amit Sunil Dhamne wrote:
>>> Hi Andre',
>>>
>>> On 1/5/26 9:32 AM, André Draszik wrote:
>>>> Hi Amit,
>>>>
>>>> I haven't done a full review, but a few things caught my eye.
>>>>
>>>> On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>>>>> diff --git a/drivers/power/supply/Makefile
>>>>> b/drivers/power/supply/Makefile
>>>>> index 4b79d5abc49a..6af905875ad5 100644
>>>>> --- a/drivers/power/supply/Makefile
>>>>> +++ b/drivers/power/supply/Makefile
>>>>> [...]
>>>>> +
>>>>> +static irqreturn_t irq_handler(int irq, void *data)
>>>>> +{
>>>>> +    struct max77759_charger *chg = data;
>>>>> +    struct device *dev = chg->dev;
>>>>> +    u32 chgint_ok;
>>>>> +    int i;
>>>>> +
>>>>> +    regmap_read(chg->regmap, MAX77759_CHGR_REG_CHG_INT_OK,
>>>>> &chgint_ok);
>>>> You might want to check the return value and return IRQ_NONE if it
>>>> didn't
>>>> work?
>>>>
>>>>> +
>>>>> +    for (i = 0; i < ARRAY_SIZE(irqs); i++) {
>>>>> +        if (irqs[i] == irq)
>>>>> +            break;
>>>>> +    }
>>>>> +
>>>>> +    switch (i) {
>>>>> +    case AICL:
>>>>> +        dev_dbg(dev, "AICL mode: %s",
>>>>> +            str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_AICL));
>>>>> +        break;
>>>>> +    case CHGIN:
>>>>> +        dev_dbg(dev, "CHGIN input valid: %s",
>>>>> +            str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHGIN));
>>>>> +        break;
>>>>> +    case CHG:
>>>>> +        dev_dbg(dev, "CHG status okay/off: %s",
>>>>> +            str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHG));
>>>>> +        break;
>>>>> +    case INLIM:
>>>>> +        dev_dbg(dev, "Current Limit reached: %s",
>>>>> +            str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_INLIM));
>>>>> +        break;
>>>>> +    case BAT_OILO:
>>>>> +        dev_dbg(dev, "Battery over-current threshold crossed");
>>>>> +        break;
>>>>> +    case CHG_STA_CC:
>>>>> +        dev_dbg(dev, "Charger reached CC stage");
>>>>> +        break;
>>>>> +    case CHG_STA_CV:
>>>>> +        dev_dbg(dev, "Charger reached CV stage");
>>>>> +        break;
>>>>> +    case CHG_STA_TO:
>>>>> +        dev_dbg(dev, "Charger reached TO stage");
>>>>> +        break;
>>>>> +    case CHG_STA_DONE:
>>>>> +        dev_dbg(dev, "Charger reached TO stage");
>>>>> +        break;
>>>> Are the above debug messages really all needed?
>> I forgot to respond to this comment in my previous email.
>>
>> I think we can keep AICL, BAT_OILO, INLIM. They're either special
>> conditions (AICL) or faulty conditions (like BAT_OILO) and we can in
>> fact keep them at dev_info level. Rest can be removed and a
>> power_supply_changed() is sufficient.
>>
>> Let me know what you think?
> I don't think dev_info() in an interrupt handler is appropriate. At
> least it should be ratelimited.
>
> If it's something special / unexpected that needs attention, having
> a dev_dbg() message only will usually not be visible to anybody.

I agree. I can change the prints to dev_info_ratelimited for the stuff 
we care about.


>
> Also will the call to power_supply_changed() down below handle the
> special conditions (e.g. convey to upper levels)? If not, can it be
> made to do so?

Yes it does, as I can see a call to kobject_uevent() inside 
power_supply_changed_work(). Also, power_supply_changed() also notifies 
other subsystems that have registered their notifiers downstream of this 
power_supply object. So I believe we're good there.

If all the above sounds good, I will proceed with sending the next 
revision including the fixes  :).


BR,

Amit

>
> Cheers,
> Andre
>
