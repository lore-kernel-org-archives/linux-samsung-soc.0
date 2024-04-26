Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A9B13A261
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 05:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714109080; cv=none; b=PuKUjNmBzjYOhneaSRbrWoqWd8LKYigeygmtMCR/Zdw1RZN79lUsRj1yimq7/6xI107ha7Q6GZT3TxCmdLkTZHOosbVIv9dTEOVSzk2nTDe7qq4KLpB88jsp2vVlJJ7j+ePBxXoEerj17WUiBE+qK2sJtRNxKxAbz3OL3P2zxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714109080; c=relaxed/simple;
	bh=6A17X04Jb+QaIAMoSdhSdFqaDCqxAC+7M2emgOEx7Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=arTGJxebvQ5jWSGutq3I9R4+EwTHtQQWCuRqv5r07WGIjGyy+XExTZO01qYI9gPNdTpCnTRdTZZfA6uT4auz3MoPnmf/Jpg+fmAB5OSZQzm8lq/4WGDPre6Kt7QoddnvlykaJQYMA+pSoPaX+2mVcfSeRB5JWRjUV9KzNxGvd20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uWalPMO5; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uWalPMO5"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240426052435euoutp014b8baf9dba971fad0948b3eb69e6b214~JvR9eIhaQ2977829778euoutp01B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 05:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240426052435euoutp014b8baf9dba971fad0948b3eb69e6b214~JvR9eIhaQ2977829778euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714109075;
	bh=QrL37T0pPHe1/07gRvyuxFVAN+0IcPGsyDxhu/3XniY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uWalPMO5kecJxPmN51JklqVuBXKTYIoIxvjh/ZfsEXaL1WJxWkhYD6De35UDTvzUo
	 0d5a65RMLnmvk/rDFh5160QoIyZ1uuk4GZ5//sglGhQeJu8JMsEohVmYT4hhM3IxuC
	 T0BEEESppAoW3I9tMFRKxC0PqgnMhIjK+CngoePo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240426052435eucas1p1c08a3a9adfda82560d3bf08a52b90168~JvR9BmdUX2903329033eucas1p1g;
	Fri, 26 Apr 2024 05:24:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 05.BE.09620.39A3B266; Fri, 26
	Apr 2024 06:24:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240426052434eucas1p26773540bb503f3347de52c6e3f42dd4f~JvR8mhzpl1508115081eucas1p2j;
	Fri, 26 Apr 2024 05:24:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240426052434eusmtrp2262d95b4dd98a8d1a0f01e27e1d55fc2~JvR8l4qmK3053130531eusmtrp2u;
	Fri, 26 Apr 2024 05:24:34 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-af-662b3a93cfdd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 22.D7.08810.29A3B266; Fri, 26
	Apr 2024 06:24:34 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240426052433eusmtip2e26f41711b89e5aac9682106ab9f698c~JvR7rQQEU2453224532eusmtip2-;
	Fri, 26 Apr 2024 05:24:33 +0000 (GMT)
Message-ID: <d62aeaa2-8d3e-409e-acea-23b9e6ff0b76@samsung.com>
Date: Fri, 26 Apr 2024 07:24:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
To: William McVicker <willmcvicker@google.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
	Herring <robh@kernel.org>, David Lechner <david@lechnology.com>, Bjorn
	Andersson <andersson@kernel.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Zir0Rhm7jZoF8r04@google.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJKsWRmVeSWpSXmKPExsWy7djP87qTrbTTDO7PZbF4MG8bm8W2DhuL
	61+es1osahCzmHj+J5vF+fMb2C02Pb7GavGx5x6rxYzz+5gsLp5ytfi/Zwe7xeE37awW/65t
	ZLFY9ek/owOfx/sbreweCzaVemxa1cnm8an/JKvHnWt72Dw2L6n36NuyitHj8ya5AI4oLpuU
	1JzMstQifbsEroyuzd+ZC7bxVvxcNYe1gXEedxcjB4eEgInEvrNOXYxcHEICKxgluvd+YIVw
	vjBKtPbfZ4RwPjNKnFyxjK2LkROs4/bhZ0wQieWMEi/uHYdq+cgo8W7rXkaQKl4BO4l//0+z
	gtgsAqoS/b1r2SDighInZz5hAbFFBeQl7t+awQ5yh7BAhsSxVwUgpoiAnsSf1gqQkcwCDSwS
	96fNZQIpZxYQl7j1ZD6YzSZgKNH1tgtsJKeAlsT3+dNZIWrkJba/ncMMcehyTok3f7QhbBeJ
	ew3fWSBsYYlXx7ewQ9gyEv93zgd7RkKgnVFiwe/7UM4ERomG57cYIaqsJe6c+8UGch2zgKbE
	+l36EGFHidfb/zJCwpFP4sZbQYgb+CQmbZvODBHmlehoE4KoVpOYdXwd3NqDFy4xT2BUmoUU
	KLOQfDkLyTezEPYuYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZjaTv87/nUH44pX
	H/UOMTJxMB5ilOBgVhLhvflRI02INyWxsiq1KD++qDQntfgQozQHi5I4r2qKfKqQQHpiSWp2
	ampBahFMlomDU6qBKW5bTe7VScZTLp16OF1UoHeN7/7ACdLL9D//fPFgaemExNTH6ds2BD2M
	OtMwbeeCWdPYrjexHD10gPXXPPPjhne6tjYyOgp3/TqaHOp+8con0zU5e9mzdmQ+sV9b9Lvp
	i9hhOaVNp+deO/BPPIVvuXDTzMlpnU93zNTqcA7ZHm7w7fH/kGj90tXN7yf6c98XWxui7X14
	XvHrw39tUtIfvWJIltWZoprANaHg53XfDln+t1sWe0QLa8RP/WYdNtulbY5l+DyTs6JfJm7a
	YyomcPOwwDebykfevFL323+2PVOw+37O/Peyo00Me5YEx/03049+8N3f717KKn7bqMfnNs1/
	2vd/ooNYW0zH0YVbnMKVWIozEg21mIuKEwHX+Qhw3AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xe7qTrLTTDNouKVk8mLeNzWJbh43F
	9S/PWS0WNYhZTDz/k83i/PkN7BabHl9jtfjYc4/VYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2
	slis+vSf0YHP4/2NVnaPBZtKPTat6mTz+NR/ktXjzrU9bB6bl9R79G1ZxejxeZNcAEeUnk1R
	fmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkbX5u/MBdt4
	K36umsPawDiPu4uRk0NCwETi9uFnTF2MXBxCAksZJbaf/c8MkZCRODmtgRXCFpb4c62LDcQW
	EnjPKPHxpiWIzStgJ/Hv/2mwGhYBVYn+3rVsEHFBiZMzn7CA2KIC8hL3b81g72Lk4BAWyJA4
	9qoAxBQR0JP401oBspZZoIFF4ubRNYwQN2xilJjS9p8RpJdZQFzi1pP5TCA2m4ChRNdbiBs4
	BbQkvs+fzgpRYybRtbULql5eYvvbOcwTGIVmITljFpJRs5C0zELSsoCRZRWjSGppcW56brGh
	XnFibnFpXrpecn7uJkZgNG879nPzDsZ5rz7qHWJk4mA8xCjBwawkwnvzo0aaEG9KYmVValF+
	fFFpTmrxIUZTYFhMZJYSTc4HppO8knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILU
	Ipg+Jg5OqQYmNf4bZ9+YXtZVOZd6q4C56dWbg/qGlXrTXY5zXY5lU3H7/y5yVefnW9cSOS3e
	3nl1+M8R2zlfl+g5NbY86pZ9l+sxzTjlzb/kIMHPmTfXtv4JE4v+3he+QNPjhSdLqNJZtoiG
	zLeemzqOTT7D8GlP29W/M3yyXpofb/lVXS0xjV+Gn2d72qojKw9VTPlWPl3T7JnK9Z1X71b+
	LMuTVXlXvsz0mdpy6dV7HU7G6i23WM8jEzv9hnXinFn8UZ++HmvQWJbRaqBwvfD6y2NVHqXM
	K/c/Kvuy1buxbE5K4crUw9wssdHf/33Zcv5G5YutQhP2RgYzr3jRcIzD3zCie93qcpdtZ1ff
	2Lpi5qGyi747rimxFGckGmoxFxUnAgBWgcsYbwMAAA==
X-CMS-MailID: 20240426052434eucas1p26773540bb503f3347de52c6e3f42dd4f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7
References: <CGME20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7@eucas1p1.samsung.com>
	<20240425091429.948467-1-m.szyprowski@samsung.com>
	<Zir0Rhm7jZoF8r04@google.com>

On 26.04.2024 02:24, William McVicker wrote:
> On 04/25/2024, Marek Szyprowski wrote:
>> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
>> module driver") this driver is instantiated as MFD-cell (matched by
>> platform device name) not as a real platform device created by OF code.
>> Remove then of_match_table and related MODULE_DEVICE_TABLE to avoid
>> further confusion.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos-clkout.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
>> index 503c6f5b20d5..0c7f4e2aa366 100644
>> --- a/drivers/clk/samsung/clk-exynos-clkout.c
>> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
>> @@ -75,7 +75,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
>>   		.data = &exynos_clkout_exynos5,
>>   	}, { }
>>   };
>> -MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
> I understand these are duplicates of the exynos-pmu driver, but was wondering
> if this will impact the exynos-clkout module from getting auto-loaded? Without
> the MODULE_DEVICE_TABLE() defined, the aliases won't be created that trigger
> udev to load this module and the mfd driver is obviously not going to load it.

This driver loaded and matched only against the platform device name 
("exynos-clkout") since the mentioned commit 9484f2cb8332. These OF IDs 
defined as MODULE_DEVICE_TABLE and of_match_table are leftovers from the 
old (pre-9484f2cb8332) instantiating method.and should be removed by 
that commit too.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

