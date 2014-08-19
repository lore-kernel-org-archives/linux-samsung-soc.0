From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Tue, 19 Aug 2014 12:40:39 -0700
Message-ID: <CAOesGMh-XRpX_U9s-BVE=BuOG-1EMDL+B_Dm1hdm+tcPQA9E-g@mail.gmail.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
	<53B0F6D1.4090006@samsung.com>
	<53C93FEB.2030507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:57565 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbaHSTkl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Aug 2014 15:40:41 -0400
Received: by mail-vc0-f171.google.com with SMTP id hq11so8070049vcb.30
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2014 12:40:40 -0700 (PDT)
In-Reply-To: <53C93FEB.2030507@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Przemyslaw Marczak <p.marczak@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

ODROID-U3 has been broken in mainline for quite a while. Have patches
been posted for this already?

http://arm-soc.lixom.net/bootlogs/mainline/v3.17-rc1/odroidu3-arm-exynos_defconfig.html
 for one of the latest boots that failed.



-Olof

On Fri, Jul 18, 2014 at 8:40 AM, Przemyslaw Marczak
<p.marczak@samsung.com> wrote:
> Hello,
>
>
> On 06/30/2014 07:34 AM, Marek Szyprowski wrote:
>>
>> Hello,
>>
>> On 2014-06-25 15:26, Marek Szyprowski wrote:
>>>
>>> Hello,
>>>
>>> This is the second version of the initial patch series adding support
>>> for Exynos 4412 based Odroid X2 and U2/U3/U3+ boards and improving
>>> support for Odroid X.
>>>
>>> Complete USB support for Odroid U2/U3/U3+ still requires some fixes in
>>> Exynos4 USB2 Phy driver and clock driver for CLKOUT:
>>> http://thread.gmane.org/gmane.linux.kernel/1731843/
>>> http://www.spinics.net/lists/linux-usb/msg109587.html
>>> The above changes however don't affect Odroid DTS files, but without
>>> them, usb3503 hub is not yet functional.
>>>
>>> Support for audio codec will be posted separately by Sylwester Nawrocki
>>> soon. Support for HDMI video output will be also posted separately
>>> together with the required ExynosDRM-HDMI fixes.
>>>
>>> If one is interested in more complete and open-source Odroid board
>>> support, there are also patches for u-boot project:
>>>
>>> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/188295/focus=188610
>>>
>>
>> Just to let everyone knows - updated Odroid patches for uboot has been
>> posted in the following thread:
>> http://www.mail-archive.com/u-boot@lists.denx.de/msg141234.html
>> You can also download them here:
>> http://patchwork.ozlabs.org/project/uboot/list/?submitter=23519
>>
>> Best regards
>
>
> Please follow the link to the new U-boot Odroid U3/X2 patches:
>
> http://www.mail-archive.com/u-boot@lists.denx.de/msg142507.html
>
> Regards,
> --
> Przemyslaw Marczak
> Samsung R&D Institute Poland
> Samsung Electronics
> p.marczak@samsung.com
