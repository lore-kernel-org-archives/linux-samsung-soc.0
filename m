From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 0/4] Add support for clocks in S5M8767
Date: Tue, 24 Dec 2013 14:27:02 +0530
Message-ID: <CAHbNUh1HchzsM_4Jq2NkgwyWf9t6sYJNdbKY1quEb75GapHitA@mail.gmail.com>
References: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
 <18704605.0nz1OWeNy9@flatron>
 <CAHbNUh2-WTc2myFbzYDmV=aSYUvO03pj3ZwNAen3j_GiGsRJkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHbNUh2-WTc2myFbzYDmV=aSYUvO03pj3ZwNAen3j_GiGsRJkg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, lkml <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 11 November 2013 08:28, Tushar Behera <tushar.behera@linaro.org> wrote:
> On 10 November 2013 18:04, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Tushar,
>>
>> On Thursday 31 of October 2013 12:18:40 Tushar Behera wrote:
>>> S5M8767 chip has 3 crystal oscillators which are operated in the same
>>> as the crystal oscillators in S2MPS11. Extend s2mps11-clk driver to
>>> support clocks in S5M8767.
>>>
>>> The patches are based on next-20131030.
>>>
>>> Tushar Behera (4):
>>>   clk: clk-s2mps11: Refactor for including support for other MFD clocks
>>>   clk: clk-s2mps11: Add support for clocks in S5M8767 MFD
>>>   mfd: sec-core: Add cells for S5M8767-clocks
>>>   ARM: dts: Add S5M8767 clock nodes on Arndale board
>>>
>>>  arch/arm/boot/dts/exynos5250-arndale.dts |    7 +++++++
>>>  drivers/clk/Kconfig                      |    6 ++++--
>>>  drivers/clk/clk-s2mps11.c                |   25
>>> +++++++++++++++++++++---- drivers/mfd/sec-core.c                   |
>>> 4 +++-
>>>  4 files changed, 35 insertions(+), 7 deletions(-)
>>
>> For the whole series:
>>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>>
>> Best regards,
>> Tomasz
>>
>
> Thanks Tomasz.
>
> Mike,
>
> Would you please pick up patches 1 and 2? Lee would pick up patch 3
> after these patches are merged.
>
> --
> Tushar Behera

Mike,

Would you please take patches 1 and 2 during this merge window?

-- 
Tushar Behera
