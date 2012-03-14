From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH v2 RE-SEND] [CPUFREQ] EXYNOS5250: Add support cpufreq for
 EXYNOS5250
Date: Wed, 14 Mar 2012 14:40:53 -0400
Message-ID: <20120314184053.GC3803@redhat.com>
References: <1331377202-25173-1-git-send-email-kgene.kim@samsung.com>
 <4F60D5FE.7080400@samsung.com>
 <20120314175703.GA3803@redhat.com>
 <4F60E25C.9060005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:26388 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751777Ab2CNSlE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 14:41:04 -0400
Content-Disposition: inline
In-Reply-To: <4F60E25C.9060005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jaecheol Lee <jc.lee@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Mar 14, 2012 at 11:24:28AM -0700, Kukjin Kim wrote:
 > 2012-03-14 =EC=98=A4=EC=A0=84 10:57, Dave Jones =EC=93=B4 =EA=B8=80:
 > > On Wed, Mar 14, 2012 at 10:31:42AM -0700, Kukjin Kim wrote:
 > >   >  Kukjin Kim wrote:
 > >   >  >  From: Jaecheol Lee<jc.lee@samsung.com>
 > >   >  >
 > >   >  >  This patch adds support cpufreq for EXYNOS5250 SoC. Basica=
lly,
 > >   >  >  the exynos-cpufreq.c is used commonly and exynos5250-cpufr=
eq.c
 > >   >  >  is used for EXYNOS5250(two Cortex-A15 cores) SoC.
 > >   >  >
 > >   >  >  Signed-off-by: Jaecheol Lee<jc.lee@samsung.com>
 > >   >  >  Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
 > >   >
 > >   >  Hi again Dave :)
 > >   >
 > >   >  Please pick up this patch for v3.4.
 > >   >  If any problems, please kindly let us know.
 > >
 > > this, and the other patch doesn't apply against current cpufreq.gi=
t
 > >
 > Oops, maybe you applied this first. Pleae try again EXYNOS4X12 first=
=20
 > then, this. I applied on top of cpufreq/next and there was no compla=
in.
 >=20
 > If any problems, please kindly let me know.

Applied and pushed. thanks!

	Dave
=20
