From: Abdoulaye Walsimou GAYE <awg@embtoolkit.org>
Subject: Re: [PATCH 0/3] Fixes for breakage resulting from syscore_ops patch
	on	s3c24xx
Date: Wed, 01 Jun 2011 14:13:35 +0200
Message-ID: <4DE62CEF.80507@embtoolkit.org>
References: <201106011348.47145.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201106011348.47145.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: rjw@sisk.pl, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
> The syscore_ops patch from Rafael J. Wysocki introduced some small
> glitches for the S3C24XX cpus resulting in compile errors.
>
> Heiko Stuebner (3):
>    Fix missing struct for s3c2410_dma_chan in s3c2410_dma_suspend_chan
>    Move s3c24xx_irq_syscore_ops to plat-s3c24xx/irq.c
>    remove the now empty mach-s3c2410/irq.c
>
>   arch/arm/mach-s3c2410/Makefile |    1 -
>   arch/arm/mach-s3c2410/irq.c    |   34 ----------------------------------
>   arch/arm/plat-s3c24xx/dma.c    |    2 +-
>   arch/arm/plat-s3c24xx/irq.c    |    6 ++++++
>   4 files changed, 7 insertions(+), 36 deletions(-)
>   delete mode 100644 arch/arm/mach-s3c2410/irq.c
>    =


I submitted same patches days ago [1], but without more explanations
than "ARM: s3c24xx: fix build errors introduced by bb072c3cf21d1", so

Acked-by : Abdoulaye Walsimou Gaye <awg@embtoolkit.org>

[1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/117812/focus=3D117=
814
