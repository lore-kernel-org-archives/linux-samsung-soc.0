Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2C53E1218
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Aug 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914088; cv=none; b=FvmbvA2Mq3WpV4NTUaM62fr6ANX6zEwxeT8C6zDJHuXSkD1GjciOD1W+cmsbJp+gFHOmoXse8CV1TlqV1m2kzuWTaiYlMUH5m0Sa8TluO/+HkhMHtsAXekh+iu+vgkFmLwfi+tRrLifm5mp/WaW/h7wo+mZVEQYTr0EH+oUipVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914088; c=relaxed/simple;
	bh=uepu9acxXvQl5sYD1/Nq3WCCzgCd4xSS+zMYdRJKUnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pa/S72LD/Xg7xApSL3RVTgcGZ5GSiZtOyZDlpXJqHDKMzwGPV0AMdeU+/Todh+fcsu2IydmIG0bNT86djLRVd8TxvEDUVTxZOnqhNS5Gk+qP24E/nU9TWrVAAt1y/OxIOCr+WH0qzA71BCgIXTjecb7UxnLGB5Mmx2nnS8UpWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pS3DNko5; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pS3DNko5"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c7fd45465so6132211fa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Aug 2026 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785914084; x=1786518884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WwkS9i7GNpI0kimuglDAwrHsAV6ybfyNHVpUwpH78Q=;
        b=pS3DNko5CooES3VAwd5B4STTaWtoMwBPiIjWO6v4VZBwao5PSBJMwD3XigGjBD3k0j
         zHzMbirqM3N5BBaQISEwCuS2SUNx+WIR/v5SF/5IvURsol7yqqHkRVZcJAvtc5gOwWXr
         agw8EL5e+OJ6boXLHfOacejsMc9tdFh4TVTseT1D5kw6WWOLrxTh/ldg0fE86uMahvBQ
         AMFPhjZKaZD+QNMqoedT2N8H3YbMY5jgaMu0xCp2+XsLfYHFQRK/VA2H82ogpIlj8aAt
         wjyyiM0sRzHiZCKwD1l5A3kvO7GDGYwiYmnpw0zplTuVH/4qj46kDQHVseQEr2awBPTz
         WrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785914084; x=1786518884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WwkS9i7GNpI0kimuglDAwrHsAV6ybfyNHVpUwpH78Q=;
        b=C14e72qAnzI9s0kNqaxh4J/FfC5mCZFQ7nq1u5xBQnGCls0ih5ih1+LsR5sXWrc/Hz
         kSrM042jV4vbr9IfLM8CxMZQYXXuoITHw0qAf6TkO+wM1DI0KlNw0bWHIkR9b09OYNAo
         +eBvg7fxG4M8s/mUSwbNrxePc96j1BguRjDfPaC0Z0Pag5wOJfEelDnRqIUgWEK4YANZ
         WpXXice9IpV/yAwUST4TUp6Gb9t20F0LVqULOJR8dM8S4wLTSwTtsWk3GgrbXSuEewnt
         CJRFoToxNixj5AHr06I5FJ4msRjfn5bT3PkuSYHleu7e/rTM3PG4i7d+2of8bFsuc/1v
         6d4A==
X-Forwarded-Encrypted: i=1; AHgh+Rpl2xDfSsL4W4PQl9rwHDj5Nop1XwNfrirBD8nSgIAzqVUrJbrptAW75UaZXTlizDP4eltDxOGz4VvQuioWBXNSIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdo10HXhQgnV+jpFmeH2YJBfQtHwOgDa7s4zlfUWiaUyqjDWfg
	rVawPPL2Y2Edjx4/GRUFmzkyxLPsGwCHBLHNgnEw4EtHBXtSgwsJzH1p
X-Gm-Gg: AR+sD13xepxqFx7VXXAzjUY4I30/j8S7iou9ju29V92f8HvaWeb70f51OT2pCdpS5in
	JvkUbUOavuSgzkzXmVgtxTNVRzFXMl9bT8Nam3eikDFNBfTDNRiai2iq54cpzXpG1Dy0/ooIuVV
	w6chQOb7pCulqIro/cG5tiqqN/BBInLM9Zjc7rEfv5kPJzVu+Csbgrm2W4cMB/UO5Nv5ookzEkM
	idZWcpkyAU7kZ9bgLYhKoQYmquuvuoSWzHERej1AB84Q/An5xXI1dlw1Cys9hZoD9NlvxJ00sFb
	25N3XCyXQ2iMrrdc+Uo7jPb0NwFfOX3Bbm+4V5/fsvBwaMoV2mCHftqE0z/KDfz3M23WPc3Zz3T
	kVM/2+fUexBQsaykhpMOMj9eVF+JcRvDm7ebwFASzxqqFbiYrFmaTGH1+UB6zipvkvqGGa+OvgI
	e1ju93H+XzeQi1avXavuYWsAF8kEE8sHLlNuiSTKxHHNMYlFCm5ZSdTHTiqkAkX/jNkVC0Ew==
X-Received: by 2002:a05:651c:19aa:b0:393:d6dd:e8a1 with SMTP id 38308e7fff4ca-39fbb1ed3demr5005791fa.2.1785914083978;
        Wed, 05 Aug 2026 00:14:43 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a33c88sm6775331fa.30.2026.08.05.00.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:14:43 -0700 (PDT)
Message-ID: <da3aece8-3ede-40cb-8f63-45614a965cd7@gmail.com>
Date: Wed, 5 Aug 2026 10:14:41 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: mfd: rohm,bd71828-pmic: Use generic
 power-controller schema
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Dmitry Osipenko <digetx@gmail.com>, Shree Ramamoorthy
 <s-ramamoorthy@ti.com>, Heiko Stuebner <heiko@sntech.de>,
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>,
 Zhang Qing <zhangqing@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Julien Panis <jpanis@baylibre.com>, Alexander Kurz <akurz@blala.de>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-8-a440783c2e78@nxp.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260804-mfd-syspower-v1-8-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 04/08/2026 17:16, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Switch the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> index 09e7d68e92bf..9818102e02c7 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> @@ -15,6 +15,9 @@ description: |
>     single-cell linear charger. Also included is a Coulomb counter, a real-time
>     clock (RTC), and a 32.768 kHz clock gate.
>   
> +allOf:
> +  - $ref: /schemas/power/power-controller.yaml#
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -79,8 +82,6 @@ properties:
>         used to mark the pins which should not be configured for GPIO. Please see
>         the ../gpio/gpio.txt for more information.
>   
> -  system-power-controller: true
> -
>   required:
>     - compatible
>     - reg
> @@ -91,7 +92,7 @@ required:
>     - gpio-controller
>     - "#gpio-cells"
>   
> -additionalProperties: false
> +unevaluatedProperties: false



If I am not mistaken, this allows all bindings from referenced common 
binding files, whether or not they are declared in this binding? If so, 
then this is probably not aligned with what I am hoping to do with the 
ROHM PMIC bindings [1] [2].

I hope to collect the commonly used ROHM PMIC bindings in one common 
file, and reference it from those PMIC files, which use some of those 
common properties. I would like to collect all of the commonly used ROHM 
MFD bindings in the same file because scattering them around in tiny 
files feels like a bad idea to me. This means that not all of the PMICs 
referencing this file, use all of the bindings from that file.

Hence I would prefer not to just allow everything from the common file - 
but to limit allowed properties to those that are explicitly mentioned 
for the specific PMIC. For example, my proposed change [1] moves:

rohm,clkout-open-drain, rohm,pin-clkout, rohm,pin-fault_b, 
"^rohm,pin-dvs[0-1]$" and "^rohm,pin-exten([0-1])?$" to 
rohm,pmic-pins.yaml. Only the rohm,clkout-open-drain should be supported 
allowed with the bd71828. Keeping:
additionalProperties: false

disallows the properties which aren't explicitly mentioned for the 
bd71828, while making it possible to keep the description, type and 
other common stuff in the common rohm,pmic-pins.yaml.



Also, keeping the single explicit line:

	system-power-controller: true

to denote this specific PMIC can act as a system power controller feels 
(to me) more descriptive than "hiding" it in

$ref: /schemas/power/power-controller.yaml#

- which is also a single line.

As a summary - would it work if you added the reference (for 
description), but also kept the explicit system-power-controller: true 
and also the additionalProperties: false?


[1] 
https://lore.kernel.org/all/838486b443af9188410d8b802a818dc0af20ea9d.1785838585.git.mazziesaccount@gmail.com/
[2] 
https://lore.kernel.org/all/d419dcf8776f7ea88e4a66b9a0f0087f11e6622c.1785838585.git.mazziesaccount@gmail.com/

Yours,
	-- Matti


>   examples:
>     - |
> 


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
