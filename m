From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [RFC PATCH] phy: samsung: move the Samsung specific phy files to
 "samsung" directory
Date: Mon, 13 Mar 2017 08:18:43 +0900
Message-ID: <12173d9d-1fd3-139e-a016-17348e79b33e@samsung.com>
References: <CGME20170309113312epcas5p3eceb2a9cce9fc8ff6871bee7b45dc15e@epcas5p3.samsung.com>
 <20170309113311.15345-1-jh80.chung@samsung.com> <58C142F6.2030708@ti.com>
 <CAFp+6iGj=me4uOpOy338oxiAi=0sLW4WnkCzzAMELkxp=ZmrVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54598 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755789AbdCLXSr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2017 19:18:47 -0400
In-reply-to: <CAFp+6iGj=me4uOpOy338oxiAi=0sLW4WnkCzzAMELkxp=ZmrVA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, krzk@kernel.org, kamil@wypas.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, javier@osg.samsung.com, linux-samsung-soc@vger.kernel.org

Hi Vivek,

On 03/12/2017 06:18 PM, Vivek Gautam wrote:
> Hi Kishon,
> 
> 
> On Thu, Mar 9, 2017 at 5:26 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>> Hi,
>>
>> On Thursday 09 March 2017 05:03 PM, Jaehoon Chung wrote:
>>> Make the "samsung" directory and move the Samsung specific files to
>>> there for maintaining the files relevant to Samsung.
>>
>> The number of phy drivers in drivers/phy is getting unmanageable. I think this
>> is a good step to make it a little better. Can you also add a MAINTAINER for
>> drivers/phy/samsung?
> 
> I remember making a similar attempt in past [1], but that time we couldn't
> reach an agreement as to whether group the phy drivers based on
> vendors or based on the type of phy.
> 
> If you are fine with grouping the drivers for each vendor, I hope you can
> consider picking that patch (I can respin the patch based on linux-phy/next).
> Other driver maintainers were also cool with that older patch.
> 
> Let me know your comments.
> 
> [1] https://patchwork.kernel.org/patch/8762561/

I didn't know you had already sent the patches.
My RFC patch can be dropped. I think it's good way.

Best Regards,
Jaehoon Chung

> 
> Regards
> Vivek
> 
>>
>> Thanks
>> Kishon
>>>
>>> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
>>> ---
>>>  drivers/phy/Kconfig                               | 96 +----------------------
>>>  drivers/phy/Makefile                              | 14 +---
>>>  drivers/phy/samsung/Kconfig                       | 92 ++++++++++++++++++++++
>>>  drivers/phy/samsung/Makefile                      | 11 +++
>>>  drivers/phy/{ => samsung}/phy-exynos-dp-video.c   |  0
>>>  drivers/phy/{ => samsung}/phy-exynos-mipi-video.c |  0
>>>  drivers/phy/{ => samsung}/phy-exynos-pcie.c       |  0
>>>  drivers/phy/{ => samsung}/phy-exynos4210-usb2.c   |  0
>>>  drivers/phy/{ => samsung}/phy-exynos4x12-usb2.c   |  0
>>>  drivers/phy/{ => samsung}/phy-exynos5-usbdrd.c    |  0
>>>  drivers/phy/{ => samsung}/phy-exynos5250-sata.c   |  0
>>>  drivers/phy/{ => samsung}/phy-exynos5250-usb2.c   |  0
>>>  drivers/phy/{ => samsung}/phy-s5pv210-usb2.c      |  0
>>>  drivers/phy/{ => samsung}/phy-samsung-usb2.c      |  0
>>>  drivers/phy/{ => samsung}/phy-samsung-usb2.h      |  0
>>>  15 files changed, 108 insertions(+), 105 deletions(-)
>>>  create mode 100644 drivers/phy/samsung/Kconfig
>>>  create mode 100644 drivers/phy/samsung/Makefile
>>>  rename drivers/phy/{ => samsung}/phy-exynos-dp-video.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-exynos-mipi-video.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-exynos-pcie.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-exynos4210-usb2.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-exynos4x12-usb2.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-exynos5-usbdrd.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-exynos5250-sata.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-exynos5250-usb2.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-s5pv210-usb2.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-samsung-usb2.c (100%)
>>>  rename drivers/phy/{ => samsung}/phy-samsung-usb2.h (100%)
> 
> [snip]
> 
> 
> 
