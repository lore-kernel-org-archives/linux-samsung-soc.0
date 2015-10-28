From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [rtc-linux] Re: [PATCH v3 5/5] drivers/rtc/rtc-s5m.c: add
 support for S2MPS15 RTC
Date: Wed, 28 Oct 2015 14:43:00 +0100
Message-ID: <20151028134300.GN22331@piout.net>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-6-git-send-email-alim.akhtar@samsung.com>
 <56302514.4090407@samsung.com>
 <20151028015323.GZ28319@sirena.org.uk>
 <56303054.8060804@samsung.com>
 <56303DA3.5020306@samsung.com>
 <5630419F.1000300@samsung.com>
 <20151028094853.GM22331@piout.net>
 <5630CE44.7070204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5630CE44.7070204@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: k.kozlowski.k@gmail.com, Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>, lee.jones@linaro.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 28/10/2015 at 22:31:48 +0900, Krzysztof Kozlowski wrote :
> > So you don't care about DT backward compatibility because when a
> > workaround will be needed for one of the IPs, then you will have to
> > update the old dtb to use it.
> 
> Nope, DTB does not contain the name for RTC driver (s2mps15-rtc). It
> will be exactly the same.
> 

Sure, I see it now. So no change is needed in the rtc driver until you
need to use that particular bit that is different.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
