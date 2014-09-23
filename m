From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH v5 0/8] arch: arm64: Enable support for Samsung Exynos7 SoC
Date: Tue, 23 Sep 2014 16:50:07 +0900
Message-ID: <013001cfd702$feb42900$fc1c7b00$@samsung.com>
References: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34240 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbaIWHuK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 03:50:10 -0400
In-reply-to: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <a.kesavan@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, catalin.marinas@arm.com
Cc: naveenkrishna.ch@gmail.com, kesavan.abhilash@gmail.com, tomasz.figa@gmail.com

Hi,

> -----Original Message-----
> From: linux-arm-kernel [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Abhilash Kesavan
> Sent: Monday, September 22, 2014 1:47 PM
> To: linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org;
> catalin.marinas@arm.com
> Cc: naveenkrishna.ch@gmail.com; kesavan.abhilash@gmail.com;
> tomasz.figa@gmail.com
> Subject: [PATCH v5 0/8] arch: arm64: Enable support for Samsung Exynos7
> SoC
> 
> Changes since v4:
> - Fixed comments from Tomasz Figa:
> 	- Changed the namespace prefix from exynos to samsung
> 	- Defined bindings to take all input clocks
> 	- Sorted the Kconfig entries alphabetically in clock Makefile
> 	- Used consistent 1 tab line breaks across the clock file
> 	- Statically initialized the samsung_cmu_info struct
> - Enabled exynos7 in the arm64 defconfig as per Catalin Marinas' comment.
> - Added Kukjin Kim's ack along with Thomas Abraham's tested and reviewed
> tags.
> 
> Changes since v3:
> - Removed aliases for serial controllers from dtsi file and moved it
>   into board specific dts file as suggested by Arnd.
> - Based this series on Robert Richter's patches for adding vendor
>   device tree sub-directories for arm64.
>   http://comments.gmane.org/gmane.linux.kbuild.devel/12131
> 
> This patchset supports the new Exynos7 Samsung SoC based on Cortex-A57.
> Exynos7 is a System-On-Chip (SoC) that is based on 64-bit ARMv8 RISC
> processor.
> 
> The following patches are tested based on linux-next tree (20140919).
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/
> 
> Following patches are required for this series:
> 1- "tty/serial: fix config dependencies for samsung serial"
>    https://www.mail-archive.com/linux-samsung-soc <at>
> vger.kernel.org/msg36208.html
> 2- "dts, kbuild: Implement support for dtb vendor subdirs" patchset
>    http://comments.gmane.org/gmane.linux.kbuild.devel/12131

Maybe you make this patch on top of the Robert's patch.
As I know, Robert's patch is not yet merged in mainline.
You should specify this dependency in mail thread.

[1]: https://lkml.org/lkml/2014/9/5/64

Best Regards,
Chanho Park
