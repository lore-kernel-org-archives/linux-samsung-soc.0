From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCHv2 8/8] ARM: dts: Add device tree sources for Exynos3250
Date: Tue, 15 Apr 2014 09:15:51 +0100
Message-ID: <534CEAB7.6020600@arm.com>
References: <1397527192-21988-1-git-send-email-cw00.choi@samsung.com>
 <1397527192-21988-9-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397527192-21988-9-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "t.figa@samsung.com" <t.figa@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jaehoon Chung <jh80.chung@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "hyunhee.kim@samsung.com" <hyunhee.kim@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, linux-ker
List-Id: linux-samsung-soc@vger.kernel.org

On 15/04/14 02:59, Chanwoo Choi wrote:
> From: Tomasz Figa <t.figa@samsung.com>
> 
> This patch add new exynos3250.dtsi to support Exynos3250 SoC based on Cortex-A7
> dual core and includes following dt nodes:
> 
> - GIC interrupt controller
> - Pinctrl to control GPIOs
> - Clock controller
> - CPU information (Cortex-A7 dual core)
> - UART to support serial port
> - MCT (Multi Core Timer)
> - ADC (Analog Digital Converter)
> - I2C/SPI bus
> - Power domain
> - PMU (Performance Monitoring Unit)
> - MSHC (Mobile Storage Host Controller)
> - PWM (Pluse Width Modulation)
> - AMBA bus

[...]

Where is the arch timer node?

	M.
-- 
Jazz is not dead. It just smells funny...
