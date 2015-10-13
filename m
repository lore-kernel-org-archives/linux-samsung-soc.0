From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos5422-odroidxu3: Added UHS-I bus speed
 support
Date: Tue, 13 Oct 2015 09:14:38 +0900
Message-ID: <561C4CEE.3050905@samsung.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
 <1444578364-1384-3-git-send-email-linux.amoon@gmail.com>
 <561B48B7.1040201@samsung.com>
 <CANAwSgSLFviT4ZNXTYwxYs2pbrr9ozJmPMauhgRPO0556Rsr_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29368 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752755AbbJMAOp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 20:14:45 -0400
In-reply-to: <CANAwSgSLFviT4ZNXTYwxYs2pbrr9ozJmPMauhgRPO0556Rsr_g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 13.10.2015 00:32, Anand Moon wrote:
> Hi Krzysztof,
> 
> On 12 October 2015 at 11:14, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> On 12.10.2015 00:46, Anand Moon wrote:
>>> Added support for UHS-I bus speed 50MB/s (SDR50, DDR50) 104MB/s (SDR104)
>>
>> This description is not entirely correct. The MMC driver already
>> supports these UHS speeds (you did not any code) so you rather enabled
>> it (description of bindings says "is supported").
>>
>> You mentioned DDR50 but I don't see respective property below.
>>
>> How do you know that these modes are really supported? I don't know. Can
>> you convince me?
> 
> Setting this DDR50 capability give me this error. That's the reason to
> drop this capability.

But you mentioned it in commit message! "Added support for UHS-I ...
(DDR50)"

In the same time dropping DDR50 is not an sufficient proof that "SDR50
and SDR104 are really supported".

Best regards,
Krzysztof
