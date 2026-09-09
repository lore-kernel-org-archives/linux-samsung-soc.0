Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173639CD0E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978470; cv=none; b=ptXCX+EEJta3ccMXbuOL4SmJ3rf/ABCI4DZCAVQ6KgukvsjIN+iyiMKoVxP9CPYno5ifqpcD2jKYL0ajq67ZnGRuRtB0SmYfu9x3Cy+9zLPNGdEMuEVpSTJeqJE9Ph/FzfPV5DgigQQre9ilRixpzOlTV+GbdL1CjaEwtyYu0Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978470; c=relaxed/simple;
	bh=jpVDW6nqXT3bwXZCXv2EI+3UUbOFqSMc60wFkeXbAgk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=lc6H17zyAHxB/RAfdVJWx9YSkIwAR5bDDMsWn1976KpHWyw37ak/I0asbP+F/LhKTUp30WRmBNH/pfQVjT+5GZR2Fz31myB+8kpsnk1ZaYyBs5MbH9Odes053/E0WhxkBEcEH/8ekywnzd+rqc9rw1V8RnT7ec60FDOFUhl4zsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeX0in1d; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeX0in1d"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so49489135e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 11:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788978465; x=1789583265; darn=vger.kernel.org;
        h=to:from:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzzpRVmc6Qf1040g7Lq6SnAgBrX6WGAOi89cdyMonLo=;
        b=qeX0in1dIzu48J9x5R8KqoTgevc4Ha9nGP+vm5qnQuFRJAQAKFfvLkerixsPp9wrN7
         NQceb6BXTODR7Uphy1FCizGjrECYncTVVgc1vN2ooJ+LPAdnQz5D9+KSM5WHRWJz4xx2
         1Whs9gaD89BhX3DwW6WYIlZbM1W04FhS3wmCLrNH0F+NU9p4Pq2N6FC7TQUCDXcQi3sl
         JcahU8yX7q51iL1NCo1/NHpl4qaLgqd2YrcNgpkFlSD+lj4cnz8brt1/YPyI/4X67Vnn
         ItI8xIPR7iVaPcyP29zq//wxxgPmLmPevJP8BQed3TRGKlFXEzO5NsmlFmeBjMbtyrNw
         PI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978465; x=1789583265;
        h=to:from:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzzpRVmc6Qf1040g7Lq6SnAgBrX6WGAOi89cdyMonLo=;
        b=Ozq4wwlVHQpLgIzAceOvirt8cpX28XiFNqZi+q9qGH4sHJGgyfpI+MMH2Uo6Wt42ZO
         xRlbRDzALP9Pv1dkZhp/qEFUF7HsFw5q3BAivKEPvGl8h/W17+gJzp8rwsK7p/nkSauj
         WsMJRcvuMLcz1qQHgBPp5PskLcYfuSC2DkZBpx3vFoURbK8k8w6kKbX0OnwjW0poiL7x
         FCY1ZauapRoNGvu1HZ8KykXLq/iYecFBJfSmsZQDEBxMGTtHpLpM8DXweLP8ucPl+kOX
         Hxq+1Cj8jwKWsO5LOsB+KlsgfA+4ONoyzMmKYvHAQSi5zjVBeznhHGsp2CvTlxHT9I/n
         uSJA==
X-Forwarded-Encrypted: i=1; AKwUvByUNvPKyn8mosEnJao653+m75GI7UP1jqzjml3s6cSds/yNXG/ZrFmi2w9jE6yJ+ERO8byu7el8yzQsvY7V2rwmgw==@vger.kernel.org
X-Gm-Message-State: AFuF++lrdNaGv4Xp84RC4S3n24hCeIRlhmYXzlM0e0ebpdZRQYUpgzS6
	gYoQ+Q1v4MdRZWBFHgJp5t7gdyI2DE9e2epT1JA5TYtWCV8xUPoEKP6VnM9zKL94xBJuQkTTPNt
	u3TIY
X-Gm-Gg: AYBFou3SV57+3GvWT0ciFtJ/kE9+mzJNmnwzNY9IWxLHdC3wuJL44/Cj3UgBXIZgVmg
	9GItOgy6NOxezGirYzUBvfIhwerjBu3NW2qGyEc/k25bOTJ8hZO2I2zxiwIhS8D901ZbUkFrB0f
	940w7BktexLW24Jmx7BYA90kyehaHl/H3r6hLutLBYyo5ZkvjLs67IEaSTaOM8dmGYvlkW3u1M8
	Ic5FnfScqkz3QEYbkcJ200CytrYoI6sVuowMTkj3fRE3O+mhUxJQWCq3sb89K0E2ERKWg85G4aZ
	XAHPlf16f0oIJAzkYFFIujJrKefjjacitBVdQBAKz7Gq5Z2eZtKOa1WiKm26BG2UbvAfiFDW+9m
	xUPo4wfKyU946YWvcSnuEYpTHCh24c8542+5gd4HLG+vbLtR5Cw0D4iv76HFGcBaiYtkF6oUBh1
	rdq1ihUTZzSWIt7kMKiCDl3/zsORURI8EeIVXuwZl0FpvGFnEQYk5RGYCM2ksO2IwigOiIgUana
	lF7kv1p5ZU2FrlpUHvSUe3gae8RDj4PoErqh1AmtJ76T3NSOY9LpIx4/rgH
X-Received: by 2002:a05:600c:64c6:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49cfa20ccaemr335752275e9.25.1788978465474;
        Wed, 09 Sep 2026 11:27:45 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c07c17sm11855715e9.14.2026.09.09.11.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 19:27:44 +0100
Message-Id: <DLAZXSNZK6QC.1VFAX37XCXBOV@linaro.org>
Cc: <linux-clk@vger.kernel.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-samsung-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [question] [Exynos850] ACPM firmware doesn't implement
 ->recalc_rate for acpm clocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>
X-Mailer: aerc 0.21.0

Hi all,

I'm working on Exynos850 platform support and currently trying to deal with
ACPM firmware clocks. ACPM is firmware running on separate co-processor
(like SCPI/SCMI thingy for instance).

Unlike gs101, the ACPM firmware clocks protocol on Exynos850 does not
implement get_rate() ACPM IPC call. Set_rate works fine, but get_rate
returns 0. Downstream reads MMIO registers directly to obtain the rate for
these clocks.

The file is drivers/clk/samsung/clk-acpm.c
static const struct clk_ops acpm_clk_ops =3D {
	.recalc_rate =3D acpm_clk_recalc_rate, <-- not impl by firmware
	.determine_rate =3D acpm_clk_determine_rate,
	.set_rate =3D acpm_clk_set_rate,
};

Currently I made ACPM clocks childs of corresponding parent clocks, for
instance, for CPU clocks:
	clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
		 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
	clock-names =3D "cpucl0", "cpucl1";
and just return parent_rate from ->recalc_rate().

The problem is that stale (cached) value is returned all the time despite
CLK_GET_RATE_NOCACHE. I tried different approaches but don't see smth
upstreameable because clock rates are changed behind Linux and I need
to trigger something like clk_get_rate(parent_clock) to let the new rate
propagate down the tree.

Which pattern is preferred for upstream acceptance here?

1. Return parent_rate as is and live with stale parent rate.
2. Cache the set value in ->set_rate() and return it in ->recalc_rate().
3. Utilise clock rate change notifiers somehow and upon POST_RATE_CHANGE
   do smth like clk_set_rate(parent, new_rate) but that probably breaks
   locking and mixes clk-provider with clk-consumer.
4. Maybe use/play with CLK_SET_RATE_PARENT?

Or something else?
Best regards,
Alexey
