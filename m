Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704641;
	b=x5rKYL0i6ErgmQmqjJf9deMiKg9Yytan32vxKkkzqfTKb5pjVS4iayPC8Vf1qgg1iM+/
	 2xj6D3XyfzVVZzKZib3DLrf/ck3dRKmseeXvJMhU32O0pFvfIzPPVp9TrYoeiZGBMKpMJ
	 E2bNWpV9MeZjittrdlYX+A1QonOjRaO9W2t4uGJdBd1XWLMgdPTFQaBI/inOznX+lyVOZ
	 U7IqBmWAUZLvqjr2cJgmlz8MzAyjnAld56eDsE2fcIG4fATXz2Q2pRjXGLEJrRkdFnNEC
	 WQXAGKTKgAQjHgluy5uCOFWQ84OlSNsG3hxfG62i55QucOE7rrtkZPZJ7b1iixdyxOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=xq+y/FXf8/3zSeIalwIHZaco3Hq6kDLw8caajKfnzLE=;
	b=euoNUzvDZ2zEnN5Y2wwLgtU4tXaZEcCCWquWJ+cWFedGbP0nkFGLYEV00XK/GQevrlWm
	 NPz0doZqVtcUdec1g/iMILrJuY8Ni6RIXN3Rw3o28DkaUqWylwkGoH2sz2Y+5obdRWr3H
	 +PR2ofUibVpl2Vk1NhuJuhmKHOkQBUmF1SiNlif082Btn4C73siN6CLrKecUSRQdY7Z+e
	 LKOeYX9LCtS/rpZu1Ml8f8y+FsnJK+9POVIj8jYfzCBvas0+8xN2rZyGH+fYk+CVMHBoS
	 5INiqCRwB3RfGV6MlZr77C0vTGAlHkXOUX1cGO8VbOoCIQQ+gaPYWGHDkwpB4CVNEgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pj2eR6ec;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7EE606A32A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 14:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD7EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pj2eR6ec
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so70625915e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 06:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795704639; x=1796309439; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xq+y/FXf8/3zSeIalwIHZaco3Hq6kDLw8caajKfnzLE=;
        b=Pj2eR6eciz64xSA48uFZKflTRCMX6C+yirjK0byZG3w5nFGba3RlkC9KY9x2hpYduC
         y+52YU8Hvr06Keo29cj40ISWfFWRVGp1T9puUNqQygYW4XulPHMPIAg0sFRD81SYq8wI
         +jtK/Pi8O+1zDSWwjwh9YNqhx5BMNDN8lAHKKpDoEbmBemj1CR0BUUpLjQwrKW6gAPzA
         Mh3teJg14b+tVoBSjUEsMYIx23pU1meLNtytQhvZGK7zxmYuyPwrYSHTvHlo3Hrpel5r
         NWTo9miYghs7bnwk05m+O0dNb1ju/KRbpWtcK/pvtqsI3ZlOH8AT+qrnizrUsiaDp8GB
         UNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704639; x=1796309439;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xq+y/FXf8/3zSeIalwIHZaco3Hq6kDLw8caajKfnzLE=;
        b=Jfy+MlkHyIsngDkbWMKaApmTUBrV4qN+vKLX4mkTIxc7dnWx4KP8vSD9BHra3CEVnh
         K3vEGcMH53Y6GDqMtzU/UcgDbX05O19yyy/FnNvWNGkyXqXt71G5wCtmg63cSxjk6UD8
         wAU7Du7SXDCXWU6jqp47v/e7taDjtiUFOQmOr+qT6gVDhGu4fT+cDQ9aeTaPYN2eQr3p
         D6Rsecv+iMdJDo4sbkFZtS9OC0aoxOFaZ8JngPnStpcglmY6wBvaEQkJ7QTEr5/DLljM
         Z4Ej4Nou0eH1UGSqWu52K+r24Y2TcVFY5GmIpNxwfUFkyU0gRLhYkIvN/gVNnQgowHnL
         iJZg==
X-Forwarded-Encrypted: i=1; AL+hErF37cWDeEgvWhVS+C4hhy0CyGis3cXnDge4oEj4b2KwHCMtG/LxxT+03YPryzGw4lTG0F+F2i0QdFcpXkM6TlVlPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/IBPe6Sf5Ih8hgWRXx2LSF6KQ6mnN3kVWL5FZlqbAviTOHX3ZZ
	2cDXp2dRAnItDyNbzzLA27AqEBfaVCzJ9GX2XA0p9szBk47eJKVWoQEg5ojK4kiuNy0=
X-Gm-Gg: AZFdTZc4ESVm9kWnp5qcjVZ4cdTrIe7w2Wj+9dZFuKp+Eg/e85lVL8AEB0NI+Ng0SOD
	HWLh3e0SoW6xiUTwklHJhFbgeVPVdVM6eHInuCuIVZA8kBq9Mh5hEheKoZIxhiOEIgt7o5/wUkB
	qD8rKIpkp5jPC3+YGXAB6jQVYfv3VBznQ7TnGIEtLGCQcieZwmSNLK+f+xrugtXPcjmzlT98gZA
	NG22gPjdFpUbznFCc81MIwrttWahho99lcR7qyg3+vipwH10eio9jNVVjStwJu46EQw09S5R4cA
	LQCUY/AdETAvkcrOLL26nrOJSGVGJJUcnMwSEGZMgsCYX9t6Mvg5ujpSjqO3jzYhYBr4JFH5ozF
	QR75MkBfech7zpOVL+rKACd3Oydzukf7JYHkQskzvWgyaqerLy8IwBNZ4I5O5cyu3EbbB/XxiIc
	wl+NHslHLx8DCNuthNjKK2e3CtL8M7IqaO0dHcn4msMu3ObbJy8y/hAqjcVh2n1At8q4/0R9K7N
	mKswu09/zoyF744fWjTBtPzRIe5jCaku1oA7exnmv7Bz0pBWKqxnpnMI9wqeDhj9mw06agePKQA
	rR5V3CF7lIj1xdxRr2l2VnSCORkb+RTUznRCTjTZ8sI0YJ8LiHp0auWU+FXkwpM9ZvNBvOcbT1M
	a8wef3iX9TT5zZomDD34=
X-Received: by 2002:a05:600c:6290:b0:4bb:741d:eba with SMTP id 5b1f17b1804b1-4bb88824a5bmr425798095e9.13.1795704639068;
        Thu, 26 Nov 2026 06:50:39 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:11a1:dfac:b1c2:1000])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm41693738f8f.16.2026.11.26.06.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:50:38 -0800 (PST)
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
Date: Thu, 26 Nov 2026 14:50:37 +0000
Message-Id: <DN586284T46G.271ABU0A683IZ@linaro.org>
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
In-Reply-To: <4adc1712-3608-4fd7-9eba-79b129c67b77@linaro.org>

On Thu Nov 26, 2026 at 2:43 PM GMT, Tudor Ambarus wrote:
>
>
> On 11/26/26 1:51 PM, Alexey Klimov wrote:
>> On Thu, 26 Nov 2026 at 10:50, Christian Loehle <christian.loehle@arm.com=
> wrote:
>>>
>>> On 11/26/26 09:16, Alexey Klimov wrote:
>>>> Hi Christian, Tudor,
>>>>
>>>> On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.c=
om> wrote:
>>>>>
>>>>> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command wr=
ites
>>>>> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU c=
locks
>>>>> independently of its interrupt mask. Setting it to 0 C limits all thr=
ee
>>>>> clusters to about 200 MHz while cpufreq reports the requested frequen=
cies.
>>>>> This was found through trial and error while tracking EAS regressions=
.
>>>>
>>>> Cpufreq reports the requested frequencies =E2=80=94 are these cached v=
alues
>>>> being reported?
>>>> Or is this what the kernel gets via the ACPM call?
>>>
>>> Requested frequencies are reported. The 200MHz I only deduced from PMU =
counters.
>>=20
>> Tudor, your thoughts?
>> Is ACPM reporting an incorrect rate or are those cached values?
>
> Both. I checked with debug prints in cpufreq:
>
> - scaling_cur_freq returns the cached policy->cur.
> - cpuinfo_cur_freq gets the freq via ACPM call. The value always matched
>   policy->cur
>
> So ACPM reports the DVFS level it was asked to set, not the throttled
> clock. With the hot trip lowered via sysfs so that the slot 7 throttle
> engages, on the X1 (cpu6):
>
>       zone     cycles/s (perf)   scaling_cur_freq   cpuinfo_cur_freq
>       68 C     0.85-1.21 GHz     2802000            2802000
>
> Without throttling, the three agree (e.g. 2.19 GHz measured, 2188000
> reported).
>
> It would be good to specify in the commit message that the governors
> don't see the throttle. Something like:
>
> Program slot 7 from the lowest hot trip. Above that temperature the
> firmware throttles the CPU clusters on its own, without cpufreq or the
> thermal governors noticing, so the hot trip must stay above the range
> where the governors regulate. This matches the downstream setup.

Ain't that mean that ACPM ->dvfs.set_rate() call doesn't work?
I don't remember all the detauls but I think you mentioned that
downstream doesn't execute set_rate() ACPM call and does the SFR
(mmio) reads, basically what we have on Exynos850.

What about clocks and corresponding PLL clocks?

Thanks,
Alexey

