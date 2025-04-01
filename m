Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED918C936;
	Tue,  1 Apr 2025 02:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743474603; cv=none; b=szSTEX6lDuHtqO5BBhGti2WPJuCM906JbW8YwMtwzzxBcL9IgnXmgbf5TR12BfRuTgngWNcGD7ox1gEALcxq7WKLoHDb2hdEfsCZfI0+oc+ErjOmYiqx5mGb9URfa7zz37o35sV5OpOVmpJxQgAp9GoQH2PzGA4zf6YAYDRx+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743474603; c=relaxed/simple;
	bh=e7umfimSSpUyu6Gb9PAWxVviQ1Pyx2Rlh5oL4MRf/MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCq6eUJ3F2T5wqwQ7hj8HlnBauNRFT8mnpLWdWYfaYFH7+AoYv2qho/mvnO+cq/RP+5u9zIg1LQBZAl8E7BSkvqomN3OpUR1mHx+ttPxeCocxuwb8KRW1exVY38b/Su6MEP/P5KcsysxTGxXSX1qDAaWf+Y6yy/vEsW8ExEmWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMg+dAsC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMg+dAsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0571C4CEE3;
	Tue,  1 Apr 2025 02:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743474603;
	bh=e7umfimSSpUyu6Gb9PAWxVviQ1Pyx2Rlh5oL4MRf/MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMg+dAsCMyIG3q3zTMQGZIr/r9WudOZIbydWtIAvOeYe0VQ2UiJZgKRYjEN2vyasu
	 XFB40wN4HzTTLmykZwxdPRCgJRNkUcVB3f46fscBYHJgHmc/btgzZ01zdh2jyaWMOv
	 RWe7vbEXNw9Cq6GocTz7m5DNqWC3LlCiPDhnp9y+sVZ8NushvPWjdxnJlaa87d9ig4
	 SnK/IVbSUlX8Sgq3D96XI9yFrhgTrFgI4Mm8pvDZDPgBwiBN9GgaqHt1uzEVjynojh
	 WEkAwHmSIZ3+rBgp5swmuKjgs0z3189hLjuB4IV2lXLdaNKQdo1aiG0MDsCMlOM2TE
	 3h/T8R9xFBmWg==
Date: Mon, 31 Mar 2025 21:30:01 -0500
From: Rob Herring <robh@kernel.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Donghoon Yu <hoony.yu@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <20250401023001.GA3186122-robh@kernel.org>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-6-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331230034.806124-6-willmcvicker@google.com>

On Mon, Mar 31, 2025 at 04:00:27PM -0700, Will McVicker wrote:
> From: Donghoon Yu <hoony.yu@samsung.com>
> 
> On Arm64 platforms the Exynos MCT driver can be built as a module. On
> boot (and even after boot) the arch_timer is used as the clocksource and
> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> source for the arch_timer.
> 
> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/Kconfig      |  3 +-
>  drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
>  2 files changed, 42 insertions(+), 8 deletions(-)

[...]

> +#ifdef MODULE
> +static int exynos4_mct_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	if (of_machine_is_compatible("samsung,exynos4412-mct"))

Your root node compatible has "samsung,exynos4412-mct"!?

In any case, add a data ptr to of_device_id table and then use the match 
data rather than comparing compatible strings again.

> +		return mct_init_ppi(np);
> +
> +	return mct_init_spi(np);
> +}
> +
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct" },
> +	{ .compatible = "samsung,exynos4412-mct" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
