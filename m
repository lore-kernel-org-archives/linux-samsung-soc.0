Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A901CA8A;
	Thu, 25 Jul 2024 06:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721889427; cv=none; b=b2F9XEHJk9DNyVosjro3A/t9ZxEO9JrSmL8Uqig92avn2/EhzmTw8wsIT2XUTQcDs4ajcqUm01eNF1/Zle6aUF8RAoopqJmoM3Qt8H4Ri2wrMZp4NAF8BMZTYSXYvRwAqUpAiR3QZPIzd6OYitzM/enOF5OFJgMRx7KiYmQQvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721889427; c=relaxed/simple;
	bh=NORB3LlQ4XTRSptu20Mig/2HZ9Rzgo+NgXd3Fn+DqAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KaVWc0gLUtJTTT4zZqx4CJ19O+IkMd6iktlccF1Kebbg4C/aqztogi9cFL+awhHQl2gXGmE917Zd2yUzcgmfp7M1WmvrBXvLUp5967wgbRg9XujC/eL7Di2NmHYL6+cTJ9SaOd/Eocq8C04nioRHuJYocOqj4Oqrq8kAMXTCQt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7Zwr4iZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7Zwr4iZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80033C116B1;
	Thu, 25 Jul 2024 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721889426;
	bh=NORB3LlQ4XTRSptu20Mig/2HZ9Rzgo+NgXd3Fn+DqAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c7Zwr4iZNbh388Yy8bOOUmfOvzoSGLuRejeNspsnCVujHOHE1tjLhVAlQoCmCLRwO
	 dIVkKj9kXNwikQlyc1hu89bw5adFpfsSw+ErEyG3ZIDhmCuXBDuAC5Y3MVY0B6H9HD
	 MgobSjwkuUa6iqVNFkLngHUqU+OkCMA7TIW8PK20fnaNB3dBS3qc9NV5CbBSGdjBPz
	 BhS7//NbkBd0YZlwY7ReV3SWa4dpv2hUQmp1XWzdQMgVMuHXRkC1mMietpYSfIWVms
	 eruu0RkXy5QhyDjbn4Jg0lr9moJgd5Ciui35gp6GKaZlzHYUIcNpSzZvFzjSF/5I+E
	 6euwS/HnrNzmQ==
Message-ID: <8ee739e7-8405-49d7-93f8-f837effe169b@kernel.org>
Date: Thu, 25 Jul 2024 08:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
To: "sunyeal.hong" <sunyeal.hong@samsung.com>, 'Rob Herring' <robh@kernel.org>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>,
 'Michael Turquette' <mturquette@baylibre.com>,
 'Stephen Boyd' <sboyd@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
 <CGME20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d@epcas2p4.samsung.com>
 <20240722223333.1137947-2-sunyeal.hong@samsung.com>
 <20240723205714.GA1093352-robh@kernel.org>
 <035501dade31$55cc7f40$01657dc0$@samsung.com>
 <03b201dade3f$3d66e3b0$b834ab10$@samsung.com>
 <bf6cd1c9-d60a-4ef1-89f3-5d28e003ce2d@kernel.org>
 <03ef01dade5c$ce407820$6ac16860$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <03ef01dade5c$ce407820$6ac16860$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/07/2024 08:35, sunyeal.hong wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Thursday, July 25, 2024 3:21 PM
>> To: sunyeal.hong <sunyeal.hong@samsung.com>; 'Rob Herring'
>> <robh@kernel.org>
>> Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>; 'Chanwoo Choi'
>> <cw00.choi@samsung.com>; 'Alim Akhtar' <alim.akhtar@samsung.com>; 'Michael
>> Turquette' <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>;
>> 'Conor Dooley' <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org;
>> linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC
>> CMU bindings
>>
>> On 25/07/2024 05:03, sunyeal.hong wrote:
>>
>>> - dts
>>> cmu_misc: clock-controller@10020000 {
>>> 	compatible = "samsung,exynosautov920-cmu-misc";
>>> 	reg = <0x10020000 0x8000>;
>>> 	#clock-cells = <1>;
>>>
>>> 	clocks = <&xtcxo>,
>>> 		 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
>>> 	clock-names = "oscclk",
>>> 		      "noc";
>>> };
>>>
>>> In this case, can you tell me how to handle it?
>>> And if a new clock item is added and a new cmu block uses only the clock
>> item added and oscclk, a problem may occur.
>>
>> The same problem was in your original version, so why suddenly it appeared?
>>
>> Anyway, why clock would be missing? You just wrote in the bindings that
>> there is such input clock.
>>
>> Best regards,
>> Krzysztof
>>
> 
> If I reflect Rob's review, it will be changed as below.
> 
> - yaml
> properties:
>   compatible:
>     enum:
>       - samsung,exynosautov920-cmu-top
>       - samsung,exynosautov920-cmu-peric0
> 
>   clocks:
>     minItems: 1
>     items:
>       - description: External reference clock (38.4 MHz)
>       - description: Block IP clock (from CMU_TOP)
>       - description: Block NOC clock (from CMU_TOP)
> 
>   clock-names:
>     minItems: 1
>     items:
>       - const: oscclk
>       - const: ip
>       - const: noc
> 
>   "#clock-cells":
>     const: 1
> 
>   reg:
>     maxItems: 1
> 
> if:
>     properties:
>       compatible:
>         enum:
>           - samsung,exynosautov920-cmu-misc
> 
>   then:
>     properties:
>       clocks:
>         minItems: 2
>         maxItems: 2
> 
>       clock-names:
>         minItems: 2
>         maxItems: 2
> 
> - device tree
> cmu_misc: clock-controller@10020000 {
> 	compatible = "samsung,exynosautov920-cmu-misc";
> 	reg = <0x10020000 0x8000>;
> 	#clock-cells = <1>;
> 
> 	clocks = <&xtcxo>,
> 		 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
> 	clock-names = "oscclk",
> 		      "noc";
> };
> 
> In this case, ip should be used after oscclk, but misc does not use ip, so there is a problem in dt check.
> 
> The code of v4 version has clock items for each block, so there was no problem like this.
> - yaml(v4)
> 
>   if:
>     properties:
>       compatible:
>         contains:
>           const: samsung,exynosautov920-cmu-misc
> 
>   then:
>     properties:
>       clocks:
>         items:
>           - description: External reference clock (38.4 MHz)
>           - description: CMU_MISC NOC clock (from CMU_MISC)
> 
>       clock-names:
>         items:
>           - const: oscclk
>           - const: noc
> 
> If there is anything I misunderstand, please guide me.
> 

You did not address my questions at all instead just copied again the
same. It is not how it works.

I am not going to discuss like this.

Best regards,
Krzysztof

