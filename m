Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFDD215077;
	Mon,  9 Dec 2024 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733204; cv=none; b=aFRSKKWcDdXJ/eJUyC6OzcHXVO89fda46Cy8vbkLpPbEjzQ3a0Go/aTaHLGANmFP0of7uGe6E2eY0TW56IaN63Ycg+K68pAwVCdU8yCgv0WG98u6X2vtbIzPRlYc4fcP8Fq5H6xWCCv9S34A44iq4zp8dJXOliTI0Lm0e9GADjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733204; c=relaxed/simple;
	bh=HsbV/5kfDFx4fY98SchLy/o10XKUQIV6I7sMet5InAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=edD1d6M2IjgH9231gy3qVKiI3OF8UiGM8xxuqRIjB0cGtDms7ptfqlJ5SKg+RPD8Fdnvqa3w104Utis376XsE42y75gT54FwI3i7SEwBxfRc+CRsQD8nHpIRnWMNTXBFhP9DIjE8pYstf/Jzk+WTaLHgEJqHpeaGAWzftNKb2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAhJDUYW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAhJDUYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19522C4CED1;
	Mon,  9 Dec 2024 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733733203;
	bh=HsbV/5kfDFx4fY98SchLy/o10XKUQIV6I7sMet5InAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LAhJDUYW0t6T9B+T3+XTBhinrTZPF6KncCHbq/Uymb/yHGlp8UMiCj+OBjCDKH/X3
	 KVNjsvyzlbLJ7U1ptDlFHhz/rSOr+DcBVl5KtFvYHqf8C34eesEdw/MVWqqtJzBOnt
	 kM1uJ3f2vGLcyclEMRNXvx9FDNwqR3mL27QHc22kDebE8NU/G7IG+TVEPPGqqmzd6J
	 WIAxTyzRJOLCOOc5rR8Ro87eiCAYkQZeFCAitDRnz48kkI/zNlS7gkBCkhowzEoOp8
	 nOcGfLMcmGGWK6HN2IBT1KM0e/rvCkzMjz+jzlvpZm66HW5tUAoxTVV4WHncitHrUB
	 87cXkWVGX591A==
Message-ID: <58d62506-de89-40e4-a3c2-bd27da515a45@kernel.org>
Date: Mon, 9 Dec 2024 09:33:16 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add bindings for
 samsung,exynos
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
 <20241205174137.190545-2-tudor.ambarus@linaro.org>
 <2lkowhldq5i4otniijfw7cb3jm6ttatwji3npw5w7c5fyevnn5@ynojupmdyqy4>
 <9886429b-1bf3-4dc3-b0d4-294a98e44ff2@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9886429b-1bf3-4dc3-b0d4-294a98e44ff2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/12/2024 09:11, Tudor Ambarus wrote:
> Thanks for the review, Krzysztof!
> 
> On 12/9/24 7:52 AM, Krzysztof Kozlowski wrote:
>> On Thu, Dec 05, 2024 at 05:41:35PM +0000, Tudor Ambarus wrote:
>>> Add bindings for the Samsung Exynos Mailbox Controller.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> ---
>>>  .../bindings/mailbox/samsung,exynos.yaml      | 70 +++++++++++++++++++
>>
>> Filename based on compatible, so:
>> google,gs101-acpm-mbox
>>
>> but then entire binding seems for different device, so you most likely
>> miss here actual Exynos devices.
>>
> 
> I need some guidance here, please. The mailbox controller can pass the
> mailbox messages either via its own data registers, or via SRAM (like it
> is used by the ACPM protocol).
> 
> I'm thinking of using the same driver for both cases, and differentiate
> between the two by compatible and `of_device_id.data`. Thus I propose to
> have a "google,gs101-acpm-mbox" compatible for the ACPM SRAM case and in
> the future we may add a "google,gs101-mbox" compatible for the messages
> passed via the controller's data register case.

Good that you pointed it out, I was indeed wondering why this is
"acpm-mbox", not "mbox in compatible.

This needs to be fixed - you cannot have two compatibles for the same
device.

> 
> Given this, I shall use the more generic name for the bindings, thus
> maybe "google,gs101-mbox.yaml"? But then exynos850 has the same
> controller, shouldn't we just use "samsung,exynos.yaml"?

If exynos850 has the same controller, then add it to the binding. Anyway
then use samsung,exynos850-mbox, because samsung,exynos is way too generic.



Best regards,
Krzysztof
