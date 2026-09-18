Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A4502546;
	Fri, 18 Sep 2026 13:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739194; cv=none; b=DG73qy/lfQE+wWFQzXfgrX80gkoevrX97YoOZu7O8sY1HFil7CDmmGoU1+D7cg/CVA/xfTURFRxx3GoHPkUQ0H4LO6+6HO1ja3yeaApiDHWSlofTJeAGyjD40aC4+IEV/pIdNyT8sHcYeRCnxKjNvxym6tTSYpm00sBHxdL0IDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739194; c=relaxed/simple;
	bh=OelAxWimRFDPn5HhsdYA23bs3HO0pbyUKTsTBvGWQxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDgZf+B+dKj3/mw0gEzc5zwdY/otOC3CUgioQMFzysaoRg9jlPDSHG+dbIj6ITjhSXxfk/uLFpEGdOV57jKb0vH8ZML0WpUg5RywpHCVCkE2kwRqOiHTZ6gnfxME9MJ1q8DlvKIGa0a35iP5X/ZPG3gDwS7urVt0WUQCc2CETEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xt0tzOwz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xt0tzOwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993591F000FF;
	Fri, 18 Sep 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739192;
	bh=ymbnMK+8HyGQmBb3o9ET5vduF9wcW5sQOF2iKVjhYNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Xt0tzOwz5qtIe7DP2AdR4q3xgGeGGZI+NCLGpZ+qOVY+gebui36VXqY2h5GGWy/lH
	 ae/bCLuSSujJuKmgYAx3fjHElH/G9kw91Kup7sOFZKR0K34c+fqsLB+ccy2T1nqTBA
	 SjQZK3Adbc0sOSauI+KLfBx8xLMLS6kxwYmExNMhW8uXKGmrhKPEn74xZqRLZt5IIC
	 Kk1dvPmXafS2+fGeaZARasgwGYMZB8c6oCsABNjjrF70glhukaUdWmg1EnEj8IglhH
	 Q4YqROK1PkoUMrUWYtznNMGi8t1Y+Dx5e2oMslqar8T/QZKkWqh3v+HRO1YtBr9E5J
	 EfymYCC/FJvog==
Message-ID: <7fbcf497-a166-45d6-844d-faaece6f581c@kernel.org>
Date: Fri, 18 Sep 2026 15:46:22 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, mani@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com,
 dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com,
 eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com,
 thiagu.r@samsung.com
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
 <CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
 <20260916122229.2604003-3-selvarasu.g@samsung.com>
 <20260918-burgundy-marmoset-of-focus-c9b9a7@quoll>
 <fef2b2f5-3838-4eec-8118-d41f9ca0ed2f@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <fef2b2f5-3838-4eec-8118-d41f9ca0ed2f@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/09/2026 15:36, Selvarasu Ganesan wrote:
> 
> On 9/18/2026 3:24 PM, Krzysztof Kozlowski wrote:
>> On Wed, Sep 16, 2026 at 05:52:28PM +0530, Selvarasu Ganesan wrote:
>>> +maintainers:
>>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>>> +
>>> +description:
>>> +  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
>>> +
>>> +select:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        const: samsung,snps-dwc3
>>> +  required:
>>> +    - compatible
>> This select is not needed.
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - samsung,exynos8855-dwc3
>>> +      - const: samsung,snps-dwc3
>> And this fallback is not really accurate. Samsung does not have snps
>> device, because snps is a vendor. Anyway, generic fallbacks should go
>> away, drop, so you are left with samsung,exynos8855-dwc3 only.
> 
> Hi Krzysztof,
> 
> Thanks for your review comments.
> And We apologize for our repeated below explanation, but we wanted to 
> ensure our intentions were clear for each point to avoid any 
> misunderstanding.
> 
> The original intent of the generic fallback was to support existing 
> Exynos dwc3 bindings from a parent/child representation from 

How does it support existing bindings? I don't understand. There is no
such fallback in existing bindings.

> (samsung,exynos-dwc3.yaml), and upcoming SoCs (Exynos 8865, 9955, and 
> 9965) can use this flattened representation without requiring a unique 
> compatible string for every project in the dwc3-generic-plat driver 

I did not forbid you to use fallbacks, so I do not understand why you
would need unique compatible for every device in the driver.

This is already heavily documented and explained in beginners docs.
Please read writing bindings docs and maybe also DTS101 slides. I even
gave the talk DTS101 two months ago in your timezone...


> of_match_table. We referred to qcom,snps-dwc3 as a helpful reference for 
> this approach.

When people argue with me, they use more often poor examples as
reference, not the good ones. Interesting pattern.

And why you did not take the proper example you even mentioned here -
Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml - as
reference?

Anyway, existing bug is not a reason to add new bug, don't you think?



> 
> As seen in samsung,exynos-dwc3.yaml, our existing bindings already 
> support multiple SoCs with diverse clock requirements within a single 
> file. Similarly, we plan to use a single flattened Samsung binding to 
> manage these diverse clock requirements. for different SoCs.
> 
> Regarding the migration for current and future SoCs, would you prefer,

I do not understand how any of this is relevant to my review comment.

> 
> Option A: A single flattened binding file using a common fallback 
> compatible string (instead of samsung,snps-dwc3) to minimize 
> of_match_table entries, and if/then constraints to handle diverse clock 
> requirements.
> Option B: Separate binding files for each individual SoCs.
> 
> Could you please let us know your preferred approach? Once confirmed, we 
> will address your other review comments based on the selected approach.

You do not have other bindings. You have one device. If you have more,
then post more. We are not making reviews based on imaginary future things.

Best regards,
Krzysztof
