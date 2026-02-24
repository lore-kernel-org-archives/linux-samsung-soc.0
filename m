Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7BB396D20;
	Tue, 24 Feb 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935926; cv=none; b=iJEjguLKCZQh4i4nzyHJPa+jX72h+KfOA5CHW2RMQ3fNBjcO5ngQNeL2bYcVJZw2z6eNj8cEwMtKBbrmriHnaOp2m4FV7IjTaEYsF4bijQqRXj8VOeO6unS9j+g0IjF7MB+8b4u0mZ6Y+kB3jFvDN7VuT/3zaMjBxGQVSPJQQko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935926; c=relaxed/simple;
	bh=6FEmsuJDNbubhFKyhDkKazqjywElu0eHjCvH8Uajybo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UY3CQk4EObfHYLxKsABzphlmmChpIQEdj54jwdieNOn+Ow8y1G3o5VUP3cngwKgCKJSUbuXg/MA4Aftc6DdfWUa5mlsfVkBWhYQmzSCA5QMPIJlUloTI2ye55hlT87ROlNuJHY3hUfmy8L3jtyJt7Vu1Z6XVB0odhN0YFghS9yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnQAG7vS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnQAG7vS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD19C116D0;
	Tue, 24 Feb 2026 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771935926;
	bh=6FEmsuJDNbubhFKyhDkKazqjywElu0eHjCvH8Uajybo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=XnQAG7vSyikzvULxCDqYcbXZzIwMn1DWv+YhbUdvyLhLqCADiL02SMRlrRUGvhTk9
	 1BGGw9p9/iuADzERzVhXSrUIYW8pmo0jsEWrCXIGOZfUgG0c8uAMQ3XkRP9kNE4hIM
	 hRpTxY6P7bvP9UHsqCrxnIcEWz8Go1veznm71ugQc0mZQvX1EACKiiM2LfrDZ+pb4m
	 gSA4/JhkehjTw1gGDFEMRbbWkjGPFd3IikCAZzuRxqOrjhvrWgweuEUmai7SFvJS8a
	 4+cn6O9tb9r9p4Wq+os/p0/eOFQt8NHE4zRgGhfxjVAxTxP/HEBrwYABQLpXdtYv9N
	 ywcc4JaUHugRw==
Message-ID: <aa5234d7-af2c-4bab-b917-2a64d21de3b2@kernel.org>
Date: Tue, 24 Feb 2026 13:25:19 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add basic device tree support for the Axis
 ARTPEC-9 SoC
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com,
 Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
 jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
 hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
 swathi.ks@samsung.com, kenkim@coasia.com, kitak81.kim@samsung.com
References: <CGME20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714@epcas5p4.samsung.com>
 <20251119131302.79088-1-ravi.patel@samsung.com>
 <177193343795.72471.8737899847600826075.b4-ty@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <177193343795.72471.8737899847600826075.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/02/2026 12:43, Krzysztof Kozlowski wrote:
> 
> On Wed, 19 Nov 2025 18:42:59 +0530, Ravi Patel wrote:
>> Add basic device tree support for the Axis ARTPEC-9 SoC
>> which contains 6-core Cortex-A55 CPU and other several IPs.
>> This SoC is an Axis-designed chipset used in surveillance camera products.
>>
>> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
>> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
>       https://git.kernel.org/krzk/linux/c/7b43a16c48fe761480ddb0312e6727d0f5fb0b4a
> [2/3] arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support
>       https://git.kernel.org/krzk/linux/c/3ae2b7442cb878c8b38fc39855f89e47ba43c405
> [3/3] arm64: dts: axis: Add ARTPEC-9 Alfred board support
>       https://git.kernel.org/krzk/linux/c/b567d42112a2b38c186b37f7ffb2e36fc567e442

And now I see warnings from build, which means you did not bother to
read maintainer soc profile for Samsung and test your patches.

artpec9.dtsi:121.11-268.4: Warning (unit_address_vs_reg): /soc: node has
a reg or ranges property, but no unit name

Sorry, that's not acceptable. I will fix it but I am not going to pick
up more patches from you, because this is not incidental. This pattern
of lack of testing repeats.

Best regards,
Krzysztof
