Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706474;
	b=uzPhh9AlI54Xy+09/L+0bzUOmttIy6/AH6vP3un34EJFE8fKeJCPukJ2tw+Ft81lanfI
	 R9p1E80P1pAMNwbQV5kHeadOwfgQUHyK/lzfKBgCYcgOcbBlwh2NZEhyRpk6cXUAiBEWp
	 bV/4H1IxMzvjvikwHkuk9i1X0tQYPecpIbuRuhFGnp2EbOxu178FdJVyZWxSs/dz63++E
	 EcGw4dQhPKLJFfN/sHn57LO+rI8cWO5VuCni2UG5fEmlBqduZwXLK1fd645kpMU3C5GbQ
	 77uOaJvMdYuwKteBIk+G+d3aaiDA6QwQnWc31+uvClkKsm29AZ+2E2NBnxyDbtC3U+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kILnoOSlT2YE/zjHB9okNcwTkN0bcn/3NhvFP8gsjgo=;
	b=3eKNp4+uU0hKNlFXvaUcNl2SYe/EIXWLnLi4EFZ85imCtEQIj7yVOS7llm4dr4GmQ2UY
	 I5CHW5+Nt3X0hlwG+OT4xPUN6Z07nBSru0KqPnbiraEj4le6MwapNlqViAQ/TpHtZL8mu
	 +27PnbNoQm/9ntYI36kEPqB4RE1a1kyEyptSMcR22B+8tVcj0FG+o47IZU7IZG6K8Xpjg
	 BQaswmX9JBJeCzRRggDzfI4tOS343GKlagLCuXNQkgPYikj/Njr9cBINhxVXJI3nYLlGQ
	 VrNELW9Eps1CR6CTovhnf8v2A1l9bFSutQutRsQvQYkrO5lKTsK4XLIFsrMnPlo5NNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e69Fq7fP;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59B4606A331
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 15:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59B4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e69Fq7fP
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so58029085e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 07:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795706472; x=1796311272; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kILnoOSlT2YE/zjHB9okNcwTkN0bcn/3NhvFP8gsjgo=;
        b=e69Fq7fPvZ+l6DJ4RuxB5Db+9Wj7K847lZlms5v6qeLbl51+9/jHRa7hRe7c/nDj+z
         Iy13fy9h/nRnFN5lIy3yK5MIEy2UrEOhOfytdM3LvUX/X8ylSQa7ku0PKUT8xsWP1nv3
         1gag19RA8dJuMJYXg2IoSzAcAyEFjLF/cMs6Cq7zw8zaAORDuCCGJOqcvHoHtIlVXfLT
         XHQRgT9iTZbEDwyhsQrQkd9b9UBGVNAV+eVLThdljEDJzpKZCDk9gy4aELxsiZbIfIQG
         uRiDTFqWcregBRuf5UQSSnVM7XiN4MhZocEJatEGNL3k3MAFZJXXZhE0uWlM6TXtORKI
         dvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706472; x=1796311272;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kILnoOSlT2YE/zjHB9okNcwTkN0bcn/3NhvFP8gsjgo=;
        b=dk5ervfOygZ7jplTYBvFVNHe24ad8+CEAjgrsf1ueEmwe5Bs3lUZYi9uXPy+E6+VXh
         5eF7sVVrUafqjETbyfVXPPXpOzVuJ1JgWiwAFxLMzYMXZKDY6XzO3xoGrLWvl2Od6Q38
         Q/NXKVkbyM0gXgU//G1bBQxaVQA3K5dtpYYkbD6rlBEX8prxz1YJZnFl3y2m5hDHxGT8
         wtB2JX9Rr4fEyH6zrQ3k4fQW7VQiG5bnb0trj8aFRq9h15tcRDl5KU0boOs8zCM4+of0
         cHlNQzdmWmwrcBo6D0dAKRZ/uP5XjRD4U6vaKibj9ryaQMhN11dimQIKX9V56rjMuA7l
         4+Kw==
X-Forwarded-Encrypted: i=1; AL+hErGExLT1ZZebkWQBp4l8Kbh+TNrmQ7/fieJyzWHtBVD3M10/7WS5fBGDZbL0FEA6yZhyxXQBdYqUDQhtaOir/X5ocg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cIFwNd7/YfJ9IhQcl16CFNe0DWI86PqYw6+dZSf4THvRU4F4Z
	XlVu4gcsZl4RlQqc94vzA9zSeKAzcwhm8KS0XLNNavX5TqK+o8qwQb+4Uwgb/Aw1czs=
X-Gm-Gg: AZFdTZc1Q+KuwNwSPB6TXgqtsBEBA0SdzUOJ+Uy36gJGB4EiB7GdsW6wVRdqnGQp6PO
	gZTIUW9OzKD6y52dZbl6u4f69EtVi0YnJySICaGNtVO+RSx5z3MzyWuNkPLr9z30wg4kncEmpIM
	zz+4+FE/GKW0ty5BiIsDUUhSgMi+QDGLuiiz4I6gj+fBBNHRKLgHWqo3BzdNU9PX2jqaV3WvQHq
	28Tu8FbYO0h6qiU7Pugmk6fajxtPLoHPLWUJoD18slWslDmf8OJMmYHCfwO/4LbycjxxQDK9tmn
	N5JKZ2ETUr+UfYoC6DQT9JTG1ErA58cVAg2WvTjuupTh+7Qa8unxouZBxgYgrtS/jZtv/MBHiYV
	b24YxV2ovzuLpwNMIbvMBrj4AfMeQdM50Bgy4jFyZ5Ud0LpVaGh5u717R90mpTfBr9rIfZ8dstV
	HasRDFHPQ8bzbhsrStmpALaAzqS7AiSqac4IYqzHCRkAsjyFCu3pSxuKGmUgn+4rBMJADJASLcs
	nx8YZmwY/MCypumNC0JxNK95JlYksnlVn7S4APC2CyTp5D3Ae/4JREKw8rbbCV91o0AhmU5isP6
	DeXd+aT7JdNhk+7Xzs/gLZZC/DSKqWrcLlq1W0qDxFHvdjHT010DbP2Dyu+yZjUfK9xQMxQEga+
	orT6afN5i6M5Gky31vQ0=
X-Received: by 2002:a05:600c:6298:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb88934652mr411385855e9.27.1795706472139;
        Thu, 26 Nov 2026 07:21:12 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:11a1:dfac:b1c2:1000])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm42419697f8f.3.2026.11.26.07.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:21:11 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 15:21:10 +0000
Message-Id: <DN58TGCM0EUJ.2DYM0M51C78MI@linaro.org>
Cc: <bzolnier@gmail.com>, <krzk@kernel.org>, <rafael@kernel.org>,
 <daniel.lezcano@kernel.org>, <lukasz.luba@arm.com>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Juan Yescas" <jyescas@google.com>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Christian Loehle"
 <christian.loehle@arm.com>
X-Mailer: aerc 0.20.0
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
 <CANgGJDrnH7R9aTXhH-nj710OjwNcUTfpxE7eWGSP=9a3eoUnug@mail.gmail.com>
 <4adc1712-3608-4fd7-9eba-79b129c67b77@linaro.org>
 <DN586284T46G.271ABU0A683IZ@linaro.org>
 <e329ce21-5a24-4301-9328-917d0ae4fdb1@linaro.org>
In-Reply-To: <e329ce21-5a24-4301-9328-917d0ae4fdb1@linaro.org>

On Thu Nov 26, 2026 at 3:01 PM GMT, Tudor Ambarus wrote:
>
>
> On 11/26/26 4:50 PM, Alexey Klimov wrote:
>> On Thu Nov 26, 2026 at 2:43 PM GMT, Tudor Ambarus wrote:
>>>
>>>
>>> On 11/26/26 1:51 PM, Alexey Klimov wrote:
>>>> On Thu, 26 Nov 2026 at 10:50, Christian Loehle <christian.loehle@arm.c=
om> wrote:
>>>>>
>>>>> On 11/26/26 09:16, Alexey Klimov wrote:
>>>>>> Hi Christian, Tudor,
>>>>>>
>>>>>> On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm=
.com> wrote:
>>>>>>>
>>>>>>> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command =
writes
>>>>>>> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU=
 clocks
>>>>>>> independently of its interrupt mask. Setting it to 0 C limits all t=
hree
>>>>>>> clusters to about 200 MHz while cpufreq reports the requested frequ=
encies.
>>>>>>> This was found through trial and error while tracking EAS regressio=
ns.
>>>>>>
>>>>>> Cpufreq reports the requested frequencies =E2=80=94 are these cached=
 values
>>>>>> being reported?
>>>>>> Or is this what the kernel gets via the ACPM call?
>>>>>
>>>>> Requested frequencies are reported. The 200MHz I only deduced from PM=
U counters.
>>>>
>>>> Tudor, your thoughts?
>>>> Is ACPM reporting an incorrect rate or are those cached values?
>>>
>>> Both. I checked with debug prints in cpufreq:
>>>
>>> - scaling_cur_freq returns the cached policy->cur.
>>> - cpuinfo_cur_freq gets the freq via ACPM call. The value always matche=
d
>>>   policy->cur
>>>
>>> So ACPM reports the DVFS level it was asked to set, not the throttled
>>> clock. With the hot trip lowered via sysfs so that the slot 7 throttle
>>> engages, on the X1 (cpu6):
>>>
>>>       zone     cycles/s (perf)   scaling_cur_freq   cpuinfo_cur_freq
>>>       68 C     0.85-1.21 GHz     2802000            2802000
>>>
>>> Without throttling, the three agree (e.g. 2.19 GHz measured, 2188000
>>> reported).
>>>
>>> It would be good to specify in the commit message that the governors
>>> don't see the throttle. Something like:
>>>
>>> Program slot 7 from the lowest hot trip. Above that temperature the
>>> firmware throttles the CPU clusters on its own, without cpufreq or the
>>> thermal governors noticing, so the hot trip must stay above the range
>>> where the governors regulate. This matches the downstream setup.
>>=20
>> Ain't that mean that ACPM ->dvfs.set_rate() call doesn't work?
>
> No, set_rate() works. Without throttling, the measured frequency follows
> every requested level (1.80/2.25/2.76 GHz at the cluster maxima, 2.19 GHz
> for 2188000, and scaling_max_freq caps take effect). FREQ_GET returns the
> level that was set; the throttle is applied by hardware below that level.

Sorry, I did a mistake, I meant get_rate() obviously.

>> I don't remember all the detauls but I think you mentioned that
>> downstream doesn't execute set_rate() ACPM call and does the SFR
>> (mmio) reads, basically what we have on Exynos850.
>>=20
>
> Downstream sets CPU rates through ACPM as well: cal_dfs_set_rate() calls
> exynos_acpm_set_rate() for ACPM vclks and caches the rate in vclk->vrate.
> cal_dfs_get_rate() returns that cached value and only asks ACPM when
> nothing is cached. So GS101 doesn't need the E850 approach, since its

> firmware implements FREQ_GET.

Which returns wrongs frequency for the situation described in the commit
message and in this discussion =3D> doesn't work? But the call itself
is implemented and doesn't return an error.

"limits all three clusters to about 200 MHz while cpufreq reports
the requested frequencies."
And also your tests.


>> What about clocks and corresponding PLL clocks?
>>=20
> Upstream has no CMU_CPUCLx driver. I'd expect a PLL readback to show the
> DVFS level too.

I am not sure.
TMU should assert a direct hardware sideband signal to the CMU block.
I would imagine it may play with CMU's clock divider/gate or triggers
skipping of clock pulses/injecting idle cycles.

Best regards,
Alexey


