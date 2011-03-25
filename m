From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/6] ARM: Remove clkdev.o build in arch/arm/common/Makefile
Date: Fri, 25 Mar 2011 17:35:30 +0900
Message-ID: <000101cbeac7$9df03df0$d9d0b9d0$%kim@samsung.com>
References: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
	<1300521019-13612-7-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1300521019-13612-7-git-send-email-thomas.ab@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Thomas Abraham' <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

Thomas Abraham wrote:
> 
> clkdev.c is moved to drivers/clk. So build for clkdev.o can
> be removed from arch/arm/common/Makefile.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/common/Makefile |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/common/Makefile b/arch/arm/common/Makefile
> index e7521bc..6ea9b6f 100644
> --- a/arch/arm/common/Makefile
> +++ b/arch/arm/common/Makefile
> @@ -16,5 +16,4 @@ obj-$(CONFIG_SHARP_SCOOP)	+= scoop.o
>  obj-$(CONFIG_ARCH_IXP2000)	+= uengine.o
>  obj-$(CONFIG_ARCH_IXP23XX)	+= uengine.o
>  obj-$(CONFIG_PCI_HOST_ITE8152)  += it8152.o
> -obj-$(CONFIG_COMMON_CLKDEV)	+= clkdev.o
>  obj-$(CONFIG_ARM_TIMER_SP804)	+= timer-sp.o
> --
> 1.6.6.rc2

Yeah, right.

But, should be handled in Linux ARM kernel mailing list.
Cc'ed Russell and LAKML :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
