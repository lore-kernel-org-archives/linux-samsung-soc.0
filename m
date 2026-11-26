Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692823;
	b=ImSODacB6Ee8u9IWAnn/qr+rCISqkMVv5PPYJ8g+0pF+PK4W/wDgvZQnX8E3Js4MNyww
	 FDbWAVBLK3BZrbkPC4NM30TDFSoSKZQY2FYVClTNNtqvWiv4JXxTN9pOKTi/ADLAkm+Jx
	 GMb0a9Z3XzFDGl6uw1hxwFncnJZuQlt3kvJysoerDHoHmTvhhzT5Q+Q28us3fwsy8YBcV
	 hTvUpshMC0TMrcZr6z7Ku9zmvSBX475NpMMAWLX4Bwv3UYnEy2FYtp67oapVG8PVamxPI
	 XsdlNemIRqMplgNs3eNSrO7/8D1IIvHId7lfc6kSsiyQ2v5Qdmh2ZgJGP3oGqGZfcwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z6b8XUkAe29Qbtx4GPrsYDuZ84bX6oCBHUSF9JuGiVE=;
	b=gHUbid6/J9tS7haQsz6LXL1q8IfC84BcfOp+4zMaC/OHnXOdKBw8CceK2OszBlRRm189
	 fBZx3jr1WZ/nwBQ8NYS54W9UWm24T04frSkotfXEYUxmhKg5A/ungfS3nk3ftrA4oCQCH
	 X6j8RkYbWB5tAONY6lslg/trmdFYcH/PoOVm4V+Sp9H96lZLwgG4OuDTWLZiIGTBZM9mK
	 /hc2qongsgVLb8eQGXVcP+8beMwTYQAC7Xkhbc78iPNiRcAwoJ0akpQuCDmpowm2cn/LQ
	 AcGRxGfsvsB9kDcisrHyO8RNzlUanTwE6iq8g1gH64lj9KPODTQaSWllyOdjS2XaCYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kgbgu55N;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E923606A32C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 11:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E923606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kgbgu55N
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso68946015e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795692821; x=1796297621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6b8XUkAe29Qbtx4GPrsYDuZ84bX6oCBHUSF9JuGiVE=;
        b=kgbgu55NJWqtsl819u2td1h3BTQU/9so27oCJxFth9UtpwHASiUMZJXPMU3X3DVX8a
         XHYpyO1Bj9RCj0FdM3Cv42VJb77av4BgmPN4oKfcfnO+RQRyWv8i6HJOHdbIavx0s7OW
         4vGwxmmNQFnOsfhlB2XpUcy6Xc3cMs8MusZr4djrwqMIJxhhSNL8j0W71saUumvV9TOR
         nwTh2CHjddK8k6Y5/U20tmOc3A7iiYaVV6pCEq2FG5cH2GkBab7F+sc4HwMI0pylQotO
         gMfaPP3WQLcBsf4nYys8Eok8jEEiJtdIniAXp9nQm/gXUO5Ie33WyjbOmXpd1Y1FmCS/
         HYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692821; x=1796297621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6b8XUkAe29Qbtx4GPrsYDuZ84bX6oCBHUSF9JuGiVE=;
        b=azo3nhiu5wqFZL4+o9ZjupWNChFxHlRONskd5nNhVuCzXwjm7ax2GBDxy9ihrRMKIU
         PSrD4mVfA9kqLf/d0wgV7PEn0850797FFpeq72Qs67+S1Ix9R+6xVlMatCypLGHi0m3J
         zYVv2RqE6ofoindoKaLLBXN/Abv3wPkE2rSMNJvZHX2flbrvhmd4uTF9vFp4CX96YsPG
         GMuZQyPz4AqLL1YRpAafnkpXTAVaysHQvEjoPErnKZyA4JHNWFkaHvvjXAqQJ7ECe/HY
         J4rAcH/NOWJW97BFghx20HNUXpuO6bMwVluV14G5GF+arBZFb6berQVWoQ4SFMAmYdZ9
         x+vA==
X-Forwarded-Encrypted: i=1; AL+hErEAKb3tbLuffL41Go5wla+1ClRbVfqiUUQaqHTBUICZONZE5Mx/hacbPHluMEV2IsQlFUd6P5dmxSGZSjDVbMT2+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/n89zBIAPSxmVNxzPyYkgeYUdXFaTVl8Fck9Gugn3goF9+bjrD
	jLqf+q2Ubf/82E3smvkoMA34ma2AyStqP7pfj4vFd2cWp6HyDZr8hCY+KRHUBRv6tQE=
X-Gm-Gg: AZFdTZcdvq5GWdi8WJ6BeNBIIBmeAfeFZjvfDoHB3wACu/0rZvN1CR4HZ3MF6VWznAQ
	rXXKAA/AEIGHyVfR9fqGzMFW/bo2DqjJNqTjAz7N6itbRj92C1/DtgW20JUts2W1JMRQLNHl+CW
	BZ5GAtwb0toDwiIqKchbrrhpML33/Fe+CMMAg4yeaRQ26Eeg8ImV3YQZ+jnbVa4WG+BvRUM6tc2
	234n9CHgukYcxgvl/KaJUH0pHpMai7N1z5Ym3JCmqW5o+ElD0gbW2g+T9xX5GpnH1c4wfwgVhA9
	QUXfhCJR6LXN164JXxiGl32n22vgzI9AL0bgy6TFVlZnqrqsXVY4FasAaN6I/QQhIPL3HvlwyT0
	mjKTPdWehlXdR2sCTZrjRXbuFyf7WXXF+epzT5j6O2g8YIAOvzmmp+dWeCtGPERV+3whI12ExIU
	rxiHthoI+CSya8oIV4bR7mt9lU7KsVe3n06Qjd8PALHVmv0nooaz2tWAsp+gxi1eyOZIOWIRUUa
	onWmFbvSDUD5Bo8oIze2pv/MDNOK7k+e0ytfz6uA0ZpP/Gvroxm5sCHn3tTk4wd/Wlu70to6t7H
	c81HyYKfPE0CeK9j9q0wVdoPJyWzADi7JEioQw==
X-Received: by 2002:a05:600c:16c9:b0:4bb:7ad9:311d with SMTP id 5b1f17b1804b1-4bb861692a1mr322942735e9.19.1795692821256;
        Thu, 26 Nov 2026 03:33:41 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm36638402f8f.23.2026.11.26.03.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:33:40 -0800 (PST)
Message-ID: <65f7bd9f-b8ea-46f9-94a1-5129268ead0f@linaro.org>
Date: Thu, 26 Nov 2026 13:33:37 +0200
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
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com
Cc: krzk@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
 lukasz.luba@arm.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 Alexey Klimov <alexey.klimov@linaro.org>, Peter Griffin <gpeter@google.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20261125173959.2198116-1-christian.loehle@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261125173959.2198116-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


I tested the patch. With the driver loaded, all clusters now run at their
maximum frequency (measured via CPU_CYCLES) instead of ~200 MHz. Lowering
the hot trip via sysfs to 55 C reprograms threshold 7, and the hardware
then holds the CPU cluster at ~55 C under full load.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
