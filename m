From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/3] ARM: Samsung: Move timer irq numbers to end of linux
 irq	space
Date: Mon, 24 Oct 2011 10:09:09 +0200
Message-ID: <4EA51D25.9060802@samsung.com>
References: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org> <1318234289-22041-2-git-send-email-thomas.abraham@linaro.org> <001001cc8d6d$5c48fa60$14daef20$%youn@samsung.com> <017001cc8fd7$c27e4ee0$477aeca0$%kim@samsung.com> <20111021194517.GA3722@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52590 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753724Ab1JXIJQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Oct 2011 04:09:16 -0400
Received: by bkbzt19 with SMTP id zt19so7875934bkb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2011 01:09:14 -0700 (PDT)
In-Reply-To: <20111021194517.GA3722@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Changhwan Youn' <chaos.youn@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rob.herring@calxeda.com, patches@linaro.org, 'Nicolas Pitre' <nicolas.pitre@linaro.org>


On 10/21/11 21:45, Grant Likely wrote:
> On Fri, Oct 21, 2011 at 06:56:52PM +0900, Kukjin Kim wrote:
>> Changhwan Youn wrote:
>>>
>>> Hi Thomas,
>>>
>>> All UART_IRQ_RXD, TXD, ERR of Samsung's platforms are also statically
>>> mapped to linux irq numbers 16 to 31. These interrupts also need proper
>> handling.
>>>
>>> Best regards,
>>> Changhwan Youn
>>>
>>
>> Hi all,
>>
>> Hmm, I'd like to apply Thomas' device tree series for EXYNOS4 and Samsung
>> stuff for upcoming merge window but there are still some comments on some
>> stuff and that should be fixed before applying. In addition I need to keep
>> the ordering to apply them to avoid conflicts. But as you know, v3.1 is now
>> close at hand and we don't have enough time for it now :(
>>
>> I will leave tomorrow morning (KST) for KS. I will talk to Grant Likely
>> about this in Prague :)
>
> One of the goals I have for the hacking summit is to get as much of
> the outstanding DT patches queued up and into linux-next.
>
OK.

I talked to Grant at ARM Subarch Workshop.

I will apply Thomas' DT patches into Samsung tree and it will be sent to 
upstream via arm-soc for upcoming merge window v3.2 and if any fixing is 
required, we will do it during -rc.

Thomas, if any problems during apply, let you know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
