From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [GIT PULL] Samsung fixes for 2.6.38-rc8
Date: Tue, 8 Mar 2011 08:27:26 +0900
Message-ID: <AANLkTikcmkPAjb0b7PBgATCf6bYOhiQOQK4w5hxggttZ@mail.gmail.com>
References: <038701cbdd1b$1c11b890$543529b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <038701cbdd1b$1c11b890$543529b0$%kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Can you also add this one?
ARM: Samsung: change suspend/resume code to depend on CONFIG_SUSPEND
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg04141.=
html

Even though suspend is not implemented at exynos4, we can use the
runtime pm feature.
Also without this patch, we can't compile the exynos4 when turn on PM.

Thank you,
Kyungmin Park

On Tue, Mar 8, 2011 at 7:57 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Hi Linus,
>
> Please pull Samsung fixes from:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> s5p-fixes-for-linus
>
> These things are for small fixes on 2.6.38-rc8.
> If any problems, please let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> The following changes since commit dd9c1549edef02290edced639f67b54a25=
abbe0e:
>
> =A0Linux 2.6.38-rc7 (2011-03-01 13:55:12 -0800)
>
> are available in the git repository at:
> =A0 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung=
=2Egit
> s5p-fixes-for-linus
>
> Banajit Goswami (1):
> =A0 =A0 =A0ARM: S5P64X0: Fix number of GPIO lines in Bank F
>
> Ben Dooks (3):
> =A0 =A0 =A0ARM: S3C64XX: Fix keypad setup to configure correct number=
 of rows
> =A0 =A0 =A0ARM: S3C64XX: Add clock for i2c1
> =A0 =A0 =A0ARM: S3C64XX: Reduce output of s3c64xx_dma_init1()
>
> Lars-Peter Clausen (2):
> =A0 =A0 =A0ARM: S3C2440: Select missing S3C_DEV_USB_HOST on GTA02
> =A0 =A0 =A0ARM: S3C2440: Fix usage gpio bank j pin definitions on GTA=
02
>
> Mark Brown (5):
> =A0 =A0 =A0ARM: SAMSUNG: Include devs.h in dev-uart.c to prototype de=
vices
> =A0 =A0 =A0ARM: S3C64XX: Staticise non-exported GPIO to interrupt fun=
ctions
> =A0 =A0 =A0ARM: S3C64XX: Tone down SDHCI debugging
> =A0 =A0 =A0ARM: S3C64XX: Fix build with WM1190 disabled and WM1192 en=
abled on
> SMDK6410
> =A0 =A0 =A0ARM: S3C64XX: Update regulator names for debugfs compatibl=
ity on
> SMDK6410
>
> =A0arch/arm/mach-s3c2440/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
> =A0arch/arm/mach-s3c2440/include/mach/gta02.h | =A0 26
> +++++++++++++-------------
> =A0arch/arm/mach-s3c64xx/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 ++++++
> =A0arch/arm/mach-s3c64xx/dma.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 1=
1 ++++++-----
> =A0arch/arm/mach-s3c64xx/gpiolib.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04 =
++--
> =A0arch/arm/mach-s3c64xx/mach-smdk6410.c =A0 =A0 =A0| =A0 13 +++++++-=
-----
> =A0arch/arm/mach-s3c64xx/setup-keypad.c =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s3c64xx/setup-sdhci.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5p64x0/include/mach/gpio.h =A0| =A0 =A04 ++--
> =A0arch/arm/plat-samsung/dev-uart.c =A0 =A0 =A0 =A0 =A0 | =A0 =A02 ++
> =A010 files changed, 41 insertions(+), 30 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
