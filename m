From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/8] ARM: imx6q-clk: parent lvds_gate from lvds_sel
Date: Thu, 3 Apr 2014 14:49:08 +0800
Message-ID: <20140403064906.GI2801@dragon>
References: <1396025579-14344-1-git-send-email-l.stach@pengutronix.de>
 <1396025579-14344-2-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396025579-14344-2-git-send-email-l.stach@pengutronix.de>
Sender: linux-pci-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Sean Cross <xobs@kosagi.com>, Marek Vasut <marex@denx.de>, Richard Zhu <r65037@freescale.com>, Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jg1.han@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Tim Harvey <tharvey@gateworks.com>, kernel@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 28, 2014 at 05:52:52PM +0100, Lucas Stach wrote:
> Allows fror proper refcounting of the parent clocks
> when enabling the clock output on CLK1/2 pads.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thanks.
