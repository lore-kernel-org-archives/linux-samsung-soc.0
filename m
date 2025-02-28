Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7831F4CA9;
	Fri, 28 Feb 2025 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740769645; cv=none; b=EJohH0kSdGpw14I8GO+1rEKeWeUpL5fhGDHSDUr7PxPa4m0XfQS4b//tira8QouUWs1EhZp6DxXwTTW0qK1eQ3wdwZg/parHNdXDk8aqgcf/PZCQ4SQAKEJVvkVAO3X66eC9mN70wI2JnDj16a6DuBrh3qYxVFULmzy+IBoBVKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740769645; c=relaxed/simple;
	bh=la6q/fnJJDn/FlTPNLsSOFcZAtqFjxAsMo5jIsCdjqc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rrvLElxUaquF6MMZNaVvMUJj6FOmup6EIphq9O2gSNEMvnEd+k9dU73AXnHe/t+bicQmfHirC5+vUzUAq8nSmU75pkK5fzlkpobvhTkzQhSqnFhKiltqtvGfv1ZhLl5tob8Wdmo8uBOu8a8dh1pcI6PM9XKBU2NHpszwqPdopNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3CKOcE6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3CKOcE6"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso435345266b.2;
        Fri, 28 Feb 2025 11:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740769641; x=1741374441; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=la6q/fnJJDn/FlTPNLsSOFcZAtqFjxAsMo5jIsCdjqc=;
        b=Y3CKOcE68xmGKTqQizb2vbjVYBWoHmY2pmcrG6AUw0cBm6tWXuPWev8/SRWjeKLdDa
         GqtgU+TJvNYerPDKpbCNy//pW/F9ffhrhZKe8ZGDOKeWBLZ3mb9dor6kASfd2cnyQuDg
         pa6CPzj4ZfMqa7Suxi5Wq3PY1jfFMKxrluN2cHpZ81NEqkW2/jptUn8sPeQSK9urI8bD
         GPywWsq+jtbaauRhALJ4AGH82jir3qPLJpRJE57SsayQOBf4j+7GWjCFhQMOHv+DwhRS
         JBt/vsSZPOvuH4EvNrFwYU+YEi2JM8H9HqVM50WinMtyzueaq0sF2wzZMDHswm+AMfC7
         AiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740769641; x=1741374441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=la6q/fnJJDn/FlTPNLsSOFcZAtqFjxAsMo5jIsCdjqc=;
        b=IHCjCxZdK2l5+Q57G5ocQ6HZGWHYnW34OceOARH8V8xMzwZGV5bCJiwZNiO6OwipMd
         ExB3cZzRUXKu1T1JMQ2KBImR00vpNdCENLxnBNGTSJG0W1b7EPr1xYbSJB6e0M3NZFNT
         +B427izD/YX8+bh7ZbkTPq85CLbVIjbTddf6AFq3IVRnE57qBOl49Hjmxqxv7LucLo8e
         jyu83jNnpcdQaIV5Lcb0euoMvB29QoCT+1zRRfZ4ZgVr/9hua+KlrTtgPBmqc+PyUqOY
         +sryESw1E/pYL+3ziZKehZ5lRUXHNSVaTE+MGUexYe9GKoMHsBWrSCtl04omY7uLuUPz
         NI1A==
X-Forwarded-Encrypted: i=1; AJvYcCUa6Hm0sBJEQqaEzDKphG92wHEA1RfQ3TUa+kaIMOtAUslaKUdwMX8x9z9m2wvzMv2k3sblZJchse8UVmIuNrqc5YM=@vger.kernel.org, AJvYcCW6T49Gm7HqN/KSb8P/N5eVfF1Bxjsv0RtX33Z9vqyRQkHfCdHVK5DmSyDJK1O0HvJ0FfyMeg9dR5+q@vger.kernel.org, AJvYcCX6mjUJ5HA2BHSQUPZ84oTr875XJZjSVkBgJcT0tzgMBKfzZXoHPTMuS/NbCnPvDIa7Kv3ksJZrMBKo@vger.kernel.org, AJvYcCXcnrJtq8EkBWbPhgMsXs/yIajQct1HOVuc8InLhQIIm9N5ilk6vQnNxHwBYpFV9AG96glHKaV8pq6l2gdu@vger.kernel.org
X-Gm-Message-State: AOJu0YwxkKbiJiwcxWlt7QtfNHqsynMPRv+g4ZttQg+rrbuRIm6IF5fX
	oapcDC4rNWxdtP9PdEd8ZpLwYcTiZXsrmvPoJWJimnZK3s2+lSMo
X-Gm-Gg: ASbGnct4BFszY1WJtPnoVhvV3iYSAFazY1oIw9MTGfFy4anj5LT9vRUL9brk5eYygSX
	eDM+iwXcGShcdguHqc7PJhkOiiuA+0ZzAEok0v5m+yaQ58RK1fr9ZMA965v2fx0T5ePQ+SSQAZR
	GLPdSDfQRtIVXY8kXeDozuhY1q0spRcpai/bWxEEEmhyZ+p7SoEOibfLLSh6aWki2f/u4kTYIpb
	giVY3ucebhkkl6tv8ulG5UrFlxMTb8GRRVq8RF6+x3tPABBTwzM/QITg8B2WsTtQO3ux0R0IrUn
	7XEYN8w1HyAE7Nk51xr2DAY09AmfLoh7lY2wq9eOMhgqyX7AAbMifvacKL5ZPaobgMBN8F4MpuI
	W1Wup
X-Google-Smtp-Source: AGHT+IFCCnuArvXOTMmII9xA75C+BNMRa1V96w0SJJTrjh/9BJpW3iD91h/vTUlZoY42/F91EKCmeg==
X-Received: by 2002:a17:906:7310:b0:ab7:bb93:56ef with SMTP id a640c23a62f3a-abf25fa9fb3mr478547766b.19.1740769641246;
        Fri, 28 Feb 2025 11:07:21 -0800 (PST)
Received: from ?IPv6:2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78? ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b99a6sm339502266b.13.2025.02.28.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:07:20 -0800 (PST)
Message-ID: <31cad1da1a02aaf0935d35e9b56357fcea9320fa.camel@gmail.com>
Subject: Re: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Kaustabh Chakraborty
	 <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi	
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 28 Feb 2025 20:07:15 +0100
In-Reply-To: <5670d992-71f4-4791-94ff-4fadc1fb5993@kernel.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
	 <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
	 <20250219-discerning-affable-chital-1fdff4@krzk-bin>
	 <e2ebd4503100ddbbe8d7e21290329e38@disroot.org>
	 <5670d992-71f4-4791-94ff-4fadc1fb5993@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-24 at 20:13 +0100, Krzysztof Kozlowski wrote:
> On 24/02/2025 18:47, Kaustabh Chakraborty wrote:
> > >=20
> > > I wonder why do we need to keep growing this list? All devices
> > > are
> > > compatible, aren't they?
> >=20
> > Well, there are two variants of compatibility having different mask
> > values.
> >=20
> > > Do you use clkout, BTW?
> >=20
> > Using the clocks defined by clkout? No. I added it as downstream
> > had it too. And the devices work fine without it. If you want me
> > to remove this patch and send the PMU patch to its respective
> > series I'll do that then (unless you object or suggest something
> > else).
>=20
> clkout is a testing tool and I doubt you can use it on a phone -
> finding
> the actual clkout pins to connect the oscilloscope is tricky.

Actually, jackpotlte uses one of the clkout pins (7885 has two) to feed
it's NFC chip with a clock.=20

Not sure if any 7870 (or any other Exynos) devices use it for something
similar but here we have at least one example of a non-debug use for
it. I will avoid it on 7885 though until it's actually needed and I can
test the functionality (and when I have the time to work on 7885
again).

Best Regards,
David

