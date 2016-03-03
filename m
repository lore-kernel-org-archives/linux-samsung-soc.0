From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] ARM: dts: add "simple-bus" to "arm,amba-bus" compatible nodes
Date: Thu, 3 Mar 2016 12:07:32 +0900
Message-ID: <CAK7LNAQzkg5F8wUeF+p30jf9CrpNxi7UTNfqXQgybP2XbEKJag@mail.gmail.com>
References: <1456804620-8750-1-git-send-email-yamada.masahiro@socionext.com>
	<20160301114610.GB30602@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160301114610.GB30602@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: arm@kernel.org, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, David Brown <david.brown@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Wei Xu <xuwei5@hisilicon.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-soc@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,


2016-03-01 20:46 GMT+09:00 Mark Rutland <mark.rutland@arm.com>:
> On Tue, Mar 01, 2016 at 12:57:00PM +0900, Masahiro Yamada wrote:
>> The "arm,amba-bus" string in the of_default_bus_match_table is
>> ambiguous.  This prepares for killing it off in a long run.
>
> I don't follow the purpose of this patch.
>
> There's no way we can remove kernel-side support for "arm,amba-bus", as
> there are DTBs that rely on it.
>
> If we're going to merge "arm,amba-bus" in the kernel with "simple-bus",
> such that there is no distinction between the two, then that doesn't
> require any DTBs to be updated.
>
> The only reason I would see for changing dts files would be a subsequent
> clean-up for consistency, but at that point "arm,amba-bus" could be
> dropped entirely.
>
> So this patch makes no sense to me.
>
> Thanks,
> Mark.
>

This patch is derived from Rob Herring' comment
"BTW, we should also kill off "amba-bus" which is an ambiguous term"
in the following thread:
http://lkml.iu.edu/hypermail/linux/kernel/1601.0/01822.html


So, the plan would be like this:

[1] Make device trees not depend on "arm,amba-bus"   (this commit)
[2] New device trees should no longer use "arm,amba-bus" alone.
[3] Go though some releases until we do not care about the backward
compatibility
[4] Drop "arm,amba-bus" from of_default_bus_match_table


No?


-- 
Best Regards
Masahiro Yamada
