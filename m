Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3025E4437A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721687253; cv=none; b=MTfu9NEI7FQj4jj7mueIT+hmWm5BCrJbEiJMJVqZVNYvstIKIo01ZBaGaC8Dd+ODpXlV3XgAwrVr65sAD9TFTFvkmIyNdG7qgqyt8tr6JyI16md0zzylxdgJ0TfhieJnl4GpmfNi14FLb44xxXRq9szqBPIk7Wd4/OWF9zyO4Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721687253; c=relaxed/simple;
	bh=0kyuDvaIF9DXP0bZ5BFO2DvCoj2uByFsJ6Gkw20m0/s=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=EsB3xGTcf2UMBF/7xHGUqpweTh+5TUYOyWDVF067Dyrsshh9+0Ckf97luBB7S7MxVrvcgTbp1w81YcKBVfUAaQNY2ZPVOk7CtJuLZoOZtHvoxANOI24EoiB7n1gCR4EAF9V112N0vZuMv6Hr8pYBkbw8GH4olraexCfL0zu7WwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qfbcobmW; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qfbcobmW"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240722222729epoutp043a6cc097d124f8dec3000b62a093b803~kqW5jgDvM3180431804epoutp04B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:27:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240722222729epoutp043a6cc097d124f8dec3000b62a093b803~kqW5jgDvM3180431804epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721687249;
	bh=Kc2VPlsgYMDXJok8yZwlqORsXBOzma/P7+MSMg3PQPY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qfbcobmWhl/p6bs1N1Py9HKKERYS/tVw9gvdCNn6ZJmuFDpRAfuo/vLLgdifcVQ3s
	 ds1nPqUVl782ySb4v0OypBA+nXuhmb7saBTA22iYfAWL5T+cZF0aPFds1DXrnbqrNh
	 Nr8UtWsSpeCTnZ8Y0x4Oi2GP54iu6H7XvqI3U+gE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240722222728epcas2p1720ffd082c980bfb5e034a0ae0599f35~kqW5CbEPz0516605166epcas2p1a;
	Mon, 22 Jul 2024 22:27:28 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.69]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WSZf807b4z4x9Pp; Mon, 22 Jul
	2024 22:27:28 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	07.32.10012.FCCDE966; Tue, 23 Jul 2024 07:27:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240722222727epcas2p22e407d13762b3a51a8133eef47d36443~kqW3-Y-M23182531825epcas2p2k;
	Mon, 22 Jul 2024 22:27:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240722222727epsmtrp1d1bc6d4b05ca13b004519ee8b111a2bd~kqW3_kNRm2082120821epsmtrp1O;
	Mon, 22 Jul 2024 22:27:27 +0000 (GMT)
X-AuditID: b6c32a47-c43ff7000000271c-c0-669edccf3211
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	DC.48.08964.FCCDE966; Tue, 23 Jul 2024 07:27:27 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240722222727epsmtip11887c74abb9457f516f00353582351b5~kqW3oivrl2290522905epsmtip1J;
	Mon, 22 Jul 2024 22:27:27 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Dan Carpenter'" <dan.carpenter@linaro.org>,
	<oe-kbuild@lists.linux.dev>, "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	"'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	"'Michael Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Rob Herring'" <robh@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>
Cc: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <a82340ab-a1db-4089-a804-acf9882782f4@suswa.mountain>
Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Tue, 23 Jul 2024 07:27:26 +0900
Message-ID: <000001dadc86$54e9fc80$febdf580$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQL/V59W3oU30qDnbfr1orizqCMf/wHcrHeQr6tzTeA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGJsWRmVeSWpSXmKPExsWy7bCmme75O/PSDP6uNbJ4MG8bm8WaveeY
	LK5/ec5q8WFeK7vF/CPnWC3On9/AbrHp8TVWi48991gtLu+aw2Yx4/w+JotXzY/YLC6ecrU4
	tPIKk0XDurPsFv/37GC3OPymndXi37WNLA6CHu9vtLJ7LN7zkslj06pONo871/aweWxeUu/x
	YvNMRo++LasYPT5vkgvgiMq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvM
	TbVVcvEJ0HXLzAH6QkmhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1ya
	l66Xl1piZWhgYGQKVJiQnXF10hGmgisaFV9+bGJsYJyh1MXIySEhYCLxc+08li5GLg4hgR2M
	Ev++9DFCOJ8YJfqWfIByvjFKrDtyiA2m5eOjK0wQib2MEidPnGSHcF4ySvx6e4gJpIpNQF9i
	dfdtNpCEiMBqZoktszrBtjALPGKUuHXkDitIFaeAk8TyBe1A7RwcwgLeEu9bc0DCLAKqEiu+
	vGYBsXkFLCVWT93MDmELSpyc+QQsziwgL7H97RxmiJMUJH4+XQY2UkTASuLj+vmMEDUiErM7
	26BqfnBI7DwsD7JKQsBF4sUhQYiwsMSr41vYIWwpiZf9bVB2vsTk62/BvpQQaGCUuPavG2qO
	vcSiMz/BTmYW0JRYv0sfYqSyxJFbUJfxSXQc/ssOEeaV6GgTgmhUk/h05TLUEBmJYyeeMU9g
	VJqF5K9ZSP6aheT+WQi7FjCyrGIUSy0ozk1PLTYqMIZHdnJ+7iZGcALXct/BOOPtB71DjEwc
	jIcYJTiYlUR4n7yamybEm5JYWZValB9fVJqTWnyI0RQY0hOZpUST84E5JK8k3tDE0sDEzMzQ
	3MjUwFxJnPde69wUIYH0xJLU7NTUgtQimD4mDk6pBiatMGW9FGfGGfzBHwp9tZme3eb6emAT
	97b2q3tV+euOR19oZH6qaXaCzXz6pSa5wGqzlE3uZQzhSTPv3LsQy/gskFOt4PJiTW0prs5y
	2/XG3fekIk1LRBLEo52///mswKuzSyzBd9ZK68pVS4LEgoo23L44k+t78oLQvMdH9QMjy1fE
	V6XZhxmsvb6GJeLCpTTV/I2aF9RuWCo1yOt/89rYtcDbS8/tjbnE4UvBM6skL73vVemZFHLy
	6jTFQN/HKloya2VnJqZKadVKlXtxcb15Vn7pkARn0U1tjkK3oHyB6etzBdxu2ulXx6WePRi+
	yaa/aRIL+wFrbmsBWddo4aC/YSvvTmT9uNtJ9poSS3FGoqEWc1FxIgBgdcC2aQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWy7bCSnO75O/PSDHad5bV4MG8bm8WaveeY
	LK5/ec5q8WFeK7vF/CPnWC3On9/AbrHp8TVWi48991gtLu+aw2Yx4/w+JotXzY/YLC6ecrU4
	tPIKk0XDurPsFv/37GC3OPymndXi37WNLA6CHu9vtLJ7LN7zkslj06pONo871/aweWxeUu/x
	YvNMRo++LasYPT5vkgvgiOKySUnNySxLLdK3S+DKuDrpCFPBFY2KLz82MTYwzlDqYuTkkBAw
	kfj46ApTFyMXh5DAbkaJI61/WCASMhIbG/6zQ9jCEvdbjrBCFD1nlDj04BAjSIJNQF9idfdt
	NpCEiMBGZokj7Z/BqpgFXjBKtM8+xQLRMplR4vbCOUwgLZwCThLLF7QDzeXgEBbwlnjfmgMS
	ZhFQlVjx5TXYal4BS4nVUzezQ9iCEidnPmEBKWcW0JNo2wi2mFlAXmL72znMENcpSPx8uowV
	xBYRsJL4uH4+VI2IxOzONuYJjMKzkEyahTBpFpJJs5B0LGBkWcUomVpQnJueW2xYYJiXWq5X
	nJhbXJqXrpecn7uJERzNWpo7GLev+qB3iJGJg/EQowQHs5II75NXc9OEeFMSK6tSi/Lji0pz
	UosPMUpzsCiJ84q/6E0REkhPLEnNTk0tSC2CyTJxcEo1MHGVPxZPXMPvr3VxedPW8sCVrw3j
	LVXyrhyU+aDoN8nb9ExdbdVV9iXbeJrPGCkqzf+Q1DfbXbAsUMPg3oWfO9j9jBOFTj2brPSl
	WIlZ89dB3fTQwtq/t9c/ZDTwSLMpZ1zDfCOAofkUg+mhtDpB0TnfL32XPHtV5YDY1EmXivSY
	9kgu2qrPsHl52zSB3ydm692+YOKeaqu0k3XzXZ3Zu2sT5bZb/ixeFtWxOUufR4hzCXvjkn1H
	te6HZL9lt3eZLz/9NYeLVEAzi5fC/jnOa6+ZOfnEyLSf6clxOPInPn2+YoKSa1pIQivDpATB
	lsIFBt931bGfiT804eiVV7MP6MWaf/4c1cPk5bL0ozKHEktxRqKhFnNRcSIAqYhhc1UDAAA=
X-CMS-MailID: 20240722222727epcas2p22e407d13762b3a51a8133eef47d36443
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240719184842epcas2p190db193d1b342abeaa820d3ef88333d7
References: <CGME20240719184842epcas2p190db193d1b342abeaa820d3ef88333d7@epcas2p1.samsung.com>
	<a82340ab-a1db-4089-a804-acf9882782f4@suswa.mountain>

Hello Dan,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Saturday, July 20, 2024 3:48 AM
> To: oe-kbuild@lists.linux.dev; Sunyeal Hong <sunyeal.hong@samsung.com>;
> Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; linux-samsung-
> soc@vger.kernel.org; linux-clk@vger.kernel.org;
devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> Sunyeal Hong <sunyeal.hong@samsung.com>
> Subject: Re: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for
> pll_531x
> 
> Hi Sunyeal,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://protect2.fireeye.com/v1/url?k=ccd9a91d-93426779-ccd82252-
> 000babda0201-b5083e850ec85e2b&q=1&e=dc8f0621-d4ce-45e5-8254-
> 9a5da18037d5&u=https%3A%2F%2Fgithub.com%2Fintel-lab-
> lkp%2Flinux%2Fcommits%2FSunyeal-Hong%2Fdt-bindings-clock-add-Exynos-Auto-
> v920-SoC-CMU-bindings%2F20240708-072150
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
> for-next
> patch link:    https://lore.kernel.org/r/20240707231331.3433340-4-
> sunyeal.hong%40samsung.com
> patch subject: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for
> pll_531x
> config: arc-randconfig-r071-20240719 (https://download.01.org/0day-
> ci/archive/20240720/202407200028.5AADGhmj-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202407200028.5AADGhmj-lkp@intel.com/
> 
> smatch warnings:
> drivers/clk/samsung/clk-pll.c:1292 samsung_pll531x_recalc_rate() warn:
> mask and shift to zero: expr='fdiv >> 31'
> 
> vim +1292 drivers/clk/samsung/clk-pll.c
> 
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1277  static unsigned long
> samsung_pll531x_recalc_rate(struct clk_hw *hw,
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1278
> 	 unsigned long parent_rate)
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1279  {
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1280  	struct
samsung_clk_pll *pll
> = to_clk_pll(hw);
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1281  	u32 mdiv, pdiv,
sdiv,
> pll_con0, pll_con8;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1282  	s32 fdiv;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1283  	u64 fout =
parent_rate;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1284
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1285  	pll_con0 =
> readl_relaxed(pll->con_reg);
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1286  	pll_con8 =
> readl_relaxed(pll->con_reg + 20);
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1287  	mdiv = (pll_con0 >>
> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1288  	pdiv = (pll_con0 >>
> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1289  	sdiv = (pll_con0 >>
> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1290  	fdiv =
(s32)(pll_con8 &
> PLL531X_FDIV_MASK);
> 
> PLL531X_FDIV_MASK is 0xffff.  Was this supposed to be a cast to s16
> instead of s32?  Why is fdiv signed?  Shifting negative values is
undefined
> in C.
> 
As you reviewed, I will change fdiv to u32 type and modify it to use a mask
of 0xffffffff.
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1291
> 5c788df7a25de7 Sunyeal Hong 2024-07-08 @1292  	if (fdiv >> 31)
> 
> It's really unclear what's happening here.  If I had to guess, I'd say
> that this was testing to see if fdiv was negative.
> 
the bit of fdiv 31 is a bit that can check negative numbers. In this case,
the mdiv is first subtracting 1. Please refer to the formula of commit
description.
FOUT = (MDIV + F/2^32-F[31]) x FIN/(PDIV x 2^SDIV) for fractional PLL
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1293  		mdiv--;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1294
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1295  	fout *= ((u64)mdiv
<< 24) +
> (fdiv >> 8);
>
^^^^^^^^^ More
> shifting.
> 
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1296  	do_div(fout, (pdiv
<<
> sdiv));
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1297  	fout >>= 24;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1298
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1299  	return (unsigned
long)fout;
> 5c788df7a25de7 Sunyeal Hong 2024-07-08  1300  }
> 
> --
> 0-DAY CI Kernel Test Service
> https://protect2.fireeye.com/v1/url?k=8c19bb62-d3827506-8c18302d-
> 000babda0201-2f20ef1ee86cc8ae&q=1&e=dc8f0621-d4ce-45e5-8254-
> 9a5da18037d5&u=https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki
> 

I will fix the patch and update again.

Thanks,
Sunyeal Hong.

