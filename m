From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Specify default clocks for Exynos4 FIMC devices
Date: Fri, 26 Sep 2014 15:45:09 +0200
Message-ID: <54256DE5.5050203@samsung.com>
References: <1410367054-30926-1-git-send-email-s.nawrocki@samsung.com>
 <5424900D.2070709@gmail.com> <54254776.7070803@samsung.com>
 <5425690A.6080102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23196 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752149AbaIZNpZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Sep 2014 09:45:25 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NCI005GFH0B7H60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Sep 2014 14:48:11 +0100 (BST)
In-reply-to: <5425690A.6080102@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com

On 26/09/14 15:24, Tomasz Figa wrote:
> I'm not concerned specifically with Exynos4210, but with placing such
> kind of data in common dtsi files.
> 
> Notice that even on boards which have correct initialization done by
> firmware, this will cause the settings to be overwritten, even if the
> firmware sets correct, but different values, regardless of them being
> clock parents or rates.
> 
> To me, even if this would mean duplicating some data, making this per
> board and present only in dts files of boards that actually need this
> (i.e. are known to have broken firmware) sounds more reasonable.

OTOH by having those settings in device tree would ensure the clock
tree is set correctly, regardless of the firmware. There is only one
correct clock parent for these devices, so the kernel couldn't do any
harm. I'd say it never worked in practice to rely on the bootloader
to configure these things, and one could say the firmware has been
broken in general with regards to this issue.

--
Regards,
Sylwester
