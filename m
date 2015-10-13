From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos5422-odroidxu3: Added UHS-I bus speed
 support
Date: Tue, 13 Oct 2015 12:43:45 +0900
Message-ID: <561C7DF1.6000609@samsung.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
 <1444578364-1384-3-git-send-email-linux.amoon@gmail.com>
 <561B48B7.1040201@samsung.com>
 <CANAwSgSLFviT4ZNXTYwxYs2pbrr9ozJmPMauhgRPO0556Rsr_g@mail.gmail.com>
 <561C4CEE.3050905@samsung.com>
 <CANAwSgRJ+5O-x61K9E_AxTZWQy3jJrKF5MiLtWRdUU29CCfa-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31217 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752009AbbJMDoE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 23:44:04 -0400
In-reply-to: <CANAwSgRJ+5O-x61K9E_AxTZWQy3jJrKF5MiLtWRdUU29CCfa-Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 13.10.2015 12:08, Anand Moon wrote:
> Hi Krzysztof,
> 
> On 13 October 2015 at 05:44, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> On 13.10.2015 00:32, Anand Moon wrote:
>>> Hi Krzysztof,
>>>
>>> On 12 October 2015 at 11:14, Krzysztof Kozlowski
>>> <k.kozlowski@samsung.com> wrote:
>>>> On 12.10.2015 00:46, Anand Moon wrote:
>>>>> Added support for UHS-I bus speed 50MB/s (SDR50, DDR50) 104MB/s (SDR104)
>>>>
>>>> This description is not entirely correct. The MMC driver already
>>>> supports these UHS speeds (you did not any code) so you rather enabled
>>>> it (description of bindings says "is supported").
>>>>
>>>> You mentioned DDR50 but I don't see respective property below.
>>>>
>>>> How do you know that these modes are really supported? I don't know. Can
>>>> you convince me?
>>>
>>> Setting this DDR50 capability give me this error. That's the reason to
>>> drop this capability.
>>
>> But you mentioned it in commit message! "Added support for UHS-I ...
>> (DDR50)"
>>
>> In the same time dropping DDR50 is not an sufficient proof that "SDR50
>> and SDR104 are really supported".
>>
> 
> These changes are related to the microSD card capabilities.
> So SDR50 have better frequency over DDR50. On the same Sandisk card.
> 
> When the card select the capability for DDR50
> ---------------------------------------------------
> [    4.001477] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot
> req 50000000Hz, actual 50000000HZ div = 0)
> [    4.001604] mmc1: new ultra high speed DDR50 SDHC card at address aaaa
> [    4.004505] mmcblk0: mmc1:aaaa SL32G 29.7 GiB
> [    4.009179] mmcblk0: error -110 sending status command, retrying
> [    4.009271] mmcblk0: error -115 sending stop command, original cmd
> response 0x900, card status 0x900
> [    4.009275] mmcblk0: error -84 transferring data, sector 0, nr 8,
> cmd response 0x900, card status 0x0
> [    4.025563] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot
> req 400000Hz, actual 396825HZ div = 63)
> [    4.067770] Console: switching to colour frame buffer device 274x77
> [    4.098782] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot
> req 50000000Hz, actual 50000000HZ div = 0)
> [    4.099692] mmc1: tried to reset card
> [    4.101332]  mmcblk0: p1 p2
> 
> 
> When the card select the capability for SDR50
> ---------------------------------------------------------------------------------
> [ 2.439806] mmc_host mmc1: Bus speed (slot 0) = 100000000Hz (slot req
> 100000000Hz, actual 100000000HZ div = 0)
> [ 2.449729] mmc1: new ultra high speed SDR50 SDHC card at address aaaa
> [ 2.455984] mmcblk0: mmc1:aaaa SL32G 29.7 GiB
> [ 2.461743] mmcblk0: p1 p2
> 
> Which will relate to better read/write speed.

Which is not an answer to my question. To none of my previous questions.

Best regards,
Krzysztof
