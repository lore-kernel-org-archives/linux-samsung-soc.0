From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] i2c: s3c2410: fix oops in suspend callback for non-dt
 platforms
Date: Wed, 06 May 2015 06:30:42 +0900
Message-ID: <55493682.6040309@kernel.org>
References: <1430676790-30500-1-git-send-email-anarsoul@gmail.com> <CAJKOXPd71vnup-RZYAh7UM2Tky2M64tA=u0Ydy=ti0yOC6h5aQ@mail.gmail.com> <55493607.3070400@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36928 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1946064AbbEEVas (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 17:30:48 -0400
In-Reply-To: <55493607.3070400@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vasily Khoruzhick <anarsoul@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org

On 05/06/15 06:28, Kukjin Kim wrote:
> On 05/04/15 08:50, Krzysztof Kozlowski wrote:
>> 2015-05-04 3:13 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
>>> Initialize sysreg by default, otherwise driver will crash in suspend callback.
>>>
>>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>>
>> I think the crash is possible if device node is missing in DT or pdata
>> is supplied. If you agree, could you add this information to commit
>> message, along with Cc-stable and Fixes tag?
>>
>> Anyway, the patch itself looks good:
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
> Can you please add me in Cc in your next posting?
> 
> I can't see the patch in my mail box...
> 
Oops, sorry for the noise. My email client had a problem and I can see
the patch now. Please kindly ignore the request :)

Thanks,
Kukjin
