From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/6] ARM: S3C64XX: Add usb otg phy control
Date: Thu, 08 Mar 2012 01:52:47 -0800
Message-ID: <4F58816F.2030004@samsung.com>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com> <1328870146-20312-2-git-send-email-l.majewski@samsung.com> <20120210182639.GB11701@sirena.org.uk> <4F575452.4090201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:34950 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755825Ab2CHJwy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 04:52:54 -0500
Received: by obbuo6 with SMTP id uo6so429120obb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 01:52:53 -0800 (PST)
In-Reply-To: <4F575452.4090201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 03/07/12 04:28, Kukjin Kim wrote:
> On 02/10/12 10:26, Mark Brown wrote:
>> On Fri, Feb 10, 2012 at 11:35:41AM +0100, Lukasz Majewski wrote:
>>> From: Joonyoung Shim<jy0922.shim@samsung.com>
>>>
>>> This patch supports to control usb otg phy of S3C64XX. Currently, the
>>> driver for usb otg controls usb otg phy but it can be removed by this
>>> patch.
>>
>> Acked-by: Mark Brown<broonie@opensource.wolfsonmicro.com>
>
> Applied, thanks.
>

Oops, following error happened with s5pv210_defconfig after applying this.

arch/arm/plat-samsung/built-in.o: In function `s3c_hsotg_set_platdata':
arch/arm/plat-samsung/devs.c:1449: undefined reference to `s5p_usb_phy_init'
arch/arm/plat-samsung/devs.c:1449: undefined reference to `s5p_usb_phy_init'
arch/arm/plat-samsung/devs.c:1451: undefined reference to `s5p_usb_phy_exit'
arch/arm/plat-samsung/devs.c:1451: undefined reference to `s5p_usb_phy_exit'
make: *** [.tmp_vmlinux1] Error 1

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
