From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH] ARM: dts: add "simple-bus" to "arm, amba-bus"
 compatible nodes
Date: Thu, 03 Mar 2016 10:12:55 +0000
Message-ID: <1456999975.2856.18.camel@linaro.org>
References: <1456804620-8750-1-git-send-email-yamada.masahiro@socionext.com>
	 <20160301114610.GB30602@leverpostej>
	 <CAK7LNAQzkg5F8wUeF+p30jf9CrpNxi7UTNfqXQgybP2XbEKJag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQzkg5F8wUeF+p30jf9CrpNxi7UTNfqXQgybP2XbEKJag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, David Brown <david.brown@linaro.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, linux-soc@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 2016-03-03 at 12:07 +0900, Masahiro Yamada wrote:
[...]
> This patch is derived from Rob Herring' comment
> "BTW, we should also kill off "amba-bus" which is an ambiguous term"
> in the following thread:
> http://lkml.iu.edu/hypermail/linux/kernel/1601.0/01822.html
> 
> 
> So, the plan would be like this:
> 
> [1] Make device trees not depend on "arm,amba-bus"   (this commit)
> [2] New device trees should no longer use "arm,amba-bus" alone.
> [3] Go though some releases until we do not care about the backward
> compatibility

Why would we stop caring about backwards compatibility? If I was a user
of any of the platforms in question and updated my kernel, I wouldn't
expect to have to debug why it was broken, then install a new dtb to fix
it - which may be a tricky thing to do, depending on the firmware used
to boot Linux.

> [4] Drop "arm,amba-bus" from of_default_bus_match_table

-- 
Tixy
