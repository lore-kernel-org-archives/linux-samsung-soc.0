From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/4] EXYNOS4210: Add Support for DVS Lock
Date: Fri, 08 Jul 2011 15:22:50 +0900
Message-ID: <002101cc3d37$7b5d27e0$721777a0$%kim@samsung.com>
References: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com>
 <1309853179-19438-5-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2VMbvfpXu4A_p9Ws0-94t1vGWpWPyZP-HvTP-p4PVgifg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <CAH9JG2VMbvfpXu4A_p9Ws0-94t1vGWpWPyZP-HvTP-p4PVgifg@mail.gmail.com>
Content-language: ko
Sender: cpufreq-owner@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, 'Jongpill Lee' <boyko.lee@samsung.com>, 'SangWook Ju' <sw.ju@samsung.com>, 'Jonghwan Choi' <jhbird.choi@samsung.com>, =?UTF-8?B?J+2VqOuqheyjvCc=?= <myungjoo.ham@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> On Tue, Jul 5, 2011 at 5:06 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

(snip)

> >
> > +static int exynos4_cpufreq_notifier_event(struct notifier_block *this,
> > +               unsigned long event, void *ptr)
> > +{
> > +       switch (event) {
> > +       case PM_SUSPEND_PREPARE:
> > +               if (exynos4_cpufreq_lock(DVFS_LOCK_ID_PM, CPU_L0))
> Really do you want to set L0, 1.2GHz for suspend?

(snip)

> > +static int exynos4_cpufreq_reboot_notifier_call(struct notifier_block *this,
> > +               unsigned long code, void *_cmd)
> > +{
> > +       if (exynos4_cpufreq_lock(DVFS_LOCK_ID_PM, CPU_L0))
> ditto at reboot

Yes, this is needed to work regardless of boot-loader clock configuration.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

