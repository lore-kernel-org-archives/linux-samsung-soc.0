From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Enable RTC node in exynos4.dtsi file
Date: Wed, 13 Nov 2013 12:52:05 +0100
Message-ID: <1764307.sx88zLt93L@amdc1032>
References: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
 <1895231.F4mtKgSWc9@flatron> <528353F7.4050004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58669 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758943Ab3KMLwT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Nov 2013 06:52:19 -0500
In-reply-to: <528353F7.4050004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>


Hi,

On Wednesday, November 13, 2013 11:27:03 AM Sylwester Nawrocki wrote:
> On 13/11/13 09:08, Tomasz Figa wrote:
> >> As was discussed earlier too, status field of DT node is not supposed
> >> > to be used for
> >> > keeping an IP enabled or disabled. That should be done via the kernel
> >> > config. The DT status
> >> > is mostly to indicate the hardware status of the IP on the SoC/board.
> >> > If the node fully defines the hardware,
> >> > then it should be kept enabled by default unless such enabling causes
> >> > some issues with other IPs due to
> >> > pin sharing conflicts, etc. In the above case the node completely
> >> > defines the hardware and hence there is no
> >> > reason to keep it disabled.
> >
> > That's correct. (Unless I'm missing some board specific dependency of RTC.
> > If so, please correct me.)
> 
> I don't really like this argument. Why not allow the firmware to decide
> which devices are relevant and should be handled by the kernel ?
> And since we are aiming at single kernel config, if I understand things
> correctly, I can't see anything else than dts that could hold the machine
> *configuration*.
> 
> So let's not make all stuff enabled by default, that's not something we
> want on those mobile device SoCs. We should not be making fine system
> tuning more difficult than necessary.
> 
> I'm with Kukjin on this matter and would prefer patches like the $subject
> patch not be merged.

I generally agree with Sylwester and Kukjin that devices should not be
enabled by default in dtsi files.  However in a particular case of RTC
support there should be an exception from the generic rule and RTC
should be enabled for all EXYNOS boards (we have RTC driver config
option already enabled in our exynos_defconfig and we are also already
enabling RTC device explicitly in EXYNOS5250 dtsi file).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
