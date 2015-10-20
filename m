From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 01/10] clk/samsung: exynos5433: add definitions of HDMI-PHY
 output clocks
Date: Tue, 20 Oct 2015 13:17:35 +0200
Message-ID: <562622CF.1070906@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
 <1445332961-25419-2-git-send-email-a.hajda@samsung.com>
 <20151020103416.20687.40409@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20151020103416.20687.40409@quantum>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 20/10/15 12:34, Michael Turquette wrote:
>> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
>> > index 5bd80d5..4f0d566 100644
>> > --- a/include/dt-bindings/clock/exynos5433.h
>> > +++ b/include/dt-bindings/clock/exynos5433.h
>> > @@ -765,7 +765,10 @@
>> >  #define CLK_SCLK_RGB_VCLK                              109
>> >  #define CLK_SCLK_RGB_TV_VCLK                           110
>> >  
>> > -#define DISP_NR_CLK                                    111
>> > +#define CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY              111
>> > +#define CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY               112
>> > +
>> > +#define DISP_NR_CLK                                    113
>
> Why break compatibility with older DTBs?

I used to be resistant to changing those _NR_CLK defines
in the past but then realized they are not part of the DT ABI.
These defines are used only in drivers and affect only size
of the provider's allocated clock array. The confusion may be
caused by the fact that the whole header is shared by the kernel
source and dts.

$ git grep -l _NR_CLK arch/arm/boot/dts drivers/clk/samsung/
drivers/clk/samsung/clk-exynos-clkout.c
drivers/clk/samsung/clk-exynos3250.c
drivers/clk/samsung/clk-exynos4.c
drivers/clk/samsung/clk-exynos4415.c
drivers/clk/samsung/clk-exynos5250.c
drivers/clk/samsung/clk-exynos5260.c
drivers/clk/samsung/clk-exynos5410.c
drivers/clk/samsung/clk-exynos5420.c
drivers/clk/samsung/clk-exynos5433.c
drivers/clk/samsung/clk-exynos5440.c
drivers/clk/samsung/clk-exynos7.c

There is no *_NR_CLK in any dts file.
New kernel will work will older DTB, the driver will just
register more clocks, which will not be dereferenced anywhere
in older dtb.

-- 
Regards,
Sylwester
