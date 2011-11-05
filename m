From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/5] EXYNOS4210: Remove code about bus on cpufreq
Date: Sat, 05 Nov 2011 10:31:03 +0900
Message-ID: <02e201cc9b5a$95421680$bfc64380$%kim@samsung.com>
References: <005401cc995c$ee9e3b50$cbdab1f0$%kim@samsung.com>
 <CAJ0PZbSy+wQRb63_sAEWvXzagFUDLJ_bOUuywMDQENg6LzNb7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <CAJ0PZbSy+wQRb63_sAEWvXzagFUDLJ_bOUuywMDQENg6LzNb7g@mail.gmail.com>
Content-language: ko
Sender: cpufreq-owner@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, 'Jongpill Lee' <boyko.lee@samsung.com>, 'SangWook Ju' <sw.ju@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

MyungJoo Ham wrote:
>=20
> On Wed, Nov 2, 2011 at 9:42 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > From: Jongpill Lee <boyko.lee@samsung.com>
> >
> > This patch removes code for bus on cpufreq because the code
> > for bus frequency changing moves to busfreq driver.
> > So code about bus on cpufreq is not necessary.
> >
> > Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> > Signed-off-by: SangWook Ju <sw.ju@samsung.com>
> > Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0drivers/cpufreq/exynos4210-cpufreq.c | =A0174
> > +---------------------------------
> > =A01 files changed, 1 insertions(+), 173 deletions(-)
> >
>=20
> Cool!
>=20
> Now, it's compatible with the Exynos4210 bus devfreq driver.
> Are you going to upstream the busfreq in the devfreq framework (at
> /drivers/devfreq/) or do you want me to submit the Exynos4210 bus
> devfreq driver that is currently on
> http://git.infradead.org/users/kmpark/linux-2.6-
> samsung/shortlog/refs/heads/devfreq
> (drivers/devfreq/exynos4210_memorybus.c)
>=20
> Devfreq is a framework to support DVFS feature for non-CPU devices,
> which is at 3.2-next tree.
>=20
I think, we need to talk about above so would be better to us if we cou=
ld
have a meeting.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

