Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB293168EE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Apr 2026 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157246; cv=none; b=OHOI9REszOoXi2+YkfFp4Pt89YWoPbWk8hyd6q1WqOmmYkc6jo1ySRpQeW05jmDRW0SEmuzFmqGbkb85QLjiR6/RaktLgLomV857StQGIocIzMI2ErsrOuMhmh7nKt2QftoYA5cOARI7OhnwYrYhYnUbJnTsLIkpUOMVIsjivsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157246; c=relaxed/simple;
	bh=rIrkXb80Gn7kwO+sP2E0LkaZFepFX2GRT4jsp3bqoxo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=BXcNU4Q4PJNyIMGxlmT3x6NhcyzpMUZOfCsw2TZojepah4I2LfpR8XuSzrceuVA3u1WxGHwPiFbBdo5pUmLPbtJdelpWP1EktCbMulSk4Eaat4OnDWy3zILDcmQ0fnVSFxVZChZBKj98lmXiKMIlnctxJUdcuAgAc5QAt7gweWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SAZxmZhk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SAZxmZhk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b93698bb57aso960361166b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Apr 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776157244; x=1776762044; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBYUs6vtopkXApMTy5KoL+CYxoYocSKqj1Le8Qpg1Dk=;
        b=SAZxmZhkleEpARgRyXAQzikRx1uApATyEcT1W9F6IqrDpLYdO3ejmzAWCufR1Dh3UL
         l/EU9bKvfvaUHnvdus3RsDrxhnmF3vj+l/md1o9GYCHIa3YUFA7nM3t1ffs4MJdXUGYx
         inNYMR8DPD8I3iLk045CMx+XdY5DcRbWYnx9HgwPixl6zlPUMFyT/AKSFRARpSBmzHI7
         HPsg8GDvBQOkkSU+wgkJKVLmyxTum29fo18wo/k71om1qDwl5EIQfBy0fD5WKkLgGr3n
         zvEr3tLwXgEdFpsPSeJDxHIICZG9TicBehetUPemRYXqI3FslqopMZh8xf+gemeVwVg3
         wCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157244; x=1776762044;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBYUs6vtopkXApMTy5KoL+CYxoYocSKqj1Le8Qpg1Dk=;
        b=RlOSlUr5Sd8+ht4Ew+CUWEwtouWA+Q4PiFRIArImNCW73x6VBbEMFfLL/Ksc/wdZmt
         Gw2FZlEOGbcx56HMxXy9Ywz8It86ZwSK/f0/UPmHWM1sp7jksSxV3dhtVjiprEB2dwf8
         W6xF/o2X8mGVk4QgYAAFqC6RLENopmNzQR8Jul5gdJjQFGx8Pb8uf3aQxy+u5F/qWJuS
         YG9CVSCJotcbuFtXFu6deSiydfGEhll36JtrJfh5KVBJpkwZrjx8UVbVLck1MuES1Hpk
         EGBkej1u+BtABSv1ajyZ3lkghc+n6QdZrp+Cas+A9MsL09RRVTjs5/OOVCALbXSMUNyM
         Dt+w==
X-Gm-Message-State: AOJu0YwS2eDxemn5wIV6WOtLvNc7Wmvv1p71JUhPa4+iNA3k57+0WKDQ
	u5LSzOFGts1+y6evjpHQhve75zqzxfqLq0/MT8o/g94Pgzdia1JnJQCwu38AcWuuWIIrVXMY+rd
	YiSk1
X-Gm-Gg: AeBDieus03BOft5qqJWHwgdS0DCpgSphCcxVW3FiuORtFIq0wBoXPkf4wKKu7vFzRuZ
	JhmwPGyyfv3HpsmcC02ub6XkchzCm5nwEz8s6/0+bCdsf0n9xKD5CeHLFN6vEuHrL42EEO45fC1
	WY38nGQE+TCtP8fJfkm9AruAFMwgoDr7+r9w+s9rwuTQRsHzzg9N6pkaN4rQSAPzoy9ESvJeQuK
	xrT4pg8T5SBnAb4pMET5eg9SmHCuTbYn2UPZVtAc3HLoytNpLarplGXmhAS/YjNhlpEoH8nVp4c
	FWZFvfMzhK6hCNgx7EaOFH9BS4QIbCZYBs1qVXaGb8N8E7uI6DLHMSc1OOTqQ4ZrBBRmLLRGOgw
	pfdLFlVe1DUHaPy6gl0oyJW6LkZD70oLeMb3di3PuF4iBHiCBG6Z5ftGADeIvDYkwOeLyCQ9n7g
	6Cd6QkI2jIjgAispiHKpmtrgVFmHMwy5auNNWBNiVtMw0D7/oIaQ+zVBqQCmuQFRNLlXMtBr5qZ
	XH8T0lzafdTm9pOA3jIHR83653G
X-Received: by 2002:a17:906:6a15:b0:b9b:e7b3:a25a with SMTP id a640c23a62f3a-b9d76d2f86fmr806127766b.12.1776157242962;
        Tue, 14 Apr 2026 02:00:42 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e43sm396148266b.13.2026.04.14.02.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 10:00:41 +0100
Message-Id: <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
In-Reply-To: <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>

On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
> On 13/04/2026 16:52, Alexey Klimov wrote:
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index cb55015c8dce..cf4a6168846c 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>  			};
>>  		};
>>  	};
>> +
>> +	apm_sram: sram@2039000 {
>> +		compatible =3D "mmio-sram";
>> +		reg =3D <0x0 0x2039000 0x40000>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>
> You miss here children.

Thank you! I guess I should convert it to smth like this:

apm_sram: sram@2039000 {
		compatible =3D "mmio-sram";
		reg =3D <0x0 0x2039000 0x40000>;
		ranges =3D <0x0 0x0 0x2039000 0x40000>;
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		acpm_sram_region: sram-section@0 {
			reg =3D <0x0 0x40000>;
		};
	};

And then later reference shmem =3D &acpm_sram_region from acpm node.

> Also, 'ranges' should be after 'reg'.

Thanks, will fix this.

FWIW this commit is a copy of commit 48e7821b26904
https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.o=
rg

Best regards,
Alexey

