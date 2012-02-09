From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: Exynos4: Add cpu-offset property in gic device
 tree node
Date: Thu, 09 Feb 2012 19:23:25 +0900
Message-ID: <067c01cce714$db77de90$92679bb0$%kim@samsung.com>
References: <1328023789-4672-1-git-send-email-thomas.abraham@linaro.org>
 <4F2819D0.7090002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64893 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757672Ab2BIKXY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 05:23:24 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ40055RFINMNZ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 19:23:23 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400E2HFIZRRL0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 19:23:23 +0900 (KST)
In-reply-to: <4F2819D0.7090002@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Karol Lewandowski' <k.lewandowsk@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

Karol Lewandowski wrote:
> 
> On 31.01.2012 16:29, Thomas Abraham wrote:
> > Commit db0d4db22a78 ('ARM: gic: allow GIC to support non-banked setups)
> > requires a cpu-offset property to be specified for non-banked gic
> > controllers, which is the case for Exynos4.
> >
> > Reported-by: Karol Lewandowski<k.lewandowski@samsung.com>
> 
> ( Minor note - my email address lacks 'i' at the end, i.e. it's
>    k.lewandowsk@ :)
> 
> > Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
> > ---
> > This patch solves the issue of boot failure with SMP enabled kernel for
> > Exynos4 device tree enabled machine.
> 
> Tested-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> 
Applied with fixing Karol's e-mail address.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
