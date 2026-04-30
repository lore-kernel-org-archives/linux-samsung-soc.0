Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919E4325485
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563451; cv=none; b=bSuR5dtY/WlKn7phEmkGOuAryO3+wPWI3Vgu6AZMgyz+qC+EXPIQZ1vpvkWW3eYaqo/HUMeMZRF/ADokTzpIFSZKDwuK1gfYXz21JVEZosgYTRYkqhE0KAlmGWswOcSFP8WSPMNiil3DkhvUclZwHXZOB4xjnp4WRaggUwKw5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563451; c=relaxed/simple;
	bh=D8ctGVVQEch5tunpDf4+eVEVa+9ZQoaz/XYhpFXnBKk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=feLlpkb8x58GpghFaUsLdG30OU208QQcfyz1BqV8/goct+U8e2Yh3VJ1x2x1pr798q8KEqUoYEoF7U3ADgjdqBGosoWys4H18s/z++sBRT9iX+rF3bdO8BG6QVXAdvbY051xP2K2O4H9BcS4urna30K7iz5SbaZYeFa/5ynLmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HipJ19fU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HipJ19fU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso9998705e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777563446; x=1778168246; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boh2FGqR0WpDSM6dhSTP3kihWh+3GkokB90DFYaafvo=;
        b=HipJ19fUAEq33OWW/Q5wLCcOkQz4TNsdlYRpHK2OgdU1xSTGX5gYTi5ltEpc9KxlyG
         rWk4XWAYn/0Kh4r96B+/Ml36YkDJ+KoZl6I6CQXXlNMJrozrmbIMTNO+1QiPY/+X/nEF
         lVcw3tXGvvESxcFtQOcWGO/Uy4U4Vrqs6S6WqtnN8VYi5Vj4SurG1M20D+e1RRKxAPKJ
         o3+zdVz3KxLhTRBjslmdaSOT1Lokn2xvSTEQI8JdmfGqehNzrWK9V1RRk4unKtJ1BI6/
         q3E4tQ1FrtQ7z1ZQcR0wYJpaQNHeynZrLDo8uiXFyo3AT6gokrT/inex1mKruQ1e/HkK
         mY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563446; x=1778168246;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boh2FGqR0WpDSM6dhSTP3kihWh+3GkokB90DFYaafvo=;
        b=OjrRXNbOjGdPMCze9GmDwH343pNIzETXfgST4blrh7G8cC8dFYVjTWD+03FDE7+ZFM
         T8WwkjejTQQydsXfYqKcYl1DPiYgeOpZp+JyMWVmQEyK/3mBRq35uEcOMHs0PGnLVn5K
         GNwtenoRaLMdMaHJmNIUElEUHez0DWgkCctQuTA7GwS0E5QH8qIvi2Dh7dZfenBYvKPm
         L3q7v7TwrWfeydEtT+BDRYnnRsW7OK4dK4/PxSNyp7BPIGPmTs/tA/IqpwVmHroZ4OVz
         rvvmZYqXxy2Ql4tc10O7MttKJRpb3xnQTrmPzhMINymnpbqswZfLJMa1yf/pTLhf2zpT
         kJIA==
X-Gm-Message-State: AOJu0Yyxg9yK6rrQiZGdNCxbGVmuBbGFOC9IaPleYyZW1kFSCQV4nauL
	2H2r4EZzFDi5cMaetwqYRVZ2MU1BlvPKSNhguAbbwkYeBM3rpIfJkvIpwATexaofYIo=
X-Gm-Gg: AeBDieuHatl5mKgt6pyPABC+DU22yYwft7LgjTmBhRwFGNTooXTV8BvTz0x7u03afHz
	vbsmWYzaKcA85TF5fNq59GRENOuhTMXcBkGiARo3tV8qn81HK/GMz5RE1xqy+l7/cKtyWR4H+Xg
	ZVyf+w+BRJLxPs57H4HH+0ZYAVAp7pxzKBXzW1ZPrCODTXxN9voQ1rXqzpuqsRqwSGSejZsevgt
	Tt74x4yWZv0d9/hfksFJNjHLhhr3WDXTeDrJNgp9kC7dI3OY+5V0SNI3vB9R2jNj8NxxT4O2d2X
	sQUkQHMky0JTHu4Cv6rsfON7Ei0DMDGIvqDsjAbTAwrofv0FJOuj/0YQ7P77qBG4T6o73n4y7wa
	4whaNoC0qR+xkFMNUrEpNf/bxUTdv0AcdhWTvRVhlc3/j7hnt6KWbSFBqN0N+LT1vKdW63Bhaep
	+WF07B6JDVO8SxhKFPyUzdpW2qdtYl4MKNxX+vCELJ+fCx2o5egYMBmXXf+nrAIp5RDePQHJFkj
	0QKRzKzb6BClafNrUWaqlNJeg==
X-Received: by 2002:a05:600c:c058:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48a83d6a890mr42190595e9.5.1777563445839;
        Thu, 30 Apr 2026 08:37:25 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:b0e1:a8:4337:b2a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b912869sm46165045e9.6.2026.04.30.08.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 16:37:24 +0100
Message-Id: <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
In-Reply-To: <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>

On Tue Apr 14, 2026 at 10:08 AM BST, Krzysztof Kozlowski wrote:
> On 14/04/2026 11:00, Alexey Klimov wrote:
>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>> information and configuration data. Add the SRAM node.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/bo=
ot/dts/exynos/exynos850.dtsi
>>>> index cb55015c8dce..cf4a6168846c 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>  			};
>>>>  		};
>>>>  	};
>>>> +
>>>> +	apm_sram: sram@2039000 {
>>>> +		compatible =3D "mmio-sram";
>>>> +		reg =3D <0x0 0x2039000 0x40000>;
>>>> +		#address-cells =3D <1>;
>>>> +		#size-cells =3D <1>;
>>>> +		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>>>
>>> You miss here children.
>>=20
>> Thank you! I guess I should convert it to smth like this:
>>=20
>> apm_sram: sram@2039000 {
>> 		compatible =3D "mmio-sram";
>> 		reg =3D <0x0 0x2039000 0x40000>;
>> 		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>> 		#address-cells =3D <1>;
>> 		#size-cells =3D <1>;
>>=20
>> 		acpm_sram_region: sram-section@0 {
>> 			reg =3D <0x0 0x40000>;
>
> This covers entire block, so feels pointless. Maybe requirement of
> children should be dropped. What's the point of having children? Why
> does the driver need them?

Thinking further about this. I was looking at the schema file and
different commits and it the right approach could be:

- add separate compatible for mmio-sram region for this case. Similar
to scmi and scpi, i'd say it should be "exynos,acpm-sram" or
"samsung,acpm-sram";

- update schema sram.yaml to exclude requirement for having child nodes
and properties like ranges, address and size cells
Similar like in commit, for instance, git show d0fe6491ddd22
(or git show 2d4a22e79a5fd).

- then this addition becomes:

	apm_sram: sram@2039000 {
		compatible =3D "exynos,acpm-sram";
		reg =3D <0x0 0x2039000 0x40000>;
	};

and will be consumed as a whole region (also as Tudor mentioned in the
other email).
And then we should update gs101 dts as well. Thoughts?

I honestly don't know why be default schema requires child nodes unless
it is specifically excluded. Could be a good question to Rob?
Or maybe we should really drop a requirement for having children from
schema.


>> And then later reference shmem =3D &acpm_sram_region from acpm node.
>>=20
>>> Also, 'ranges' should be after 'reg'.
>>=20
>> Thanks, will fix this.
>>=20
>> FWIW this commit is a copy of commit 48e7821b26904
>> https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linar=
o.org
>
>
> Huh, we should fix that one as well.

Best regardss,
Alexey
