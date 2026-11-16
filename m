Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846696;
	b=zVSzAtuN0Wx/ddwWoaJEyQr6+x5zND1a3fxnFOg+qAHm76Qz1THfBStnv4G2R+nOEw44
	 ZD6IQCBixRBY7Cklg+TGWafk2xDpgUtZRQc4KTvFJSh/V1kw1MUNua7XFJS5RrEASpu32
	 mdHGNoQHnLLZ+jN8azeXI5TESRHmlpJuX1EXyp8EzZZYieuUBH980JVN7GhBnX3DyrEa7
	 SCzG+ZqM0FRTccNU/2dM7G3ocJUQIh1ids+3erR1bJFGT+/KbQquy4S6hQ6+QIulrTTh4
	 o/KUfWlvKcxA2+0we/V7pj1tVUI9OIEThBmUdrX6EF9OVTm7uSsfkAM3hzFbze0Xxgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=;
	b=kPow8aL/yxQ7YZ4V29Tx75DOcbdVzKQTZ57SU+mZNyLWHFthOdSM/OctmBepP832y5gu
	 3zzUfDRwq9i63h2wC/J0hD2i4lL/ZQ52cVUDOey2fnfV0ZFbHjJNVksOTA0YjbwPyOZlK
	 hK9EQnA4IkI7SFSsHXn6YXrjS9GNTAsm0bogB+/mH2Y9raYni3eyHIF/Bq0SfvELy9SiM
	 AgeCHlDDO8DVSpyUvgYRyDbADvsct14DxkS0llNYnOu9agciyn/Gmp8AbbqqK4N5cgCzP
	 3UQ2NT8ii99rA0UTfprAwcSBJM3OF9SWjkujR2HDPL7jOl/uwDTnTPgBFfKHjM3cSlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EEvBKJ1r;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A81606A323
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 16:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A81606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EEvBKJ1r
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so22956095e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794846694; x=1795451494; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=;
        b=EEvBKJ1rFfBy+1dRTF2Mv5NGPK7F2WYjuh/Zyb+oEqRcWF0/WVJ9xmDiJIQLcC2bjB
         W3OZGnemxf1txBh/fC0zSljE+2CV3BCYPwK3CsmbULLyI7dddfmqTS5200TuHxSVJfc9
         qSJG3m7YaeB+9o1Psx7mhYVP09HUDmPwl7yTB2yvGX6HxGYh8QkB1TTyYAnV5wIhuEj7
         34gfp4+FhfD3pYKnLIlmaNgBhPTv+7y5DJ5cJAzWGRvsDU5W64h/EhQVja0br7w45gJA
         l4MSDBsLGFlPb+fpOMdx+uOJknwZdoDWcfr3Q+d8IKz+scHslJd+0uf+qKbrPNbeH1uJ
         dYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846694; x=1795451494;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=;
        b=zYcifB9pYgnYYUX4dP4LKqZVLtq5hEfyBEgPRM1IIkDfOr++ufe6l/sKIzn85xP0Ep
         Zf0ePBq6qDyVYrwJAXDFBFbPKu/aXUovBek2BQwPjE5Y/cs3NtWug+fWWP1UW/2VGH+V
         ScOmRmSplHC4P1RIDbE64K9eoLGAR1qGwz/aFvW0Njhe4KQto8sWeSYY32N+XQVxrgSA
         6n6zmzLgLUIbbMCCo2eUTHGUY6U9MSivvKZYSSMo+6Ev8LtsJtP6Yiml0GP5z4/ZU20Z
         IdYiQPx63c0x6MANwcdvjQqfbDAFhrsdyY92C9DhXlcZlxp+VO0Bn5t5d3B3RG8Xn+14
         g8NQ==
X-Forwarded-Encrypted: i=1; AL+hErFIZXxbNNOmbSoWI9wibnDOLFE8fxEIuMwekNuLMDRzkyzgJf+doTOJcnBqJksDf8TqQ0bvRkztDZM/hZaC3xLGjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9xYlyFq3XmAc47wgUk7zPkF+xESNGRO/Sk/6Qn/8vxj16vzR3
	9Pwo8VT8M25DAViZvwzO9zjdWuK/dtCCxZRlRi+kRzmtJaaywxzRX4PMnJsudq7HNUQ=
X-Gm-Gg: AYBFou20pUQLJSIq5v46ouy70xjkpztUUemunxKVArg22WMhmtMomJEsfYiu9nossTZ
	dYj0e1gIm35FglGiKSKDbnt+2IJO2ptBoGSeWIhADL1+afPnEec1rZmHgXEWeVk40N4t/N5X4Xa
	tfR3eUTr+3mwFjGPuFszZsrXm6Yfyqk15zov17thM+4loc4/51pyxVDqrHrEaKcj2JhKFhnZo4T
	kdpOS+FHOtnnR+Odqe8q81s3ERZqT+Aqgl9xJG4gcbetzwtth20QNgXUCuVN66rC7orlpjoC8PY
	sGR8IR/zwfQ+Wram7gGAM4hSTLBUppyNcEw/KxkQjpgik4lcNZhkCQy2TW+ijthimaw+Byg0OFT
	fJTOXUApjT2tSFOKLjjfUGbCphQnV7OlOOaB9Sa74BMHdfpewuQgIDy9FpcViWrupbVEmadXT1K
	nDKhLP4aSJZyo/DTapT9UhPo1iJYtTbKGVmtGekorX8DTZNsHTL7kWsUbK7IN9Gxd+p8oeNqfQt
	8Q6jMM8dHyE2NIds/5pgXS4GUDUHUQfiXue2HKFCLZZag/eq3ZF2A9yDTekQXyd49KdKskGYkCa
	H5d/nfdEsNjDvJ7N2IvCd62al4fRpkErjlRcsViIYinBson5qxq9bwLfpLTbQjimgJAih6Yf2u1
	3ZZGhyXWkspo+zkjMztQ=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr233741175e9.21.1794846694305;
        Mon, 16 Nov 2026 08:31:34 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:bb28:8e5a:f94b:4332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78385508sm242715e9.3.2026.11.16.08.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:31:32 -0800 (PST)
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
Date: Mon, 16 Nov 2026 16:31:30 +0000
Message-Id: <DMWS1URVNP4I.99T9QR6VWAUW@linaro.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Thomas Turner"
 <tturner@lineageos.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Juan Yescas" <jyescas@google.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org> <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org> <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org> <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>
In-Reply-To: <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>

Hi Peter,

On Fri Nov 13, 2026 at 4:46 PM GMT, Peter Griffin wrote:
> Hi Alexey,
>
>> >> Eventually to have some sensible/working ->recalc_rate() for ACPM
>> >> cpucl{0,1} clocks.
>> >>
>> >> Which is needed, for instance, for cpufreq_dt because it registers wi=
th:
>> >>
>> >> static struct cpufreq_driver dt_cpufreq_driver =3D {
>> >>         .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>> >>                  CPUFREQ_IS_COOLING_DEV,
>> >>
>> >> Don't know if it answers the question (if I understood it correctly)?
>> >>
>> >
>> > Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
>> > parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
>> > ->recalc_rate(). Could you please clarify a few things in the commit
>> > message (and below):
>>
>> Thanks for the good questions. You hit the exact pain points we have bee=
n
>> debugging on hardware with cpufreq-dt and Panfrost devfreq.
>>
>> > 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding th=
e
>> >    APM hardware, they are the PLLs that ACPM reconfigures behind the
>> >    scenes. Meanwhile, acpm_clk_register() sets num_parents =3D 1 and
>> >    pdata.fw_name =3D name for all 9 clocks in exynos850_acpm_clks[].
>> >    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
>> >    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanentl=
y
>> >    orphaned in CCF with rate =3D 0?
>>
>> Correct. Is it a problem now since there are no "clients" or consumers o=
r
>> users of these clocks?
>>
>> Or do you suggest to link them all to parents clocks to have a sensible
>> rate?
>
> Since your implementation relies on CCF to get the clock rates I think
> you have two options:
> 1) Only register ACPM clocks that have a corresponding CCF implementation=
.
> 2) Add the missing CCF clocks for the ACPM clocks you are registerring

Well, if there are other suggestions to implement these clocks without
relying on clock framework, then feel free to share.

Current implementation does indeed registers all clocks from
exynos850_acpm_clks[] and the ones not listed in DT will have no
parents, no rates, with no_connection_id and no users+usage.

Since it seems to be a problem, okay I will fix it.

> Should CCF's ability to set the rate for these ACPM-managed clocks
> also be restricted? It seems undesirable to have two entities (Linux
> and ACPM) able to set the clock rate, with the possible exception of
> it being useful for debugging. These limitations should also be
> clearly mentioned in the commit message or cover letter.

Ideally yes.

>> > 2. Does bypass_acpm_exynos850_get_rate() actually return the updated r=
ate
>> >    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
>> >    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
>> >    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
>> >    __clk_recalc_rates() only reads the cached core->parent->rate witho=
ut
>> >    calling ->recalc_rate() on the parent itself. Won't parent_rate rem=
ain
>> >    stuck at the initial boot frequency?
>>
>> This was already asked and seems there are no answers. The problem with
>> stale rate is present.
>> https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@lin=
aro.org/
>
> The question was sent on September 9th, but the series adding support
> into ACPM was sent on September 15th
> (https://lore.kernel.org/lkml/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3f=
b1@linaro.org/).
> The limitation about get_rate returning stale values should have been
> clearly stated in the cover letter or commit messages.

It is a fair point on documenting this in the commit message =E2=80=94
but the gravity of the problem and its consequences were understood quite
recently (you should be aware about that). At the time v2 was sent,
initial testing only exercised one-way rate transitions which appeared to
work, so the full impact of the stale rate wasn't apparent until more
detailed DVFS testing later on. The problems with stale rate were
initially discussed way before September.

>> Any suggestions?
>
> For the benefit of the ML, we discussed this topic off list. The
> consensus was to try and make CCF walk the clock tree, recalculating
> clock rates from the SFRs without using any cached values (as ACPM
> could have changed the SFRs of PLLs, dividers, etc., behind Linux's
> back).
>
> That should in theory mean that clk_summary will always report the
> correct clock rates for everything in the clock tree and we won't
> report (or make decisions) based on stale values.

I'll re-implement and re-send.

>> > 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
>> >    cpucl1_cmu_info still set `.manual_plls =3D true`.
>> >    Does that conflict with ACPM firmware managing the CPU PLLs?
>>
>> I don't know yet what to do with that. I didn't encounter any problems
>> yet because of this. Is it related to early initialisation only?
>> I thought that exynos CMU driver doesn't touch PLL clocks after init.
>
> You should check this with downstream sources and the TRM.

Erm, I don't think this question relates to downstream unless I am
missing something.

BR,
Alexey.
