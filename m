From: Tony K Nadackal <tony.kn@samsung.com>
Subject: RE: [PATCH v2 0/2] Adding support for Exynos7 Jpeg variant
Date: Mon, 05 Jan 2015 10:45:11 +0530
Message-ID: <000301d028a6$9c290300$d47b0900$@samsung.com>
References: <1418974680-5837-1-git-send-email-tony.kn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13844 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751023AbbAEFOk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 00:14:40 -0500
In-reply-to: <1418974680-5837-1-git-send-email-tony.kn@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: mchehab@osg.samsung.com, j.anaszewski@samsung.com, kgene@kernel.org, k.debski@samsung.com, s.nawrocki@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, bhushan.r@samsung.com, tony.kn@samsung.com

Gentle Reminder.

Thanks,
Tony

> -----Original Message-----
> From: Tony K Nadackal [mailto:tony.kn@samsung.com]
> Sent: Friday, December 19, 2014 1:08 PM
> To: linux-media@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; devicetree@vger.kernel.org
> Cc: mchehab@osg.samsung.com; j.anaszewski@samsung.com;
> kgene@kernel.org; k.debski@samsung.com; s.nawrocki@samsung.com;
> robh+dt@kernel.org; mark.rutland@arm.com; bhushan.r@samsung.com; Tony K
> Nadackal
> Subject: [PATCH v2 0/2] Adding support for Exynos7 Jpeg variant
> 
> This patch series adds support for Exynos7 JPEG variant, which is mostly same
as
> Exynos4 JPEG variants with few register configuration differences.
> At the same time it modifies #define based JPEG variant macros into enum.
> Patch 1/2 fixes possible bug in setting INT EN register, where
> EXYNOS4_INT_EN_REG was getting modified without reading before.
> 
> Patch set v1 and related discussion can be found here [1].
> 
> [1]: http://www.spinics.net/lists/linux-samsung-soc/msg40308.html
> 
> Changes since v1:
>  - Added new patch 1/2 which fixes issues in writing EXYNOS4_INT_EN_REG.
>  - Converted JPEG variant macros into enum as suggested by Jacek Anaszewski.
> 
> 
> Tony K Nadackal (2):
>   [media] s5p-jpeg: Fix modification sequence of interrupt enable
>     register
>   [media] s5p-jpeg: Adding Exynos7 Jpeg variant
> 
>  .../bindings/media/exynos-jpeg-codec.txt           |  2 +-
>  drivers/media/platform/s5p-jpeg/jpeg-core.c        | 61 ++++++++++++++++++---
> -
>  drivers/media/platform/s5p-jpeg/jpeg-core.h        | 10 ++--
>  drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c  | 33 +++++++-----
> drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.h  |  8 +--
>  drivers/media/platform/s5p-jpeg/jpeg-regs.h        | 17 ++++--
>  6 files changed, 95 insertions(+), 36 deletions(-)
> 
> --
> 2.2.0
