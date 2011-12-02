From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 3/4] ARM Exynos4210-Nuri: remove compiler errors
Date: Fri, 2 Dec 2011 18:23:39 +0900
Message-ID: <CAJ0PZbTKgqgg3SZN3KyVFzGDuSU8qjM5NjwNcM28mtmzfbS0Xw@mail.gmail.com>
References: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>
	<1322730317-8171-4-git-send-email-myungjoo.ham@samsung.com>
	<04f901ccb0d0$b94191b0$2bc4b510$%kim@samsung.com>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:45384 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752529Ab1LBJXk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 04:23:40 -0500
In-Reply-To: <04f901ccb0d0$b94191b0$2bc4b510$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, Dec 2, 2011 at 5:59 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> MyungJoo Hamm wrote:
>>
> What's the 'compiler errors'?
>
> And I don't know why this patch included in this series, maybe this s=
hould
> be separated from this series?

The error is:
arch/arm/mach-exynos/mach-nuri.c: In function =91nuri_power_init=92:
arch/arm/mach-exynos/mach-nuri.c:1080:2: error: implicit declaration
of function =91irq_alloc_descs=92
It is due to the recent changes in some of the header files (they
removed some header inclusion from header fiiles).

In this patchset, we are providing a test case (Exynos4210-Nuri) for
the device driver and we had to resolve the compiler error first.

Cheers!
MyungJoo


--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
