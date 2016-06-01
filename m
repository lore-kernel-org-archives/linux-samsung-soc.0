From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 13/22] ARM: dts: exynos: Enable UART3 on Exynos5410
Date: Wed, 1 Jun 2016 22:06:21 +0200
Message-ID: <CAJKOXPcDZFaqL7+wT9d9iD7Y4QbZWPFQw2hTR3AzyU4K099WYA@mail.gmail.com>
References: <1464429273-23457-1-git-send-email-krzk@kernel.org>
	<1464429273-23457-14-git-send-email-krzk@kernel.org>
	<CAOi56cXeRjGgE+=psk7K45oeAgZ27HFxbi+an-ELnA3-_Z_BTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAOi56cXeRjGgE+=psk7K45oeAgZ27HFxbi+an-ELnA3-_Z_BTA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 1, 2016 at 9:57 PM, Kevin Hilman <khilman@kernel.org> wrote:
> Hi Krzysztof,
>
> On Sat, May 28, 2016 at 2:54 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> Just like other Exynos5 family SoCs, this one has four UARTs. Configure
>> clocks for UART3 and enable it.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
> This patch landed in linux-next[1] and kernelci.org found a boot
> regression on the exynos5410-odroidxu[2], where it looks like it's
> faulting in clk_prepare().  Bisecting pointed to this patch.  I added
> "status = disabled" back into the DTS on top of next-20160601[3] and
> verified my odroid-XU to be booting fine again.

Hi,

Thanks for report. Indeed the patch brings up to the light an issue in
serial driver. Fixed here:
https://lkml.org/lkml/2016/5/31/570

I left the commit in my tree as it is correct (strictly speaking).
Sorry for any trouble it makes.

Best regards,
Krzysztof
