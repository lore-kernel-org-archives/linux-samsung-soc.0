Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6137E47F69
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Nov 2024 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063894; cv=none; b=PJhbdz0+OEPj8DIHbfWxl7jjFIGTTyQ8AUnKl+8aLi1fDpu/w87miZ1ACouN2GczJuaOSO/LyxpuvSOFzWHYUg4f2m4AXmBtl4u1pU1kI1llp+rUJkJupesO+9lJpBpy7WEpk94XgVXaJssvZnS5+IpR28xWqivDG+iaAFdG0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063894; c=relaxed/simple;
	bh=EHKj3SZV2nSocjj33OqxioO8lncH/rLo6m5Nb7dyeww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Dgo9oUPq37Ypb2oh7Ro3DeNeulvjKpMRVXVdycH9C4oio/nwcnu27Yhm+UDdbzbOqWcQsD4rD/l3k+jYhKwX4jSyP/vNCgPoZfzwP0q87GNVBsNGDgMzAZMRMO3k7X8spLp4f/xSEoix9j7j2fEmBscmgvW4KPeobocm8AzN2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mrLneQi1; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mrLneQi1"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241108110444euoutp01f08973d025f5fcfe12b70f41ae74eaaf~F_W5-rv4D1955719557euoutp01n
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Nov 2024 11:04:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241108110444euoutp01f08973d025f5fcfe12b70f41ae74eaaf~F_W5-rv4D1955719557euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731063884;
	bh=Dvf3axbliI/ujabZdurZLe5FqLB+at5UxHoMcZ4bKbA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=mrLneQi1D5cGPU7aMqewYpj6K6MzrLBt5cW+j4V/ZsOhZECtjEf64dnXGKZIpIqer
	 GWGusYf5SKS55Uvf/79f4UXyr6nyrDqoee7lh35GKFg5+s/jsfcas2Mw0Slqz00xAW
	 eed1qqRngPZS8bwCPW8C4VsUTX++PYMsCP8PNNJM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241108110444eucas1p272655c1287a1385b5c979dd6b6e1a661~F_W5uu6kd2690226902eucas1p2E;
	Fri,  8 Nov 2024 11:04:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 62.92.20409.C40FD276; Fri,  8
	Nov 2024 11:04:44 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d~F_W5Zh_gW2404924049eucas1p2H;
	Fri,  8 Nov 2024 11:04:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241108110444eusmtrp287e513fb02e49cdaf567d1145cf0121f~F_W5Y9bIL0196601966eusmtrp2j;
	Fri,  8 Nov 2024 11:04:44 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-37-672df04cde63
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id CD.79.19920.C40FD276; Fri,  8
	Nov 2024 11:04:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241108110443eusmtip19e51735c159767a892635dfa1d625ce0~F_W4cEPV51433314333eusmtip1o;
	Fri,  8 Nov 2024 11:04:43 +0000 (GMT)
Message-ID: <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
Date: Fri, 8 Nov 2024 12:04:41 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
To: "Rob Herring (Arm)" <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 'Linux Samsung
	SOC' <linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20241106171028.3830266-1-robh@kernel.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRz12/M62LzOwh+ZCbOirOxh4e39sMxIWIZRLHusvGyRTttDKwgW
	leUqCLVcN0OtxDXLZJrM1SqnuR7mzAJ1E40lJVasUompaW7Xyv/OOb/HOb+PD2MKb7JnYEcU
	alKpkKaJODxWbZPXsSjx+yLZEmtZKHH3qpFDFDe2sAmHo4pLvLMUcQi94wmDGPk1xibGH5u5
	hM72m7MBSygxaRJMxlxOgkNfihIGTLN2sCS8Nalk2pEsUrl43UGe/NqtqMzWTcefXhBrURmh
	Q4EY4MthxNWMdIiHCXEDgoseyyQZROC0mdk0GUAwVupCf0f6HKMsulCOQDfkYdLkBwLjEN3F
	x9eB2Wpn+DALnw2et50sWg+Gl9d7/Xg6HgE9Tj3Xh0PwZGj+2Mn24Wn4SXjvyPU7MPE6BH3N
	Pf6lTDwUnL3F/qUcfCnovuk4PhyIx0LVqzwu3RMBZx7e8CcCvAsDavg+l869GQz3ajg0DoF+
	e82kPhPG63xLfQPnEZSM9EySKwi0n52TV6+GrpbhiWlswmI+PLAspuWN8Mxb4JcBF0DHt2A6
	hADyaguZtMyHCzlCunsuUPbKf7b1rW3MK0hETXkXasqZ1JRzqP++JYhlRKGkRpUuI1XLFGR2
	tEqartIoZNGHM9JNaOIHvR6zD5pRef+PaBtiYMiGAGOKpvHFkgUyIT9VeuIkqcw4oNSkkSob
	CsNYolD+nNQIUojLpGryKElmksq/VQYWOEPLQK9WYLrNxke20676yGO93YI1HwJHT4VvimsY
	fF7Uujbn+1ZBdsxCqr1C2/Amb9/eawXbd1k1I++GY4O8HY3tNXvejDFitOdkHQfFhtz05PwQ
	tdrzuik32X0qHLpXGlSF4bqjvI71Tf13LJ3nVgcEXW6PbUtp+ep+rv1yKatSPo/3Wd4XmWHe
	UvrJW5GikBXsVldL9Jld4tu18fslQLS4+kYjxME767M8dV4qzp5EJUmcS+LDBEFKttVeP7vw
	halL0JjPzXlyfFZ1a3SdIfbs+4yNwgJLePAQ2zWOyR0G0pqYMnzmp7thv/SQE3oSg4Tx7oBV
	29zdhY/Wh6FUEUslly6NYipV0j/6ck26sAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7o+H3TTDd7MY7FYOXUVm8X8I+dY
	Lc6f38BucXnXHDaLGef3MVn8/v6P1eL/nh3sFl2H/rI5cHgs2FTqsWlVJ5vH+RkLGT0+b5IL
	YInSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy5i2
	SKvgglPF/g7/BsalFl2MnBwSAiYSL87/Yeli5OIQEljKKNHROJkRIiEjcXJaAyuELSzx51oX
	G0TRe0aJxSfvsoMkeAXsJHbsPc4EYrMIqEi8v3iTBSIuKHFy5hMwW1RAXuL+rRlg9cICIRJn
	Ht8EGyoiUCUxZdlmZpChzAI7GSV2/58PlhASMJPY8OkNG4jNLCAucevJfLAFbAKGEl1vu8Di
	nALmEhtOTWKHqDGT6NraxQhhy0s0b53NPIFRaBaSO2YhGTULScssJC0LGFlWMYqklhbnpucW
	G+oVJ+YWl+al6yXn525iBEbctmM/N+9gnPfqo94hRiYOxkOMEhzMSiK8/lHa6UK8KYmVValF
	+fFFpTmpxYcYTYGBMZFZSjQ5HxjzeSXxhmYGpoYmZpYGppZmxkrivG6Xz6cJCaQnlqRmp6YW
	pBbB9DFxcEo1MK02S/4a/Wj/pU8Fk7T3eBuKTL35NeCz0CPh4IA5CxV2budc1nON4bih5KIn
	zkbvn6VM5C5cWCAes85+IT9j0Kkn8v2tRU+X6u24PlHq/ttrr1YZGCdeMjecdPtDGbc9xzVd
	7fetb1cJfXuyJE9g/8rae4mi8099srG4wO1yxsjz2ZRly1UWfWyUWxu4NazlY8K17HT+HL8p
	K55etTby697paPHw5InuI5EHrDXUthqrN/j469hZN3Q9Tj6xcjnjlCtzbZYddVL41XI3/ILk
	59C6yBuBM/8nf2ta8e8ea/XPQx16vS8al86fbvGYecXHrQprvotO8MjhXnw4/0H4ES2L4Mqs
	yQpHjgrfXntQ7OENJZbijERDLeai4kQAuGVZqkEDAAA=
X-CMS-MailID: 20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d
References: <20241106171028.3830266-1-robh@kernel.org>
	<CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>

Hi Rob,

On 06.11.2024 18:10, Rob Herring (Arm) wrote:
> While OpenFirmware originally allowed walking parent nodes and default
> root values for #address-cells and #size-cells, FDT has long required
> explicit values. It's been a warning in dtc for the root node since the
> beginning (2005) and for any parent node since 2007. Of course, not all
> FDT uses dtc, but that should be the majority by far. The various
> extracted OF devicetrees I have dating back to the 1990s (various
> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. The
> warning is disabled for Sparc as there are known systems relying on
> default root node values.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>   - Add a define for excluded platforms to help clarify the intent
>     is to have an exclude list and make adding platforms easier.
>   - Also warn when walking parent nodes.
> ---
>   drivers/of/base.c | 28 ++++++++++++++++++++++------
>   drivers/of/fdt.c  |  4 ++--
>   2 files changed, 24 insertions(+), 8 deletions(-)

This patch landed in today's linux-next as commit 4b28a0dec185 ("of: 
WARN on deprecated #address-cells/#size-cells handling"). In my tests I 
found that it introduces warnings on almost all of my test systems. I 
took a look at the first one I got in my logs (Samsung Exynos Rinato 
board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):

------------[ cut here ]------------
WARNING: CPU: 1 PID: 1 at drivers/of/base.c:107 
of_bus_n_addr_cells+0x98/0xcc
Missing '#address-cells' in /soc/system-controller@10020000
Modules linked in:
CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.12.0-rc6-next-20241108 #9360
Hardware name: Samsung Exynos (Flattened Device Tree)
Call trace:
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x68/0x88
  dump_stack_lvl from __warn+0x150/0x1dc
  __warn from warn_slowpath_fmt+0x128/0x1b0
  warn_slowpath_fmt from of_bus_n_addr_cells+0x98/0xcc
  of_bus_n_addr_cells from of_bus_default_flags_match+0x8/0x18
  of_bus_default_flags_match from of_match_bus+0x28/0x58
  of_match_bus from __of_get_address+0x3c/0x1c8
  __of_get_address from __of_address_to_resource.constprop.2+0x3c/0x1e8
  __of_address_to_resource.constprop.2 from of_device_alloc+0x54/0x164
  of_device_alloc from of_platform_device_create_pdata+0x60/0xfc
  of_platform_device_create_pdata from of_platform_bus_create+0x1b0/0x4dc
  of_platform_bus_create from of_platform_populate+0x80/0x114
  of_platform_populate from devm_of_platform_populate+0x50/0x98
  devm_of_platform_populate from exynos_pmu_probe+0x12c/0x284
  exynos_pmu_probe from platform_probe+0x80/0xc0
  platform_probe from really_probe+0x154/0x3ac
  really_probe from __driver_probe_device+0xa0/0x1d4
  __driver_probe_device from driver_probe_device+0x30/0xd0
  driver_probe_device from __device_attach_driver+0xbc/0x11c
  __device_attach_driver from bus_for_each_drv+0x74/0xc0
  bus_for_each_drv from __device_attach+0xec/0x1b4
  __device_attach from bus_probe_device+0x8c/0x90
  bus_probe_device from device_add+0x56c/0x77c
  device_add from of_platform_device_create_pdata+0xac/0xfc
  of_platform_device_create_pdata from of_platform_bus_create+0x1b0/0x4dc
  of_platform_bus_create from of_platform_bus_create+0x218/0x4dc
  of_platform_bus_create from of_platform_populate+0x80/0x114
  of_platform_populate from of_platform_default_populate_init+0xc0/0xd0
  of_platform_default_populate_init from do_one_initcall+0x6c/0x328
  do_one_initcall from kernel_init_freeable+0x1c8/0x218
  kernel_init_freeable from kernel_init+0x1c/0x12c
  kernel_init from ret_from_fork+0x14/0x28
Exception stack(0xe0045fb0 to 0xe0045ff8)
...
---[ end trace 0000000000000000 ]---

To silence the above warning and the rest of them on this board I had to 
do the following change:

diff --git a/arch/arm/boot/dts/samsung/exynos3250.dtsi 
b/arch/arm/boot/dts/samsung/exynos3250.dtsi
index b6c3826a9424..c09afbcd1cab 100644
--- a/arch/arm/boot/dts/samsung/exynos3250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos3250.dtsi
@@ -347,6 +347,8 @@ pmu_system_controller: system-controller@10020000 {
                         reg = <0x10020000 0x4000>;
                         interrupt-controller;
                         #interrupt-cells = <3>;
+                       #size-cells = <0>;
+                       #address-cells = <0>;
                         interrupt-parent = <&gic>;
                         clock-names = "clkout8";
                         clocks = <&cmu CLK_FIN_PLL>;
@@ -615,6 +617,8 @@ pdma1: dma-controller@12690000 {
                 adc: adc@126c0000 {
                         compatible = "samsung,exynos3250-adc";
                         reg = <0x126c0000 0x100>;
+                       #size-cells = <0>;
+                       #address-cells = <0>;
                         interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
                         clock-names = "adc", "sclk";
                         clocks = <&cmu CLK_TSADC>, <&cmu CLK_SCLK_TSADC>;

I'm not a device tree expert, but for me this size/address cells 
requirement for nodes, which don't have addressable children looks a bit 
excessive. I bet, that if it was really needed from specification point 
of view, Krzysztof would already add it to Samsung Exynos dtsi/dts, as 
he spent quite a lot of time making them conformant with the spec. 
Krzysztof, could you comment on this?


> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 20603d3c9931..39fb59b666f3 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -87,15 +87,25 @@ static bool __of_node_is_type(const struct device_node *np, const char *type)
>   	return np && match && type && !strcmp(match, type);
>   }
>   
> +#define EXCLUDED_DEFAULT_CELLS_PLATFORMS ( \
> +	IS_ENABLED(CONFIG_SPARC) \
> +)
> +
>   int of_bus_n_addr_cells(struct device_node *np)
>   {
>   	u32 cells;
>   
> -	for (; np; np = np->parent)
> +	for (; np; np = np->parent) {
>   		if (!of_property_read_u32(np, "#address-cells", &cells))
>   			return cells;
> -
> -	/* No #address-cells property for the root node */
> +		/*
> +		 * Default root value and walking parent nodes for "#address-cells"
> +		 * is deprecated. Any platforms which hit this warning should
> +		 * be added to the excluded list.
> +		 */
> +		WARN_ONCE(!EXCLUDED_DEFAULT_CELLS_PLATFORMS,
> +			  "Missing '#address-cells' in %pOF\n", np);
> +	}
>   	return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
>   }
>   
> @@ -112,11 +122,17 @@ int of_bus_n_size_cells(struct device_node *np)
>   {
>   	u32 cells;
>   
> -	for (; np; np = np->parent)
> +	for (; np; np = np->parent) {
>   		if (!of_property_read_u32(np, "#size-cells", &cells))
>   			return cells;
> -
> -	/* No #size-cells property for the root node */
> +		/*
> +		 * Default root value and walking parent nodes for "#size-cells"
> +		 * is deprecated. Any platforms which hit this warning should
> +		 * be added to the excluded list.
> +		 */
> +		WARN_ONCE(!EXCLUDED_DEFAULT_CELLS_PLATFORMS,
> +			  "Missing '#size-cells' in %pOF\n", np);
> +	}
>   	return OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
>   }
>   
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 4d528c10df3a..d79707fb2eb1 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -938,12 +938,12 @@ int __init early_init_dt_scan_root(void)
>   	dt_root_addr_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
>   
>   	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
> -	if (prop)
> +	if (!WARN(!prop, "No '#size-cells' in root node\n"))
>   		dt_root_size_cells = be32_to_cpup(prop);
>   	pr_debug("dt_root_size_cells = %x\n", dt_root_size_cells);
>   
>   	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
> -	if (prop)
> +	if (!WARN(!prop, "No '#address-cells' in root node\n"))
>   		dt_root_addr_cells = be32_to_cpup(prop);
>   	pr_debug("dt_root_addr_cells = %x\n", dt_root_addr_cells);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

