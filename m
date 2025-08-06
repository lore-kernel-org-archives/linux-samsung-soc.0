Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989F828B516;
	Wed,  6 Aug 2025 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754488668; cv=none; b=KmRBxG+dDJ3lNMjBm0PAOJUHotXTTGIavDYQxBKk5MntPMwHZLavgAZ4Dn4G7rPDQu2wf8lAcyyx3r21Kss5lpBdXFgw+18KUwG6IVV/vffOSAr64XPVJjxicRvS1X3QODElzxMW6bSArPJiDkKLN1dlvGTDBMzpsYEZu4kCQVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754488668; c=relaxed/simple;
	bh=n/ObepZyGgjKds95g5+xh+xWSxe6QfTejtKfyZCffzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogcyEngT8K0eBmAF6mBso9xvIvaDabnbEWRluMAgQLUQINrC36me9oRc9sKcVAmZAepJbSRmW5zetFgy4nup/DHD614TGa1hg/pdMaaLjvRj3Z1BtMeLL+YMfDmE85BniAgM/9AXLKrLXDaaIL7TOeXyi52AB1Iay+I0EgGv71k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixufnPeF; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixufnPeF"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af949bdf36cso774320066b.0;
        Wed, 06 Aug 2025 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754488665; x=1755093465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHzr4MA8aqHB6jajAWjKyzRf2MPIdZd6EmOAFNAHckc=;
        b=ixufnPeFZWZWL+U7dONizLSVXMhOcE+xOYcwCKqcY6dA7RJW1BImckZ3nkLbmbXC9e
         JUQNINh9ASCnE3ITE2WTgoXcLji6NJpn8190FA+O+Ln7ZPCN0Dd9ddf6icXt6IQW5Tcu
         6Aba7hZFIv6Ipd1oBW7A4Gmi3wA2PNgvz352FCjdBnhfARNApXKM7pliYib7W6s3jYr3
         eSI/qodluaYihe4ce6tXnzXuQaqXFQhWXdwVXVJzSC/3I9UEQAyg9ki5xPRzGhhpad4a
         Izd5oPRsdLFRsWRorH2yY3nj0AJzqjK/NNz3Qwyl1UkBSB5hVmCRb1T9L6oq3ykDdvrU
         dFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488665; x=1755093465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHzr4MA8aqHB6jajAWjKyzRf2MPIdZd6EmOAFNAHckc=;
        b=BgqJK8jEsrHBlJHgmwvMluANZhv0vkuhi0oX2xf6jrorcKnVprHsB3df+P9FFxu6XU
         0e99I3eojmb77w4d56tHdGG6odh3k10Dzf7HRdkeUA/V2dk+J7lf0/8uFJj5/vkaTQ+4
         RLqDBckTwSXWCBq//qnwUKLjFx4Zd1fXaYMsBsG90uZ3rBgNLec5IORAGfUEn2Kn01Wn
         +FtzE4nokjBxNw/ZvRy9fytWd/4uyn0dci8eyxj70cB4tLxGj2ej4F8lj0uw+zgzi73q
         yb1gmwIQm0Yh3SASXE5CehA+PpqQ2N/VBgxY2HhJJCoM9G7f45c+hMeMSqY9o2N9R7JQ
         PQug==
X-Forwarded-Encrypted: i=1; AJvYcCUiDDU9KJ1DKre7rBPj7nRbGAbycwDRmX4yJXe4wiKFdICD+nqD55XzMw6jjtDkjCN/VSpfNTkeboUnT27sDzhtIXM=@vger.kernel.org, AJvYcCV2Z7jhakL+L5GW5eYp5rxSvVw1ZxCQg48ywlOVqoKcp8Ga3c9Gss8mi42wkXHyYqGONolBTp/ayFJl@vger.kernel.org, AJvYcCW95p0POUrThDAJB5h18KyglatdaUVmGpKPK5VhAtbIBJQRK65NOUIhq10OfOAYpeWgIJ1U6X07+L7fVFUs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4qNWA/krtCsUIUtcTu8npjPpYqgZcqaLXX37b0JV/FVtRAA08
	kGYjF+me9G7/XXJvhajkZoIREK7McNi8DpVDc3pehdYko8+yJHQc9z4S
X-Gm-Gg: ASbGncvhSdfFCJndOZiyncF/OsX6/ZdHZn0HtCOaSZKdbaYXk35/8cxiH21m2aQGzaJ
	yhwck/lzRPB2lNCDixA2ZS0JiFWTubXU962HIHaK5vVGeXeRBt6PngWAB0TAWZ83NHrVRKFhfqi
	H/QNymdRB7wkNIATu6QZE2YTkL9mi3sUbDuo6KGEn/4JRaVWzVVLCMCIvKVae53ur4H3JOaJZLf
	3i9lwZU48AWTjns7+tKyOgcuHOsawdT9NQcoTJh9iKPe9Y78ppywCohWsRagVnmcK6AcwGvdJqj
	BrFSGDC1r5oQ4PYCgOAEH2Y20AJPuCoYOL0lu9qp9vnDll3ThXJ0mnHyLIbBDA0nISwPm0wr1g2
	0FEftrXb8SDTJ7/07CblU3pmw7nPoN/Xkm7iz0MsBI1mjDhM7r1aokh7WcMGT/kxbBXw9kXsf+h
	8rFRmcVlW063E=
X-Google-Smtp-Source: AGHT+IGQ3QZUaLC8+topY1n9SlLxxAbYjEO2ebSd3f+30oUx/XN3GCsmaSZCHF1ta/LFIKgiqEA7eQ==
X-Received: by 2002:a17:907:7f18:b0:af9:2502:7772 with SMTP id a640c23a62f3a-af992bc37femr270882566b.54.1754488664645;
        Wed, 06 Aug 2025 06:57:44 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91ee3c1f7sm1045900366b.68.2025.08.06.06.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:57:44 -0700 (PDT)
Message-ID: <cd17cfb4-5708-4c15-b616-505f669bf2eb@gmail.com>
Date: Wed, 6 Aug 2025 16:57:42 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos2200: define all usi nodes
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
 <20250730074253.1884111-6-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4maFxYv4RrvzUXWwteXAVm64ocj2LSAgtM6RMtzbM_p-w@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4maFxYv4RrvzUXWwteXAVm64ocj2LSAgtM6RMtzbM_p-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/2/25 03:29, Sam Protsenko wrote:
> On Wed, Jul 30, 2025 at 2:44 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Universal Serial Interface (USI) supports three types of serial
>> interfaces - uart, i2c and spi. Each protocol can work independently
>> and configured using external configuration inputs.
>>
>> As each USI instance has access to 4 pins, there are multiple possible
>> configurations:
>> - the first 2 and the last 2 pins can be i2c (sda/scl) or uart (rx/tx)
>> - the 4 pins can be used for 4 pin uart or spi
>>
>> Such configuration can be achieved by setting the mode property of usiX
>> and usiX_i2c nodes correctly - if usiX is set to take up 2 pins, then
>> usiX_i2c can be set to take the other 2. If usiX is set for 4 pins, then
>> usiX_i2c should be left disabled.
>>
> The whole naming scheme is a bit confusing: one might think that
> because both usiX and usiX_i2c have the same number (X), they
> represent the same USI block.

Mapped to a different address? Hm, I doubt.

>  I can see how they might share the same
> pins, but it doesn't seem enough to me to justify this convention. If
> I'm missing something, please help me understand why it should be done
> like that?

That's the way it was done by Samsung in downstream, and specifically in
upstream for autov9 [1]. Clocks are already merged and definitions expect
the convention implied by my patch. Iit'll be way more mangled if we use
non-matching node to header-definition names.

>
>> Define all the USI nodes from peric0 (usi4), peric1 (usi7-10), peric2
>> (usi0-6, usi11) and cmgp (usi0-6_cmgp, 2 pin usi7_cmgp) blocks, as well
>> as their respective uart and i2c subnodes. As Samsung, for some reason,
>> has decided to restart the counting of usi instances for cmgp, suffix
>> labels for nodes of such with _cmgp.
>>
> Yeah, they probably meant to number CMGP instances, not USI instances.
> Because CMGP (stands for Common GPIO) is actually a separate IP block
> containing:
>   - 2 x USIs
>   - 1 GPIO controller (8 GPIO lines)
>   - One general purpose ADC
>   - 6 interrupt combiners
>
> So some USI blocks are separate USIs, and some USI blocks are a part
> of bigger CMGP blocks. And instead of using "usi_01_cmgp" for example,
> they should've gone with "usi_cmgp01".

I guess.

>
> Usually it's recommended to follow the naming scheme from the TRM, but
> AFAIU you don't have one.

Yes...

>  And the scheme used in the downstream device
> tree looks like comlete garbage. Anyways, I don't have strong
> preference on the naming scheme. Frankly I'd just do the consecutive
> numbering for all the USI nodes in this case, like: usi0, usi1, etc.
> And add the comments when needed, like "USI from CMGP01 block".

This will mangle stuff way too much for my preference. People will be
way more confused when comparing this to the downstream device tree
too, as the average Jo does not have access to anything apart from kernel
source (like me -_-).

>
>> Spi support will be added later on.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1361 ++++++++++++++++++++
>>  1 file changed, 1361 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> index 22c6da907..f83e6cf24 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -7,6 +7,7 @@
>>
>>  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>>
>>  / {
>>         compatible = "samsung,exynos2200";
>> @@ -314,6 +315,76 @@ pinctrl_peric0: pinctrl@10430000 {
>>                         reg = <0x10430000 0x1000>;
>>                 };
>>
>> +               usi4: usi@105000c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x105000c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                <&cmu_peric0 CLK_DOUT_PERIC0_USI04>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric0 0x1024>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_8: i2c@10500000 {
> Why not number all the underlying protocol nodes using the same number
> as the USI node?

Same as above, my wild guess is that Samsung ordered them by physical
position.

Best regards,
Ivaylo

[1] https://github.com/torvalds/linux/blob/cca7a0aae8958c9b1cd14116cb8b2f22ace2205e/arch/arm64/boot/dts/exynos/exynosautov9.dtsi#L503

>  Like it's done in gs101.dtsi. And maybe even follow
> USI naming scheme used in gs101 in general? Like, sort all USI nodes
> by unit address, and then number them starting from 0. If some other
> USIs are missing (like I mentioned in my review for the previous
> patch), add those too, first.
>
> [snip]

