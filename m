From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/4] ARM: exynos: SoC/Mach for v4.9
Date: Fri, 2 Sep 2016 18:32:44 +0200
Message-ID: <20160902163244.GB5534@kozik-lap>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
 <1472548739-20050-5-git-send-email-k.kozlowski@samsung.com>
 <5635206.ooNAZCeQOe@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5635206.ooNAZCeQOe@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 02, 2016 at 06:26:42PM +0200, Arnd Bergmann wrote:
> On Tuesday, August 30, 2016 11:18:59 AM CEST Krzysztof Kozlowski wrote:
> > Samsung mach/soc update for v4.9:
> > 1. Fix for DMA on S3C24xx. This was probably broken for long time, nobody runs
> >    this code... till now.
> 
> Good to know. This reminds me that the s3c24xx DMA code is one of those
> that need to be converted to dma_slave_map at some point. Maybe if someone
> is now running that code, they could give that a try as well?
> 
> It shouldn't be hard to convert, let me know if you need more information.

+Cc Sylwester,

Sylwester recently dig into this platform. I think he managed to play
some audio.

Best regards,
Krzysztof
