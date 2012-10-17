From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/6] dts: exynos: add device tree support for exynos5
 mixer
Date: Wed, 17 Oct 2012 20:32:09 +0900
Message-ID: <006201cdac5b$0b7cebb0$2276c310$%kim@samsung.com>
References: <1350343834-23992-1-git-send-email-rahul.sharma@samsung.com>
 <1350343834-23992-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28875 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755175Ab2JQLcL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Oct 2012 07:32:11 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MC100BQ5C1FOPA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Oct 2012 20:32:10 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MC1009FPC1M2E20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Oct 2012 20:32:10 +0900 (KST)
In-reply-to: <1350343834-23992-3-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com

Rahul Sharma wrote:
> 
> This patch adds support for device tree based discovery for exynos5
> mixer. Mixer node is also renamed with "exynos5-mixer".
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  .../devicetree/bindings/drm/exynos/mixer.txt       |   15 +++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
>  arch/arm/mach-exynos/include/mach/map.h            |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
>  4 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/drm/exynos/mixer.txt
> 
Basically, same comments on your 1/6 patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
