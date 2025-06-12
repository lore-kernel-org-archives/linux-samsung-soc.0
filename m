Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73A24EF88;
	Thu, 12 Jun 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739430; cv=none; b=f9IRyimXCQnwKmMKxPii3BTwVYrp/uW/c3UrEbvAWsAX+c9i0RBHKe9Rh7hYIUICjiaTS10uYIPoi+EPQXZRTmvXI43Q1hlMqeawBuv7Cg1WL2K8BLcHLvxfo1op3fyF7tG41fSaoKr4cxkNt3QvI0D1DxL0wEx7ZkrMQUaWVfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739430; c=relaxed/simple;
	bh=lrhWjcC1p3vpAdzkTP5scpnrJVT2HqrYXcMoc7cDr2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivQ0da2gsf4AhBsjevyyiMjC9PnZQmH+xVz1yCA66cBzhfKPbNqn/KmMK4azHMOqlbJBKOGEQI83a8Nh3izq3H/4EDUhyq1VhXsUGXrpFFPyng4Erf0MK8gpiVuzpxbRs7poA4fZQtiE1nc/EccW7yXijauAI3OhcEXZn/YLswg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzTvcfiL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzTvcfiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A74DC4CEEA;
	Thu, 12 Jun 2025 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739429;
	bh=lrhWjcC1p3vpAdzkTP5scpnrJVT2HqrYXcMoc7cDr2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HzTvcfiLdY7e9RyrcfxKBcFXqy5kFNwZcuFmJvfP73bDt/3Mmdsi6oJJ5yLV/Q4xi
	 VtYreZ0IVnD8yTQD81hKk5I1nfMdoXvPZD3Z2ETh+JMSw4Giv7XqCcKnAuoukyT/D9
	 Jjt3qW6ZSJ+ZhGsr0cpYoSxB+688QvM01DqF+P78V3UqeQGDYfHT7uUTIfp3Re44Ok
	 /Cx6sXGz1hHc9ryM9w4hf07lVps1CtbPfuNWAuX4FUNduU87jOOrXYvj3oQ2e3MEwu
	 VrBkgRoLIqGPynkRbK6PHAFrTStNHdrH4pDeWTukvnOwNkMPTWXPB7mZtz4jzhjiWD
	 lXNXQBVyN1XcQ==
Message-ID: <023f1c08-f9bb-483f-89e8-2ff5206d1f19@kernel.org>
Date: Thu, 12 Jun 2025 16:43:45 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, krzk@kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 15:44, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
> 
>    vmlinux: 152864 kB -> 154528 kB
>    Image: 39391 kB -> 39067 kB
> 
> No difference in resulting include/generated/autoconf.h, except making
> modules: SND_SOC_SAMSUNG, SND_SOC_SDCA_OPTIONAL, SND_SOC_APPLE_MCA,
> SND_TIMER, SND_COMPRESS_OFFLOAD, SND_PCM, SND_SOC_SOF_OF and
> SND_DMAENGINE_PCM.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> If patches are fine, I will take them via Samsung SoC.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Sven Peter <sven@kernel.org>
> Cc: Janne Grunau <j@jannau.net>
> Cc: asahi@lists.linux.dev
> Cc: linux-samsung-soc@vger.kernel.org
> ---

Acked-by: Sven Peter <sven@kernel.org>

