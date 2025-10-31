Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B7271459
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926794; cv=none; b=BHeSBlQEuxsLRRFn+r0Lh1b6aNE1GqEaf+ubbHQW655S35CvIMtkmXsRn81jd0l/agE+n4ZuorXQHznsZrDbHszHwtKixDpa4e3qhp8X1lhVCp2pJ/kBOId4KeOfmAcFUnTzZ4NUQ4weeXyrqBak+6RAAdL2kBhXOThXaGey5ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926794; c=relaxed/simple;
	bh=K5YIOa2uekYTR7BG1QeqoaCyvyNsybzRqs7pinkLnWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXMViTvQ888yaMJfIEFrCWuu5tILQ6JVlZ+Uhsh4jjHb1/5piKvAs/IUBkDBzIb4bdN4OerTUA6XqbhrS16kmJWX0wV8QSuL3WSDHLFmNRdeQ1rsB2kO1rtSOvhxdmywlxHSwrZBDJBwwJCyNWgJg532WFEv4GN/Ft3OGD4LDPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNzqTuFk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNzqTuFk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so9683635e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761926790; x=1762531590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRyeAIdNCNVWpBCeP53EIPuNRhQqWF48SYqRwaIlzas=;
        b=ZNzqTuFkTuBZ8f3SDYnyOaDh3AHx8D37teQ2vkgeDtIR5KDXf2wyELVdYJGQOPSFv8
         Q7RVHmwnYZXFiOlkxarzJzADWZjhHpTjEs0tjiulqiw2MmdvBvqbqUseRPZHxPXbgxQH
         1TDXTvsJ9rb7jfPP228WbC0h4S1GEhWdEsv4/042sXXVXme7/J3Y4cAPmQ2cJyGsfHWZ
         uyqlhCR43cn6k6csSlyvOBcbVYEq3dDlT4yOFp3RpYPNVXVrdgYcdbEDWRDQq+xfqYNM
         YRXM5KxO+joZOmNkQZl/IN0gz6CNm3cEF1X3xPPA2b9hYgmePIu611YrviEnKtyhQ0s5
         3jVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761926790; x=1762531590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRyeAIdNCNVWpBCeP53EIPuNRhQqWF48SYqRwaIlzas=;
        b=HXdKLeXvDza6uzoNyQtXPs2c1XqWrsO37LN95SglG69oh3lU1Hue8KbnFWBxXSt2nE
         GOAlYHlrSR0w5FnQC9ZdX6rKzC/So7kUIj3jrRVsq86vxlYT4jZinXV8P0WyX6F63PXA
         +20RN7QgySpEsl8xYi2ytVG0qS824s5yoeuGqjsiboMBQx/QWt8IbAYET6HNnFfoIN08
         Au3Q38laTr6Vuq6D8Q7Fl1uziieGHwMqbhdENcRsG5jKJvpqZNSxGbzXds5Gx0rqcFTn
         X5R1SXz12OGEQgp3nBowQQd2PlzJ2IOuFAbQBEgvHUFgRFYgFvvPep8zkCbjaszOkUby
         JVVw==
X-Forwarded-Encrypted: i=1; AJvYcCXifMv7SXriU9nFZLa2yPp5inv8g8cEkLl3ZVfjXRa075zD3Lf8VqgKeeQv5woL74yPkdIe9OXWcisZ5e+Nm7qUNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+H3sS/kYkTK9qon3JLek3amf/MmjzOKx57MJ7RyXiJihJrbmH
	2Bk8Q6IYPlooErRWywiKXo3nw3JMkc7+GLuEI+O4KxBBjnJJpd2PWwTNNgOKVoVS3o0=
X-Gm-Gg: ASbGnctE80edLQDyzNRFD82Ls51BaoGbnMCaw+2V5ctRBPg0Ciy/rNiy6PuIwoxIcYF
	Tc/HUwYFkbFJUdHDVjJVkuPoN3V8/hZcTKKhVfm6/mspnLe/Ifl0kW3T8sMXNVQK8RDbTY1K04H
	NW0v35IiRR+3CjuerhLLMRbt5YPuzBdX659ae5v1UEaU3i5SzPhv/5RpD2bRNP40cdndgMgzfuv
	i9tzBmVteuA4N8tqmVXl2xvlzIdv4M1HTwm3EE/O/yU8GVZLKE8W4DuBQ5fFlKSdyXXYYktOv1d
	xZzv25sSATTaBMzesmLkXmENXlaHsBiCoMF4m/Yp6rD9ylNLjn4GrJaxaiWJwgcRP2WAk9b+v70
	mHrlnadB92sRtf1spPucfyPvHHJ98Oifrf62Pxi2F9coj5L6NhrYsczDvz3k08Ca79G7HhZsPi3
	tzynMWGS8pf+zpv/2s3BDxllogRdxm9ZI=
X-Google-Smtp-Source: AGHT+IFCU6WaBZgiF/ZmQ2rOEta9IrMmGJFMsWC5NGLfn/XlBZep1GcrbuAmBW+nOAHJjxzhUAPNvQ==
X-Received: by 2002:a05:600c:b8a:b0:46f:b42e:e39c with SMTP id 5b1f17b1804b1-477308efe61mr37787825e9.41.1761926789560;
        Fri, 31 Oct 2025 09:06:29 -0700 (PDT)
Received: from [192.168.0.252] ([82.76.204.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13ec105sm4271473f8f.36.2025.10.31.09.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 09:06:28 -0700 (PDT)
Message-ID: <336b06a7-8772-443e-8716-99e52ac4cc7e@linaro.org>
Date: Fri, 31 Oct 2025 18:06:27 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: nvmem: add google,gs101-otp
To: Conor Dooley <conor@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
 <20251031-gs101-otp-v1-1-2a54f6c4e7b6@linaro.org>
 <20251031-seltzer-briskness-6f223654c993@spud>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-seltzer-briskness-6f223654c993@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/31/25 5:02 PM, Conor Dooley wrote:
> On Fri, Oct 31, 2025 at 12:45:09PM +0000, Tudor Ambarus wrote:
>> Add binding for the OTP controller found on Google GS101.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/nvmem/google,gs101-otp.yaml           | 68 ++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2144911297beb89337b0389b30fe6609db4156ea
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google GS101 OTP Controller
>> +
>> +maintainers:
>> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
>> +
>> +description: |
>> +  OTP controller drives a NVMEM memory where system or user specific data
>> +  can be stored. The OTP controller register space if of interest as well
>> +  because it contains dedicated registers where it stores the Product ID
>> +  and the Chip ID (apart other things like TMU or ASV info).
>> +
>> +allOf:
>> +  - $ref: nvmem.yaml#
>> +  - $ref: nvmem-deprecated-cells.yaml
> 
> Why are the deprecated cells needed here?
> |  Before introducing NVMEM layouts all NVMEM (fixed) cells were defined
> |  as direct device subnodes. That syntax was replaced by "fixed-layout"
> |  and is deprecated now. No new bindings should use it.
>

This OTP controller has an OTP memory space that can be read/program/lock
using specific OTP commands /register pokes (I'm not adding support for
this in this patch set).

The OTP controller register space contains dedicated registers for the
Product ID and Chip ID, which I'd like to expose as nvmem cells so that
a client can parse them and register as a soc device (see [1]).

Right now I need to expose the OTP controller register space, but I
expect that the OTP memory space will need to be exposed as nvmem cells
in the future as well.

Thus I need to be able to expose both the OTP register space and the
OTP memory space as nvmem cells in DT. I thought of using the deprecated
(fixed) cells for the OTP register space and the fixed-layout syntax
for the OTP memory space.

What is the recommended way to expose the OTP register space? I guess
an alternative is to add empty nodes as direct device subnodes, and
define and add the cells to the nvmem device from the driver using
config->cells.

[1] https://lore.kernel.org/linux-samsung-soc/20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org/T/>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: google,gs101-otp
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: pclk
> 
> Why bother with clock-names when you only have one clock? Are you
> anticipating a variant with more?
> 

Likely, but I'll drop the name. We can add it later on.>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - clock-names
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/google,gs101.h>
>> +
>> +    otp: efuse@10000000 {
>> +        compatible = "google,gs101-otp";
>> +        reg = <0x10000000 0xf084>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
>> +        clock-names = "pclk";
>> +
>> +        product_id: product_id@0 {
> 
> Why does this node name have an underscore?

I forgot to update, will use product-id for the name> 
> Additionally, all nodes here should lose their labels.

and drop the labels from the examples.

Thanks!
ta
