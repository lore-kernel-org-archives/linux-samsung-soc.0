Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794588397;
	b=uYaB0gO70hfRygx0vDndem+Ey1gSQr6DLCQeKus/7g69EFtq7eqxgTJ+MSKcSYlphV8z
	 6I0gnYz7SB8lMM5bfKv1pEWoCPt/x8l+TmhOstm/zk/JOkBTW2FSr/9bDvDbbRsZOjMo5
	 63J9o37MlR9t2iV0/N4VK2xtZQ8HNfyKglEcEEWjYjEjj2y/HwX/XTeRgG6zCqKy5A7Gc
	 jP1vLf1vxMI7JpPcJ7utRLDUtHblwSBhXrzspHo5hMoxGdwlT8jpgeAtz9WNeofEUzBTe
	 kdZbtz3LeFX+TeAvUCBuhrq8q2jM+1dub7y0zUJDd37BhEUVeAh+jJr+8hbmSgvfAqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
	b=y8NN3f2rWdw5vhoGTE6Ee/6LMEhqwwLvR0EbBNq3JhCbSoqtMLaJwFK+AKG0r+9GxsOs
	 RcEZDewOdZVT/BnrxARO6HMQ97flEHfcNZCO8DhfoXBU8JkZ3EWIobDomB+Dg3JIXDilX
	 Nt6L0VFlot/mK19hlaZrXAVLANocbb+64ayy+H85lcDXLOtprsl3UK2mNv6AJoTnI0r0t
	 KN/ZLRDnaVOEx+6U28A9cGbsvxg7jLe1MXfUkmhGox/BfpRCjgEjfgPdaGAJ5IoT1ksi8
	 VyTqumlh9SZnXgzDz8AOLbdIhpbbsqfRuhACxu9KbXWprl0jfEW/igwHPSlpO2aJEcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iv+OQwbi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D07606A88E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 16:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D07606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iv+OQwbi
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so2227569a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 08:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794588395; cv=none;
        d=google.com; s=arc-20260327;
        b=c0qU9grTLrv1f9oWk1SJ6AmlwmuRAJgi4LaBUepel3sDg7ebUa1wKb1evAq+XN0nrz
         BNxjdu2/gCWwLvM1rwvtIZzZkXN4oUtMpm1VD5Y3/57ozqJKXiR5ApyhMCpxeBwGAE2p
         Hlqi9YgfEVFbzlvH0KDFeGYQsIg7AeQTpodBvxgDnVvGSNIVm1arJ97zb7v5LaoiYuXo
         z8SqLfiM1KXV5edsqLC+PPvGU4O/XBews9Av9UX4TQTzoNTnVYHLzhbPiklc90C2e+JH
         9CUqNVp8DMX6CClHpymKu3RwAiTWiUM7NJW33vu1F/BMXT509rhTu/oGT132KPCfxThG
         DJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        fh=FLv0hivgPPPNG39BOCjk5GQuoiYikJPc3XbH7Pb0PIg=;
        b=Gs9EKBMM6gi7t/aWpmCSAIVMwdOQzYe5m0LwLd6RRCmI4siFvR7alF1PZ8qhJM/zbv
         gTkIxCyvBuX7zkhcQqETS1deP/9WKpbgEq73Yx+KUoU3b9vsAdrU3lEnk5+OdcW/sx7f
         T7lTlyhDOdDaG0zxrkqqbP926CCXChTi7nwvO9VcIunvflNZrhrKTrKEbXypszDoN5uR
         YPI5GcWKIARSXZVz8UThVk4b0PBoXOYwG04xTIxqIVQ2b0DAb6InbCSIqLhr1b8kmpz9
         cDlTqous2rj78qMdG8Jo5RvCqe/SuVU5pCjUazKjyW7Cm5nIuiaFy9Y1jGK2cljmgpz2
         bkUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794588395; x=1795193195; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        b=iv+OQwbi4cghQpC0jKft/CSqfDiS1Ihc9bfUHcjUtiUmUBegPlwVr/Ul8v16P5x1Oa
         WJ2xfkXeIZqSRMcmRIzFnK1FCmeyxWVAIN2VXSDib1ZkUH3H2LU/Mip8ClkyAAhJIoT2
         uPY+i1hFWgOsylJs945u0z0AG0T/5ilAOzPbwa+bAykSn4GOP5UArt1jcWlNkZso2IzX
         CRiSokmPrLmTrrWNUe1r/OIJGNSh9i7KzU/GU1Dh6QEuNwGrKE3ZKB/sOkvKeqEk411k
         rndIDYoU9jL3kD+f7zNtbLiby6wstIJPZzPp+JZSwdoACWmvyFq1F6zTwoR/yjpV55pa
         jhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588395; x=1795193195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        b=aBC8mkuXbYJy6dhzEmDmxzQAeme7pOu8CWhN/htV4wS7n3NydxCQn0vQDSOo4SX2YQ
         ZGfF5go2KyglRvNK9XYZl68IwmtJcc7/i0Us62ZvJ7dpoq8N9jMlYT6ASbH8+0Z0Wnyt
         NevIQf2+2+DMyD9wiJbzdfE404szeVE57v9WexIIoCuyJHguZYfrRzTF210zAnhp7U3e
         okyRziAjLn3TTiuHiCe7b+aYY6ze14llBNi8XxXx+PXq1kzKC/k5764OxkDMDVy8UFD9
         C5si5KsZcjgWg9TlqdnscpoBjVQ/UKg5ejc8f025V0mNNf/zjVQ+WNZuJV+wLYmVi0pH
         rz1w==
X-Forwarded-Encrypted: i=1; AL+hErHxklQXWphnT/73w2Q7JdzCvhv4c1ao9ExUia+zLAsaKkW5DgayhnfuEiJHphSJpNXVgWMW6rnXxu08bldnttQT5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YJPJuziQNqFYC1ckxegCtEpUfyaiz5UbDWI1Ik24vaGNfFFtS
	tMrenQN1j8+erXBOrRgAlxvtR3kI9T8EUC+CuIeOwmrJPXZkxzfn02vgqHtkeb4eVSIXwlnCfcS
	I62Cipo95HIJiM+8ZmuhtD4LadJ4VaCe1HkQ4QeMdXg==
X-Gm-Gg: AYBFou2Y85j9BHAxytRlTeD42QTJEGUMcgm00n/Pe6F64yTNG9itBf/Mdc+Cm6p+U0w
	ZlC2thCzKOBOpg5UtzdlYnnHJeEV1SU1k4Wbb4+iebuGYD8RS1mKkuWYX6r9eZEo/laPoSAwcwt
	E4P3gIINpTQga9GQsvam6+Brlnhz9vmw53zo3qF3pCrZYMgxSMOxispe2HHrBIyV8dJegFMndUv
	9pq0YjxWaZgfisayXM8nq9kD1dXczgLIqDzr288wFylI9NPWwPrY7USjbF6PuaANCfe8XRi7aPn
	5GVR/KoGD37+Q0RxSy3XZazk73IoG7HNPTXds1Q6kD1QKC9Nycla54iAWkaz87Du3AGmEtIcbXm
	/tRxoqB2J1wUwT5sThLgw2JiZ+ezIg9MBHvlHHcuYxMvz27JAOCc/dfVDKsAD5hw1ELZGdQ==
X-Received: by 2002:a05:6402:a6c4:10b0:6b4:7b28:858b with SMTP id
 4fb4d7f45d1cf-6b7c0be1709mr2033159a12.19.1794588394028; Fri, 13 Nov 2026
 08:46:34 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
 <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
 <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org> <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
In-Reply-To: <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 16:46:21 +0000
X-Gm-Features: AclHuK_ez23rl1EP1_wg4tzOti-KVedDElMJmYIu226TUJ8WPAQv2T8gyYll0Ws
Message-ID: <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Turner <tturner@lineageos.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Juan Yescas <jyescas@google.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

> >> Eventually to have some sensible/working ->recalc_rate() for ACPM
> >> cpucl{0,1} clocks.
> >>
> >> Which is needed, for instance, for cpufreq_dt because it registers with:
> >>
> >> static struct cpufreq_driver dt_cpufreq_driver = {
> >>         .flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> >>                  CPUFREQ_IS_COOLING_DEV,
> >>
> >> Don't know if it answers the question (if I understood it correctly)?
> >>
> >
> > Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
> > parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
> > ->recalc_rate(). Could you please clarify a few things in the commit
> > message (and below):
>
> Thanks for the good questions. You hit the exact pain points we have been
> debugging on hardware with cpufreq-dt and Panfrost devfreq.
>
> > 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
> >    APM hardware, they are the PLLs that ACPM reconfigures behind the
> >    scenes. Meanwhile, acpm_clk_register() sets num_parents = 1 and
> >    pdata.fw_name = name for all 9 clocks in exynos850_acpm_clks[].
> >    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
> >    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
> >    orphaned in CCF with rate = 0?
>
> Correct. Is it a problem now since there are no "clients" or consumers or
> users of these clocks?
>
> Or do you suggest to link them all to parents clocks to have a sensible
> rate?

Since your implementation relies on CCF to get the clock rates I think
you have two options:
1) Only register ACPM clocks that have a corresponding CCF implementation.
2) Add the missing CCF clocks for the ACPM clocks you are registerring

Should CCF's ability to set the rate for these ACPM-managed clocks
also be restricted? It seems undesirable to have two entities (Linux
and ACPM) able to set the clock rate, with the possible exception of
it being useful for debugging. These limitations should also be
clearly mentioned in the commit message or cover letter.

>
> > 2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
> >    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
> >    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
> >    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
> >    __clk_recalc_rates() only reads the cached core->parent->rate without
> >    calling ->recalc_rate() on the parent itself. Won't parent_rate remain
> >    stuck at the initial boot frequency?
>
> This was already asked and seems there are no answers. The problem with
> stale rate is present.
> https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@linaro.org/

The question was sent on September 9th, but the series adding support
into ACPM was sent on September 15th
(https://lore.kernel.org/lkml/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org/).
The limitation about get_rate returning stale values should have been
clearly stated in the cover letter or commit messages.

>
> Any suggestions?

For the benefit of the ML, we discussed this topic off list. The
consensus was to try and make CCF walk the clock tree, recalculating
clock rates from the SFRs without using any cached values (as ACPM
could have changed the SFRs of PLLs, dividers, etc., behind Linux's
back).

That should in theory mean that clk_summary will always report the
correct clock rates for everything in the clock tree and we won't
report (or make decisions) based on stale values.

> > 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
> >    cpucl1_cmu_info still set `.manual_plls = true`.
> >    Does that conflict with ACPM firmware managing the CPU PLLs?
>
> I don't know yet what to do with that. I didn't encounter any problems
> yet because of this. Is it related to early initialisation only?
> I thought that exynos CMU driver doesn't touch PLL clocks after init.

You should check this with downstream sources and the TRM.

regards,

Peter
