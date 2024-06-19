Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26B6A8D2;
	Wed, 19 Jun 2024 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718778589; cv=none; b=Dx9VLSGmXsdl1mqgrPmorq7MrDETbtqtwZwWtAb/SW0rVRPmAJWERPHp8S5K6jHOCziKm0mGE5oC6IcRvzgX1MxLnjSsAzsnMtsSvrvnD7LHgga5sN/JxqoHeF8DxqWj8B57PW4OFTfCv3vAS3XRSyxe0FzxkPMS5yB+PwBKwjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718778589; c=relaxed/simple;
	bh=qrqiVK2ovLgHbXt6I0KvbL8dDMz2xJDacD99Uke7Uns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpdNdz4f3ggpl+pn7e8LbBtrGkd0zCcv1S8awaU9nW+M2zLZoa0k6Co7+16fCYM+9Qn1+VeQKyHac40VnUo9zerRIpj6zB8AVuP1+2PfzRJXeYiQBTdVARqDKakxfjSrbro0BH8D8amG+0ZFIqxZlWi7iHELn1jJhrFxWR43F2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHkweQTO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHkweQTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BA4C2BBFC;
	Wed, 19 Jun 2024 06:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718778588;
	bh=qrqiVK2ovLgHbXt6I0KvbL8dDMz2xJDacD99Uke7Uns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QHkweQTOdM+YxrEh+N40f+mW6QOCe++11SQvXe1W/zyPJ7UfRiIhK6d6Ce6HYELBz
	 qVj5z8PtIOEsky5HlXbZG88p2vF4y0JULV3LJK/2uH43fmwLc5btA5uynh9NU5YhR4
	 xyrUDRPfFItFpStjAvNiJG6v7BZ+9v5detpc3ogmcXRLRob88e6TZ8o+Hjgq1KOHBp
	 c3hyjnKe9qZFwRlOj+g2qsU0zLSDjSpJRkqe30iu2PFar1O3OyGHJ7VHQfxm7N0URI
	 Xd/cWLkVyW6ZvO2zh09v7e82eyq13olvKxSVJb7o7Fy+FMwTNaJWbz9eXBHX1kbUj1
	 /hhdIo8OmNbSg==
Message-ID: <d904bcd0-62e3-47b0-acb2-0cf864fa33fb@kernel.org>
Date: Wed, 19 Jun 2024 08:29:42 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mfd: syscon: add of_syscon_register_regmap() API
To: Peter Griffin <peter.griffin@linaro.org>, lee@kernel.org, arnd@arndb.de,
 alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org,
 andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 semen.protsenko@linaro.org, kernel-team@android.com
References: <20240614140421.3172674-1-peter.griffin@linaro.org>
 <20240614140421.3172674-2-peter.griffin@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240614140421.3172674-2-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/06/2024 16:04, Peter Griffin wrote:
> The of_syscon_register_regmap() API allows an externally created regmap
> to be registered with syscon. This regmap can then be returned to client
> drivers using the syscon_regmap_lookup_by_phandle() APIs.
> 
> The API is used by platforms where mmio access to the syscon registers is
> not possible, and a underlying soc driver like exynos-pmu provides a SoC
> specific regmap that can issue a SMC or hypervisor call to write the
> register.
> 
> This approach keeps the SoC complexities out of syscon, but allows common
> drivers such as  syscon-poweroff, syscon-reboot and friends that are used
> by many SoCs already to be re-used.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/mfd/syscon.c       | 48 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/syscon.h |  8 +++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 7d0e91164cba..44991da3ea23 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -192,6 +192,54 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
>  	return syscon->regmap;
>  }
>  
> +/**
> + * of_syscon_register_regmap() - Register regmap for specified device node
> + * @np: Device tree node
> + * @regmap: Pointer to regmap object
> + *
> + * Register an externally created regmap object with syscon for the specified
> + * device tree node. This regmap can then be returned to client drivers using
> + * the syscon_regmap_lookup_by_phandle() API.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
> +{
> +	struct syscon  *entry, *syscon = NULL;
> +
> +	if (!np || !regmap)
> +		return -EINVAL;
> +
> +	/* check if syscon entry already exists */
> +	spin_lock(&syscon_list_slock);
> +
> +	list_for_each_entry(entry, &syscon_list, list)
> +		if (entry->np == np) {
> +			syscon = entry;
> +			break;
> +		}
> +
> +	spin_unlock(&syscon_list_slock);
> +
> +	if (syscon)
> +		return -EEXIST;
> +
> +	syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
> +	if (!syscon)
> +		return -ENOMEM;
> +
> +	syscon->regmap = regmap;
> +	syscon->np = np;
> +
> +	/* register the regmap in syscon list */
> +	spin_lock(&syscon_list_slock);

You still have window between the check for existing syscon and adding
to the list. This likely is not an issue now, but it might if we have
more devices using same syscon and we enable asynchronous probing.

> +	list_add_tail(&syscon->list, &syscon_list);
> +	spin_unlock(&syscon_list_slock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
> +


Best regards,
Krzysztof

