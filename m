Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AE2299AAE;
	Sat, 16 Aug 2025 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755365747; cv=none; b=J8p0g5/H/7OoOcvS4pfiDaq+a+uy0FgC895bWjq01v/1qgI/7BJU5L5sHCJ2CFmJU5G+StxvbX/wBlWbpLdcj3xFV/id5gW+pKKWxwhImQJdeWv7s1no2OU0ZUVlwVObcP12vfelp9nByDSB1f4KFQ1RITREk54cch1j+7Des+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755365747; c=relaxed/simple;
	bh=A+N2XcwNVAjwYn+WRP8d1G++M5aYzoV1qYAOFWVfQUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qro00xONFg5Zzyje1CLZPdJfpI1lD+nCPcq9LPRyTv7wNMon1T/IifH6GCvwxuRRsmGY+E5PzRvfyg1+uLC1bF9LkFNfTCTeDdydkvX/MDBva3GYVyVsQli/RLGoQBZGSG3t5AxBhelygU9FIL/FrQwEujen0Ih1FEtjmqIYTnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ4B4UkD; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ4B4UkD"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ace3baso494087166b.3;
        Sat, 16 Aug 2025 10:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755365744; x=1755970544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwviYPQGB1I/w7NU4rVUl6UMm8yXDWLDOqexuNMZHj0=;
        b=DJ4B4UkDfc2FuozUDtl3m3BtEBoDCyQWzV4yZpqjsEEwHa8AFJ24O6TU7oNjgsgNiS
         gJ0spCmzwCTnGDZfdk4arUTKL3364XVLHi/mqHBKfj4TwcQ+IF0z1PtfT6XgTTl7+4tW
         l4Owzh4EGCxLJjltikVd06SMsDaoSNeAK5jzQwmr0YUDLeezjeuoyHgXcI9UquAR6GUk
         EzcdLZN2dK7AI9q5ztMmZfIe52chtzV+vVF1lmN5o8y8w9hzeuo8Kb6IKj/HwjZULXd+
         gHg8AicG0txf6YjKrYZxfrui/IgOltXRgP35FIJS4JIVbUTS4j4JYorTO7fLse9nQRnO
         rO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755365744; x=1755970544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fwviYPQGB1I/w7NU4rVUl6UMm8yXDWLDOqexuNMZHj0=;
        b=PhaKHVMI4wuSff9gvuBUn/TgLWgnuNPRbiueI9iEKuJRV/8EH6Dnu5cTZdJZEXy93h
         6XWra5bD68dHipSf6NAZyN5fyz6B5Z3ixeL84yPjyTLScgr2Es++UUyJd5EVinkcFS47
         JR2rUQLJkgn9trdh9A1lcZ6K5+dO6YXiFTYFZVmiSqRzdZKbDK5rMwrTOqZkeAQF/U3E
         gbVIYP7CwcOuIDTaV6bDISYgmfOP1pDu656K2I8Sgy3ctdAVBEEDAJpmQYnfFarjTRLG
         Z6enh4k5pwBywB5o8T22XXkyBUcdG7Vqf2WMPdC1Rn0JQt74xw394VQ8hY1le7WdSyt5
         krDg==
X-Forwarded-Encrypted: i=1; AJvYcCVK7A+9g9UpNm76pWPbXScOfwvxEvjy/JUC+zqS9gSe8ypgiRBzpxMNpti63H869XAb7dZXMQR+Q3Fhr1rt6LWnpVw=@vger.kernel.org, AJvYcCVhdwVoROSGsjmc2hWmvK3NO5UyDe71WJ1ghrUuMs2Zi1+LZZ41w8XduWa4lkAUi12qMq/F6Fznqi0mVuwi@vger.kernel.org, AJvYcCXd9LmHKVrO2eEIORngCVObZn53bTcR0SLrqNt59B6su9XUDSjEAjKSKC1i8RNlaORmCZMgLE4bqQfb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1U5bp0yvfBM1AbTCOF2JZ0kus4yN/1FCrzlX+RAOibfxNgTp
	kAQfdMUww0ehbK1hKLPe+Y8SNW/i5wk3lK9BDsfc1yXanOi41YlfOvTE
X-Gm-Gg: ASbGnctlfcdwslrNP9Jl3NWVM+038iNVbeJHGl5ypXY3oUUcb0v1ns95xE0ZaJLzIVV
	qY1Q7Mft3v38PU/jHGkf6v/i3BSbqb0rldGd34FvlW088jwVXBxLjJz9KrqYD4lW+dl1I4xA77T
	Fejh6s3CBbemy7uhAEjV0vLfb96aj7k1BiB8GoGRz/+qHeUqcuyq1V8JbAcKY/Rw1nh1ruCBiRm
	xwNFhL6YvUAgBaZKsn+TL/sHPtmufaVmP+3Yud3QxR4YZG80uC9kNzQbPwx4zqSaG6LwIzKgMvS
	Sx3le0L7GIBxQKkRlBdlew/R575K7uFNhu0kMRnwSuYNRQLpsN0P1hHC2GUZPNQ6MxySSgi6q6E
	bcq1PoAx7HB5INmkfXr7puTt+IEB3Q2USAPZcZwFp4MOSVoG998Q3/izsAp+Dll31uUy0OCXL9Q
	PG
X-Google-Smtp-Source: AGHT+IH+TMwZN6wLewjxiueXv8jiO5h9FGdUKa87VCAkSdSbxDlmS9D3F/+XFbuGxMa2BrgQCBB8yw==
X-Received: by 2002:a17:907:d2a:b0:ae6:c23f:3cf with SMTP id a640c23a62f3a-afcdc244436mr599984966b.16.1755365743786;
        Sat, 16 Aug 2025 10:35:43 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce78d2esm417010766b.52.2025.08.16.10.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 10:35:43 -0700 (PDT)
Message-ID: <0cd105e7-505d-40da-a0d3-1f8ada8f2ca7@gmail.com>
Date: Sat, 16 Aug 2025 20:35:41 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses,
 except spi
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4mjOmi4BM2zOPcR6GH=4ngA3FisotqFXXGAbHOghQ4x8g@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4mjOmi4BM2zOPcR6GH=4ngA3FisotqFXXGAbHOghQ4x8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/16/25 20:29, Sam Protsenko wrote:
> On Fri, Aug 15, 2025 at 2:05 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Hey, folks!
>>
>> This patchset adds serial busses, implemented in usi, for exynos2200.
>> It's missing spi, due to me having troubles with reads when testing.
>> Serial_0/1 have not been included in the patchset, as it seems like
>> they're encapsulated in usi blocks, but are the only implemented
>> protocol and/or do not have a dedicated register for setting other
>> protocols in a sysreg. That'd at least require patches in the usi
>> driver and bindings to add support for.
>>
>> About the naming convention for usi nodes, I've chosen to keep the
>> downstream one instead of relabelling all to avoid confusion when
>> cross-referencing the vendor DT and to keep consistency with clock
>> names. They're labelled the same in the bootloader too.
>>
>> Best regards,
>> Ivaylo
>>
>> Changes in v3:
>> - drop the serial_0/1 patch
> Why did you decide to drop it? As I understand, having a serial
> console enabled can be quite valuable for this platform bring up.

On the only board that is supported (g0s), serial can either be accessed
via a special usb-c cable, whose way of working only Samsung knows,
or soldering to uart pads on a tiny masked jtag (?) connector on the motherboard.
The latter I'm not sure exists, as I haven't checked on g0s. (it does on dreamlte).
Using uart is not really viable for debugging, framebuffer/usb work too :)

> If you don't know how to add the related USI node -- it's ok, can be done
> later, as soon as the serial works without it.

I can't test that. On dreamlte a similar scenario exists, however usiv1
does not require the clock gating code, so not encapsulating it in
a USI node is fine. Not sure about g0s, however.

Best regards,
Ivaylo

>
>> - add r-b tags from Sam
>> - increase the size of all syscon to 0x10000 and not 0x3000
>> - change description of last patch to be more meaningful regarding the
>> usiN and usiN_i2c mess
>> - s/usi6_i2c_cmgp/usi_i2c_cmgp6, following the TRM naming convention
>>
>> Changes in v2:
>> - add a patch that switches address and size cells to 1 in /soc
>> - adjust all new nodes to define reg props with 2 cells in total instead of 4
>>
>> Ivaylo Ivanov (4):
>>   arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
>>   arm64: dts: exynos2200: use 32-bit address space for /soc
>>   arm64: dts: exynos2200: increase the size of all syscons
>>   arm64: dts: exynos2200: define all usi nodes
>>
>>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1433 ++++++++++++++++-
>>  2 files changed, 1398 insertions(+), 37 deletions(-)
>>
>> --
>> 2.43.0
>>
>>

