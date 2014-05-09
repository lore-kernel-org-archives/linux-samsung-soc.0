From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2.1 3/9] ARM: S3C24XX: enable usage of common dclk if
 common clock framework is enabled
Date: Sat, 10 May 2014 01:11:45 +0200
Message-ID: <536D60B1.2070906@gmail.com>
References: <2104342.rkElQpXtvM@phil> <1399654181.19276.2.camel@x220> <536D1611.4010301@gmail.com> <1428172.jtv2HGWM9N@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:36633 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752172AbaEIXL4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 19:11:56 -0400
Received: by mail-ee0-f54.google.com with SMTP id b57so3050712eek.27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 May 2014 16:11:55 -0700 (PDT)
In-Reply-To: <1428172.jtv2HGWM9N@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Hi Heiko,

On 10.05.2014 01:07, Heiko St=FCbner wrote:
> Am Freitag, 9. Mai 2014, 19:53:21 schrieb Tomasz Figa:
>> On 09.05.2014 18:49, Paul Bolle wrote:
>>> On Wed, 2014-04-23 at 22:09 +0200, Heiko St=FCbner wrote:
>>>> Add platform device and select the correct implementation automati=
cally
>>>> depending on wether the old samsung_clock or the common clock fram=
ework
>>>> is enabled.
>>>>
>>>> This is only done for machines already using the old dclk implemen=
tation,
>>>> as everybody else should move to use dt anyway.
>>>>
>>>> The machine-specific settings for the external clocks will have to=
 be set
>>>> by somebody with knowledge about the specific hardware.
>>>>
>>>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>>>
>>> It seems this one just hit linux-next (in next-20140509).
>>
>> Which is bad, because:
>> a) it conflicts with patches already applied in samsung-clk tree,
>
> I remember seeing patches regarding more than one clk-samsung clock p=
roviders.
> Do you need any additional changes for s3c24xx from me for this?
>

Yes, that's the problem here. If you could do it, I would appreciate it=
,=20
but if you don't have time then I can handle this. The changes needed=20
are mostly trivial - basically every common samsung_clk function gets=20
new argument to a context structure. The branch to base on would be=20
for_3.16/exynos5260 in samsung-clk tree.

>
>> b) the DT binding added by patch 4/9 has not been acked .
>
> I'm not 100% sure if this is necessary, as the binding is similar to =
most
> other Samsung bindings and looking through recent clock binding chang=
es I
> didn't find any that seemed to have a special dt-maintainer ack - inc=
luding
> Exynos ones. Also if I remember correctly there was this "if we don't=
 respond,
> carry on" policy around :-) .
>

Well, for me this could go as is, but rules should be followed and the=20
rules are ACK or 3 weeks and a ping without response. So we need to wai=
t=20
at least to next Wednesday to bypass DT review.

Best regards,
Tomasz
