Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C8515C140;
	Mon, 30 Sep 2024 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727692429; cv=none; b=KH3MORhu6K3d6zv+F0ZD6ESzyqIXohwFwecJ37bAMyj8ZUZNNDqZ0Jc2KO0F8QVcFTImmvWHs43+oakUQ7In6THhUCa8AHktApqEB4PpTclp//EoL2XVRaG8tSr68SnzC6YHbJxKFrIOCKGJ+d8HOVn8ROyWYv8Ewc6OZu71Jcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727692429; c=relaxed/simple;
	bh=9B1h0p8HTLf6TJhVHkcuROa+wMWJ4RQ+m7E5VR/ZVlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lGXfKqaUDN3lzRJhlq9D79F4OlYqirlTnlfaKa/qlLBmjZI20QYfKIOyDvyT/qCzaWlr7C1XFbcHHEfN/wZL/nRqXuDlEiPwERAriLtJti54eyARCUr+42PjYBQGIMcuUNJX3t2qDQb1+Xhvf93rTHVnbWxWKZn9xuFIUBkwnNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Re5Z2AzM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Re5Z2AzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4685C4CEC7;
	Mon, 30 Sep 2024 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727692429;
	bh=9B1h0p8HTLf6TJhVHkcuROa+wMWJ4RQ+m7E5VR/ZVlM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Re5Z2AzMQtrd7ABdPZXY9ilKHEwNcEqiw8kbBKlJ0gU8TGNNr9KBoaxuIsheu2+Ds
	 SRS8wI9l/R7ygkdeEw1eoL51tZTk09V0eAswGErWnl6LcQNlYUZdX3LGB4Z4T0nmEo
	 swMtcmYYFvjN0uKnGcBDX+KnNXRIl5SCXQ9gsuC/HwsAnNRiEtHOD5+zk1zyyrMAdR
	 gGLIbpT2AM3lmLo7KjkmKz7S/jQLrNSiFcQk0COq+kK6CWfeNPBaEF5YDOKluCmI/g
	 NSiS40MT+fSgMIcQ5Wn44eTkZ7FxU0+7y3k95MBEhfHL6w/Ccx3OGTd9TFvXyrp0Eh
	 fLqF0naaQk7lg==
Message-ID: <3fd98d2a-2891-4579-bbdb-52c48c7b50ab@kernel.org>
Date: Mon, 30 Sep 2024 12:33:42 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: Fix out-of-bound access of of_match_node()
To: Jinjie Ruan <ruanjinjie@huawei.com>, s.nawrocki@samsung.com,
 cw00.choi@samsung.com, alim.akhtar@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, sunyeal.hong@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240927102104.3268790-1-ruanjinjie@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240927102104.3268790-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2024 12:21, Jinjie Ruan wrote:
> Currently, there is no terminator entry for exynosautov920_cmu_of_match,
> hence facing below KASAN warning,
> 
> 	==================================================================
> 	BUG: KASAN: global-out-of-bounds in of_match_node+0x120/0x13c
> 	Read of size 1 at addr ffffffe31cc9e628 by task swapper/0/1
> 
> 	CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0+ #334
> 	Hardware name: linux,dummy-virt (DT)
> 	Call trace:
> 	 dump_backtrace+0x94/0xec
> 	 show_stack+0x18/0x24
> 	 dump_stack_lvl+0x90/0xd0
> 	 print_report+0x1f4/0x5b4
> 	 kasan_report+0xc8/0x110
> 	 __asan_report_load1_noabort+0x20/0x2c
> 	 of_match_node+0x120/0x13c
> 	 of_match_device+0x70/0xb4
> 	 platform_match+0xa0/0x25c
> 	 __device_attach_driver+0x7c/0x2d4
> 	 bus_for_each_drv+0x100/0x188
> 	 __device_attach+0x174/0x364
> 	 device_initial_probe+0x14/0x20
> 	 bus_probe_device+0x128/0x158
> 	 device_add+0xb3c/0x10fc
> 	 of_device_add+0xdc/0x150
> 	 of_platform_device_create_pdata+0x120/0x20c
> 	 of_platform_bus_create+0x2bc/0x620
> 	 of_platform_populate+0x58/0x108
> 	 of_platform_default_populate_init+0x100/0x120
> 	 do_one_initcall+0x110/0x788
> 	 kernel_init_freeable+0x44c/0x61c
> 	 kernel_init+0x24/0x1e4
> 	 ret_from_fork+0x10/0x20
> 
> 	The buggy address belongs to the variable:
> 	 exynosautov920_cmu_of_match+0xc8/0x2c80
> 
> 	The buggy address belongs to the virtual mapping at
> 	 [ffffffe31c7d0000, ffffffe31d700000) created by:
> 	 paging_init+0x424/0x60c
> 
> 	The buggy address belongs to the physical page:
> 	page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4349e
> 	flags: 0x3fffe0000002000(reserved|node=0|zone=0|lastcpupid=0x1ffff)
> 	raw: 03fffe0000002000 fffffffec00d2788 fffffffec00d2788 0000000000000000
> 	raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> 	page dumped because: kasan: bad access detected
> 
> 	Memory state around the buggy address:
> 	 ffffffe31cc9e500: f9 f9 f9 f9 00 00 03 f9 f9 f9 f9 f9 00 00 00 00
> 	 ffffffe31cc9e580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 	>ffffffe31cc9e600: 00 00 00 00 00 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9
> 	                                  ^
> 	 ffffffe31cc9e680: f9 f9 f9 f9 00 00 06 f9 f9 f9 f9 f9 00 00 06 f9
> 	 ffffffe31cc9e700: f9 f9 f9 f9 00 00 06 f9 f9 f9 f9 f9 00 00 06 f9
> 	==================================================================

In the future, please the trim logs from entirely unrelated parts, like
addresses.

No need to resend for this.


Best regards,
Krzysztof

