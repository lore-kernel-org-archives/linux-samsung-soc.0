From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH RFC 3/5] ARM: samsung: add clock setup for FIMC and FIMD
Date: Tue, 27 Aug 2013 12:07:32 +0900
Message-ID: <000201cea2d2$92a43530$b7ec9f90$%han@samsung.com>
References: <1377517114-20222-1-git-send-email-m.krawczuk@partner.samsung.com>
 <1377517114-20222-4-git-send-email-m.krawczuk@partner.samsung.com>
 <1445676.NMCyFEC5q4@amdc1032> <521BA070.2000800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24802 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904Ab3H0DHe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 23:07:34 -0400
In-reply-to: <521BA070.2000800@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mateusz Krawczuk' <m.krawczuk@partner.samsung.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, kgene.kim@samsung.com, kyungmin.park@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, mturquette@linaro.org, thomas.abraham@linaro.org, t.stanislaws@samsung.com, m.chehab@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, August 27, 2013 3:38 AM, Sylwester Nawrocki wrote:
> On 08/26/2013 06:19 PM, Bartlomiej Zolnierkiewicz wrote:
> > On Monday, August 26, 2013 01:38:32 PM Mateusz Krawczuk wrote:
> >> This patch adds code that sets correct parents and rates for clocks
> >> used by FIMC and FIMD on Goni board.
> 
> This patch is supposed to be a workaround to make the display and camera
> subsystem working even without properly configured parent clocks in the
> boot-loader, right ? And as such it doesn't really belong to this series
> and has been written primarily for the clocks testing purposes ?
> I think it can be dropped in the next iteration of this series.
> 

Agreed. :-)
This patch can be dropped next.

Best regards,
Jingoo Han
