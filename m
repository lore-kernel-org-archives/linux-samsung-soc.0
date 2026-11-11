Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365283;
	b=UflH88HdAdzjE56U6RJ+TzmR7+p7j5YdO7spZwgOmaa3PLnsFv20zg+FkGQ5msRzlPxJ
	 WVkBdlMBscBxuKQnkyFpsT93fscufi1krttOS3JzvDLvfbDj5DE+SbAd8Plts7f2WmfJy
	 8gJr4EEltpxeLP5gKJkz36mlXeeKJX3T8JJBLLYn8zr8hBa+MzrRcZvY1kP32iwPPjn4a
	 V3Dtls68Kwon5gSVLe/hV+XGvMQeCfNX3/WETvKaT2oxe3E5Q71N4l60IhjMXrmPpHCro
	 uWmI3V75sP7o2wYnKx7/bGCwsaM9jRnFIW9Dtu0sOM/BWMNOl9zfzWAe9uB577Zhl7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=;
	b=5VYmISeGHs4U9nZNCecZ4XmnlgOoV0Kv6EcFYIcLYtZahDRYLQoBPCinvyg39Ppb1pl8
	 hC2Em6As1kAy8gFqRdnFZF6Ay9Idb5gb6kX3PbvLmVT7dqSw2AxbukB4gLfMppjHuiG4i
	 cbIFkR3hC1I5jaqi6a6qacbwojj6mgjwPhj0j492L4/ZxlGzaH8UTQsq+6V/oyKUGuziV
	 f9J/aRjoAsEYUtvX4C7MyI2dWdWccWv+M/kh4cSRjgcwP6xpzbK9PhERDx8KuqfuvL8v5
	 HFi9hB77CblRxp3h3/nQN756f6AsgkTwul65QSKSXJRXnTfK536IbJ/DRTUsUWe3ApQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CzPoybpK;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F03606A321
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2026 02:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CzPoybpK
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso27827605e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2026 18:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794365281; x=1794970081; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=;
        b=CzPoybpKzKt8cx3ZkmD6WjMp5be0568OQsLnW8sqGhZxRa07MHaqv+2UE8a2ARmtSW
         hcG7SaNbTDWpqdm0MsDGPrGAWvPvrCIn/jMzw6sjkt/phxJNyZpxKfWOqZVtejHys7lo
         RZKReJqr4zRap3IynG8QVlOoF2Q3TTvzM2Rtb8TDoY/KSmCAYdgbuBP7Ba8KomvxUsfD
         BQiKkEprv9tKqOGAuv00u5Ey+g9/3O2mvg3e5gH20xOBZU13jB+eT3b/aFobjQ7Qqi2V
         7j0KsMheWKHWtF2PJTu4t8WN6mn5b0NHWotLebphhwU1viPiqBbVTY8vBSQIlzfpEzQQ
         6Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365281; x=1794970081;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=;
        b=j2AI/6CYlQObh3wlcCV8XMXVWHCBraGn76veL5T5YN6ZasbOi4sfEsmeMqOebYJ5Pl
         wMnHGwjDUlW9HKFMDUvlqY1eyp3qi2T6s3z0by5yEDsHAywTREFER8XDDiq2QUJG1cSG
         8qQd2+kf/zGtmRVqWaTLZVfQq3KuioAGFTg3T8U3ciy2nZyHCnNIf0ha5ITCaTjnd3/w
         toC5nJXvIJehz+zwjRnGHvL1DifNxVdTaLYbcMTcgvEugPsBFWhDsz11J5RmnISmnIqk
         Wl8IA+VsGHgBDwNcz70+hFDwSNo6d8nNi9vjFry8lD0CbNMfQZQbNeD76RN8ykSKETYw
         B28g==
X-Forwarded-Encrypted: i=1; AL+hErFN7S61Iw6fr2EhyGfFzlfEL4H5RtncCs/V3duwxozuU7r1GFpNUMMO9CDjjIAJ+Xe+E7w1s7j+09zpclXzfgoOQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8GVmVMDbgtn6hsPBmCfIqHotIY75Ia2548xips0OsleqBD26FZ
	zv/6hPjH8Ap2ErAudbQZSjgSAJ2gMujp8ZJJBnbSkFhLmqU0e/o2djEn4KGjl0EokPM=
X-Gm-Gg: AYBFou1w0tugpeS9eV2b6JjLN8Y8Y+zIh0BIpK09RGscwxsfZcXorpK1qAg1BF8QyZv
	L51nx/WT8lGNDtHNx5ZcosFoTzsb8pmvKf20ejLlXX4dqtZrNZyak7+Bj3lPHwEXeOI1f7vf4mn
	3DsZBCFXecjOo/5ECYtN6f9X1yDjZbclMk4H9us/VdXIlhR2IvBOwD15GM7JTPVNU+Yk87qsA+A
	8u1RCIZ+YkJhFX+DLjtktHSAgbGpB08GTCjExrUuXm4fH4QfBEmDR/ThDGAmMQ3rVEjiRr9VFJJ
	0ZB8Ahs8syqrb1D440dQmIl4KNG9zBhEnsNoKX32Rxkb4HAEpsaZ+kCt27lRmcOH9DunGeATVLa
	qrKtfnL9q9wKGS23X262S8+UWz1VAT4Vrz8t1afe+mYmUJytpwYfIBtx7AEvvS96NtiAFoAv50P
	70qUkCI68WQgY2KoT0KeGcV0gXC82G8wlnvA2DYCaUxRfl/8+nEFn5c+K6YWGLmbYYKxESRuozT
	3FedbP0sd9B9rIL4RPSgXNoarXKar2e/4bFY/qvif0+FBbrd8ux+AYnNfneghZj9HJXmVdcVE0F
	AH7+m2GrGLGeXMsOtO4v7XjprXKE8tsXClnAQFS1VkbmR+ZxWUBUl+WNcF+obt9LHUzqHtjq+ru
	3JMva67gXVq4LrQ==
X-Received: by 2002:a05:600c:1389:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ba09388518mr13400485e9.24.1794365280959;
        Tue, 10 Nov 2026 18:48:00 -0800 (PST)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe64bcsm99261205e9.8.2026.11.10.18.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:48:00 -0800 (PST)
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
Date: Wed, 11 Nov 2026 02:47:59 +0000
Message-Id: <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
Cc: "Thomas Turner" <tturner@lineageos.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Juan Yescas" <jyescas@google.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org> <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org>
In-Reply-To: <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org>


On Thu Oct 1, 2026 at 2:27 PM BST, Tudor Ambarus wrote:
>
> On 9/30/26 2:54 PM, Alexey Klimov wrote:
>> Hi Tudor,
>>=20
>> On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
>>> Hi, Alexey,
>>> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>>>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmwar=
e
>>>> protocol provides interface for all client drivers to actually use
>>>> features exposed by the APM co-processor.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/bo=
ot/dts/exynos/exynos850.dtsi
>>>> index 8a4771899a8e..91c6cee8f483 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -11,6 +11,7 @@
>>>>   */
>>>> =20
>>>>  #include <dt-bindings/clock/exynos850.h>
>>>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>>> =20
>>>> @@ -170,6 +171,18 @@ timer: timer {
>>>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>>>  	};
>>>> =20
>>>> +	firmware {
>>>> +		acpm_ipc: power-management {
>>>> +			compatible =3D "samsung,exynos850-acpm-ipc";
>>>> +			mboxes =3D <&ap2apm_mailbox>;
>>>> +			shmem =3D <&apm_sram>;
>>>> +			clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>>>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>>>
>>> Why do you describe these clocks?
>>=20
>>>> +			clock-names =3D "cpucl0", "cpucl1";
>>=20
>> To link these clocks with ACPM clocks from this list:
>> (file drivers/clk/samsung/clk-acpm.c)
>>=20
>> static const struct acpm_clk_variant exynos850_acpm_clks[] =3D {
>> 	ACPM_CLK("mif"),
>> 	ACPM_CLK("int"),
>> 	ACPM_CLK("cpucl0"),
>> 	ACPM_CLK("cpucl1"),
>> 	ACPM_CLK("g3d"),
>> 	ACPM_CLK("aud"),
>> 	ACPM_CLK("cam"),
>> 	ACPM_CLK("disp"),
>> 	ACPM_CLK("cp"),
>> };
>>=20
>> Eventually to have some sensible/working ->recalc_rate() for ACPM
>> cpucl{0,1} clocks.
>>=20
>> Which is needed, for instance, for cpufreq_dt because it registers with:
>>=20
>> static struct cpufreq_driver dt_cpufreq_driver =3D {
>>         .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>>                  CPUFREQ_IS_COOLING_DEV,
>>=20
>> Don't know if it answers the question (if I understood it correctly)?
>>=20
>
> Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
> parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
> ->recalc_rate(). Could you please clarify a few things in the commit
> message (and below):

Thanks for the good questions. You hit the exact pain points we have been
debugging on hardware with cpufreq-dt and Panfrost devfreq.

> 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
>    APM hardware, they are the PLLs that ACPM reconfigures behind the
>    scenes. Meanwhile, acpm_clk_register() sets num_parents =3D 1 and
>    pdata.fw_name =3D name for all 9 clocks in exynos850_acpm_clks[].
>    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
>    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
>    orphaned in CCF with rate =3D 0?

Correct. Is it a problem now since there are no "clients" or consumers or
users of these clocks?

Or do you suggest to link them all to parents clocks to have a sensible
rate?

> 2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
>    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
>    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
>    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
>    __clk_recalc_rates() only reads the cached core->parent->rate without
>    calling ->recalc_rate() on the parent itself. Won't parent_rate remain
>    stuck at the initial boot frequency?

This was already asked and seems there are no answers. The problem with
stale rate is present.
https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@linaro=
.org/

Any suggestions? It does seem to be a real problem since we discussed this
again off the list and cpufreq may stuck because of this.

We can cache the ACPM clock set_rate if the call succeeded for instance
(option 2 in the URL above).
I have such patch somewhere locally and Thomas also cooked a version
with caching. Will it be an acceptable approach?

The other thing is that we may need an initial rate set if reading of
a rate happens before first ACPM set rate call.
Is it fine to return parent's clock rate in such case? For this approach
we actually need linking to parent clocks.
Or should we hardcode some boot values in the driver for instance?
We can also potentially hardcode PLL clocks to get one-time boot
(initial values) for ACPM clocks and avoid using parent's clocks
toplogy.


> 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
>    cpucl1_cmu_info still set `.manual_plls =3D true`.
>    Does that conflict with ACPM firmware managing the CPU PLLs?

I don't know yet what to do with that. I didn't encounter any problems
yet because of this. Is it related to early initialisation only?
I thought that exynos CMU driver doesn't touch PLL clocks after init.

Thanks,
Alexey


