From: Kukjin Kim <kgene@kernel.org>
Subject: RE: Broken device trees for exynos in linux-next
Date: Fri, 16 Aug 2013 09:04:28 +0900
Message-ID: <13b101ce9a14$2cebd700$86c38500$@org>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58751 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047Ab3HPAEv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Aug 2013 20:04:51 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRL00LBLK7HWHB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Aug 2013 09:04:29 +0900 (KST)
In-reply-to: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Mark Brown' <broonie@kernel.org>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Olof Johansson wrote:
> 
> Kukjin,
> 
Hi, Olof,

> On Thu, Aug 15, 2013 at 12:34 AM,  <build@lixom.net> wrote:
> 
> >         exynos5440_defconfig:
> > ERROR: Input tree has errors, aborting (use -f to force output)
> >
> >         exynos_defconfig:
> > ERROR: Input tree has errors, aborting (use -f to force output)
> 
> Full error is:
> 
>   DTC     arch/arm/boot/dts/exynos5420-smdk5420.dtb
> ERROR (phandle_references): Reference to non-existent node or label
> "pdma1"
> ERROR (phandle_references): Reference to non-existent node or label
> "pdma1"
> ERROR (phandle_references): Reference to non-existent node or label
> "pdma0"
> ERROR (phandle_references): Reference to non-existent node or label
> "pdma0"
> 
> Looks like you have broken device trees in linux next.

(+ Mark)

NO, the build breakage is due to commit 6187288f15bc ("ARM: dts: exynos5250:
move common i2s properties to exynos5 dtsi" which is in Mark Brown's tree.

Mark, pleaser revert it in your tree...

> Also, what is exynos5440_defconfig?

(+ Arnd)

I think, maybe we discussed about that? :) current exynos_defconfig cannot
support exynos5440 because of LPAE and I remember we decided LPAE and
non-LPAE should be separated. So as I commented before, exynos5440_defconfig
is needed. If you have any concerns, please let me know.

> Don't add contents (which includes defconfigs)
> to linux-next branches that won't make it all the way upstream.
> 
Sure :)

Thanks,
Kukjin
