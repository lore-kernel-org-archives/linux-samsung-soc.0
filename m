From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: EXYNOS: Make EXYNOS common cpufreq driver
Date: Sat, 24 Dec 2011 11:20:08 +0900
Message-ID: <089201ccc1e2$8edf99d0$ac9ecd70$%kim@samsung.com>
References: <03b301ccb48a$1fc93bb0$5f5bb310$%kim@samsung.com>
 <20111209153925.GA21045@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: 
Content-language: ko
Sender: cpufreq-owner@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Dave Jones' <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jc.lee@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> 
> Dave Jones wrote:
> >
> > On Wed, Dec 07, 2011 at 11:44:21AM +0900, Kukjin Kim wrote:
> >  > From: Jaecheol Lee <jc.lee@samsung.com>
> >  >
> >  > To support various EXYNOS series SoCs commonly,
> >  > added exynos common structure.
> >  > exynos-cpufreq.c => EXYNOS series common cpufreq driver
> >  > exynos4210-cpufreq.c => EXYNOS4210 support cpufreq driver
> >  >
> >  > Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> >  > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >
> > Please rediff this one and resend. It doesn't apply on top of the other
> > patches..
> >
> > Applying: [CPUFREQ] EXYNOS4210: Remove code about bus on cpufreq
> > Applying: [CPUFREQ] EXYNOS4210: Update frequency table for cpu divider
> > Applying: [CPUFREQ] EXYNOS4210: cpufreq code is changed for stable
> working
> > Applying: [CPUFREQ] EXYNOS: Make EXYNOS common cpufreq driver
> > error: patch failed: drivers/cpufreq/Makefile:42
> > error: drivers/cpufreq/Makefile: patch does not apply
> > Patch failed at 0005 [CPUFREQ] EXYNOS: Make EXYNOS common cpufreq driver
> > When you have resolved this problem run "git am --resolved".
> > If you would prefer to skip this patch, instead run "git am --skip".
> > To restore the original branch and stop patching run "git am --abort".
> >
> > I'll push out what I have applied so far to cpufreq.next
> >
> Hi Dave
> 
> You can find updated 4th patch at below.
> I rebased it on your latest cpufreq/next branch.
> And the 5th patch has no problem to apply.
> 
Hi Dave,

I couldn't find 4th and 5th patches in your cpufreq yet.
If any problem, please let me know.

Merry Christmas!
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> If any problem, please let me know.
> 
> As a note, since my git send-email has problem, re-submitted them on
> Sunday.
> Please kindly ignore that.
> 
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.

(snip)

