Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B503C42048;
	Wed, 18 Dec 2024 07:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508420; cv=none; b=suvVF2flM5oDDAVmZbS0eN510h+tobyrlAMXj+3VhgWKSuTA6CMNQ9vqv6g1YBubsVQneSH20PpSb21DIjwAZNFr4RoNJfijar+IqEqB5P2Ons1PGPtvpOgOF+2+r26uho+1RmgyNylpQP8S+GtVWuFhb/Dno3L1aWxPLXiQulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508420; c=relaxed/simple;
	bh=S1MG6GjxrCyAhgpy4OiU6srUJQ7vRr6Wl8DoBKh2efM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGioeVYJkIxBcn1hky41B+14Lm39xZHs30IAAcT6E/pwdDuEn8YaMdIZq8ZvGTjUC/haOV4DB6Y2UhYcIFH2NHezkXIPLT9/L/Z0I2CnxP4wYa7IVTYDt/uosDWjKD1qKazxBQ/Q0vELpTPGqAmaqOOBGG/pD1d3pd3N67N00D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvqrjNbu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvqrjNbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7199CC4CECE;
	Wed, 18 Dec 2024 07:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734508420;
	bh=S1MG6GjxrCyAhgpy4OiU6srUJQ7vRr6Wl8DoBKh2efM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SvqrjNbuTdIvKOBoT5lPmCbuyrUQ7fFh07VUdQRkhW2hFdT6yh9ih+ps76peLKLL6
	 tDQWzGOwsD35kh8JQzbYVMJV0StJQwY07jIsYhmHvoZxKD6yMMssZ2AcWPru1QsvXi
	 dhmCyRmoIWdjgBwErLHHsq6iuv3X8GsC54lGUPbEXUTCudCMgO3Blu0mvPKbx08RcF
	 lOCgAslu0e6Niey59zjXw64bWxFQdISlbehN6dbEvssNk9mWVyATBgQX2G8EeKolPi
	 PjZ7OS/utYq9pSBwo+nbf+vvWZ8at1rmInAgUMPcFNIzj46Yi/8kjCGUWocsldQHcy
	 V75s3f+HwGJbQ==
Message-ID: <748f90f0-be7e-43e0-88e7-477cd082793e@kernel.org>
Date: Wed, 18 Dec 2024 08:53:35 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
To: =?UTF-8?B?64KY7IaM7JuQL1NPV09OIE5B?= <sowon.na@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 kishon@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
References: <20241118021009.2858849-1-sowon.na@samsung.com>
 <CGME20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6@epcas2p2.samsung.com>
 <20241118021009.2858849-2-sowon.na@samsung.com>
 <000001db3a42$c5a79b70$50f6d250$@samsung.com>
 <001401db50ec$a31703a0$e9450ae0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <001401db50ec$a31703a0$e9450ae0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2024 02:32, 나소원/SOWON NA wrote:
>>> I am not sure how we can help you, you are keep missing to collect all
>>> the tags
>>> https://lkml.org/lkml/2024/11/7/617
>>>
>> Really sorry for missing tags. I append it immediately, and will not miss
>> anymore.
>> Your review helps me a lot and makes my patch better. I applied all your
>> reviews to my patches.
>>
>> Thank you a lot once again for your help.
>>
> 
> I missed including the "Reviewed-by" tag in the patch set I sent. Could you please let me know if you'd prefer me to send a v4 with the tag included, or if you're able to apply it with the missing tag?
> 
> Thank you for your understanding, and I apologize for the oversight.

Why are you asking me? This is not a patch for me.

Best regards,
Krzysztof
