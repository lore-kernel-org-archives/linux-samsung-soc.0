From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2.1 3/9] ARM: S3C24XX: enable usage of common dclk if
 common clock framework is enabled
Date: Fri, 09 May 2014 19:53:21 +0200
Message-ID: <536D1611.4010301@gmail.com>
References: <2104342.rkElQpXtvM@phil> <3888936.TSFL3ZW3mv@phil> <3835735.0k9HAgQHzN@phil> <1399654181.19276.2.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:45573 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756942AbaEIRxc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 13:53:32 -0400
Received: by mail-ee0-f42.google.com with SMTP id d49so2924954eek.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 May 2014 10:53:31 -0700 (PDT)
In-Reply-To: <1399654181.19276.2.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

On 09.05.2014 18:49, Paul Bolle wrote:
> On Wed, 2014-04-23 at 22:09 +0200, Heiko St=C3=BCbner wrote:
>> Add platform device and select the correct implementation automatica=
lly
>> depending on wether the old samsung_clock or the common clock framew=
ork
>> is enabled.
>>
>> This is only done for machines already using the old dclk implementa=
tion,
>> as everybody else should move to use dt anyway.
>>
>> The machine-specific settings for the external clocks will have to b=
e set
>> by somebody with knowledge about the specific hardware.
>>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
> It seems this one just hit linux-next (in next-20140509).
>

Which is bad, because:
a) it conflicts with patches already applied in samsung-clk tree,
b) the DT binding added by patch 4/9 has not been acked .

Kukjin, might I ask you to drop this series from your tree and let me=20
send you a pull request with necessary dependencies and this series=20
applied properly to resolve merge conflicts, as I suggested before in=20
one of my replies to this thread?

Best regards,
Tomasz
