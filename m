From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] pinctrl: exynos: add exynos5250 SoC specific data
Date: Wed, 09 Jan 2013 17:29:28 -0800
Message-ID: <00df01cdeed1$f08d73b0$d1a85b10$@samsung.com>
References: <1355399644-29417-1-git-send-email-thomas.abraham@linaro.org>
 <1355399644-29417-2-git-send-email-thomas.abraham@linaro.org>
 <CACRpkdaQ10CgoFXtk4EyqL4LWVpsdEAdrmy5R-_Rqm5fJdqS4A@mail.gmail.com>
 <CAJuYYwTZkzCXjowhKaJ253Oji07eDdEjMvNssyL1ThWtETswSQ@mail.gmail.com>
 <017801cde453$77b03eb0$6710bc10$@samsung.com>
 <CACRpkdZKB1_1U1VZfYADwWfFpBum0Qc88kWtW37h7Z05RtSJfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20746 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932377Ab3AJB3n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 20:29:43 -0500
In-reply-to: <CACRpkdZKB1_1U1VZfYADwWfFpBum0Qc88kWtW37h7Z05RtSJfA@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, patches@linaro.org

Linus Walleij wrote:
> 
> On Thu, Dec 27, 2012 at 5:58 PM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
> 
> > And I think, would be clear if the config could be changed like
following.
> >
> > 8<----------------------------------------------------------------------
> > From: Kukjin Kim <kgene.kim@samsung.com>
> > Subject: [PATCH] pinctrl: exynos: change PINCTRL_EXYNOS option
> >
> > Since pinctrl-exynos can support exynos4 and exynos5 so changed
> > the option name to PINCTRL_EXYNOS for more clarity.
> >
> > Cc: Thomas Abraham <Thomas.abraham@linaro.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Shall I take this into the pinctrl tree?
> 
Yes, please :-)

Just note, regarding Samsung pinctrl changes in the following:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/pinctrl-exynos

Thanks.

- Kukjin
