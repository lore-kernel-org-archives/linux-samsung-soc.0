From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 00/18] ARM: use const and __initconst for smp_operations
Date: Tue, 25 Aug 2015 10:37:15 +0900
Message-ID: <CAK7LNATD0559Yh5E2pkGpcEOFUboK=5hR37QfLwNBRt+7aJHGg@mail.gmail.com>
References: <1440390978-22796-1-git-send-email-yamada.masahiro@socionext.com>
	<CAOesGMjku09wsUmwooq2ZXLyV7CPfioi0oAV5EgvW_wE98VYeg@mail.gmail.com>
	<20150824212127.GH7557@n2100.arm.linux.org.uk>
	<CAOesGMgayep0EgCAdDWSujmiycDqtFUb0iKg-aioJqyzHRectA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAOesGMgayep0EgCAdDWSujmiycDqtFUb0iKg-aioJqyzHRectA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Frederic Weisbecker <fweisbec@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Pavel Machek <pavel@ucw.cz>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@nvidia.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Michal Simek <michal.simek@xilinx.com>, Wei Xu <xuwei5@hisilicon.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>, "arm@kernel.org" <arm@kernel.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>linux-arm-msm <l>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Russell, Olof,

2015-08-25 6:44 GMT+09:00 Olof Johansson <olof@lixom.net>:
> On Mon, Aug 24, 2015 at 2:21 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>> On Mon, Aug 24, 2015 at 02:12:06PM -0700, Olof Johansson wrote:
>>> Easiest of all would probably be to get the sub-arch patches into one
>>> release, then switch the prototypes and function definitions in the
>>> next. If you switch prototypes first you'll get a bunch of warnings,
>>> right?
>>
>> Wrong way around. :)
>>
>> If you change the sub-arches to declare the smp operations as const,
>> and try and pass them into a function which doesn't take a const-pointer,
>> you'll get a warning.  The core bits need to go in first before the
>> sub-arch patches.
>
> Ah yes, my bad.
>
>> I think the series has limited value - it allows us to (a) check that a
>> small quantity of code doesn't write to these things, and (b) allows us
>> to move the SMP operations structure from __initdata to __initconstdata.
>> It's still going to end up in the init region which is read/write in any
>> case, and still gets thrown away.
>>
>> Given where we are, I don't think we need to rush this in during the
>> last week before the merge window opens, even though it's trivial.
>
> Agreed. So if you pick it up for 4.4, we'll get the rest for 4.5.
>

OK.

I will put 01 and 02 to Russell's patch tracker
(after waiting for a bit more comments just in case).

I will do the rest later.





-- 
Best Regards
Masahiro Yamada
