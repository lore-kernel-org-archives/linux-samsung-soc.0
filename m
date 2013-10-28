From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: disable PCIe for SD5v1 board
Date: Mon, 28 Oct 2013 08:12:54 -0700
Message-ID: <526E7EF6.3020400@samsung.com>
References: <000301cea9fe$619d2900$24d77b00$%han@samsung.com>	<CAOesGMjuzKxi_j5pASteHaNXoNQ=nURLPRk5b6pbNLmCPC+txw@mail.gmail.com>	<000101ced39f$b553ec80$1ffbc580$%han@samsung.com> <CAOesGMgCgZuAdnYHKGoBNLNCrCX0mERHMsuLOuoTPs=RWPsWMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:35904 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756004Ab3J1Pxb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Oct 2013 11:53:31 -0400
Received: by mail-oa0-f44.google.com with SMTP id l20so3813832oag.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Oct 2013 08:53:31 -0700 (PDT)
In-Reply-To: <CAOesGMgCgZuAdnYHKGoBNLNCrCX0mERHMsuLOuoTPs=RWPsWMA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 10/28/13 08:15, Olof Johansson wrote:
> On Sun, Oct 27, 2013 at 10:36 PM, Jingoo Han<jg1.han@samsung.com>  wrote:
>> On Monday, October 28, 2013 1:52 PM, Olof Johansson wrote:
>>> On Wed, Sep 4, 2013 at 11:08 PM, Jingoo Han<jg1.han@samsung.com>  wrote:
>>>> Disable PCIe for SD5v1 board, because there is no PCIe slot
>>>> on SD5v1 board.
>>>>
>>>> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
>>>> ---
>>>> Tested on SD5v1 board.
>>>>
>>>>   arch/arm/boot/dts/exynos5440-sd5v1.dts |    7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
>>>> index 5b22508..78a239d 100644
>>>> --- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
>>>> +++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
>>>> @@ -36,4 +36,11 @@
>>>>                  status = "disabled";
>>>>          };
>>>>
>>>> +       pcie@290000 {
>>>> +               status = "disabled";
>>>> +       };
>>>> +
>>>> +       pcie@2a0000 {
>>>> +               status = "disabled";
>>>> +       };
>>>>   };
>>>
>>> Usually IP blocks like these are always left disabled in the dtsi, and
>>> explicitly _enabled_ in the DTS on boards that make use of that part
>>> of the chip.
>>> So the real solution here should be to move the disabling to the 5440
>>> .dtsi instead.
>>
>> OK, right.
>> Thank you for your guidance.
>>
>> Then, do you mean the following?
>> If it is right, I will send the v2 patch.
>
> Yes, exactly!
>

Hmm...I thought both ways (#1 disabling something in soc dt, enabling in 
board dt if required, #2 enabling in soc dt, disabling in board dt if 
required) are possible but I have no strong objection with your 
suggestion. In addition, just one way is more clear to us :)

OK, I will keep the way for Samsung stuff.

Thanks,
Kukjin
