Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704241;
	b=TxRovWvRNgybRcSRim22waGOTuMdrsdcLr54hscO6ecl4VjLxM3ahejrg95AyBrEideO
	 MDB7f29q+okebWINtrYm8CNxmZ11swI1wp1BsYcYHKRrtu71Bp5IuR6QxloToYKUoe0LW
	 6N94UAusMzxqKrYpSGk9cUw+pHkwRuTx6Dy6Yt786YL3+0MwcFTtTgAQJTzWDbyAKNIZm
	 re+Y5asNCWia6woredKfVkNrpZPtAcmtbWtihE+hAkbZr7fulXcC1Rmer7cwNRsR2GC6P
	 8Mgbf3ZM4WNFPF4jTSxQK3UopHhbttscmPQUhoIgHaT9/PLNRPnJms9z8A8lJgEprTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4YMdf8dZZ3XD9ty/AOcOBfYoGbewgxxeb9WLsPQ2aAU=;
	b=rKOJLYI8bKGJVNwrj7eUhlFYpywQAPBvHma+vSpLcdcoNmLKcsk7TGiHGYKhx7VNY7l0
	 RRgGJZkTGF96rq4MwBlEvJhkDMxeZSXYnebZjpCj362cyQNdsET4d4eRsFQQ4zbStTvh0
	 AdXnax/kcJ7hxP644C1F5J53OBszOGUptDNk+a1oqGEG31DbEeYHAdS7u1RWUeDKl+DCg
	 kWkjv6WcHD5xMEn5HwUEMMR9/V/eWubBnBWkc6KfM8grb4TctssEDtjY38GTF8kamwfqI
	 pbjQ0LTZKQjDw58iGpp3KfBy3Hq47JXPK4iqZnRufxrqsjsA836DSQm9KSBbKzU4WtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eigWEAO+;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D7606A31E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 14:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eigWEAO+
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso6247053f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795704239; x=1796309039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YMdf8dZZ3XD9ty/AOcOBfYoGbewgxxeb9WLsPQ2aAU=;
        b=eigWEAO+U3ezl897PKREzwJkRm8DbmgMgKfc/6Ll3Jdz5mNILNZFy3fRXAjKtt2JcC
         Kv2KeGZ6K6/pJz5IXKQDzvmGEkv02rLXOjLbGRx8YgDm2snl53wmLQ6dqapdpsKO4ttt
         DTa9LW8E5Xxgnn7wZdkvQuwkUcaL2DEJH7HB6EdYql2Y8064RzvSswcSiI8Yjl2iU/oF
         2w/vHp7LoONBYtMSoje3iByComSNZY6XhmI3iK5YFQQn1iDZKJU47/v51pXOSLegbctH
         95gmoMkLQcO0NzJ5d8qKNsE/5zKgx0paS6UhENaVDRLV/c5S2ZnijfQEnsknlqTHnCBX
         Lq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704239; x=1796309039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YMdf8dZZ3XD9ty/AOcOBfYoGbewgxxeb9WLsPQ2aAU=;
        b=O5fn6kd1DzeDUIzpg+QILCkhWbxGSZv48myFpyuTJxqQ2ZeSIksrvdxOXRixeDmOQZ
         bNECwuT9UCJK5gPjdzR7G21QCDzx1ISf9xTq+jzdXOOPE4yBAPQrlDKfOTvWCmnAR3SD
         Xvg4Eb/BdW8iabmx17pqeXYAqlYQ4d2Eo3ERHLKemKrncNj33nCIdrHrktRDWIlYFmkW
         gf0ObW9YOC8boMP2AmoGgt3ZwfBJF23gBN7PUD2vmww2Hcn2Lc1TsuhLFoatrPiFafXu
         TjiqQ3JS7dvGKNBq1ELeT+AX7b8y2HFBX0tmPW5ns6DXjlh7m69B8qF6UjqUWfkIF/F/
         6gyA==
X-Forwarded-Encrypted: i=1; AL+hErEU6rS0Pclsv7wqU1hdRZ+7lEjp7RTqLNDH3kITvXK5E/kjiRIrtcJx7li1ly+V1Dbqbqrf/vW/dM6CT1krOceOdg==@vger.kernel.org
X-Gm-Message-State: APuU4Z81IPi612pSSI6iw7HhqohS7XUjxaPAk3NXZuW8kddaV7TKwkDw
	jLNMRHschddSjiIC1kTsoOP7RJ24bBWkjdyTqp5qHvVfh5oENEiWTGrbiyAU3ISAQvw=
X-Gm-Gg: AZFdTZc1ZQ3c7Ss6D+Et4k7Gu9ccsB1h0Ik1OjAOiS5MfKyCTxQS2DDkiUjcCL4Xlwq
	qzjsSLBzzbc01zb2JiH89KMyrh574hqg8GNKlS5NO1rMjEMcvaBt0w6KOCIDojRqeFfrRvg2svL
	eNWN6vExo0eX30i/tWEX/jfxub4p1w2fljrvp0HYY2M3khwe90zPAM1Gdn/noc89ROArFcCJb1t
	qLBoeHRbZADmZQEI4SIiNfPhioW2yyqRsSFYn+LVpRndDotnGdH6HBHKqYlDAuh9nQqC74eUdn6
	qKMMIjzhxInNd45/4wVHV5nNNwpZuhfa99lWoNCaUElL1r3Are6GIJlEvFGn5MbteNfkI2WZiaf
	r/ovUILL8eiRJxRDgPwRjrA4PH9j96sKENbB9x6NLt65YeGcX/nlGBNY/kYMX8seAYUKUC33Rkq
	Q26U9y1wj1Ti5fX3cQCPrmj15opxlzCt/rp8tAeiciD2Ta1FB2RKJCCoUWO5joCqJa6kyXItiW4
	EgP0f++Tb/YrjLjBsMzpeYjeEO2f2MdZJnHP0KiLAVeoLgBQZ+fdql0LFvtKIvOTjbB2d3ihkJF
	Nt51Jn/2bgXCbQx/vF7e4AZURULjvxT9ItH956I=
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id ffacd0b85a97d-4abb86ed79amr40096146f8f.43.1795704239358;
        Thu, 26 Nov 2026 06:43:59 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm40596392f8f.49.2026.11.26.06.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:43:59 -0800 (PST)
Message-ID: <4adc1712-3608-4fd7-9eba-79b129c67b77@linaro.org>
Date: Thu, 26 Nov 2026 16:43:56 +0200
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANgGJDrnH7R9aTXhH-nj710OjwNcUTfpxE7eWGSP=9a3eoUnug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/26/26 1:51 PM, Alexey Klimov wrote:
> On Thu, 26 Nov 2026 at 10:50, Christian Loehle <christian.loehle@arm.com> wrote:
>>
>> On 11/26/26 09:16, Alexey Klimov wrote:
>>> Hi Christian, Tudor,
>>>
>>> On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.com> wrote:
>>>>
>>>> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writes
>>>> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clocks
>>>> independently of its interrupt mask. Setting it to 0 C limits all three
>>>> clusters to about 200 MHz while cpufreq reports the requested frequencies.
>>>> This was found through trial and error while tracking EAS regressions.
>>>
>>> Cpufreq reports the requested frequencies — are these cached values
>>> being reported?
>>> Or is this what the kernel gets via the ACPM call?
>>
>> Requested frequencies are reported. The 200MHz I only deduced from PMU counters.
> 
> Tudor, your thoughts?
> Is ACPM reporting an incorrect rate or are those cached values?

Both. I checked with debug prints in cpufreq:

- scaling_cur_freq returns the cached policy->cur.
- cpuinfo_cur_freq gets the freq via ACPM call. The value always matched
  policy->cur

So ACPM reports the DVFS level it was asked to set, not the throttled
clock. With the hot trip lowered via sysfs so that the slot 7 throttle
engages, on the X1 (cpu6):

      zone     cycles/s (perf)   scaling_cur_freq   cpuinfo_cur_freq
      68 C     0.85-1.21 GHz     2802000            2802000

Without throttling, the three agree (e.g. 2.19 GHz measured, 2188000
reported).

It would be good to specify in the commit message that the governors
don't see the throttle. Something like:

Program slot 7 from the lowest hot trip. Above that temperature the
firmware throttles the CPU clusters on its own, without cpufreq or the
thermal governors noticing, so the hot trip must stay above the range
where the governors regulate. This matches the downstream setup.

Cheers,
ta
