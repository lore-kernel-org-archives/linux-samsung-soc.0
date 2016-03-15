From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 7/7] ARM: dts: Add initial gpio setting of MMC2 device
 for exynos3250-monk
Date: Tue, 15 Mar 2016 13:25:57 +0900
Message-ID: <56E78ED5.9060604@samsung.com>
References: <201603151221.FDX9rQCr%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52617 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829AbcCOE0B convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2016 00:26:01 -0400
In-reply-to: <201603151221.FDX9rQCr%fengguang.wu@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Hi,

On 2016=EB=85=84 03=EC=9B=94 15=EC=9D=BC 13:18, kbuild test robot wrote=
:
> Hi Chanwoo,
>=20
> [auto build test ERROR on v4.5-rc7]
> [also build test ERROR on next-20160314]
> [if your patch is applied to the wrong git tree, please drop us a not=
e to help improving the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Chanwoo-Choi/ARM-dts=
-Add-new-Exynos3250-based-ARTIK5-module-dtsi-file/20160315-101326
> config: arm-exynos_defconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tes=
ts.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=3Darm=20
>=20
> All errors (new ones prefixed by >>):
>=20
>>> Error: arch/arm/boot/dts/exynos3250-monk.dts:564.9-10 syntax error
>    FATAL ERROR: Unable to parse input tree

>    FATAL ERROR: Unable to parse input tree

This patch depend on patch[1]. I send the separate patch-set.
To build this patch, patch[1] should be applied. It is my mistake.
[1] https://lkml.org/lkml/2016/3/14/245

Best Regards,
Chanwoo Choi
