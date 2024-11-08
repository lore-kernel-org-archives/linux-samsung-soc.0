Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722F1F4726
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Nov 2024 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731079710; cv=none; b=bpncgLedxaBhx2T9nH+gi0IaUhYbfhFsNqXO3mbSpTE2AXF15DZqx5L2YaYXBhTuQBU3LbYtUu/GfbvgJVQRjmCDyl0koBzlZT7FXPROqGkDeA4HUUDVhPBkjU0Gzgf4b4J0oDBdaV9CBXWwiAxw2dNUYxyDfo2KdUrEU4xH6iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731079710; c=relaxed/simple;
	bh=NyRjWdCH9gmdxv7gCOmkSci/AMAkfvifemM1MyN74Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=hRcc3GlcPgkd4RSILWmGysL7vM42jBWpmY9Jp3vBk5YdrRYK5phCeEjnbpI6DdZoxWqEm+u9whiGvOPqMzDvUJ5kGcq2Z7ZOi3q7MAWsute8p2PEBDn4cZVO0aJVoXi2HQAUCDva96DXeGUnzgzxCKrmlqdigkNXN28uA33OQdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ouVCOvxF; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ouVCOvxF"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241108152825euoutp01bd60852a122cac6b896ddf98d370b831~GB9IhyG1G2100121001euoutp01k
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Nov 2024 15:28:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241108152825euoutp01bd60852a122cac6b896ddf98d370b831~GB9IhyG1G2100121001euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731079705;
	bh=mSLue5/5WzB0WeBGrS/Ac7CEsCRjFZj3IoyYVwiCpPI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ouVCOvxFSMNOtoethx1y7HRqIJYrAqIDUyMuAQSaIxKqNsCihIr2s+3nzaWyhM+63
	 A3cL9QTeGbm/4hxvDJ2ZHva6l/ZyiBBSka/ZvT0mOzxWt26ZXXrrro7vGHe9g1TP5Z
	 JfDfhpg7OMoD3TYJIR6kPM+1ckNWXGGRhVGzXrx0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241108152825eucas1p136c2ccc3700d2a344f8129d62387517d~GB9IPVSLk2486724867eucas1p1o;
	Fri,  8 Nov 2024 15:28:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 10.91.20397.91E2E276; Fri,  8
	Nov 2024 15:28:25 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241108152825eucas1p14a71e696b176aa57437be7221ebdf974~GB9H1PgbI2689426894eucas1p1l;
	Fri,  8 Nov 2024 15:28:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241108152825eusmtrp2711fc20630bafe24972ee2f7477b3a65~GB9H0zYim2707727077eusmtrp2F;
	Fri,  8 Nov 2024 15:28:25 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-c7-672e2e192b48
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 15.6C.19654.81E2E276; Fri,  8
	Nov 2024 15:28:25 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241108152824eusmtip1dd9c72b31b1861e48ba2054250088617~GB9HIkBMo0966909669eusmtip1C;
	Fri,  8 Nov 2024 15:28:24 +0000 (GMT)
Message-ID: <6d7c0eda-d93e-43b3-8b85-40b4ef094277@samsung.com>
Date: Fri, 8 Nov 2024 16:28:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley
	<conor@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Linux Samsung SOC
	<linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAL_JsqKpv73RXLhdgox5gjxRUdaP7TVQyMs5rur+Ac=S4OtEFw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfVCLcRz32/Ps2dPO3M9E34QyL3fE1Hl7HPKenZfyngsxekys1W1G5FxJ
	Xoa7QqolcqikiYREysKMNJc/ZCKlu1x341zeZrW0PUP/fd6+b7/70YQ4lz+YjlHtZNUquVJC
	CcnbT+yW8b5SqSLoUf5Q5kpGEcWcf1THZyyW6wLmVcVZismyPOAxjp9OPtN9v1zA6Ixd1Gxa
	lleqlZUWHaVklqwLSNZROmwZGSmcEc0qY3ax6gkhm4TbTqafIOKv+iU8rLIKkpDDW4e8aMCT
	4I7NSeiQkBbjQgT2yzV8jnzrIc5cxJEOBA57tuBvSe2NZoozChC8sNf2GHQP+YqgDLsyIhwC
	yQ+qSBcm8UgozDxCcHp/MGe3uvWB2B+arFnungPwKqj9+Ibvwt54ODgOnXFvQWAdD57U1LoN
	AvuAtfU8z4UpHAw6m45yYS+8HPKrX3ky/pByK8d9D+BGGiqzT3m2ng/mVLMHD4B2U5kHD4Hu
	u66mroLDCPIcTR6ShiCpzYq41HRorPtNuc4k8BgoqZjAyXOg2n7aLQPuBw22/twS/eDk7UyC
	k0Vw5JCYS48Gvenav7EPX9YTaUii7/Uu+l5n6nudo/8/Nw+RRciH1WpiFaxmoordLdXIYzVa
	lUK6JS62FPX8oOdO0/dyVNj+VWpEPBoZEdCExFsUHhmoEIui5Xv2suq4jWqtktUYkR9NSnxE
	o6L9WTFWyHeyO1g2nlX/dXm01+AkXk7xupTJssx7x2TjzCs7HVOm1Vd9NvSZOd3WQdGqqIIC
	c1fbsfiJJREZeQm+U1uo9vpdfgvCjgcMHa/c8jSxOTQ8vKrP7OCPZF1CzdJxWbnPqhsumU8f
	tP14Pin6fegX5zzdklDj/rDAn6ARWFdfKN9dnTI8pvtlsWltanqA6EC6oXIN+ybGwF+/P78y
	alpy0JRPzPsch/Tt2EDL4pK+qRtOXQ9OjwxJO5ypbFhxM7E1wn500KUbTSO2/jLE160K6oyK
	eNfyOnfzoLicMnJ7ATat/tIYeTl5VkXJwrnNvucG2upFAb6iRO0Hy2ueM/vxPkvURmF45yJD
	18XEt/5pbcUtB1bOkJCabfLgsYRaI/8DTZade7ADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xu7qSenrpBhteM1msnLqKzWL+kXOs
	FufPb2C3uLxrDpvFjPP7mCx+f//HavF/zw52i65Df9kcODwWbCr12LSqk83j/IyFjB6fN8kF
	sETp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZUya
	2MtcsFq64uD+W+wNjL9Fuhg5OSQETCTObHzIBmILCSxllNhyqBAiLiNxcloDK4QtLPHnWhdQ
	DRdQzXtGiTNX5rKAJHgF7CQa9+0Hs1kEVCRWTO9ghogLSpyc+QQsLiogL3H/1gx2EFtYIETi
	zOObYENFBBQlfrdNYwUZyizQxSRx5uRuFogNbUwSHy/8AzuJWUBc4taT+UwgNpuAoUTX2y6w
	OKdAoMSyA5dZIWrMJLq2djFC2PISzVtnM09gFJqF5JBZSEbNQtIyC0nLAkaWVYwiqaXFuem5
	xUZ6xYm5xaV56XrJ+bmbGIFRt+3Yzy07GFe++qh3iJGJg/EQowQHs5IIr3+UdroQb0piZVVq
	UX58UWlOavEhRlNgaExklhJNzgfGfV5JvKGZgamhiZmlgamlmbGSOC/blfNpQgLpiSWp2amp
	BalFMH1MHJxSDUxR2y4/EDQ7y9h763agXG30pe6IX6X8oYf6jFym8G5ccWp65NPdO3PVhPTq
	fi5JUN0VkDAvZPaqzDs/l5zs5Jztevt53oZCy9gjqTIzNYsNJSsvuW2+s2Nn6UyJbTNvCWv8
	PDbV+RO/v3rJ+aTfR71PTX5SunzH36ips9Uiri6VnOs7yfK+yPTcHyuFJVlsJZZ08omabu1r
	SNDtm5syfwaX9ueSPY+Sev5tcvTa8kza+8OyjddXnpun2F4wb/XxJt1PMxXrtc9teZ+yuaRv
	dWtXGZNW07mZhtOOply2Kl36Vzuo+6JCx7Fzh85rlOTsv3Y2jePn335dKaHSzRccXV+HXrv0
	N1Vpufmeh/fiT8zVVmIpzkg01GIuKk4EAGffUONDAwAA
X-CMS-MailID: 20241108152825eucas1p14a71e696b176aa57437be7221ebdf974
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d
References: <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
	<20241106171028.3830266-1-robh@kernel.org>
	<3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
	<CAL_JsqKpv73RXLhdgox5gjxRUdaP7TVQyMs5rur+Ac=S4OtEFw@mail.gmail.com>

Hi Rob,

On 08.11.2024 14:25, Rob Herring wrote:
> On Fri, Nov 8, 2024 at 5:04 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 06.11.2024 18:10, Rob Herring (Arm) wrote:
>>> While OpenFirmware originally allowed walking parent nodes and default
>>> root values for #address-cells and #size-cells, FDT has long required
>>> explicit values. It's been a warning in dtc for the root node since the
>>> beginning (2005) and for any parent node since 2007. Of course, not all
>>> FDT uses dtc, but that should be the majority by far. The various
>>> extracted OF devicetrees I have dating back to the 1990s (various
>>> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. The
>>> warning is disabled for Sparc as there are known systems relying on
>>> default root node values.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>> v2:
>>>    - Add a define for excluded platforms to help clarify the intent
>>>      is to have an exclude list and make adding platforms easier.
>>>    - Also warn when walking parent nodes.
>>> ---
>>>    drivers/of/base.c | 28 ++++++++++++++++++++++------
>>>    drivers/of/fdt.c  |  4 ++--
>>>    2 files changed, 24 insertions(+), 8 deletions(-)
>> This patch landed in today's linux-next as commit 4b28a0dec185 ("of:
>> WARN on deprecated #address-cells/#size-cells handling"). In my tests I
>> found that it introduces warnings on almost all of my test systems. I
>> took a look at the first one I got in my logs (Samsung Exynos Rinato
>> board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):
> Thanks for the report. Let me know if any others have a different
> backtrace. Also, since it's a WARN_ONCE, fixing one case could expose
> others.

> >...

> I'm going to fold in the following fix which should fix the warning:

This fixes all the warnings I've observed.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 824bb449e007..f21f4699df7a 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -333,7 +333,8 @@ static unsigned int of_bus_isa_get_flags(const __be32 *addr)
>
>   static int of_bus_default_flags_match(struct device_node *np)
>   {
> -       return of_bus_n_addr_cells(np) == 3;
> +       /* Check for presence first since of_bus_n_addr_cells() will
> walk parents */
> +       return of_property_present(np, "#address-cells") &&
> (of_bus_n_addr_cells(np) == 3);
>   }
>
>   /*
> @@ -701,16 +702,16 @@ const __be32 *__of_get_address(struct
> device_node *dev, int index, int bar_no,
>          if (strcmp(bus->name, "pci") && (bar_no >= 0))
>                  return NULL;
>
> -       bus->count_cells(dev, &na, &ns);
> -       if (!OF_CHECK_ADDR_COUNT(na))
> -               return NULL;
> -
>          /* Get "reg" or "assigned-addresses" property */
>          prop = of_get_property(dev, bus->addresses, &psize);
>          if (prop == NULL)
>                  return NULL;
>          psize /= 4;
>
> +       bus->count_cells(dev, &na, &ns);
> +       if (!OF_CHECK_ADDR_COUNT(na))
> +               return NULL;
> +
>          onesize = na + ns;
>          for (i = 0; psize >= onesize; psize -= onesize, prop += onesize, i++) {
>                  u32 val = be32_to_cpu(prop[0]);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

