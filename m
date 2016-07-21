From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/4] mfd: Add Samsung Exynos Low Power Audio Subsystem
 driver
Date: Thu, 21 Jul 2016 13:11:27 +0100
Message-ID: <20160721121127.GD14925@dell>
References: <1467738804-31460-1-git-send-email-s.nawrocki@samsung.com>
 <578F9495.9090502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <578F9495.9090502@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Beomho Seo <beomho.seo@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 20 Jul 2016, Sylwester Nawrocki wrote:

> On 07/05/2016 07:13 PM, Sylwester Nawrocki wrote:
> > This patch adds common driver for the Top block of the Samsung Exyn=
os
> > SoC Low Power Audio Subsystem. This is a minimal driver which prepa=
res
> > resources for IP blocks like I2S, audio DMA and UART and exposes a =
regmap
> > for the Top block registers. Also system power ops are added to ens=
ure
> > the Audio Subsystem is operational after system suspend/resume cycl=
e.
> >=20
> > Signed-off-by: Inha Song <ideal.song@samsung.com>
> > Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > ---
>=20
> Lee, is this patch good enough for your tree? Are you going to have
> any review comments ?

Please don't sent contentless pings.  If you think the patch has been
dropped (it hasn't) then just send a [RESEND] patch.

The merge window is about to open.  I will not be taking any patches
for the next couple of weeks.  Your patch is marked as to-review in my
Inbox, so please bear with me and I'll get around to it.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
