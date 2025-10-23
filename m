Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B7239E80;
	Thu, 23 Oct 2025 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202681; cv=none; b=KxrgYSCtKPL+8qsu0HgwrJtenkfqGdi+nKxVJ0I7mYq4pM+S6QFOQGWVzACway4EboYmO8HZphM2m/IzjyG9t1smLPyKgixZIsiG6DXbx/yx4wk/9blq3D+aM4Yx4ZnYLO3QIwdrs2+OS9zkSxyROY7ZwimmrgBlXINKyl+ndqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202681; c=relaxed/simple;
	bh=Bk8mkjow2SUlSxjCiPaDSHS2if6WZcJF6LTupPJO9Lg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BgnJiFb6dfO2R08iXL1oZ7NKMfhQKUypnMZZo8NQct/zmWBntwTWhRl3Nfai1mIl2OkX5XdgAGcdMZmiGJZdaTgr2DSncqyE22an549wXWKQcXTFx/l7/3qdrVOaciQ6//9QW88hsFHNd+VgPWswto8tk5es+aa6A5CfN0fotZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwOH8CUA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwOH8CUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC92C4CEE7;
	Thu, 23 Oct 2025 06:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761202681;
	bh=Bk8mkjow2SUlSxjCiPaDSHS2if6WZcJF6LTupPJO9Lg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=YwOH8CUA1g9ZjTrRt8S/qb1Q3DHdjKzluiDFYeHpLVuGaohh7VOG2OGrBAcLeOlWs
	 C40TQFde0pwYlDpr2/HKy0dG0ouwreMDd+jnkJjYr22RM05cEfFvM10L2CWG6tySP8
	 gKZA4cMykWRNYPifPlo1rsti7VELpDv6T38DWPy7Nd59Ry68maQUUvsfmfhBAC14BG
	 jw/Ajk9wAAnjRVhq1iNqRgHRVJpJBy+mq10zbkRDWYLnM1ICI42l4IorHuyK5D4ri8
	 PIvT7YwVn3s7Zo5nOQUgaGACuU+x6YJ2UmZRvWs8zKj6ZpZThib+KD1xnSnWrVc6so
	 D66n7jYnPapbg==
Message-ID: <698ba0ea-3367-4fc0-bd4f-0177283c2e77@kernel.org>
Date: Thu, 23 Oct 2025 08:57:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB
 PHY
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>,
 Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20251017235159.2417576-1-royluo@google.com>
 <20251017235159.2417576-2-royluo@google.com>
 <20251023-collie-of-impossible-plenty-fc9382@kuoka>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251023-collie-of-impossible-plenty-fc9382@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2025 08:43, Krzysztof Kozlowski wrote:
> On Fri, Oct 17, 2025 at 11:51:58PM +0000, Roy Luo wrote:
>> Document the device tree bindings for the USB PHY interfaces integrated
>> with the DWC3 controller on Google Tensor SoCs, starting with G5
>> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
>> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
>>
>> Due to a complete architectural overhaul in the Google Tensor G5, the
>> existing Samsung/Exynos USB PHY binding for older generations of Google
>> silicons such as gs101 are no longer compatible, necessitating this new
>> device tree binding.
>>
>> Signed-off-by: Roy Luo <royluo@google.com>
>> ---
>>  .../bindings/phy/google,gs5-usb-phy.yaml      | 104 ++++++++++++++++++
>>  1 file changed, 104 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
>> new file mode 100644
>> index 000000000000..c92c20eba1ea
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
>> @@ -0,0 +1,104 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025, Google LLC
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google Tensor Series (G5+) USB PHY
>> +
>> +maintainers:
>> +  - Roy Luo <royluo@google.com>
>> +
>> +description: |
>> +  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
>> +  Google Tensor SoCs, starting with the G5 generation.
>> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
>> +  and USB 3.2/DisplayPort combo PHY IP.
>> +  The hardware can support three PHY interfaces, which are selected using the
>> +  first phandle argument in the PHY specifier::
> 
> Just one ':', anyway this sentence and below does not belong to
> description but to phy-cells. You describe the cells.
> 
> Or just mention the header with IDs - here or in phy-cells.


If you go with free-form text description in phy cells, then some
example could be:
renesas,rcar-gen2-usb-phy.yaml

For the header (in this case clocks):
display/msm/dsi-phy-common.yaml


Best regards,
Krzysztof
