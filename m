Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC27219A7E;
	Wed, 17 Sep 2025 02:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758076012; cv=none; b=H1cLIut3ZOxLSrQCK1XEMxEz1liTwjkbwvMdeCwnEWmwSqi466VjIa4mF10H90t04VMM0iOwQsxDqfsJBeR8OxfUdGgZBR1VcK+EeNT+kpPO6l6SgZhSQKhcpkWZPw1v/948ZdsKWa5ixEHsQOW4Gay25wSlEDbiDlVKD5TnvRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758076012; c=relaxed/simple;
	bh=WBYtinUfynMQdo7EUgi/v4l0p6ZLU2dBPFXS/wRAI48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UopdJKzFGMhFcy66T/FumDj5n4oz0mgcyha7XvbVNS0loX0nRvms7tvnQwvYac1TKWXeb9psooQieM4Z2A3AFFOqo6ldlIDnIgIIl4pSuq/5+un/KiZ3at7JlnYNnBOjy/VXdnIs0antp+98p5AVXbJbJL/wEQBK55xmdMhggf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnOX5kah; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnOX5kah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B270C4CEEB;
	Wed, 17 Sep 2025 02:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758076012;
	bh=WBYtinUfynMQdo7EUgi/v4l0p6ZLU2dBPFXS/wRAI48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rnOX5kahyi1aWzXOlgg3Uq8FvVfMMCJ/WHPx0MgONJYo+4ZPZys9nvWY1dwuQd8su
	 ZVvjrQNht2xOTi3qwZy8dQ56N9/F34dACuI86gdSMCsoYT5dZBPyG9+2RxqtQY2IPu
	 2eLJqayuAOvIKuuM+CPPWxtk+NPIdU6lfWsowlm+C1/nEF7x0I6TWFZhjXxGhNJD6z
	 N4MYKEoLctBPQpJ/pXMKHpORR/mPQPxF6y8t77lBXq9Mh+VG5qgjw6wYdNVdghpCAy
	 WxkFVsVhxkZ7i5se0mzAKqZSsa5X4N1KWKU9ZWkdr14nxfBsx55VBfI6w+dtYvSJM5
	 HAixpqkTaRQeQ==
Message-ID: <f037c73d-e341-434e-9bee-92ebcb2da5c8@kernel.org>
Date: Wed, 17 Sep 2025 11:26:48 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] clk: samsung: introduce exynos8890 clock driver
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
 <20250915074931.GD8224@nxa18884-linux.ap.freescale.net>
 <83128929-4daa-4dac-8162-e773af675438@kernel.org>
 <20250915113055.GA14420@nxa18884-linux.ap.freescale.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250915113055.GA14420@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/09/2025 13:30, Peng Fan wrote:
> On Mon, Sep 15, 2025 at 09:16:40AM +0200, Krzysztof Kozlowski wrote:
>> On 15/09/2025 09:49, Peng Fan wrote:
>>> [...]
>>>> +static void __init exynos8890_cmu_top_init(struct device_node *np)
>>>> +{
>>>> +	exynos8890_init_clocks(np, &top_cmu_info);
>>>> +	samsung_cmu_register_one(np, &top_cmu_info);
>>>> +}
>>>> +
>>>> +/* Register CMU_TOP early, as it's a dependency for other early domains */
>>>> +CLK_OF_DECLARE(exynos8890_cmu_top, "samsung,exynos8890-cmu-top",
>>>> +	       exynos8890_cmu_top_init);
>>>
>>> Not sure you need to run Android GKI, without module built, this platform
>>> will not able to support GKI.
>>
>> Why would anyone worry about GKI? We develop mainline kernel, not
>> Android kernel.
> 
> I understand this. But someone will have to update this to support module
> built whether mainline or downstream tree, unless GKI is not in the plan.

What Android, Windows or BSD people plan is outside of my scope. I am
happy if someone wants to make it fully modular and actually TESTS it,
so it works. It was not fully modular because of boot limitations long
time ago, which maybe are solved maybe not.

Best regards,
Krzysztof
