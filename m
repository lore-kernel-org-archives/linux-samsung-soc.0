Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C11013D53C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714123300; cv=none; b=OAOGoNQcxZopp2lDbetXosofvC7/7+VelmAj/RyoWEY0RinKR16OJkgJA45VH3NpHcwpFMn4QlY9Wo3xQC30m7giV4yT5kd9pwRX7Nv/SO9jb/MwubIbUFTvIsx75iUOvv2lEALAdH/5Q9s2USvkktrpkXUJjuXz43krb86zkGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714123300; c=relaxed/simple;
	bh=J46hu9WwxuHHqG3jg2udhzUNYemwQPRMqtfF0/62PyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=azZVfMhefNPWJOZYTY965d8EHko4LYgRr8Qzjyu6pV8g2Xni+EJBJhemgWUIZktGrfJr3kvS/d6P9+bHm1JX+87Lh9LxL/jJkclAf5HrbPq14gAHdtzronOH3LNZlQVTvtislANDg2qEhPFziLqGdc3jVOz1ClDR669DSi9dOks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OSmp/78F; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OSmp/78F"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240426092131euoutp0252deca582941d81b2b1865613575f4f1~Jyg071bPb0756707567euoutp02H
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 09:21:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240426092131euoutp0252deca582941d81b2b1865613575f4f1~Jyg071bPb0756707567euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714123291;
	bh=x+cvxNVH4eVdi6OhVC/jgqpXd3jzhVuCkryfhPDJH5I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=OSmp/78FFVNT0s5xaQl9k1v6TfoYxt1Tkdupgpg8Vof6K1kEVuRETMAMejcc16KNv
	 peOHENyPdNLoj2mante5jWJgg1A6BjJVujgbc2JHXfK7qtYxPGpFnNuh/NfFoLMsW0
	 yihveCTcT75KQ96O10hm9cdGkJ+tSiQeLrpwhIes=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240426092130eucas1p2c60365c869ae2a0323b224d9aa8c6677~Jyg0fei8f3047830478eucas1p2o;
	Fri, 26 Apr 2024 09:21:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id D9.28.09624.A127B266; Fri, 26
	Apr 2024 10:21:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240426092130eucas1p1cdb1063d963b5e9b262547c0689bf55f~Jyg0IJCWr1229112291eucas1p1N;
	Fri, 26 Apr 2024 09:21:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240426092130eusmtrp224ea90100e16f7a14c650e73f91faa74~Jyg0HCLrM0240702407eusmtrp2k;
	Fri, 26 Apr 2024 09:21:30 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-b6-662b721a799d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id C7.A9.09010.A127B266; Fri, 26
	Apr 2024 10:21:30 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240426092129eusmtip225058950a745bd8129af36a94ab9978a~JygzNU40Y0252802528eusmtip2a;
	Fri, 26 Apr 2024 09:21:29 +0000 (GMT)
Message-ID: <ad2cf931-0b51-4439-9963-bdb8a8b63b2b@samsung.com>
Date: Fri, 26 Apr 2024 11:21:29 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
To: Krzysztof Kozlowski <krzk@kernel.org>, William McVicker
	<willmcvicker@google.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, David
	Lechner <david@lechnology.com>, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <b271df59-fb7d-4637-8ac0-1e53be2f0ee4@kernel.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7djPc7pSRdppBo+uG1k8mLeNzWJbh43F
	9S/PWS0WNYhZTDz/k83i/PkN7BabHl9jtfjYc4/VYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2
	slis+vSf0YHP4/2NVnaPBZtKPTat6mTz+NR/ktXjzrU9bB6bl9R79G1ZxejxeZNcAEcUl01K
	ak5mWWqRvl0CV8arP3PYCjYIVmzoecbUwLidr4uRk0NCwETi9ZZ5bF2MXBxCAisYJXpv3mKB
	cL4wSmxZ+4sVwvnMKNH/9wA7TMvxO19ZQWwhgeWMEp+u+0EUfWSU+Py1iREkwStgJ/H45AYm
	EJtFQFVi3vVGFoi4oMTJmU/AbFEBeYn7t2YADeXgEBbIkDj2qgAkLCIQLrFrxmGwxcwC15kl
	Ps6ewAaSYBYQl7j1ZD7YTDYBQ4mut11gcU6gXb8aljND1MhLbH87hxmkWUJgMadE/9FZjBBX
	u0jMX78e6gNhiVfHt0DZMhL/d4IMBWloZ5RY8Ps+lDOBUaLh+S2obmuJO+d+sYGcyiygKbF+
	lz5E2FHi9fa/jCBhCQE+iRtvBSGO4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrjEPIFRaRZS
	sMxC8uYsJO/MQti7gJFlFaN4amlxbnpqsWFearlecWJucWleul5yfu4mRmB6O/3v+KcdjHNf
	fdQ7xMjEwXiIUYKDWUmE9+ZHjTQh3pTEyqrUovz4otKc1OJDjNIcLErivKop8qlCAumJJanZ
	qakFqUUwWSYOTqkGJgXt7/ILZl/kj31UJnr8mK2/Muvea9t2Pq3WVnulHM+UYKH3a7erYmJb
	YcehUgeHF9fruiKfrVt6ceqJvYdeOxS4p7/W2SevGh00nefRjHrJkKSYO7emv7Y/Led+6rPZ
	VDfZNYeDnnIvU485+vzNP7Yb1bWemp9mzWN4OkXuX/PJOI33E7dslZNply7vus7e8NE3VOVL
	VUyVtvf/zq1S+9kDJWYKrTnpNmFFtfXxqvsH3Uu4s//6Gl+6EeZVNa9soVWa4l0d+xzp3U4G
	9t5u/zIaQ6ZbtBwWPyh2hiO87MqpFPGZey+k32SM000NXR3RV3ZRqm4V04czWp4zfhdPPH1N
	WdP5hJhEUHVupUijEktxRqKhFnNRcSIAmQ7Met4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsVy+t/xe7pSRdppBgvvSFk8mLeNzWJbh43F
	9S/PWS0WNYhZTDz/k83i/PkN7BabHl9jtfjYc4/VYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2
	slis+vSf0YHP4/2NVnaPBZtKPTat6mTz+NR/ktXjzrU9bB6bl9R79G1ZxejxeZNcAEeUnk1R
	fmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsarP3PYCjYI
	VmzoecbUwLidr4uRk0NCwETi+J2vrF2MXBxCAksZJWYtnccGkZCRODmtgRXCFpb4c62LDaLo
	PaPEoa8P2EESvAJ2Eo9PbmACsVkEVCXmXW9kgYgLSpyc+QTMFhWQl7h/awZQPQeHsECGxLFX
	BSBhEYFwiVVH/zODzGQWuMkssfXIHUaIBbOZJM5eX8IMUsUsIC5x68l8sAVsAoYSXW+7wK7j
	BFr8q2E5VI2ZRNfWLkYIW15i+9s5zBMYhWYhuWMWklGzkLTMQtKygJFlFaNIamlxbnpusZFe
	cWJucWleul5yfu4mRmBEbzv2c8sOxpWvPuodYmTiYDzEKMHBrCTCe/OjRpoQb0piZVVqUX58
	UWlOavEhRlNgYExklhJNzgemlLySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQi
	mD4mDk6pBibdUIZUB435Zckvg1WbtLnKrqWE2Tcp/OG4tNZx14evMpJzBKOY2qsb1N7emrLd
	Wdr47N5Tj9/1zLZgMJpyNzl6yZXE1ClWFhOa3Z/86LAyrQ58oyy8fs9+wY7UCRozTkxlF5Wv
	nnNx62Wn1C95TG/jGqWOnpXWFGRhCuJ7+/XCrGP7DyRd6J1Wv7kyv2SP1vabp2I3iv++ZdN+
	0WVL4kTH6KzVzQX/fDM23mA0ifg6mcXh6p/DVQemFh6/f6zq7mItftvwsx6i36az+izcypaZ
	X1VgMv/jmpMB57WX7lm63G1pzN+g/AT/xUUbop2Xuk6ZFpa3mn3JKd8V1jfW3E3mU/7oVzwh
	reP/rd4Z90yUWIozEg21mIuKEwGJAOOGcQMAAA==
X-CMS-MailID: 20240426092130eucas1p1cdb1063d963b5e9b262547c0689bf55f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7
References: <CGME20240425091434eucas1p11ec105de15d448c0fb14812705e4eac7@eucas1p1.samsung.com>
	<20240425091429.948467-1-m.szyprowski@samsung.com>
	<Zir0Rhm7jZoF8r04@google.com>
	<d62aeaa2-8d3e-409e-acea-23b9e6ff0b76@samsung.com>
	<b271df59-fb7d-4637-8ac0-1e53be2f0ee4@kernel.org>

On 26.04.2024 11:02, Krzysztof Kozlowski wrote:
> On 26/04/2024 07:24, Marek Szyprowski wrote:
>> On 26.04.2024 02:24, William McVicker wrote:
>>> On 04/25/2024, Marek Szyprowski wrote:
>>>> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
>>>> module driver") this driver is instantiated as MFD-cell (matched by
>>>> platform device name) not as a real platform device created by OF code.
>>>> Remove then of_match_table and related MODULE_DEVICE_TABLE to avoid
>>>> further confusion.
>>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>>    drivers/clk/samsung/clk-exynos-clkout.c | 2 --
>>>>    1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
>>>> index 503c6f5b20d5..0c7f4e2aa366 100644
>>>> --- a/drivers/clk/samsung/clk-exynos-clkout.c
>>>> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
>>>> @@ -75,7 +75,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
>>>>    		.data = &exynos_clkout_exynos5,
>>>>    	}, { }
>>>>    };
>>>> -MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
>>> I understand these are duplicates of the exynos-pmu driver, but was wondering
>>> if this will impact the exynos-clkout module from getting auto-loaded? Without
>>> the MODULE_DEVICE_TABLE() defined, the aliases won't be created that trigger
>>> udev to load this module and the mfd driver is obviously not going to load it.
>> This driver loaded and matched only against the platform device name
> Matched yes, but "loaded"? As in module loaded? Are you sure? There is
> no MODULE_ALIAS, no platform_id_table with MODULE_DEVICE_TABLE, so with
> this patch all aliases are gone.
>
> The old aliases indeed could have been used to load the clkout, even if
> not used for matching.

Right, the proper solution is to add:

MODULE_ALIAS("platform:exynos-clkout");

I was convinced that the module_platform_driver() macro adds simple 
module alias based on the driver name, but it looks that's not true. 
Thanks for pointing this out. I will send v2 with the above alias then.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

