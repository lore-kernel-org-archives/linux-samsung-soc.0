Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63B8356A06
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Jan 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488822; cv=none; b=FkVaO1QrazvWNpFR/MFMje1S+1FI46GSGbJaUyf0/237GiTGbdmv+7Pfen5Ri7+RzfO6K6O6hiEbihZRIcQ7+G3S6/5a1cd6mnTsiTAgMBGNPnsewpDv9vGqNo8AV46LaPB2UCmRBPKd+dB0e/OvmyYUFDWoIF1Imt+GRD10I5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488822; c=relaxed/simple;
	bh=swNWq/Qxez0tgxAwoz1l6nJo+pCorfSqxCY1iXrFZHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MC4M080Pm7BAs3GR56zbnkyErsLWojRVCzJRXgc9hm1S2kKhI7dgm52ujTO4vwRDsU4epsllxV5rJ8WengJDCqVQwKX0MHqZZWg+NBzmY3kL4knYU5xwYp+iQu8VAaXTmAMLMUPW52Os4QEmft0/GC9fDnbVq8I1Xi8Ytwm4mfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JdFoLE6l; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JdFoLE6l"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so748413f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Jan 2026 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768488819; x=1769093619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHHyxMePqBdKnAeFR/9faD5DxG5+hRTAA8ppV4k9N0M=;
        b=JdFoLE6lsO3/oM2JGXO/yGXC6L0YrK6il/9okubnHpD3W5FLZPcGZCyxbYJW3LXrfE
         DsoAhnbYdzc5nzgWQjkDiYaVac7ncAQyD0SyqBW2zvJJghwXC4LNwJzMPHV7uoVd87sM
         YAlcZxWTNYIyTrEEsNymdzEiLf3SIec7fc0MpG+yqqyez8Mcye5yMWrhhrt5Bl2Fdqsk
         QnjtY5ApXmMR9hgqvyQHSW/9nrunVJRgdO89/ZfRk0NnE8zzWN5gZeglS2CHXQWlaFiQ
         1nhCJQzs3N8rB/ATZjN7pex/2FkRgIPJZg3GiHaE6dZM35X1nSJNp4HlLG+P4ZDEdRt6
         RKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768488819; x=1769093619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHHyxMePqBdKnAeFR/9faD5DxG5+hRTAA8ppV4k9N0M=;
        b=Ji1gtENYiUe40JypQTwFCMUAT5RAqQFC2/0M/TIXfaDRj6NdCXQ3GIgyyXpetsFu5L
         FbBPrD5DTmbJQV8LqO6W5kenuBEoiJv2TINvSdNmARh6rUHAbQiTGZYkk5wf3D1Nwbo8
         PwNvYi2A7z0iRjb4OJyhmUDPe1gcplLHIHWXcOnxWcu0QPL6KE7+KqZW0sVFkCqjBav7
         sSE6jEIDrFw2onktIjm3rJfCqTbhaQZbgRu3lCQfdwXTNcnWjQsRrKhr51ic04WdR36T
         zygHPSZxRpW0nSaq3q91PRkUWcypBtqNu6mhjFL7shYcT5B3GRrRVZMEBx76cKjyfmpj
         khPg==
X-Forwarded-Encrypted: i=1; AJvYcCXwrW8RiuqrN1RUHkjzqc2PCBj5zfX9ZqJPq1LX54kE0v74ZuFYebRZxkOBpQTfI+QIe80F18rd29xiKWijFHmD+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1bYb325ZiiNm03ZCKd5JEIClZ0jVpp1BKZEgDvI8UvpyFphXz
	mdWLkqdYrtw5Txd2FEC6YYRjTYgqf07zUDttpCtYQC7TlgfPZSfYPgnTEOTOEI22B3LHSrK0rJ6
	BGIH1
X-Gm-Gg: AY/fxX5fWWy1f+erG3GqVhTRgUM5yfBv5fk71ZGNlN2SHMU+zGhUTvK29Mr/tmUOZQK
	PX4CHtzU+4bdKlG8sBNNkQ+ZRDgrfJIB7YQdjhKuiMGEstEkk5Aqjz0A+7cgpAcdcq5/8nyutYn
	p9o9Dg91KkiTkL/XOsmnyBzqsvUAfK+AwVwk72L/z/rOilDmfHgNTWrJ7qul2YT5bCbLHCBUxEr
	pCO9hxYNMTQC3DhFoY6snJ/+3FwETxkjiaCjVc0er7uSxWpMgDy0pT28fNsrcd3mr0Olgxj4fPq
	8k4z3Vw4WnoYDvpfAsOrz+brp2Y0dnqLp+i/cesJkJ2mgjmc8lMVN29TSfGN5163uK/SGXLYtdl
	xGtq69Nm6u0AND1jxGM0N1Xx+rfYipada1x4fE03vO7FqEzB2PMKXQRlqXgf7qnMj2VFbBhkSpU
	gxQIQP7zS6g/cRQlkSVw==
X-Received: by 2002:a05:6000:26c6:b0:431:9b2:61c8 with SMTP id ffacd0b85a97d-4342c4ee902mr8010060f8f.10.1768488819096;
        Thu, 15 Jan 2026 06:53:39 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6e09acsm6183638f8f.35.2026.01.15.06.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 06:53:38 -0800 (PST)
Message-ID: <200d34bf-150e-4f8a-b400-2f54863502ac@linaro.org>
Date: Thu, 15 Jan 2026 16:53:36 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
 <20260115-slim-denim-potoo-cad9cb@quoll>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260115-slim-denim-potoo-cad9cb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/15/26 3:36 PM, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 02:16:31PM +0000, Tudor Ambarus wrote:
>> Document the bindings for the Thermal Management Unit (TMU) System
>> Controller found on Google GS101 SoCs.
>>
>> This memory-mapped block exposes the registers required for reading
>> thermal interrupt status bits. It functions as a syscon provider,
> 
> I don't think this is syscon, but the actual TMU. Syscon is various,
> unrelated system configuration registers.
> 
>> allowing the main thermal driver to access these registers while
>> the firmware manages the core thermal logic.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/mfd/google,gs101-tmu-syscon.yaml      | 37 ++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..6a11e43abeaa23ee473be2153478436856277714
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
> 
> Not MFD either, but soc.

You are right, it's not a syscon, it's just a normal thermal IP block
from which I need to access the interrupt pending registers.

Then I guess I shall describe the new binding in bindings/thermal/,
please correct me if I'm wrong.

> 
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/google,gs101-tmu-syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google GS101 TMU System Controller
>> +
>> +maintainers:
>> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
>> +
>> +description: |
> 
> Drop |
> 
>> +  The TMU System Controller provides a memory-mapped interface for
>> +  accessing the interrupt status registers of the Thermal Management
>> +  Unit. It is used as a syscon provider for the main TMU driver.
> 
> No, it is not a syscon provider. Entire last sentence is incorrect. You
> must describe here hardware and this hardware does not provide any sort
> of syscon to any sort of driver.
> 

Indeed.

I'm going to link the ACPM TMU child node with the TMU node via a
"samsung,tmu-regs" property.

Some concern that I have is that I describe the clocks and interrupts in
the ACPM TMU child node. Usually the clocks and interrupts belong to the
node that contains the reg property. But I guess that's alright because
the interrupts property is expected to be in the node that the driver
binds to. For the clocks, by placing it in the ACPM child node, I allow
runtime PM to manage it.

Do you think the below description is accurate?

soc: soc@0 {
    tmu_top: thermal-sensor@100a0000 {
        compatible = "google,gs101-tmu-top";
        reg = <0x100a0000 0x800>;
    };
};

firmware {
    acpm_ipc: power-management {
        compatible = "google,gs101-acpm-ipc";
        /* ... */

        thermal-sensor {
            compatible = "google,gs101-acpm-tmu-top";
            clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
            interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
            samsung,tmu-regs = <&tmu_top>; 
            #thermal-sensor-cells = <1>;
        };
    };
};

Thanks!
ta
