Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F3F42378E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2026 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212958; cv=none; b=ofLMdUf7pcAopa+SwM/0S3GrERYWURPHi0mssV62TxAQjzZp9uilMWkVw0vD03sDLceN7uSoEWdCxnxIl/jVHs80B35K5xciz0Iw3lx3tGN6fRTAW+aODFS5m0gSVQwzCLXcGlOpyWlOUjLQ/3/PNsSDkQpRH6EBEhxpH1YBoA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212958; c=relaxed/simple;
	bh=jYAGBzEdiDYrKaqtGarxhjuX178G2cGTOL2sQ1XaXRU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=bpU4wmtMazCKhCwW7GFBRmQQ55760gf53DyodprQUJBpHDmM2qkniM5zoPPWNL6B3efOnz7Gz2BqhS9x8bFDVRVzUhYE4rsQQycyisryffvCBlQ7ZQmCeOgdea2+B8ZoAvWW6xq1dap/fVo3Jlhk0umdPuxVi5gynRXnk8rLazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZdToe9pk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZdToe9pk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so2830096a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2026 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784212952; x=1784817752; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lb0FpvvpSdoj0hDfslcUa9MeWIX/fDu9Too5G2vuRxM=;
        b=ZdToe9pkzvu88TqfEOpFVIpYP9xFcxb8yEe/jDqZTFeFqTiz6uyPw9NtEvD0Pbkn0P
         fjZiwaAQzJ1rbylMdiR0SpDX/7Is4voK3/nJz1N0syGuplMWczXJGhKYMElXZa4ecYr2
         0MHvUuC1Kxz3s60LiZEtzNacCQo/kUlbtS3jCkCXJIyRZ2I19cGEsfqTkGB3YmvhYV/B
         WsUiz2V2jhJhgdNiI+NfPbVBj1lVhJaGpdVqX+A6aH3TphpoVs8SDQB9vgejeSqCl9Ek
         VGTonk/ad+huAsSJUhVyXK3vRVMrhXxqQOixosBDwciq114wsuTTzh79p8Hsi/lHDOmb
         S3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212952; x=1784817752;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lb0FpvvpSdoj0hDfslcUa9MeWIX/fDu9Too5G2vuRxM=;
        b=VBCKbRN4D0JZ4dtupdMKBPG92pak5tAwzaLHL3Hl7U1gupBmH4q8JbuuKKkyhFnNIF
         TSHEfP044cCRndlkuz17odBmaRUq+42/Ejef3WHgjB303622Ea+u7/R+e+fOwR3d48IS
         AESW7STNaK47csF9/zpvOM1B3tep5TgodX94O+OJ8ZxqWVpQSxDa5hIifTk8rqV1WCjg
         TfQYLyHvSBMPmSaGjfmPand1tSF7XKWqeU3WrcgOuQwNSRrtYpOQbvdbGa7y6Z8/7+q5
         Dy3fQYMMQc6HT+8WsNrv9VgdDxSu0MUkHuAiCRth5ocPXi3sEX+MXaBps4N4XINN6sF9
         GKYA==
X-Gm-Message-State: AOJu0Yy68B5+MndxawcmdfsbCahvoYrHq/3KkkNZNPVvZscldU5sErBd
	uyan82KWHETrfd1E/pV1f7CwBE12TGZjm/hbWV0eOs+FKwn8Y8T4SYFfmMSrulX9n0yBQyTLMKW
	HPH9q
X-Gm-Gg: AfdE7cllecdJX9xEGlWmQR4g0Ie/5VEIubIAquU64hFedDS+WRxT/P9NVQpe6yQXCVc
	RLIzIFAFeHeeurUWimjL7Mku6nkJT8EIlSsbbkJN5bK/TItFUZn1vhacq6tj1sLREhH1I9FbPdb
	WSVCzvhIlnvLk6plrxsX/veZLqiDzHw1UDdALhvpntH/9tTwWK1I7NcUBGnlvjaw0k2lXyezCay
	XUtL7vVruVqxn5cVNiQYvCPAWceuKZIB3bRkb3hiJgwEAo30H2jWKIJBjCWOshGndogHhMspKZ4
	gzdfIdN9NG4KCu1Cxftazwh3DsTNoOMHcP/MuliA55lHeUCO/AQkhdtt9hBxvHvHCFR+IHll55Z
	TvrW15R0AGaV8pARqaQP1LWR99y2p7eD4j2WkAVvt601ti1Vb8fivCOyO5tCtxcHBB/9lk3E3Lg
	tkS1FcUbDEPQ24L/MA9ujd0/tEL0sjSBYmnYtw6Jsyz/SsW0tX7KGCsUIjeTAOOF2hZGqS
X-Received: by 2002:a17:907:a48:b0:c16:6c0f:a810 with SMTP id a640c23a62f3a-c16790fc001mr454407666b.9.1784212952048;
        Thu, 16 Jul 2026 07:42:32 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:5e58:c548:d5e9:96bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16874a27f7sm221311966b.57.2026.07.16.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 15:42:30 +0100
Message-Id: <DK02PDXI9JAT.R27YE9T9UG5G@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
 <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
 <b7657812-3afc-4b13-a579-6f07d061e2d9@linaro.org>
In-Reply-To: <b7657812-3afc-4b13-a579-6f07d061e2d9@linaro.org>

On Wed May 6, 2026 at 1:11 PM BST, Tudor Ambarus wrote:
>
>
> On 4/30/26 6:37 PM, Alexey Klimov wrote:
>> On Tue Apr 14, 2026 at 10:08 AM BST, Krzysztof Kozlowski wrote:
>>> On 14/04/2026 11:00, Alexey Klimov wrote:
>>>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>>>> information and configuration data. Add the SRAM node.
>>>>>>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>>>  1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/=
boot/dts/exynos/exynos850.dtsi
>>>>>> index cb55015c8dce..cf4a6168846c 100644
>>>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>>>  			};
>>>>>>  		};
>>>>>>  	};
>>>>>> +
>>>>>> +	apm_sram: sram@2039000 {
>>>>>> +		compatible =3D "mmio-sram";
>>>>>> +		reg =3D <0x0 0x2039000 0x40000>;
>>>>>> +		#address-cells =3D <1>;
>>>>>> +		#size-cells =3D <1>;
>>>>>> +		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>>>>>
>>>>> You miss here children.
>>>>
>>>> Thank you! I guess I should convert it to smth like this:
>>>>
>>>> apm_sram: sram@2039000 {
>>>> 		compatible =3D "mmio-sram";
>>>> 		reg =3D <0x0 0x2039000 0x40000>;
>>>> 		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>>>> 		#address-cells =3D <1>;
>>>> 		#size-cells =3D <1>;
>>>>
>>>> 		acpm_sram_region: sram-section@0 {
>>>> 			reg =3D <0x0 0x40000>;
>>>
>>> This covers entire block, so feels pointless. Maybe requirement of
>>> children should be dropped. What's the point of having children? Why
>>> does the driver need them?
>>=20
>> Thinking further about this. I was looking at the schema file and
>> different commits and it the right approach could be:
>>=20
>> - add separate compatible for mmio-sram region for this case. Similar
>> to scmi and scpi, i'd say it should be "exynos,acpm-sram" or
>> "samsung,acpm-sram";
>>=20
>> - update schema sram.yaml to exclude requirement for having child nodes
>> and properties like ranges, address and size cells
>> Similar like in commit, for instance, git show d0fe6491ddd22
>> (or git show 2d4a22e79a5fd).
>
> this works fine, but only if the sram is consumed as a whole, and only by
> ACPM. Is this the case for exynos850?

Sorry for the delay. Yes, as far as I am aware, this is a case for
exynos850 as well.

Thanks,
Alexey


