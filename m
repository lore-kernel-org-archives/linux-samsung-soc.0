Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978E290F;
	Sun, 16 Feb 2025 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698631; cv=none; b=GUlWDZcA80uwVteeeXfGJYglkz8w2EXn6pqfPYoHztsf4gB8fUcv01X1xukv6AJhZB3G1ZtZxCI+2Uy6dAbjkdyEuBfWqVXMO1aEddoiLkzQP1eNNvzyGUdLa9Cer862FNssfIcpg50NmW5FcdGsCM63f9dUIe1IQ8oAIV6GJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698631; c=relaxed/simple;
	bh=LItlxkeVY3OlbSolxlRak/BIF6duZftC7VGrnR1A50w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INY3cdriSRG9LjZDCPGobDRjl6eN5gIOieuNF+wg9NuWvFwishDt6TEm2xLRfP5r3xEC4DN/n3FXFaU4GNt2Y4VTwAm/1ekdKsLFrlhhHy1WiSeVWPuzajDWr8ofvTcDSGO3XIP3iKqQ6gGRsajS3n7mGxbJF5OK/cTE9eU/pGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXJKEKe+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXJKEKe+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5592C4CEDD;
	Sun, 16 Feb 2025 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739698629;
	bh=LItlxkeVY3OlbSolxlRak/BIF6duZftC7VGrnR1A50w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UXJKEKe+wzhWLqWS10DcTSM4go2ftC+8AhFNAuGoDk+eRt4krFOieACAsyO2Drmy5
	 bAMEFOuq+JmodZNpPeB7PImAyhgZaiJHrF/z06P4NKWndgy6zbIBSvaE2uudq5vXvj
	 Y7d01ejYy1R95SAgOjg2j5pUWWaxogjEK5jCqyQ1efK+3ilgUP+S2arJglWEsZ3PEY
	 xJzA4QHwEzI5ZpFfZRTtDe1VVACt6LfuYrMktVsVmHMhmlmvV99fozcLUQcjnBUIlP
	 R0ZZPl6VtVeS8VlX6+idLQ0m3XcIzAN2qtB4qJRPLizLLSXtiPGeg6Jk1UdEc8hdwy
	 cuTkVRMInqZrg==
Message-ID: <b7cab5cc-c560-4128-8f2b-184ffb400d01@kernel.org>
Date: Sun, 16 Feb 2025 10:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: add
 samsung,exynos2200-snps-eusb2-phy schema file
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
 <D7TR7VP9UPQA.2U5BL328HNSXU@cknow.org>
 <fc860290-c5e5-4193-a8b7-a53137dd4155@kernel.org>
 <9c23e529-92ac-408f-a7e5-7cb7beda35b6@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9c23e529-92ac-408f-a7e5-7cb7beda35b6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2025 10:27, Ivaylo Ivanov wrote:
> On 2/16/25 11:22, Krzysztof Kozlowski wrote:
>> On 16/02/2025 10:14, Diederik de Haas wrote:
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/samsung,exynos2200.h>
>>>> +
>>>> +    usb_hsphy: phy@10ab0000 {
>>>> +        compatible = "samsung,exynos2200-snps-eusb2-phy";
>>>> +        reg = <0 0x10ab0000 0 0x10000>;
>>>> +        clocks = <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
>>>> +                 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
>>>> +                 <&cmu_hsi0 CLK_DOUT_DIV_CLK_HSI0_EUSB>;
>>>> +        clock-names = "ref", "apb", "ctrl";
>>>> +        #phy-cells = <0>;
>>>> +        phys = <&usbcon_phy>;
>>>> +    };
>>> Shouldn't the example have at least all the *required* properties?
>>> Same for patch 2 of this series.
>>
>> Yeah, this wasn't ever tested.
> 
> Device trees were tested with dtbs_check W=1 but I overlooked testing bindings
> with dt_bindings_check. Anyways this is rather a small problem, will be fixed
> in a v2.
> 

This makes the bindings unreviewable and they will be marked as "changes
requested".

Best regards,
Krzysztof
