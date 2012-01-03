From: amit kachhap <amit.kachhap@linaro.org>
Subject: Re: [PATCH V4 0/5] ARM: exynos: Add l2 retention mode cpuidle state
Date: Tue, 3 Jan 2012 11:52:26 +0530
Message-ID: <CADGdYn7ZU5xiDvOLMR4wVHEWtF-2p86jNZFCOXMV6PrZXuLWbQ@mail.gmail.com>
References: <1323083172-14096-1-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:43096 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750818Ab2ACGW0 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 01:22:26 -0500
Received: by obcwo16 with SMTP id wo16so12146587obc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jan 2012 22:22:26 -0800 (PST)
In-Reply-To: <1323083172-14096-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, patches@linaro.org, linaro-dev@lists.linaro.org

Hi Mr kim,

All the comments have been addressed for the Exynos cpu idle patchset.
The updated patchset was posted about one month back and there have
been no further comments on the patchset since then.

As this patchset seems to be stable now, do you think these these
patches can merged in this 3.3 merge window? Kindly let me know your
opinion.

Thanks,
Amit Daniel

On Mon, Dec 5, 2011 at 4:36 PM, Amit Daniel Kachhap
<amit.kachhap@linaro.org> wrote:
> Changes since V3:
> *Implemented Russell feedback and moved sleep magic 4byte memory befo=
re
> s3c_cpu_resume to data section.
>
> Changes since V2:
> *Implemented the suggestion of MyungJoo Ham and used INFORM0/1
> registers for resume for some board versions.
> *Added back save/restore through CPU PM notifiers as suggested by
> Lorenzo Pieralisi. This is useful to restore vfp state.
> *some patch modularization (s5p/exynos) and proper commit logs.
>
> Changes since V1:
> *rebased the whole patch against 3.2-rc1 tree
> *removed GIC save/restore in AFTR cpuidle state as it is external
> to cpu powerdomain
> *Added L2 setup code through device tree
> *Removed only l2 save/restore registers in sleep
>
> This Patch series adds support for AFTR mode cpuidle state based on
> patch (http://www.spinics.net/lists/arm-kernel/msg132243.html) earlie=
r
> submitted by Jaecheol Lee <jc.lee@samsung.com>.
>
> This patch uses CPU PM notifiers , common l2 save/restore and
> new cpu_suspend/resume interfaces and is based on the tip of
> for-next branch of samsung tree.
> (git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.gi=
t for-next).
>
> Amit Daniel Kachhap (5):
> =A0ARM: exynos: Add support AFTR mode on EXYNOS4210
> =A0ARM: exynos: save L2 settings during bootup
> =A0ARM: s5p: add L2 early resume code
> =A0ARM: exynos: remove useless code to save/restore L2
> =A0ARM: exynos: Enable l2 configuration through device tree
>
> =A0arch/arm/mach-exynos/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 60 +++=
++++++---
> =A0arch/arm/mach-exynos/cpuidle.c =A0 =A0 =A0 =A0 =A0| =A0152 +++++++=
+++++++++++++++++++++++-
> =A0arch/arm/mach-exynos/include/mach/pmu.h | =A0 =A02 +
> =A0arch/arm/mach-exynos/pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 15 ---
> =A0arch/arm/plat-s5p/sleep.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 44 +++=
+++++-
> =A05 files changed, 233 insertions(+), 40 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
