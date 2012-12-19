From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: EXYNOS: Fix NULL pointer dereference bug in Origen
Date: Tue, 18 Dec 2012 20:12:52 -0800
Message-ID: <002401cddd9f$1e3c9dc0$5ab5d940$@samsung.com>
References: <1355743461-21535-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44097 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754265Ab2LSEMz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Dec 2012 23:12:55 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MF900CRDFPI8WB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 13:12:54 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MF900EI2FPGTWA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 13:12:54 +0900 (KST)
In-reply-to: <1355743461-21535-1-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> When DRM support for Samsung SoC and Samsung S3C framebuffer support
> are selected, the kernel crashes as it does not get the required
> platform data. Change the compile macro to CONFIG_DRM_EXYNOS_FIMD
> to fix this.
> 
> Without this patch the following crash occurs during bootup:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000000
> PC is at 0x0
> LR is at s3c_fb_probe+0x198/0x788
> [<c01520e8>] (s3c_fb_probe+0x198/0x788) from [<c01a3dd4>]
> (platform_drv_probe+0x18/0x1c)
> [<c01a3dd4>] (platform_drv_probe+0x18/0x1c) from [<c01a2b8c>]
> (driver_probe_device+0x70/0x1f0)
> [<c01a2b8c>] (driver_probe_device+0x70/0x1f0) from [<c01a2d98>]
> (__driver_attach+0x8c/0x90)
> [<c01a2d98>] (__driver_attach+0x8c/0x90) from [<c01a14e4>]
> (bus_for_each_dev+0x50/0x7c)
> [<c01a14e4>] (bus_for_each_dev+0x50/0x7c) from [<c01a23f4>]
> (bus_add_driver+0x170/0x23c)
> [<c01a23f4>] (bus_add_driver+0x170/0x23c) from [<c01a324c>]
> (driver_register+0x78/0x144)
> [<c01a324c>] (driver_register+0x78/0x144) from [<c000862c>]
> (do_one_initcall+0x34/0x174)
> [<c000862c>] (do_one_initcall+0x34/0x174) from [<c01de210>]
> (kernel_init+0x100/0x2a0)
> [<c01de210>] (kernel_init+0x100/0x2a0) from [<c000e118>]
> (ret_from_fork+0x14/0x3c)
> 
Look OK on this whole series. Will apply.

Thanks.

- Kukjin
