Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707104;
	b=oQGI69zFvr2xIYK0h36GmEAmZlBfsE6tH/meMo5HlxeNqX7Ug45qlmDSVaugUOoWyLpJ
	 5s0z664OtY9sRLyLACk7c+BFWNYk+VRJqpGz3WkGp85T1+6AuEjbJIkuXYfIzPbwvwLd4
	 Fh/S1XuxVJfvf0YYq2Wy8DMb2y1hdivikyrQg3sTwDVahQw2trxPLdVC/r9VdT3a36hHi
	 66nGZNTaXVanws1Wd6LhJQTysxtRNDc9L3oo8r00g2+JSRoC9G3kggTunf9P8kschlDMO
	 Bbf7089mVNgp7CrLWHz6psRU79a3q0lZtDqsRNBiyPHg8aDucqN1G5toutb3KoHdI6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=CNCCU62jDJl9wNoG3rW1B0EyVBtl7xnr4/sj56FZ3Ck=;
	b=5dcTzjXOeHi92b3ipZf1qsh17mOIqzp4oH30iX0h7gZc76yZaqrrhGhRqNsx8WxSsuQA
	 WhapMHbOVADLr1cwiYNug7+dikPmXj4QamVVHyBCUFrsfSY3SvjPAcd6O27Ma8LA/b7OY
	 isuXloptQimoIjXS0GA1HuyHB05D/DRQmHBXR2B+15HKsvI/3jkzsZ+9uc9cSpKSJWqcJ
	 FyCl4VyDZzta9R2uEAighzbctR9N6ROUG8kWndqdhe6j5cVKDnXlGtwNcLC9wKlm2VtmX
	 FFUog8kX2yV9iivCtMPNsFABQ6hqOrd2IYtqNJrKjoMu2Ilv1KTnGID6tAi1fNrDoUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mG3JMuiu;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B068606A31E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 15:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B068606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mG3JMuiu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so17651155e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 07:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795707103; x=1796311903; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CNCCU62jDJl9wNoG3rW1B0EyVBtl7xnr4/sj56FZ3Ck=;
        b=mG3JMuiuTh0qJHEgtqlWO1QzHe5cXadqiY6ZbiCRf+9Y8OuZWFJTbOjRFCdDV0FHiF
         yo0/VV2mjXJounpOzQuaQcP0fXNpVw+6YBwUaLe2xUfdvyGWUvICyeR59pkYmRVfcA6+
         kgkjGNxQTU3tC6HVXAulQUDLlerh4h/dQEl+qmJ/CJcHfWqcNJ4UzNOqdrqy7UyKy0QY
         FsZmLJSYWdagR2ZBAcO18fcAR84OutmANWh4TbzudwM3ILZwz8UMw31C9GKoSq278m2C
         48fpAArBX7F7UrlFa8Y5fM9pkq82TnCqjs6LqjApE60izruG0XhF9XZKgVA1peF9ozW3
         NpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707103; x=1796311903;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNCCU62jDJl9wNoG3rW1B0EyVBtl7xnr4/sj56FZ3Ck=;
        b=PEiXl5C5gQJ7HQO56uf8j/trOxgn8V7zu9wlDhMnZHnO1P87nmx0MYEPhXM6xSonBi
         OSyfZkmV4CKanPcgGUM8qT4Tyo/24RER3epuh6FJtJub5HXuh4kNt745F7cbwiOwhv72
         DQ5tbZ0/FIKaE0ccQhNhErmuGMpQDJcQcw1kiiNzf7kNQFlv7sjDXnT+iaG3+Guxk388
         W2rC5Jd2FF91lAcpu1BLlxyw8qhJJAwgwCh75JdTxTBKkOW9ypVcAs1unWiuE17HLG/E
         N+9sA5EwUuGXesw/Ts2q13qmr4q4qLFWlMMtDuYjcA8JxZdIcYy79r4JbE8Jn4+BQcec
         6rhg==
X-Forwarded-Encrypted: i=1; AL+hErGO6mRkFvxiMOhrY0dpcoJVg9cc5lJ1jny/k4h7Sv3o6E931jhyO+pvErlK8Aa2PNlF4d8T8eers4zWeCCecPsQ7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UVN28bOGztwCmPtUSFlKrqYNm1s6CZ0p6kbqsyEyH0Tu0j7oU
	B1kPAtVSW+aOTlZjIIo5/Bx0csLjm5HWV398ZLMCI98MtlvcBBu7CbdS08busfZvhoQ=
X-Gm-Gg: AZFdTZeJh64F4dPc3go8QSHDQEJtmXYnPZna5AxNcbBWpEcsbMJN5VFwTQXF7R/J7Xz
	kllFqQfNj9pd2r714tjZgAirxEr1H6c0WozeQwx4X5Z04ZA9zVGrP1v1H/iDodQAHwZUiHERdaW
	VvvRjaRQCqmgJEtsH8UkIfZwTNds7bxuUiiWftdJfnHQcgDR//EbT/hl0UlURQIuzl5cP37tM0s
	X0s01Y87WgOa3529Zzjo4kbw93EFohUXCpjYrC6LWdug8L87lapmQLbdS/nYaVR+v8QTjZKiowY
	47b4oba6df4bWGAlqVGOV/nNLXzRm9CynkATaF8ncBaQicNYbX7wfgdX+A1apSoa5Nh7PWMlpud
	zEYWqJ9PgoZimaYwQnYRgTB5aD+MiAThzrtGPhI5hAANKA4RSjLqLMVjhp4pvwzMHpsRtTqUGuH
	zzrZAJsjOSSO3MXbLFmWj60WcdSEcuohMr/jueCspEHwdQGDSGLWYEQh3u1Sfser6Z/Yc0cmTuQ
	e0hw3EOQ6ybRVqvcHS0kR4lzTS1BnyFHwQrl0MH6ktVU7aFMTXdlS2K973g9HgsiHcEI+Zxgrd9
	g+lAWnZqbiHtWzqGEfJkiwdLQaR28osP9Q/Iz6ATUBbsHzHvyj9FmlkeVv+1IsfZZbyop8ujpAC
	ge41L6dvF/J8vsr7MOLg=
X-Received: by 2002:a05:600c:4753:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4bb8880c73emr448397385e9.21.1795707102651;
        Thu, 26 Nov 2026 07:31:42 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:11a1:dfac:b1c2:1000])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm678687845e9.14.2026.11.26.07.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:31:42 -0800 (PST)
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
Date: Thu, 26 Nov 2026 15:31:41 +0000
Message-Id: <DN591I26AVUH.11MO49ZCF9V8U@linaro.org>
Cc: <bzolnier@gmail.com>, <krzk@kernel.org>, <rafael@kernel.org>,
 <daniel.lezcano@kernel.org>, <lukasz.luba@arm.com>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-pm@vger.kernel.org>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Christian Loehle" <christian.loehle@arm.com>,
 <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
In-Reply-To: <2162b02c-642a-446c-973e-ca80607da294@arm.com>

On Thu Nov 26, 2026 at 10:50 AM GMT, Christian Loehle wrote:
> On 11/26/26 09:16, Alexey Klimov wrote:
>> Hi Christian, Tudor,
>>=20
>> On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.com=
> wrote:
>>>
>>> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writ=
es
>>> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clo=
cks
>>> independently of its interrupt mask. Setting it to 0 C limits all three
>>> clusters to about 200 MHz while cpufreq reports the requested frequenci=
es.
>>> This was found through trial and error while tracking EAS regressions.
>>=20
>> Cpufreq reports the requested frequencies =E2=80=94 are these cached val=
ues
>> being reported?
>> Or is this what the kernel gets via the ACPM call?
>
> Requested frequencies are reported. The 200MHz I only deduced from PMU co=
unters.
>
>>=20
>>> Program slot 7 from the lowest active hot trip so hardware throttling c=
an
>>> precede the critical trip's system shutdown. Cache the low/high window =
and
>>> update the hot limit from set_trip_temp(), because the thermal core ski=
ps
>>> set_trips() when that window is unchanged.
>>=20
>> FWIW, Exynos850 control register for TMU has bits to enabled/disable
>> such behaviour (and it probably works).
>> Maybe gs101 also has it.
>> But it seems that cpufreq scaling feature itself is explicitly enabled.
>
> Thanks for the hint Alexey!
> THERM_TRIP_EN is bit12 on Exynos850, clearing that on gs101 still stays o=
n 200MHz
> for me. The downstream driver doesn't define it either.
> Clearing bit16, i.e. 0x09003 instead of 0x19003 does indeed remove the th=
rottling
> even with all zeroes in slot7.
> I would probably still go with $SUBJECT, as I'd say the risk of this havi=
ng unwanted
> side effects is lower IMHO, but I'm also happy with either.

Sure, no objections about the patch here!

I just thought that for exynos850 we might need to initialise it manually
since we rely there less on ACPM and what bootloader leaves for kernel.

Thanks for checking.

Best regards,
Alexey

