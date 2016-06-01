From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v5 13/22] ARM: dts: exynos: Enable UART3 on Exynos5410
Date: Wed, 1 Jun 2016 16:54:41 -0400
Message-ID: <cabfd6c2-fc7e-622a-36e6-5be0b674cdd2@osg.samsung.com>
References: <1464429273-23457-1-git-send-email-krzk@kernel.org>
 <1464429273-23457-14-git-send-email-krzk@kernel.org>
 <CAOi56cXeRjGgE+=psk7K45oeAgZ27HFxbi+an-ELnA3-_Z_BTA@mail.gmail.com>
 <CAJKOXPcDZFaqL7+wT9d9iD7Y4QbZWPFQw2hTR3AzyU4K099WYA@mail.gmail.com>
 <e9a103cc-a5cf-95d8-ee49-d44542dbcb1e@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <e9a103cc-a5cf-95d8-ee49-d44542dbcb1e@osg.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/01/2016 04:52 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,

[snip]

>>
>> I left the commit in my tree as it is correct (strictly speaking).
>> Sorry for any trouble it makes.
>>
> 
> Kevin pointed me to this issue over IRC and I was able to reproduce it in
> my Peach Pi by removing the UART3 clocks from the Exynos5420 clock driver.
> 
> Your patch indeed fixes the issue, I'll add a Reviewed-by on that thread.
> 

err, I meant a Tested-by tag... but yes I've also reviewed the patch :)

Best regards, 
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
