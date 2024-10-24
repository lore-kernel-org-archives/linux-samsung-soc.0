Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AE8167D80;
	Thu, 24 Oct 2024 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729762596; cv=none; b=nF0MnhEiua4YkBhHJz7aUjDsYvwevFzAOVEVjWdHOsTt//T9TKh4GNKWn9AU+6RZy4xJdoezYB8r54VJVPnreH8h3HjmL/dincbOCWbDm6e+0bC4NzCGkD3dItIkpTPjFFlsFrxfY5p+ppvMJ2KdTPzbabXh3EBYBZkQVEAAuXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729762596; c=relaxed/simple;
	bh=9V8v3G8V4u5gRq40JKuzggCBQnGtC85Om4+BPdzx5xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIgSIZXU/3mLlBhvL0sEW342aITDUoodf7HFnkKq59Jy0tbs3q0DcQIw7l55huBffd2rR8XzzLNjbQBBdhqovpFvWNdTrSs3ZwL9HnO8oaiafX+KQvT2Lg1rE6ySWwH+a4Cirx/9j+2ZJDXDrXMwNdkciqiH45fUOuWIladAwwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRZoc7iz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRZoc7iz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC4EC4CEC7;
	Thu, 24 Oct 2024 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729762595;
	bh=9V8v3G8V4u5gRq40JKuzggCBQnGtC85Om4+BPdzx5xc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eRZoc7izynF5PK0WXh4FFr7oPs9AtRjMGAqULRKtenpCIetYPFrYCKgNIJgYm3tq9
	 A41TEMXfNFHq5Pgg1iuP7lXy3eCKxvRStuP/N5ph9dmUJttrL4PoJIp+C+u7CEQ4Bf
	 y9gM/Zlt6HaUwBEj4M7pd6zuOfa8vnWU5wiMvmQkpZLIFZrq5B3xTdH1GQo5y4Ntny
	 QkjczVrQtTsvsFEgn39GwKLC7FAlhEgbTk4Oor10Y1d2Rhlo0In0UlELjOGoYu0v1e
	 ad7RmAJGg7Iu5IppcJFx5MjsuPZg65M2Ism5oP4swd+75XuGZEW41CbC9Hx+PQbhKJ
	 gIaPmIElACcaA==
Message-ID: <855101b0-0102-4c77-b110-bdec12b28f29@kernel.org>
Date: Thu, 24 Oct 2024 11:36:22 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>, jassisinghbrar@gmail.com
Cc: alim.akhtar@samsung.com, mst@redhat.com, javierm@redhat.com,
 tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
 <d41ee8f6-9a2c-4e33-844a-e71224692133@linaro.org>
 <1ece02e6-bf78-443a-8143-a54e94dd744c@kernel.org>
 <d91109a1-532a-4b95-ad4c-3b9cf8e3dbbb@linaro.org>
 <1e76bc70-21a6-4ac7-99ea-30a7ccf387bb@kernel.org>
 <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2024 11:53, Tudor Ambarus wrote:
> 
> 
> On 10/23/24 10:00 AM, Krzysztof Kozlowski wrote:
>>>>>> I also cannot find any piece of code setting several of above, e.g. tx_base
>>>>> I'm not writing any SRAM configuration fields, these fields are used to
>>>>> read/retrive the channel parameters from SRAM.
>>>> I meany tx_base is always 0. Where is this property set? Ever?
>>> It's not zero. My assumption is it is set in the acpm firmware, but I
>> Where is any assignment to this member?
> 
> In probe() you'll see that exynos_acpm->shmem is a pointer in SRAM to a
> struct exynos_acpm_shmem __iomem *shmem;
> 
> Then in:
> 
> static int exynos_acpm_chans_init()
> {
> 	struct exynos_acpm_shmem_chan __iomem *shmem_chans, *shmem_chan;
> 	struct exynos_acpm_shmem __iomem *shmem = exynos_acpm->shmem;
> 	...
> 
> 	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
> 						 &shmem->chans);
> 	...
> }
> 
> shmem->chans is not initialized (or tx_base). I'm using its address in
> SRAM (&shmem->chans) which I then read it with readl_relaxed().
> 
> I guess one can do the same using offsetof:
> shmem_chans = readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
> 					      chans));
> 

I see, the code and the naming is confusing. Two exynos_acpm_shmem_chan
variables and one exynos_acpm_shmem. shmem_chans is used as an array,
but nowhere pointed or indicated that it is array of some size.

All this could be clearer if exynos_acpm_shmem_chan was packed, because
then it is obvious it points to defined memory, but maybe packed is not
correct here? Probably splitting all this into logical chunks would be
useful. Like not mixing reading offsets with reading values, because I
really have to spend a lot of time to identify which one is which in
exynos_acpm_chans_init().

Best regards,
Krzysztof

