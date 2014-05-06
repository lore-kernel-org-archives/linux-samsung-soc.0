From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: remove SAMSUNG_CLOCK remnants after ccf
 conversion
Date: Tue, 06 May 2014 13:30:45 +0900
Message-ID: <0e4f01cf68e3$f2a63f00$d7f2bd00$@samsung.com>
References: <1615843.xdRuLnoxgD@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1615843.xdRuLnoxgD@phil>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
> =

> This finally removes all remaining SAMSUNG_CLOCK conditional code
> from s3c24xx architectures.
> =

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> This is of course meant to go on top of the s3c2410 ccf conversion
> =

>  arch/arm/mach-s3c24xx/Kconfig         |  5 -----
>  arch/arm/mach-s3c24xx/common.c        | 17 -----------------
>  arch/arm/mach-s3c24xx/cpufreq-utils.c |  6 ------
>  arch/arm/mach-s3c24xx/mach-anubis.c   | 27 ---------------------------
>  arch/arm/mach-s3c24xx/mach-bast.c     | 27 ---------------------------
>  arch/arm/mach-s3c24xx/mach-osiris.c   | 27 ---------------------------
>  arch/arm/mach-s3c24xx/mach-rx1950.c   | 14 --------------
>  arch/arm/mach-s3c24xx/mach-vr1000.c   | 27 ---------------------------
>  arch/arm/mach-s3c24xx/pm.c            | 12 ------------
>  9 files changed, 162 deletions(-)
> =

At last, we're supporting common clock framework for s3c24xx.

Heiko, very thanks for your effort.

Will apply with your previous s3c24xx ccf series.

- Kukjin
