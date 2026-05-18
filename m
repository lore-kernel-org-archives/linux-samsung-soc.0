Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F35A35AC30
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103451; cv=none; b=tM/pl6xQMRST3SERolhWZtNubBhWA3UxHOnfTmyATX7eC0IrQQl6UIg13u1qbFC6jL/zXG4EBkQoib9Kgx6xcfiBVA7US/TU0NWLWQkJt5Ppzl3jg0HpO/HTccfcnf3ao2xy3Pm6BAqll3oEQo7OM0fuMcxshRZL0A8L+iMAKko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103451; c=relaxed/simple;
	bh=F9DUA1LqQ88iO37nW8gpSVHM+uh7CWcGexGTeUjHR3w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DK+DEssKdnRYPilzehHq2X7GrITetlHierJvjrfLuT71szmb4/l2gnFLCdwg31qMhgzj/LpvD0ZA1Ilu/a13EQxml8P4Jc4ISPAinugMatpSc5nPVOHtXsmq9vbT9ZZNzWc4VBXLoLBtOupfBz8YMczzDCqdrA/Zkwm0OOevOXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MfJ/iw5j; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfJ/iw5j"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-452169ae568so1352186f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 04:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779103447; x=1779708247; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpW8bJVhk5zYu8hx8WxBDR+Y5xwzZmAgq2/PvnTXnyY=;
        b=MfJ/iw5jyqUsdmXXMNV0ArbTWB9bxPdWiawF3Gl6YQcbSoQr+Ys/wG5+GJFI87Mmrq
         alqqIECVCQ30/jaZfcNwvGHCgjEXZVBM1uC2oWudpwwiatxBimOufMLX85xDkuTlepPo
         ztVbafI5tnlNX9OOD6z+551301JIKytFdJdhCSe3G0q4CWQWCrmeXxvRMzNL8LK0AEdZ
         k+m8K8852uNVLXEcftycWS5l7lQwFHqoJn9hgV6uCGyhszEg3wHTNXU+IPZDvkrKmTHI
         /NBBDs8DVUgosBzay3pFHXWk42vgXze6Y9DykwvgHjEAgFu450IucAvBuPuMIeoVz/hI
         NZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103447; x=1779708247;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpW8bJVhk5zYu8hx8WxBDR+Y5xwzZmAgq2/PvnTXnyY=;
        b=pcHdr5p3E3qZlniNXzpACg9w3vwiNT9bWpcGxJr7IHmI5IjxafiyfFD2aR1Ti2Pjiy
         vY/NU6yzVBToGxo9Zk6joDeTVaRtMkXq/3tklddwzF1UesNEqszbil4k4iX9JbcdgVpk
         nMiPp6XHbnVAAq36tR33Cs0r6NDF5Y4VRckSOi+Vbvtp2qs+NVUTERqqVd6vXqyFUZba
         MeaOQk8VSxb9RVJUQfDhC7xG4ngBdj8gbPIo8jV8pptsj5nhwgeGt9SmrZQD33p3e9Fa
         6EtKbLuomuISZVV5RgyMTtwmRc03oaJRpdgWYeHvYR6d40wlqfogq1uKaifXph1sk+O2
         46Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/2x2ioFW9q7BCCdIKCkTTF1vBd+rB8AIBp8a1r1g3A7jDGpyKBzBqLhoOhOXaW3ttaar8taQ813Ytv0zoynzEHQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTL5QGBpSavx1ejpPb+m3T6+6V3YtBgWAQ6taGwpgE48AnEYyQ
	uSOnh33bWQnPlkhDIi7dTSmCeiLnM0XvqXxw/viauT1QKuadDdqMwvC6fjhpig3eHmQ=
X-Gm-Gg: Acq92OFkNS6Tlj7+yUvNeIgrq4MdDtqJ6WsU4AKC85f/qgeWsn/jYORX4LHhuiSHLB1
	/FPAev7r6SnZ1V+HUcayjzix8evl0VOCnzj3oAywMOGloIgYiaHsl4UrP9qPtLJiNmJ3jfmYeiY
	Ng+vvtYFbV2kFgfKsOJ2bYzHsAXNRBSkipv9e3dVEaw7/vwM6n5XHdZIeQJmrx1c6m5KpI5Z7Yz
	FZzscAqLayXZgUYeXZsDHLen94F9pPSrebgPqcYAL6cDkSu69iqIwZGtbmvuRVtypmEkxVXan53
	ZwIddHBIhE5rzfF76dUysXCKJ9jvdFvF7PTyPk+SSAHByhvqvQLtVdAXjdru8ip+tP78OQshsEc
	Gwbe1dZ66lBADv9/y/BdfQD/IkalYViWc5SyHC1/c9HEm+XLukgC3fNLtnFEoD0jul8Q4K7njUT
	p0mACb+WdRfHmV8WXPiJvm6ZWSJyUE8EaS4gm5N/oDs7XsTYgTZGoMgkMQY91fi4mg96Rbgqzhc
	epHbGVp28ly0A==
X-Received: by 2002:a05:6000:2dc2:b0:45d:4c20:7285 with SMTP id ffacd0b85a97d-45e5c5bbe46mr24111628f8f.6.1779103447148;
        Mon, 18 May 2026 04:24:07 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767ee0sm34384474f8f.1.2026.05.18.04.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 12:24:05 +0100
Message-Id: <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
In-Reply-To: <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>

On Fri May 15, 2026 at 8:56 AM BST, Tudor Ambarus wrote:
>
>
> On 5/11/26 4:17 PM, Alexey Klimov wrote:
>> On Thu May 7, 2026 at 9:31 AM BST, Tudor Ambarus wrote:
>>> On 5/6/26 6:13 PM, Alexey Klimov wrote:
>>>> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
>>=20
>> [..]
>>=20
>>>>> new file mode 100644
>>>>> index 000000000000..c68d60b4c0b3
>>>>> --- /dev/null
>>>>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
>>>>
>>>> [..]
>>>>
>>>>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>>>>> +{
>>>>> +	/*
>>>>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>>>>> +	 * capabilities. Treat zero and all positive values as success.
>>>>
>>>> ACPM_TMU_INIT returns capabilities inside designated error field?
>>>
>>> yes
>>=20
>> Heh. Okay.
>>=20
>>>> What about other messages/commands? They just return error code there?
>>>
>>> all the other commands either return -1 for errors, regardless of the e=
rror
>>> type, or 0 for success.
>>>>
>>>>> +	 */
>>>>> +	if (fw_err >=3D 0)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (fw_err =3D=3D -1)
>>>>> +		return -EACCES;
>>>>> +
>>>>> +	return -EIO;
>>>>> +}
>>>>
>>>> Could we map these return values with better granularity instead of
>>>> returning -EIO for everything else that is not minus one?
>>>
>>> I think we're good as we are now. The firmware returns either -1 for er=
rors,
>>> zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabi=
lities.
>>> I can't tell if there are other commands that return capabilities as we=
ll,
>>> or if there are other capabilities for TMU_INIT, I don't have access to=
 the
>>> firmware code.
>>=20
>> On Exynos850 I see more than just one returned error codes. I definitely
>> see 0xfe and 0xfd at least. I don't have any data to confirm that ff
>> maps to -1 and fd-s, fe-s to -2,-3 though and what they mean. From my
>
> for these error codes we will return -EIO which is alright. We can have
> a more granular approach depending on the SoC if you want.
>
> For GS101 above is alright, it matches the info I got from the firmware g=
uys.

*sigh*

>> experiments I suspect that 0xfe means that call/msg type is not
>> implemented or not accessible and 0xfd means that passed parameter is
>> wrong or incorrect or not found.
>>=20
>> I am also not sure that I saw 0xff-s but, well, maybe that needs more
>> experimenting.
>>=20
> fe and ff will be covered as well by -EIO.

Of course. But it is about propagating the correct error (meaning
exactly "what went wrong") to the other levels and to a user.
My debugging of tmu for e850 would be a bit easier when sending messages
to acpm if I knew that:
-- something went completely bad;
-- specific acpm call is not implemented/not allowed
   (but acpm machinery is working);
-- passed argument for acpm call is not correct/not found
   (but acpm machinery is working);

Instead all of that I get only -EIO. Couldn't say if it will be helpful
for any other platforms.

> Let's keep this as it is for now, and if you need a more granular approac=
h
> we can differentiate that for e850.

It's quite sad that even on that level ACPM on gs101 differs from ACPM
on E850.

Thinking further about this I'd humbly suggest that even

	if (fw_err >=3D 0)
		return 0;

	pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
	or pr_debug(...);

	if (fw_err =3D=3D -1)
		return -EACCES;

some debug message would do.
Perhaps we need some convertation, for instance as it is done in scmi
code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
data for mapping acpm errors to some human meanings.

Up to you.

Thanks,
Alexey
