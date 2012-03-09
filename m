From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/6] ARM: S3C64XX: Add usb otg phy control
Date: Fri, 09 Mar 2012 07:35:22 -0800
Message-ID: <4F5A233A.8080900@samsung.com>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com> <1328870146-20312-2-git-send-email-l.majewski@samsung.com> <20120210182639.GB11701@sirena.org.uk> <4F575452.4090201@samsung.com> <4F58816F.2030004@samsung.com> <4F5897A2.807@samsung.com> <20120308142033.2acb142e@lmajewski.digital.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:64211 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754715Ab2CIPf1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 10:35:27 -0500
Received: by gghe5 with SMTP id e5so901939ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 07:35:27 -0800 (PST)
In-Reply-To: <20120308142033.2acb142e@lmajewski.digital.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 03/08/12 05:20, Lukasz Majewski wrote:
> Hi Joonyoung,
>
> On Thu, 8 Mar 2012 12:27:30 +0100
> Joonyoung Shim<jy0922.shim@samsung.com>  wrote:
>
>> On 03/08/2012 06:52 PM, Kukjin Kim wrote:
>>> On 03/07/12 04:28, Kukjin Kim wrote:
>>>> On 02/10/12 10:26, Mark Brown wrote:
>>>>> On Fri, Feb 10, 2012 at 11:35:41AM +0100, Lukasz Majewski wrote:
>>>>>> From: Joonyoung Shim<jy0922.shim@samsung.com>
>>>>>>
>>>>>> This patch supports to control usb otg phy of S3C64XX.
>>>>>> Currently, the driver for usb otg controls usb otg phy but it
>>>>>> can be removed by this patch.
>>>>>
>>>>> Acked-by: Mark Brown<broonie@opensource.wolfsonmicro.com>
>>>>
>>>> Applied, thanks.
>>>>
>>>
>>> Oops, following error happened with s5pv210_defconfig after
>>> applying this.
>>>
>>> arch/arm/plat-samsung/built-in.o: In function
>>> `s3c_hsotg_set_platdata': arch/arm/plat-samsung/devs.c:1449:
>>> undefined reference to `s5p_usb_phy_init'
>>> arch/arm/plat-samsung/devs.c:1449: undefined reference to
>>> `s5p_usb_phy_init'
>>> arch/arm/plat-samsung/devs.c:1451: undefined reference to
>>> `s5p_usb_phy_exit'
>>> arch/arm/plat-samsung/devs.c:1451: undefined reference to
>>> `s5p_usb_phy_exit'
>>> make: *** [.tmp_vmlinux1] Error 1
>>>
>>
>> Also the s5pv210 needs setup-usb-phy.c file. I think the attached
>> patch will solve this errors. This patch was tested only compile.
>>
>> Thanks.
>
> Thank you for the patch.
>
> I've extended your's patch by adding GONI dependent platform code.
>
> It has been tested and works with s3c-hsotg driver.
>
> Test HW:
> GONI S5PC110
>
> Tested-by: Lukasz Majewski<l.majewski@samsung.com>
>
Looks good to me.
Applied, Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
