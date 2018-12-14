From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] ARM: dts: exynos: Specify I2S assigned clocks in proper
 node
Date: Fri, 14 Dec 2018 07:59:00 +0100
Message-ID: <20181214065900.GA22664@kroah.com>
References: <CGME20181212175813epcas2p26f7ec0e0e5e90d1e9cb7aeccd273e0ab@epcas2p2.samsung.com>
 <20181212175744.8287-1-s.nawrocki@samsung.com>
 <20181213205656.GA799@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213205656.GA799@kozik-lap>
Sender: stable-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 09:56:56PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Dec 12, 2018 at 06:57:44PM +0100, Sylwester Nawrocki wrote:
> > The assigned parent clocks should be normally specified in the consumer
> > device's DT node, this ensures respective driver always sees correct clock
> > settings when required.
> > 
> > This patch fixes regression in audio subsystem on Odroid XU3/XU4 boards
> > that appeared after commits:
> > 
> > 'commit 647d04f8e07a ("ASoC: samsung: i2s: Ensure the RCLK rate is properly determined")'
> > 'commit 995e73e55f46 ("ASoC: samsung: i2s: Fix rclk_srcrate handling")'
> > 'commit 48279c53fd1d ("ASoC: samsung: i2s: Prevent external abort on exynos5433 I2S1 access")'
> > 
> > Without this patch the driver gets wrong clock as the I2S function (op_clk)
> > clock in probe() and effectively the clock which is finally assigned from DT
> > is not being enabled/disabled in the runtime resume/suspend ops.
> > 
> > Without the above listed commits the EXYNOS_I2S_BUS clock was always set
> > as parent of CLK_I2S_RCLK_SRC regardless of DT settings so there was no issue
> > with not enabled EXYNOS_SCLK_I2S.
> > 
> > Cc: stable@vger.kernel.org # v4.17+
> 
> I gues your format would work (got recognized by stable scripts) but
> strictly speaking format is different:
> 
> 	Cc: <stable@vger.kernel.org> # 4.17.x
> 
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/stable-kernel-rules.rst#L127

Either works just fine, my scripts have to be a bit flexible due to all
of the odd ways people like to tag things here...

thanks,

greg k-h
