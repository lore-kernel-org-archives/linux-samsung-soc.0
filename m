Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088468;
	b=3Mlt3++tpd6uCaVRHuUqj+bz5f4t3TzJFCCyKIFuRLFsJ1bonwjDPvSuR2KRgO+tSBh8
	 iKKwJhLFa2BYkIL207ctHRn42Ig2QaRVy3HuPqPVu+o9KpqVhENwZ+2uB5I8Zrh9XdJGv
	 24OTGbrmUha2s2wflkXKAqx0YrfPJ+WZbpRYzw3nMb/3VD7GPoYdLaAtrHsKJbcgxW1nu
	 ABthcQv/7iRdN8NVRas/1qnutD4u4PTJbD64zSBFlmuDDpNEJ6mMxBTtUs8Ag8MuRMzIc
	 8rMRJuOpa9DrZMo6SmxgV2mEUBpk3qiQjSwQ50ctBukW0c6nRK2k66fSvEtwHbRQytQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
	b=UwLTpV5LQkVMfO9TgyEK3el03rjCtzJzVXEEZKHWEVQRX7MBzqoS0bIrNDE9Svo+qfSn
	 BhX+Oi5WevfV+3ESC75LenqSAiQBmOBMUNrKCfHevcHMPPIpbOEEF27XcswKNQgzWffYW
	 FJOIlow1KjaXacLqY2LWdkmX/nCHIV/PFdnvIgolZZC8g358jrnzF9lypLZoSOkp6ykN3
	 0Pccy6lFabiFcSsLaVwCgfqlf0xbdzQQ8mjWiTCCNWjdsd//2TrfN4qR0ZcYW6LUZlrBX
	 XO/2k1C5GPLW0TvVPC4A15QtE6FgzVhMKTxeWs1y7fQR5gXujZeajZpldjfs/DN1OlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="hLfVGe/6";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625A5606A325
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 11:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 625A5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hLfVGe/6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so10847065e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795088467; x=1795693267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
        b=hLfVGe/6VVOPTA8v7FKdWRuQuRmWxsjr6S6y5jTg5if7Lzf0tQNN4TaXAQody43hTg
         wJQ4s9BffXGconioSgn0+0huHsdHw8oEFKYEr/6f+Ca5F6S8ix1HbHWCvhH8T/P0iLq8
         vxFIxLEdW2ZUIMsIfdbOSJhTy9GLmCs6UIxIOJliplJ7PWpk7Da2VbChe+7+h6OOEFQ9
         L7xKm89Mr4c6+lEJ5x6wmHxyKbxBM7vI0oiNqm9oqIZ8dBdUg30TDvoDDxhq3ekk1H4A
         mPDKNMP5bo9+Jz3OHygXjk1wRO43yxyCiu6xP0dUdeN6SmfkpGoAdTYd8f77OLQl3mYb
         CgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088467; x=1795693267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
        b=QNzQEVI+DuDYzddl/gvO3nDQAFvkUtXcC4DFVmT6LPei+FJpl4luVRyExWzeTbpG1i
         a/OXnecNn0Jvzt0aIgfHz3bqNTVtjGsOab3r6JUhbDboV+f0rcSQtnQig8ofAyvF4a8d
         JIr7ScnZmFD7HTFci1k3aQ4FM3XaU9zYNUnVBpsSXLwasl+LOJTVl2aZyWhwiva4TQAr
         fGxX8jirf5vcb8qUlG2BGidY+WrXc0OhpS2Oem4+kctua+wlepZsqwYaY4osNjOd1MEE
         PxAFks/dR1rAirDtNlGrdH9j3tOFzzcI7o687u85tcEsuN7NcvEvLdXJE7spouPCHHhE
         OuWw==
X-Forwarded-Encrypted: i=1; AL+hErGCIWgZcmEYQ31FOIcO9JNneo1Hm7rEeAVfgZxjG4F2L904f9zpwtLZdSdkK73wQY4Zd1H87zR/9/iF0yIi2k3saQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+i4FYJ6Yriwm+97TFrPJkHCuhKF2LvfFOoJ3dMuHIBq259miza
	yibWUanBi3IfC43JcDtfUae/2CDtxvoZVzNITHpDgGdM3nf203gzgKWElGrErDutnjE=
X-Gm-Gg: AYBFou19uOxstFk/G3/WafvPci0jrvJLAkg9LZzqsuD/tHWyAoTkiIwL7lmu6cZq1gA
	yca/OZTJlzAVSp+lEBZA0FUIHfEeX7dK9uGRGisxxZ/7sGRIJWEuyRgLez9AaW/pcL7VE5PbqAQ
	tPl+ZWPoJfN3Tn+vQEtvDxxloOU7YcpCB9g06SHxwC1upTmxFnh9iZhY9LL+5B/9Ib3U2b4fKnI
	RbDisSWMfKkb6ZWdvmKXYVNW1UPBrChHxaqPmrYLjSG61vdtGjki0nFJLJuDWP1cB/CTYrcmdpQ
	2pVoGyLdF61Y5DqIuBBQZsvgaWi8gTgybJGIsgTf2a1wCy113/Pyz2Z53dz2vl68sG4c/SwXY4/
	DSgZI8fs/IfkVzrr2dophSSjxqUZzbDMCyTNfyjWAIu5l2QwPwDRp9RsvQeCXPGqhQ0MS8c83Vg
	r5r8jgA9SrkPQM0Meh1XY0WQ3D5bEKMpNQs8b239nqay65TxtzcbZh618wa4E7ZC8NlsPkNyzoe
	sFTso316j3x41N/pakzyEgTtkWGUE3l+tTdp0g+4EelsPm+a2rhd5ZawBlkVIiegk3ET35pr8hs
	chR/22vEWrjrxXf6mgbwfDeYSAIU3vN2AqRVFG9z
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb861576bemr14665855e9.11.1795088466528;
        Thu, 19 Nov 2026 03:41:06 -0800 (PST)
Received: from [192.168.0.252] ([79.115.63.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm9943663f8f.14.2026.11.19.03.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:41:06 -0800 (PST)
Message-ID: <fa1f0750-ac4e-4bf9-b549-2bb9a17cbb0a@linaro.org>
Date: Thu, 19 Nov 2026 13:41:04 +0200
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
Subject: Re: [PATCH v2 0/3] thermal: samsung: acpm-tmu: Add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey!

Thanks for the series!

On 11/18/26 3:51 PM, Alexey Klimov wrote:
> This series adds support for the Thermal Management Unit found on
> the Samsung Exynos850 SoC to the existing acpm-tmu driver.

Exynos850 almost doubles acpm-tmu.c, and most of the new code is
register-level handling that has nothing in common with GS101.
I'd like to split the driver now, while we add the second SoC,
rather than later. The layout could be:

  drivers/thermal/samsung/
    acpm-tmu.h            internal header: acpm_tmu_priv, acpm_tmu_sensor,
                          SoC driver data / callbacks
    acpm-tmu.c            probe, PM, thermal zone ops, threaded IRQ, OF match
                          table, locking and sensor disable/enable around
                          threshold updates
    acpm-tmu-gs101.c      ACPM IPC callbacks, sensor groups, regmap config
    acpm-tmu-exynos850.c  MMIO init and trimming, threshold and interrupt
                          registers

  obj-$(CONFIG_EXYNOS_ACPM_THERMAL)  += exynos-acpm-tmu.o
  exynos-acpm-tmu-y                  += acpm-tmu.o acpm-tmu-gs101.o \
                                        acpm-tmu-exynos850.o

See drivers/thermal/qcom/tsens* for a similar layout.

Also, please note Christian's fix for GS101 threshold 7 [1], you'll likely
need to rebase your set on his v2 as it's a fix and shall come first.

[1] https://lore.kernel.org/all/20261117083442.830549-1-christian.loehle@arm.com/

Cheers,
ta
