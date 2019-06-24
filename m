From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos: Add regulator suspend
 configuration to Odroid XU3/XU4/HC1 family
Date: Mon, 24 Jun 2019 19:12:46 +0530
Message-ID: <CANAwSgTymg=u8oJy4bOoREpY1DvVqav=FfdizumeUJMYhntKaQ@mail.gmail.com>
References: <20190621155845.7079-1-krzk@kernel.org> <20190621155845.7079-3-krzk@kernel.org>
 <CGME20190623160226epcas2p3449814deb1faf7bf939481e6d4da2b86@epcas2p3.samsung.com>
 <CANAwSgTFQo8wL5s-djwPXFFOLtTHvRQif6234kFC=23PwMhuEQ@mail.gmail.com>
 <d94a2f99-fb99-c238-7011-9bbb4c0cd90f@samsung.com> <CAJKOXPeXELUjsuW9eyGuRj56067qnL-J2Lt4U42mYiyx=X+F_Q@mail.gmail.com>
 <2f58b63e-adf1-7935-8849-f311dc991b84@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2f58b63e-adf1-7935-8849-f311dc991b84@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek / Krzysztof,

On Mon, 24 Jun 2019 at 14:31, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Krzysztof,
>
> On 2019-06-24 09:41, Krzysztof Kozlowski wrote:
> > On Mon, 24 Jun 2019 at 09:20, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> On 2019-06-23 18:02, Anand Moon wrote:
> >>> Thanks for this patch. Please add my
> >>>
> >>> Tested-by: Anand Moon <linux.amoon@gmail.com>
> >>>
> >>> [snip]
> >>>
> >>> Could you integrate below small changes into this patch.
> >>> with these below changes suspend and resume work correctly at my end.
> >>>
> >>> [1] XU4_suspendresume.patch
> >>>
> >>> As per S2MPS11B PMIC 1.2.1 Regulator (Features)
> >>> Fix the min max value for *Buck7* and *Buck8*
> >>>
> >>> -- Buck7 (VDD_1.0V_LDO) 1.5 A (1.2 V to 1.5 V, 12.5 mV step, default on 1.35 V)
> >>> -- Buck8 (VDD_1.8V_LDO) 2.5 A (1.8 V to 2.1 V, 12.5 mV step, default on 2.0 V)
> >> Could you elaborate why such change for Buck7 and Buck8 is needed?
> > Anand has here valid point - the constraints in DTS do not match
> > hardware manual. This leads to question whether voltage table in
> > driver is proper... Another point is the voltage itself. The
> > schematics describes them as at specific voltage (1.35 V and 2.0 V)
> > but after boot they are 1.2 V and 1.85 V. Maybe this shift comes from
> > the problem above.
> >
> >>> Also add suspend-off for *Buck9*
> >>> Buck9 internally controls the power of USB hub.
> >>> Adding suspend the this node help proper reset of USB hub on Odroid
> >>> XU4 / HC1/ XU3
> >>> during suspend and resume. Below it the logs from my testing.
> >> Disabling Buck9 in suspend indeed reduces the power consumed by the
> >> board during suspend-to-ram from about 80mA to as little as 7-10mA, what
> >> matches the results of OdroidXU3. Thanks for the hint!
> > Although I did not get what is the difference in the logs (Anand
> > pasted two logs but they look the same) but the power consumption is
> > reason is good enough. I would be happy to put in the changelog entire
> > consumption  difference. I can measure it on XU3-Lite but can you give
> > me the XU4 (before and after)?\
>
>
> HC1:
>
> next-20190620: 120mA (@5V)
> this patchset: 72mA (@5V)
> this patchset + fixup from Anand: 7-10mA (@5V)
>
> XU4 (SDcard):
>
> next-20190620: 88mA (@5V)
> this patchset: 74mA (@5V), sometimes 42mA (@5V)
> this patchset + fixup from Anand: 6-9mA (@5V)
>
>
> XU4 (eMMC):
>
> next-20190620: 100mA (@5V)
> this patchset: 72mA (@5V), sometimes 41mA (@5V)
> this patchset + fixup from Anand: 6-9mA (@5V)
>
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

Thanks for this results.

Best Regards
-Anand
