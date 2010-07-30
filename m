From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v3 3/3] ARM: SAMSUNG: i2c/busses: Add HAVE_S3C2410_I2C
	option to include I2C for Samsung SoCs
Date: Fri, 30 Jul 2010 09:22:51 +0900
Message-ID: <AANLkTikyOUyz+sNPgBvWU8FvYa8HvgRY4P2udhMY=eOw@mail.gmail.com>
References: <1280396565-21014-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1280396565-21014-1-git-send-email-kgene.kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Naveen Krishna Ch <ch.naveen@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jul 29, 2010 at 6:42 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> From: Naveen Krishna Ch <ch.naveen@samsung.com>
>
> This patch adds HAVE_S3C2410_I2C to control inclusion of I2C bus driver
> on Samsung SoCs and makes I2C bus driver dependency SoC specific instead
> of machine specific. This will enalbe all machines using Samsung ARCH_S3C=
2410,
> _S3C64XX, _S5P6440, _S5PC100, and _S5PV210 to select the I2C driver by de=
fault

What's the different from use PLAT_SAMSUNG?

config I2C_S3C2410
        tristate "S3C2410 I2C Driver"
        depends on PLAT_SAMSUNG

Please don't populate the Kconfigs.

Thank you,
Kyungmin Park

>
> Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> ---
> Changes since v2:
> - Added HAVE_S3C2410_I2C in drivers Kconfig
> - Made I2C bus driver dependency SoC specific
> - Selected additional support I2C bus driver for S5P6440, S5PC100,
> =A0and S5PV210
>
> Changes since v1:
> - Modifed the Kconfig help comments.
>
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A05 +++++
> =A0drivers/i2c/busses/Kconfig | =A0 11 +++++++++--
> =A02 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 98922f7..e922994 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -634,6 +634,7 @@ config ARCH_S3C2410
> =A0 =A0 =A0 =A0select ARCH_HAS_CPUFREQ
> =A0 =A0 =A0 =A0select HAVE_CLK
> =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> + =A0 =A0 =A0 select HAVE_S3C2410_I2C
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Samsung S3C2410X CPU based systems, such as the Simtec=
 Electronics
> =A0 =A0 =A0 =A0 =A0BAST (<http://www.simtec.co.uk/products/EB110ITX/>), t=
he IPAQ 1940 or
> @@ -663,6 +664,7 @@ config ARCH_S3C64XX
> =A0 =A0 =A0 =A0select S3C_DEV_NAND
> =A0 =A0 =A0 =A0select USB_ARCH_HAS_OHCI
> =A0 =A0 =A0 =A0select SAMSUNG_GPIOLIB_4BIT
> + =A0 =A0 =A0 select HAVE_S3C2410_I2C
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Samsung S3C64XX series based systems
>
> @@ -672,6 +674,7 @@ config ARCH_S5P6440
> =A0 =A0 =A0 =A0select GENERIC_GPIO
> =A0 =A0 =A0 =A0select HAVE_CLK
> =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> + =A0 =A0 =A0 select HAVE_S3C2410_I2C
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Samsung S5P6440 CPU based systems
>
> @@ -691,6 +694,7 @@ config ARCH_S5PC100
> =A0 =A0 =A0 =A0select CPU_V7
> =A0 =A0 =A0 =A0select ARM_L1_CACHE_SHIFT_6
> =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> + =A0 =A0 =A0 select HAVE_S3C2410_I2C
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Samsung S5PC100 series based systems
>
> @@ -701,6 +705,7 @@ config ARCH_S5PV210
> =A0 =A0 =A0 =A0select HAVE_CLK
> =A0 =A0 =A0 =A0select ARM_L1_CACHE_SHIFT_6
> =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> + =A0 =A0 =A0 select HAVE_S3C2410_I2C
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Samsung S5PV210/S5PC110 series based systems
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index bceafbf..f1751da 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -521,12 +521,19 @@ config I2C_PXA_SLAVE
> =A0 =A0 =A0 =A0 =A0is necessary for systems where the PXA may be a target=
 on the
> =A0 =A0 =A0 =A0 =A0I2C bus.
>
> +config HAVE_S3C2410_I2C
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 This will include I2C support for Samsung SoCs. If you =
want to
> + =A0 =A0 =A0 =A0 include I2C support for any machine, kindly select this=
 in the
> + =A0 =A0 =A0 =A0 respective Kconfig file.
> +
> =A0config I2C_S3C2410
> =A0 =A0 =A0 =A0tristate "S3C2410 I2C Driver"
> - =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX
> + =A0 =A0 =A0 depends on HAVE_S3C2410_I2C
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Say Y here to include support for I2C controller in the
> - =A0 =A0 =A0 =A0 Samsung S3C2410 based System-on-Chip devices.
> + =A0 =A0 =A0 =A0 Samsung SoCs.
>
> =A0config I2C_S6000
> =A0 =A0 =A0 =A0tristate "S6000 I2C support"
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-s=
oc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
