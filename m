From: amit kachhap <amit.kachhap@gmail.com>
Subject: Re: [PATCH V3 0/6] ARM: exynos: Add l2 retention mode cpuidle state
Date: Fri, 25 Nov 2011 09:14:17 +0530
Message-ID: <CADGdYn46oLjkfrRgc--khr851Gw7ZPb_htpfyS9vas==mCiAjw@mail.gmail.com>
References: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:58386 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab1KYDoR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Nov 2011 22:44:17 -0500
Received: by ywa9 with SMTP id 9so775539ywa.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Nov 2011 19:44:17 -0800 (PST)
In-Reply-To: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, linux-samsung-soc@vger.kernel.org

Dear Kukjin Kim,

Any comments or feedback on this patchset from your side. I am
preparing another version with fixes/issues suggested by Russell
and Inder.

Thanks,
Amit Daniel

On Tue, Nov 22, 2011 at 3:05 PM, Amit Daniel Kachhap
<amit.kachhap@linaro.org> wrote:
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
> Amit Daniel Kachhap (6):
> =A0ARM: exynos: Add support AFTR mode on EXYNOS4210
> =A0ARM: s5p: remove useless churn in sleep.S
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
> =A0arch/arm/plat-s5p/sleep.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 32 +++=
+++-
> =A05 files changed, 226 insertions(+), 35 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
