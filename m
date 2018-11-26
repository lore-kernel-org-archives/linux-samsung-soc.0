From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add g3d bus nodes using VDD_INT for
 Exynos542x SoC
Date: Mon, 26 Nov 2018 14:19:07 +0530
Message-ID: <CANAwSgQv8e9geQCmnB7stH7GtQ__DmNDqReJaa_Au0hxvKij7w@mail.gmail.com>
References: <20181123094413.1108-1-linux.amoon@gmail.com> <CGME20181123094508epcas5p4b7958b812bf0f64ca47006ced9fda279@epcas5p4.samsung.com>
 <20181123094413.1108-3-linux.amoon@gmail.com> <5BFBA2D1.8090409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BFBA2D1.8090409@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On Mon, 26 Nov 2018 at 13:08, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>
> Hi Anand,
>
> CLK_DOUT_ACLK_G3D is the clock for GPU h/w and it requires the buck4_reg("vdd_g3d").
>
> bus_wcore uses the buck3_reg("vdd_int"). bus_wcore and bus_g3d don't share the
> same voltage line. It is wrong to make 'bus_g3d' as the child of 'bus_wcore'
> because of using the different regulator.
>
> CLK_DOUT_ACLK_G3D and buck4_reg should be controlled from MALI driver
> with DEVFREQ framework. Unfortunately, MALI driver is not posted to mainline.
>
>

Thanks for your clarification, I missed this point. mali gpu is linked
to buck4_reg
Next time I will ask for the expert how to proceed on some changes.

Best Regards
-Anand
