Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1640126AEC;
	Mon, 30 Sep 2024 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727692196; cv=none; b=Oho8QnplqhDc2h6ewkCpZTgt3QfZTNzeuX0bJ/XzVDtk/eHmmpgHmrTYNBkD4bjIE6vf9rbga6JJ3RtQjaHY9Si5ZCSor4Y0CklrqW8ywCHD5YXRrulAEHm90jK8E0C7SqhFdftvxkCQEzny6gDgMd1VI2mj26g0u3ciGun6qHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727692196; c=relaxed/simple;
	bh=bVUnemnRJlAkNfmj4POjrlh67Wjw48pMhrhhoQHlkyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbI4tmzs643KZBKYXzMy81UlCQ/8sPUqzASprfy501ZWaUgrxLypyRxEU9QMKYC2r3i9DZvyd/tfxzYlmEDv4ZIAFlu5TpsWupualPmT4heTpjVygIGzD2M4YVyKUUG1w5nllwvHiswsXzBjYQag9Vq+Cx6q515K2y1N1MALNY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2CEDA7;
	Mon, 30 Sep 2024 03:30:22 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F412E3F587;
	Mon, 30 Sep 2024 03:29:50 -0700 (PDT)
Date: Mon, 30 Sep 2024 11:29:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	sunyeal.hong@samsung.com, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: samsung: Fix out-of-bound access of of_match_node()
Message-ID: <Zvp9mWLKveSz5Xdo@J2N7QTR9R3>
References: <20240927102104.3268790-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927102104.3268790-1-ruanjinjie@huawei.com>

On Fri, Sep 27, 2024 at 06:21:04PM +0800, Jinjie Ruan wrote:
> Currently, there is no terminator entry for exynosautov920_cmu_of_match,
> hence facing below KASAN warning,
> 
> 	==================================================================
> 	BUG: KASAN: global-out-of-bounds in of_match_node+0x120/0x13c
> 	Read of size 1 at addr ffffffe31cc9e628 by task swapper/0/1

> 	The buggy address belongs to the variable:
> 	 exynosautov920_cmu_of_match+0xc8/0x2c80

> Add a dummy terminator entry at the end to assist
> of_match_node() in traversing up to the terminator entry
> without accessing an out-of-boundary index.
> 
> Fixes: 485e13fe2fb6 ("clk: samsung: add top clock support for ExynosAuto v920 SoC")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

FWIW, I'm hitting this while testing on v6.12-rc1, and my local fix was
essentially the same (adding a '{ /* sentintel */ }' entry), so FWIW,
with one minor nit below:

Acked-by: Mark Rutland <mark.rutland@arm.com>

> ---
>  drivers/clk/samsung/clk-exynosautov920.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
> index 7ba9748c0526..a3634003b29b 100644
> --- a/drivers/clk/samsung/clk-exynosautov920.c
> +++ b/drivers/clk/samsung/clk-exynosautov920.c
> @@ -1155,6 +1155,7 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
>  		.compatible = "samsung,exynosautov920-cmu-peric0",
>  		.data = &peric0_cmu_info,
>  	},
> +	{ },

Nit: the sentinal entry is meant to be the last entry, so it shouldn't
have a trailing comma.

Regardless of that, it'd be nice to have this fix in -rc2, since anyone
trying to test with KASAN is going to hit this at boot time.

Mark.

>  };
>  
>  static struct platform_driver exynosautov920_cmu_driver __refdata = {
> -- 
> 2.34.1
> 
