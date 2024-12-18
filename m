Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5112198A07;
	Wed, 18 Dec 2024 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517237; cv=none; b=YbKwhAgaym5fi7F/U5bfrATu015jjlcak2KnN+ZrWHaDVTfIfB4G2STMt8FBBc6Fr7MnIKs7L1AHHnrfsYxC6bBr3sV6m+UxN6VsEkhTqT/Y8PHUhAHEI7I4afqNT1Iwy2vEAWvmDbggAIH3YS/OhMjKWsHWQoJJT8BD8LcGWKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517237; c=relaxed/simple;
	bh=EjDZEwFG6yQIGgrFN0Tp7rulbbAbKfkU4zQLwsdW+1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnhoSAKe0rk4TDbxNNaf+6SrVFDFRNqXQckccxiTEOrXGwzWV+eYpvuW9pn9BPrVB3imD4haIAL4olG89mPN6YrMgf29zVmLjm9/ITbQ9O7u23F0UVemZ11NxT01Lugw40AHja8gJNJR9w0uWw3D0BTbOVolQj6j6lCmqj+1aAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJJNifdG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJJNifdG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A913FC4CECE;
	Wed, 18 Dec 2024 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734517236;
	bh=EjDZEwFG6yQIGgrFN0Tp7rulbbAbKfkU4zQLwsdW+1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJJNifdG7kJbecF+2ew9FNhbNhYPLGftl7NhSeT9UUGOqglvZCA401rs7bfQsarDf
	 Cbg1OVYICs+NLR5KMpye2xvCe1VpOThVuoNORAz6/GfRuS9RsmelfrUIgAXpe/sTfx
	 z1eWoHeeFLXKSGC44T/NgE5W0ckyA73P8aJ8NsPdbBdGFQ0sRAqfnVEPXB+fdl5vWl
	 6i1XEeMx8uJq+6T6Pw+SSQa+U32ML/L9qtq6uGUjguf0gG1EmkBG8MIQkuB5bi8H/s
	 NyP0DJ//ZLgGp5T+DrGoElpdiHXH4EYAPQnuOEoCFgrJ9vkYKKC3kTSYXBcpzD4MSs
	 e9soO1mXHOjrw==
Date: Wed, 18 Dec 2024 11:20:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v5 2/3] mailbox: add Samsung Exynos driver
Message-ID: <ld6s5c3b6vfvn7l3yjxst6cyrq5xb3r4fmkqcjxawopjzoijjp@gt2ld2bm5562>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>

On Tue, Dec 17, 2024 at 09:40:21AM +0000, Tudor Ambarus wrote:
> The Samsung Exynos mailbox controller has 16 flag bits for hardware
> interrupt generation and a shared register for passing mailbox messages.
> When the controller is used by the ACPM protocol the shared register is
> ignored and the mailbox controller acts as a doorbell. The controller
> just raises the interrupt to APM after the ACPM protocol has written
> the message to SRAM.
> 
> Add support for the Samsung Exynos mailbox controller.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mailbox/Kconfig          |  11 +++
>  drivers/mailbox/Makefile         |   2 +
>  drivers/mailbox/exynos-mailbox.c | 184 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 197 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

