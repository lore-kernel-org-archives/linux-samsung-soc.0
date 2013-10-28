From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: disable PCIe for SD5v1 board
Date: Mon, 28 Oct 2013 09:30:49 -0700
Message-ID: <CAOesGMj8r_ETtSQU1mXnKfnKzbJp5R0w=umRRp9jZ+_TD_UaLg@mail.gmail.com>
References: <000301cea9fe$619d2900$24d77b00$%han@samsung.com>
	<CAOesGMjuzKxi_j5pASteHaNXoNQ=nURLPRk5b6pbNLmCPC+txw@mail.gmail.com>
	<000101ced39f$b553ec80$1ffbc580$%han@samsung.com>
	<CAOesGMgCgZuAdnYHKGoBNLNCrCX0mERHMsuLOuoTPs=RWPsWMA@mail.gmail.com>
	<526E7EF6.3020400@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:50820 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756894Ab3J1Qau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Oct 2013 12:30:50 -0400
Received: by mail-qc0-f179.google.com with SMTP id k18so3958254qcv.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Oct 2013 09:30:50 -0700 (PDT)
In-Reply-To: <526E7EF6.3020400@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Mon, Oct 28, 2013 at 8:12 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 10/28/13 08:15, Olof Johansson wrote:
>>
>> On Sun, Oct 27, 2013 at 10:36 PM, Jingoo Han<jg1.han@samsung.com>  wrote:
>>>
>>> On Monday, October 28, 2013 1:52 PM, Olof Johansson wrote:
>>>>
>>>> On Wed, Sep 4, 2013 at 11:08 PM, Jingoo Han<jg1.han@samsung.com>  wrote:
>>>>>
>>>>> Disable PCIe for SD5v1 board, because there is no PCIe slot
>>>>> on SD5v1 board.
>>>>>
>>>>> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
>>>>> ---
>>>>> Tested on SD5v1 board.
>>>>>
>>>>>   arch/arm/boot/dts/exynos5440-sd5v1.dts |    7 +++++++
>>>>>   1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts
>>>>> b/arch/arm/boot/dts/exynos5440-sd5v1.dts
>>>>> index 5b22508..78a239d 100644
>>>>> --- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
>>>>> +++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
>>>>> @@ -36,4 +36,11 @@
>>>>>                  status = "disabled";
>>>>>          };
>>>>>
>>>>> +       pcie@290000 {
>>>>> +               status = "disabled";
>>>>> +       };
>>>>> +
>>>>> +       pcie@2a0000 {
>>>>> +               status = "disabled";
>>>>> +       };
>>>>>   };
>>>>
>>>>
>>>> Usually IP blocks like these are always left disabled in the dtsi, and
>>>> explicitly _enabled_ in the DTS on boards that make use of that part
>>>> of the chip.
>>>> So the real solution here should be to move the disabling to the 5440
>>>> .dtsi instead.
>>>
>>>
>>> OK, right.
>>> Thank you for your guidance.
>>>
>>> Then, do you mean the following?
>>> If it is right, I will send the v2 patch.
>>
>>
>> Yes, exactly!
>>
>
> Hmm...I thought both ways (#1 disabling something in soc dt, enabling in
> board dt if required, #2 enabling in soc dt, disabling in board dt if
> required) are possible but I have no strong objection with your suggestion.
> In addition, just one way is more clear to us :)
>
> OK, I will keep the way for Samsung stuff.

It varies, in some cases it makes sense to make the default enabled
and just disable where needed, for example for entirely on-chip IP
blocks.

For things like PCI-e, where different board manufacturers might
choose to use it or not, it seems that keeping disabled by default is
sensible.


-Olof
