From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [rtc-linux] Re: [PATCH v3 5/5] drivers/rtc/rtc-s5m.c: add support
 for S2MPS15 RTC
Date: Wed, 28 Oct 2015 16:00:58 +0530
Message-ID: <5630A3E2.9010207@samsung.com>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-6-git-send-email-alim.akhtar@samsung.com>
 <56302514.4090407@samsung.com> <20151028015323.GZ28319@sirena.org.uk>
 <56303054.8060804@samsung.com> <56303DA3.5020306@samsung.com>
 <5630419F.1000300@samsung.com> <20151028094853.GM22331@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37942 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755647AbbJ1Kjx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 06:39:53 -0400
In-reply-to: <20151028094853.GM22331@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, lee.jones@linaro.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

Hi Alexandre,

On 10/28/2015 03:18 PM, Alexandre Belloni wrote:
> On 28/10/2015 at 12:31:43 +0900, Krzysztof Kozlowski wrote :
>> The s2mps13 clock driver added new name and compatible... which was
>> probably totally unneeded (I missed that during review). We don't have
>> to make this as a rule...
>>
>> Since we do not have any data about future workarounds and the
>> differences then just follow Ockham's razor - use the same name and
>> compatible.
>>
>
> So you don't care about DT backward compatibility because when a
> workaround will be needed for one of the IPs, then you will have to
> update the old dtb to use it.
>
> Unless you are sure that the IP is the same, doing
>
> { "s2mps15-rtc",	S2MPS14X },
>
> is probably the best way to handle that. Note that I personally don't
> care about the DT ABI, I'm just pointing out what may happen ;)
>
Thats what my point is, anyway I am still looking into the fine prints 
of the s2mps15 and s2mps14 user manual, now I have found at least one 
difference in their one of the register bit, which might be a good 
reason to keep s2mps15-rtc device.
Will update the same in v4.
Thanks,
