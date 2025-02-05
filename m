Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19DE25776;
	Wed,  5 Feb 2025 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774551; cv=none; b=faRFWfXhNw+5RB2LFslaFZaiQEx6WRbq7iXLFpy1QtFSyT6c3CQroR6pCb/KvUVmzILksFRpIXS2B3USt5C/M2Zwsju6l/z3JPbxCnc2PVNNrmo+OZUHaIfagJQ3lxJeNeNP+8Y2iuOeaxl2MKVVuYX2A39FKzRuxWOK93MbdtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774551; c=relaxed/simple;
	bh=QwbXiXnwON6yed6zKLetH/YmLwCc0nfO+VEqFa1NgZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScTyzD1rs1bM1fncHbqrk0nlRXZVOS7T3lAMcX2zuL+fARzE7Ncngb4r5qkuaZgJIeO5Fama3H/EvxTHLvwRkQvFdMasQYpaWw9mOMXxjI31NtjZOzmWlaMx09irgbua9k/QOpDizMIO4VJFCVOzBaVZbJ02BdaHBGP1B9wQSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVepVIgZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVepVIgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6E2C4CED1;
	Wed,  5 Feb 2025 16:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738774551;
	bh=QwbXiXnwON6yed6zKLetH/YmLwCc0nfO+VEqFa1NgZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iVepVIgZcX2j5PFC+0y/33hEnzKbcDsFC5sMdTu/LTN6SVHauXZDs5JoTTtHgC72j
	 XJmjJDpWuWqO+bIh93l9S/K2v2fQ80j8B3QMtpbbsJ762TyDkFoLlKzSi6Gi83lTTC
	 8ylqSmlhRtc41LENxMXGgBBVXNG5TRHLssvSVSXrKUZLlm/aDxGrWMNc+03jJVbTXg
	 o8XMudlCGI3wZ7tl7RVwdVhtFwzpeWPikCgdXKRituUaN6DDYQOXXhAQx91XKa+2CF
	 sXyDyORyEsY4olmp/dJN8dlzH2eG5zp6I1fQVsuWvSNkWwhOuwRtZwj6L7F8LBmRDM
	 xczXcSjn9zxsQ==
Message-ID: <3c76b1bc-bb3f-439c-9e60-6afec6a59198@kernel.org>
Date: Wed, 5 Feb 2025 17:55:46 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: exynos: update all samsung,mode
 constants
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
 <20250204172803.3425496-5-ivo.ivanov.ivanov1@gmail.com>
 <dc3dcfe1-2706-449b-8622-2783349e8b41@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <dc3dcfe1-2706-449b-8622-2783349e8b41@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2025 09:18, Ivaylo Ivanov wrote:
> On 2/4/25 19:28, Ivaylo Ivanov wrote:
>> Update all samsung,mode property values to account for renaming USI_V2
>> constants to USI_MODE in the bindings.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
>>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
>>  .../boot/dts/exynos/google/gs101-oriole.dts   |  4 +-
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
>>  5 files changed, 35 insertions(+), 35 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> index f1c8b4613..cb55015c8 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -651,7 +651,7 @@ usi_uart: usi@138200c0 {
>>  			compatible = "samsung,exynos850-usi";
> 
> ...
> 
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>> index 387fb779b..b73c152c7 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> 
> This patch won't apply anymore since gs101-oriole was moved to pixel-common.
> 
> I didn't see that [1] was applied yesterday. I could make a new patch that
> also covers these changes, but I'd expect the rest of this series to get applied first.
> 
> [1] https://lore.kernel.org/all/20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org/

I applied the rest I think, so please rebase this one.

I cleared my patch queue for Samsung, I think, so let me know if I
missed anything. There were some dependencies so it took me some time.
Pings outside of merge window are fine.


Best regards,
Krzysztof
