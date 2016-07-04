From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v3 0/2] mark spi clocks as critical and enable spi3 clocks
Date: Mon, 04 Jul 2016 13:20:03 +0900
Message-ID: <20160704042003.GB23620@samsunx.samsung>
References: <1467270911-10971-1-git-send-email-andi.shyti@samsung.com>
 <CGME20160704040000epcas1p3aeb0a1337a7e8e7274090bd932f556e3@epcas1p3.samsung.com>
 <CA+Ln22HuCdDr=g06ynK7mqjDfUVrQgG-NRkfTP_zE6h-wZk6Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <CA+Ln22HuCdDr=g06ynK7mqjDfUVrQgG-NRkfTP_zE6h-wZk6Gw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

> > This patchset enables spi3 clocks by marking critical clocks as
> > CLK_IS_CRITICAL and in the meantime replaces the use of
> > CLK_IGNORE_UNUSED for spi1 clocks.
> >
> > The sclk needs to be considered critical as well.
> >
> > The SPI3 in the tm2/tm2e boards will control an irled for remote
> > controlling.
> >
> > Changelog:
> >
> > V1 -> V2
> >  - the "sclk_spi3" doesn't need to be enabled in boot time as it
> >   is handled by the spi driver itself.
> >
> >  - use the CLK_IS_CRITICAL flag for the ioclk
> >
> > V2 -> V3
> >  - some more tests has confirmed taht "sclk_spi1,3" need to be
> >    enabled as critical!
> 
> This sounds like a DTS and/or SPI and/or clock driver bug then. I'm
> pretty much convinced that it might also cause other problems and this
> workaround will only mask them making things even more difficult to
> debug in the future. Let's not introduce more technical debt.

In principle I agree, but, the upcoming TM2/TM2e boards will have
the audio codec connected on SPI1 and the ir remote controller on
the SPI3 (others SPI slots are used as well, but we don't have
the drivers ready for them).

I followed for SPI3 the same approach as it was done for SPI1, so
that I see two choices here:

 * reject this patches and cleanup the SPI1 from the "technical
   debt" and not have anything working on spi.

or

 * do for SPI3 the same as it has been done for SPI1 (and as it
   is now) with its "technical debt".

I did quite an extensive testing on these lines and I don't see
any other alternative.

Thanks,
Andi
