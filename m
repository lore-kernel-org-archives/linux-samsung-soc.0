From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] ARM: dts: add "simple-bus" to "arm, amba-bus" compatible nodes
Date: Tue, 8 Mar 2016 14:54:54 +0900
Message-ID: <CAK7LNASi381k5H3usDj1oLr=uzn7VTMS1jquSVaVEjd5JxWt_g@mail.gmail.com>
References: <1456804620-8750-1-git-send-email-yamada.masahiro@socionext.com>
	<20160301114610.GB30602@leverpostej>
	<CAK7LNAQzkg5F8wUeF+p30jf9CrpNxi7UTNfqXQgybP2XbEKJag@mail.gmail.com>
	<1456999975.2856.18.camel@linaro.org>
	<CAL_JsqLBNo2YuJGqBo1DaYgzV7=WuX-0BPutoW3f3U1k0wX3_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from conssluserg003.nifty.com ([202.248.44.41]:49984 "EHLO
	conssluserg003-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751534AbcCHFzA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2016 00:55:00 -0500
In-Reply-To: <CAL_JsqLBNo2YuJGqBo1DaYgzV7=WuX-0BPutoW3f3U1k0wX3_w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "Jon Medhurst (Tixy)" <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, "arm@kernel.org" <arm@kernel.org>, David Brown <david.brown@linaro.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, linux-soc@vger.kernel.org, linux-arm-k

Hi Rob, Mark, Jon,


Setting aside the future plan, anyway we should avoid
relying on an undocumented compatible string.
(and we should avoid its spread as Rob pointed out.)

I rephrase the git-log  (no update in the code-diff).

Could you check v2, please?
https://patchwork.kernel.org/patch/8529701/

Better?





2016-03-04 5:23 GMT+09:00 Rob Herring <robh+dt@kernel.org>:
> On Thu, Mar 3, 2016 at 4:12 AM, Jon Medhurst (Tixy) <tixy@linaro.org> wrote:
>> On Thu, 2016-03-03 at 12:07 +0900, Masahiro Yamada wrote:
>> [...]
>>> This patch is derived from Rob Herring' comment
>>> "BTW, we should also kill off "amba-bus" which is an ambiguous term"
>>> in the following thread:
>>> http://lkml.iu.edu/hypermail/linux/kernel/1601.0/01822.html
>>>
>>>
>>> So, the plan would be like this:
>>>
>>> [1] Make device trees not depend on "arm,amba-bus"   (this commit)
>>> [2] New device trees should no longer use "arm,amba-bus" alone.
>>> [3] Go though some releases until we do not care about the backward
>>> compatibility
>>
>> Why would we stop caring about backwards compatibility? If I was a user
>> of any of the platforms in question and updated my kernel, I wouldn't
>> expect to have to debug why it was broken, then install a new dtb to fix
>> it - which may be a tricky thing to do, depending on the firmware used
>> to boot Linux.
>
> If no one notices, then there is no ABI. Things break all the time
> when nobody cares. It will be more than a few releases for sure. We
> may never get to step 3, but we should do step 1 so people stop
> copy-n-pasting this in step 2.
>
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
