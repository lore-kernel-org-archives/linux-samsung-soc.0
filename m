From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH v8 0/2] ommu/exynos: Add IOMMU/System MMU driver for
 Samsung Exynos
Date: Mon, 2 Jan 2012 14:42:29 +0100
Message-ID: <20120102134229.GZ29877@amd.com>
References: <000e01ccc624$c9349310$5b9db930$%cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:22194 "EHLO
	TX2EHSOBE009.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751084Ab2ABNmf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 08:42:35 -0500
Content-Disposition: inline
In-Reply-To: <000e01ccc624$c9349310$5b9db930$%cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: KyongHo Cho <pullip.cho@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Subash Patel' <subash.ramaswamy@linaro.org>, 'Younglak Kim' <younglak1004.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Sanghyun Lee' <sanghyun75.lee@samsung.com>

Hi,

On Thu, Dec 29, 2011 at 09:24:18PM +0900, KyongHo Cho wrote:
> Changes since v7:
> - Rebased with the recent commits of the following git branches
>   * git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/next
>   * git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git/for-next
> - Changed magic numbers into macros
> - Setting owner of a System MMU in 'iommu' field of dev_archdata
> - Verbose message in the default fault handler
> - Some bug fixes.

I still get 

  LD      .tmp_vmlinux1
/data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ld: no machine record defined
/data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ld: no machine record defined
/data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ld: no machine record defined
make[1]: *** [.tmp_vmlinux1] Error 1

when trying to compile ARM/Exynos with 3.2-rc7. Am I doing something
wrong or is this not expected to work?


	Joerg

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632
