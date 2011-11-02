From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 0/4] Add SPI clkdev support
Date: Wed, 02 Nov 2011 17:06:40 -0400
Message-ID: <1320268004-4545-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset modifies the existing clkdev to make SPI driver
independent of the clock names send from platform data. This
patches enables the SPI driver to request SPI bus clocks
using generic connection ID.

Link to V1:
        http://www.spinics.net/lists/arm-kernel/msg141671.html

V2 Changes:
        -Add newly introduced CLKDEV_INIT macro for creating clk_lookup
        structure as suggested by Russell King
        V2 patches series are:
        http://www.spinics.net/lists/arm-kernel/msg142733.html

V3 Changes:
        -Reworked the patches as per the following link. Patch series in
        the following link removed & and , from the macro declaration and added
        in the macro defination.
        http://www.spinics.net/lists/arm-kernel/msg143663.html

V4 Changes:
	Rebased to next-samsung-dt.

Padmavathi Venna (4):
  ARM: S3C64XX: Add SPI clkdev support
  ARM: S5PC100: Add SPI clkdev support
  ARM: S5P64X0: Add SPI clkdev support
  ARM: S5PV210: Add SPI clkdev support

 arch/arm/mach-s3c64xx/clock.c         |   80 +++++++++++++--------
 arch/arm/mach-s5p64x0/clock-s5p6440.c |   61 ++++++++---------
 arch/arm/mach-s5p64x0/clock-s5p6450.c |   49 ++++++++-----
 arch/arm/mach-s5pc100/clock.c         |  124 +++++++++++++++++++--------------
 arch/arm/mach-s5pv210/clock.c         |   50 ++++++++-----
 5 files changed, 210 insertions(+), 154 deletions(-)
