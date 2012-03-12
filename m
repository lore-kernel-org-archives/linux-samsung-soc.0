From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 0/2] ARM: Exynos: Add irq_domain and device tree
 support for combiner
Date: Tue, 13 Mar 2012 02:37:59 +0530
Message-ID: <CAJuYYwQ3d1+UODEBOJYnQ=_+zNCc8dwZJycs_kLsEWDcteBa-A@mail.gmail.com>
References: <1329798806-32482-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:34365 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756444Ab2CLVIA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 17:08:00 -0400
Received: by vcqp1 with SMTP id p1so4624577vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 14:07:59 -0700 (PDT)
In-Reply-To: <1329798806-32482-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Hi Rob/Grant,

On 21 February 2012 10:03, Thomas Abraham <thomas.abraham@linaro.org> w=
rote:
> Changes since v3:
> - In dt case, the use of fixed gic linux irq number to map the combin=
er
> =A0interrupt output is removed. This is replaced with the interrupt n=
umber
> =A0obtained from the gic irq domain. (Thanks to Rob Herring and Grant
> =A0Likely for this suggestion).
> - Split the patch into two parts - irq_domain and device tree support
> =A0addition.
>
> Changes since v2:
> - Rebased to Grant's irqdomain/next branch.
>
> Changes since v1:
> - Includes all changes suggested by Rob Herring.
> - Tested with SPARSE_IRQ enabled.
>
> This patchset adds irq_domain and device tree support for the Exynos =
Interrupt
> Combiner controller.
>
> The first patch adds a common irq domain for the interrupts managed b=
y the
> interrupt combiners. All the instances of irq combiner reference the =
common irq
> domain for translating hardware interrupts to linux irq number.
>
> The second patch adds a interrupt specifier translator to support dev=
ice tree
> based instantiation. It can translate interrupt specifiers for device=
 nodes
> which use combiner as their interrupt parent.
>
> This patchset is based on
> http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.gi=
t [for-next]
>
> with all irq_domain (v5) patches merged from
> http://git.secretlab.ca/git/linux-2.6.git [irqdomain/next]
>
> Thomas Abraham (2):
> =A0ARM: Exynos: Add irq_domain support for interrupt combiner
> =A0ARM: Exynos: Add device tree support for interrupt combiner

Any comments on this patch series? If it helps, I can repost this
patch series. This patch series is a pre-requsite for the irq-domain
and dt support for wakeup interrupts, which Rob has acked.

Thanks,
Thomas.

>
> =A0.../bindings/arm/samsung/interrupt-combiner.txt =A0 =A0| =A0 48 ++=
+++++++
> =A0arch/arm/mach-exynos/common.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0112 ++++++++++++++++----
> =A02 files changed, 140 insertions(+), 20 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/samsung/i=
nterrupt-combiner.txt
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
