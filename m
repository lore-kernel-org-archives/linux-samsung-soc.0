From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 0/2] regulator: add irq domain and device tree support
 for MAX8997
Date: Tue, 13 Mar 2012 02:40:03 +0530
Message-ID: <CAJuYYwQMB0ANS6noscRe6P4d0JKmTPLP_1r2Sr6-N3amAZiD5Q@mail.gmail.com>
References: <1330000688-11226-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:40955 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756652Ab2CLVKE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 17:10:04 -0400
Received: by vcqp1 with SMTP id p1so4626587vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 14:10:04 -0700 (PDT)
In-Reply-To: <1330000688-11226-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Rob/Grant,

On 23 February 2012 18:08, Thomas Abraham <thomas.abraham@linaro.org> w=
rote:
> Changes since v2:
> - Atleast one voltage level has to be specfied for Buck 1/2/5 even if=
 GPIO
> =A0DVS option is not used (suggested by MyungJoo Ham).
> - Reworked the irq_domain support based the v5 of irq_domain generali=
zation
> =A0patches.
>
> MAX8997 is a multi-function device which includes support for regulat=
ors, rtc,
> battery charger and other sub-blocks. This patchset adds device tree =
support
> for the pmic (regulators) sub-block.
>
> The first patch adds irq domain support for the interrupts supported =
by max8997
> mainly for removing the need to pass a irq_base from the platform cod=
e. The
> irq_base could not anyway be passed in case of device tree based inst=
antiation.
> The reverse mapping method used is linear since the sub-drivers of ma=
x8997 has
> access to the max8997 irq_domain from which the linux irq number can =
be
> obtained.
>
> The second patch adds device tree support for max8997. This patch mod=
ifies both
> mfd and regulator portions of the max8997 code.
>
> This patchset is based on the following tree.
> http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.gi=
t [for-next]
>
> with all patches merged from
> http://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git =
[for-next]
> http://git.secretlab.ca/git/linux-2.6.git [irqdomain/next]
>
> and depends on the following patchset.
> [PATCH v3 0/4] ARM: Exynos4: Add irq domain and device tree support f=
or wakeup interrupts.
>
> This patchset has been tested on Origen board.
>
> Thomas Abraham (2):
> =A0mfd: add irq domain support for max8997 interrupts
> =A0regulator: add device tree support for max8997

Any comments for this patch series?

Thanks,
Thomas.

>
> =A0.../devicetree/bindings/regulator/max8997-pmic.txt | =A0134 ++++++=
+++++++++++++
> =A0arch/arm/mach-exynos/mach-nuri.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A04 -
> =A0arch/arm/mach-exynos/mach-origen.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 -
> =A0drivers/mfd/max8997-irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 60 +++++----
> =A0drivers/mfd/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 73 ++++++++++-
> =A0drivers/regulator/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0139 +++++++++++++++++++-
> =A0include/linux/mfd/max8997-private.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A04 +-
> =A0include/linux/mfd/max8997.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A02 +-
> =A08 files changed, 382 insertions(+), 35 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/regulator/max=
8997-pmic.txt
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
