Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF993ACA43
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756462; cv=none; b=S+YLq9f4jn7qu8r0bqzqZTYEZ5OSuxCx3OwSM3hA75D7xIt1COajwowD625ogw4Zg8GvVWril0QGTH/WGLe+Gitves0NrTBkWYfdi+IbRzaqzzwnG4vW5sp/bqnCN/AlAfPjqfLSgUkPxy5PQ5a9nu44PhuLlwt0hbVtYdbucOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756462; c=relaxed/simple;
	bh=wgzcFkHTCxr0nZzPWg2ONzU+NfOaWdB4NrZwRjIZSY8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=UMDzvad+gYjtjHQK1kb/7L2TFaqw/4PMNwcTcw1C3wfMk1J4xtncT0cvIycm3xfz++aKVuNxSWVc7SdHO8LbYgb5DtBj4ZDEIQetfMZWTGHnldBknQbiVtRPF3Jq+n2c1r+2uafUdAsN4toiTvpnCH3zEZrd5QH9lYYLLjyIGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XPT4o5yd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPT4o5yd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso48959075e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2026 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773756459; x=1774361259; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4FQFwct641zr80eIr2ZHYhiIx/XAziYXoGFH19ywqk=;
        b=XPT4o5ydgU0/xy7hAhwTxuVqnIPhsd3XavimwsDlPZYGXfemiyxwsBBzJS3qhtYrnH
         9OE427BdMhPrVyijuDSYEfwQQ34bRhNUJ+u6+77M5FbzQ9IyetZqn1OLJ1Wa328Op3Fb
         M31lCRDmW89URZdmCaibIajJqfkgut45U17cz0AzVMH1VVDlLQcLBSAJtACpg2uLRfSv
         FwbTI+JpB398+1yFx6CKTET0+f3vCpllJKseHlJRT+gzlqpuPOWPLpD5wptLTGUlpwum
         p9L9drPmEZpimGI+6bYJJZJ+4kaDhmmrlw8puUeMiMYFdqywfEPl3PXh47IHL9y5W9sD
         bS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756459; x=1774361259;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4FQFwct641zr80eIr2ZHYhiIx/XAziYXoGFH19ywqk=;
        b=caxkeWO3DcWi7trmKj3f+GT+C2eTzwZRwLq1ev6noHwQXbKlNi1mzE1w8dBHpnljaT
         SmdBpkmHuYcCunktwzjZEQLvC9mZRGWW8Q1GTJMYZLI0PFwA+lYtTrYEfIX0zGxTfQxl
         lNc7A1J6R75I1yIu3y1JlMyHSRcwvuQN1RgSZw2NL3pAk+AbG49c1l/xmv4IXqh7WVr5
         6uBGOz3N4yq79zrJTja3yCApF2KyeCMi2cxOQFrBMq/qIqYSD9bmBFIv+3j9R03tomrh
         IirBUsW5YdpCbwqNrcb1fkXpmZqvkCRTDXFuyaVNMcxT9jEKkSnIOiAXY8liR1e8FMZ4
         piBg==
X-Forwarded-Encrypted: i=1; AJvYcCV8gE4FcZOsHei4g8DpfwCzqBrCIhRVtX5sWtT/TzRrx3+J0bgcRh6sQRbH2IVbc/FewTu/YUjgEMWrlWKQSXjk2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/J13ctAKol8sjlc4qoIl1U5nCiQtMLdJaQbPLxGt8RfLLhX7J
	K3O2fVnVNX+MDprPBORnCetIHcbZuT//NJCCZ92mf7CB+XMfN/tVt1zqCPRPW0etdwU=
X-Gm-Gg: ATEYQzyApmF4wj1iax3HJSwu1s/A68MPeDG6FKpTCcLkGqE54KNpMDS6wK9BY/Hd5Cd
	SPIOeOXctK9O1psnWrUd1OHagN+XVxDbWWFQrB+9FE/r7xu+X76Q98T47TXd8HstcciYiOCgPH+
	lfh1Af9TYB4aKUqMbySc+nDoReOOFpL6BeJiBbycNA36ZDAqTTKJQGSdRcsYs9Nl98QIn4Jb/7L
	5wL13ylcqNKP5UuZy1/cdzP+rmiTW2fcU+FGpqENsYQM85TTed7rpN4UqX/p9HaQlbqlYzLZaqU
	7hHfd+VHNZr5I9jNAzcrSCLNTyU6WVigqMsfzYt+9PmS9q2ks0atN8PdgqwLk5dCXitbYhpRkm0
	cD16k+xwg5MGFTxg9AwaQ3OTr2bIer9vG1EkoEgt0WEEInoqJ+e9qjHz7hefUyDoC8Dw01PGIf0
	4x6jcbxURVHfqSPERIglb5QiHiRZWXQx5PcBPYQSfHLzGYcsnA6fMzWTZxFJBm7DxR+mENXJfqK
	n1FLsEgKTGGOx74uA==
X-Received: by 2002:a05:600c:1913:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-485566e2d50mr291282515e9.5.1773756459032;
        Tue, 17 Mar 2026 07:07:39 -0700 (PDT)
Received: from localhost ([2a02:c7c:5e34:8000:df24:76aa:fdca:2fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm125024095e9.3.2026.03.17.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 14:07:37 +0000
Message-Id: <DH546REC2G49.2YNUL3SWK4QNB@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
 <CADrjBPrC43gaRZw8289a15PLBN8ideWvO9jJwPr5beRJ=x4Rbw@mail.gmail.com>
In-Reply-To: <CADrjBPrC43gaRZw8289a15PLBN8ideWvO9jJwPr5beRJ=x4Rbw@mail.gmail.com>

Hi Peter,

On Fri Mar 6, 2026 at 1:44 PM GMT, Peter Griffin wrote:
> Hi Alexey,
>
> On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
>>
>> Add pmu_intr_gen node for Exynos850. This hw block is required
>> for different power management routines like CPU hotplug and
>> different sleep and idle states.
>> Also reference this node from main PMU node.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index cb55015c8dce..e3f4fe6ee118 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
>>                                                  IRQ_TYPE_LEVEL_HIGH)>;
>>                 };
>>
>> +               pmu_intr_gen: syscon@11870000 {
>> +                       compatible =3D "samsung,exynos850-pmu-intr-gen",=
 "syscon";
>> +                       reg =3D <0x11870000 0x10000>;
>> +               };
>
> This should be ordered by unit address (so in this case placed after
> the pmu_system_controller node). Refer to
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Thanks, I'll update it.

Best regards,
Alexey
