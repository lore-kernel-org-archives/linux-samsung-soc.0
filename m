Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6D13FEE;
	Mon, 23 Dec 2024 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734969541; cv=none; b=gYNwqA1GWBEzGCt5Mk3Hg3xoO2LcUO7gMqeKHUkIUK5k5/QXz3DCJFVrTmvq5id24ytbsi3W4Lq2tUsES376pBF7lgNOw/+fstgM8nsH5S8eVjYoclu4QAKSKp/7teSiGibemzPK4Wtc8IQECvfVaRyOFh4U1Ts25eaS4KBYx3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734969541; c=relaxed/simple;
	bh=IMhhqcikriEhghtj/Hx/wU1Ar/3/aaUENB36dKe9Uac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opmknrgS3uaOMThH9QE8xS+lLNiERIllPNmxBKIQj1UwKbfBuqkbRUGzFzVguYg7aP2fNcKxMcq9tSSnnoDehMbw9ZqDIRRgZuGrgWLANemr9Q377E055KNHfZ66ef2XB/+QTFdfyKaWA6/5MjDi6LoumYdxqzORiMlbxjWpd9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hc5WpQ6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hc5WpQ6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6E5C4CED3;
	Mon, 23 Dec 2024 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734969540;
	bh=IMhhqcikriEhghtj/Hx/wU1Ar/3/aaUENB36dKe9Uac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hc5WpQ6VAEQeB9w1r6KhyAWUOBNua6t529xu+9j4wBbp0jXGjBLRfxAG/Ot4nTkDh
	 +tHsMsvG7JIjBFslmScvZKLzd5jW24S274uyf6KeGEyGPnsLBiKEWxaTZiixJrYS01
	 AbnrgAgqSENEDEBrIm70L1j3aVQ3sU1t0uYivDnvs3CtcKUek47IXPRAMwcpxsRjmO
	 BKWVfUNpmd/uGSu7ahd1+flb+1jyxfoQRt0aUZlpOyUpUgkceWrBuTRySHxm3iqKNn
	 DvnrTFVcerpP3gnpIKf/y6P0dGCHLd3Z7qKnIWtebrVS6ccZKRVyRO6Vr7NmdG6Alp
	 M9wT0gYXU5DYw==
Message-ID: <45ef0069-5414-49a2-b7e4-4b0c70c0d1a4@kernel.org>
Date: Mon, 23 Dec 2024 16:58:55 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: google: add gs101-raven and
 generic gs101-pixel
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
 <20241220-gs101-simplefb-v2-1-c10a8f9e490b@linaro.org>
 <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
 <cfdc5b1b03140e3d2ce3fb58e8b342dc2ac06d04.camel@linaro.org>
 <d960e22e-01ad-406d-9616-d45edbef0232@kernel.org>
 <9507951f9ce4ee9d8c553d8964f00ef217f8ed1d.camel@linaro.org>
 <c2efb6c7-4a0b-4078-b0df-6e646eb88906@kernel.org>
 <34f62a976e4dd2d56eb34e4efa987ddc3e2f31ca.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <34f62a976e4dd2d56eb34e4efa987ddc3e2f31ca.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/12/2024 16:54, André Draszik wrote:
> On Mon, 2024-12-23 at 16:39 +0100, Krzysztof Kozlowski wrote:
>> On 23/12/2024 16:31, André Draszik wrote:
>>> On Mon, 2024-12-23 at 15:14 +0100, Krzysztof Kozlowski wrote:
>>>
>>>>
>>>> You now say that these are valid boards:
>>>>
>>>> compatible = "google,gs101", "google,gs101";
>>>
>>> Sorry, I don't see how (apart from the fact that dtbs_check flags
>>> non-unique elements anyway). The result of the patch is:
>>>
>>>         minItems: 2
>>>         maxItems: 3
>>>         items:
>>>           enum:
>>>             - google,gs101-oriole
>>>             - google,gs101-raven
>>>             - google,gs101-pixel
>>>             - google,gs101
>>
>> The problem is this line. Although entire concept of flexible list is
>> neither need nor ever recommended.
> 
> All of this was inspired by Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> I guess not a good example in this case...

These are SoMs with multiple revisions, so quite a different case. Plus
there is actual reason from Michal for doing that explained in commit msg.

> 
>>
>>>         allOf:
>>>           - contains:
>>>               const: google,gs101-pixel
>>>           - contains:
>>>               const: google,gs101
>>>
>>> So one can not have 'google,gs101' twice. And if I only add
>>
>> Still can be, but indeed not with my example but:
>>
>> "google,gs101", "google,gs101", "google,gs101-pixel";
> 
> This example doesn't pass irrespective of binding, because
> dtbs_check will complain about non-unique elements.

Ah, cool, I wasn't really sure. I checked only dt_binding_check on some
example and there it was not spotted.


Best regards,
Krzysztof
