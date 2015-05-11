From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] Show proper respect for Heinrich Hertz by using the
 correct unit for frequency
Date: Mon, 11 May 2015 12:08:48 -0700
Message-ID: <20150511190847.GE15563@atomide.com>
References: <20150511131952.GD2067@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150511131952.GD2067@n2100.arm.linux.org.uk>
Sender: linux-omap-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

* Russell King - ARM Linux <linux@arm.linux.org.uk> [150511 06:23]:
> The SI unit of frequency is Hertz, named after Heinrich Hertz, and is
> given the symbol "Hz" to denote this.  "hz" is not the unit of frequency,
> and is in fact meaningless.
> 
> Fix arch/arm to correctly use "Hz", thereby acknowledging Heinrich Hertz
> contribution to the modern world.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Acked-by: Tony Lindgren <tony@atomide.com>
