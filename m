From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: EXYNOS5250: Register architected timers
Date: Wed, 03 Apr 2013 13:56:07 +0900
Message-ID: <24db01ce3027$8d457400$a7d05c00$%kim@samsung.com>
References: <1363222742-15220-1-git-send-email-agraf@suse.de>
 <1363222742-15220-4-git-send-email-agraf@suse.de>
 <239701ce2f8f$093a2f40$1bae8dc0$%kim@samsung.com> <515AC4E3.2070508@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32255 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761102Ab3DCE4J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Apr 2013 00:56:09 -0400
In-reply-to: <515AC4E3.2070508@suse.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alexander Graf' <agraf@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, =?ks_c_5601-1987?B?JyJUSE9NQVMgUCBBQlJBSEFNL1NSSS1CYW5nYWxvcmUtU0xHLy4=?= =?ks_c_5601-1987?B?L7vvvLrA/MDaIic=?= <thomas.ab@samsung.com>, 'Giridhar BM' <giridhar.m@samsung.com>

Alexander Graf wrote:
> 
> On 04/02/2013 12:44 PM, Kukjin Kim wrote:
> > Alexander Graf wrote:
> >> When running on an exynos 5250 SoC, we don't initialize the architected
> >> timers. The chip however supports architected timers.
> >>
> > Yes, exynos5250 can support, mct(multi core timer) is used though.
> >
> >> When we don't initialize them, KVM will try to access them and run into
> >> NULL pointer dereferences attempting to do so.
> >>
> > Yes, right.
> >
> >> This patch is really more of a hack than a real fix, but does get me
> >> working with KVM on Arndale.
> >>
> > Hmm, if you think, this is _really_ a hack, you need to add some
> comments
> > about that for clearance, and since the mct.c file has been moved into
> > drivers/clocksource/, this should be re-worked.
> >
> > BTW, I discussed about this with Thomas and Giridhar just now, we
> reached
> > this 3rd patch could be dropped because the correct way is to add a dts
> > node for arch timer which patch 2nd is already doing after 3.9-rc1
> because
> > of CLOCKSOURCE_OF_DECLARE macro.
> >
> > So if you' OK above, let me know so that I can take only 1st and 2nd
> > patches to support KVM on exynos5250.
> 
> I'd say go ahead and take them and I'll verify whether things work on
> your tree :).
> 
OK, I will.

> What's the git repo of your branch?
> 
You can test with my for-next branch but this series can be seen tomorrow
night(KST) in my public tree.

Any problems, please let me know.

Thanks.

- Kukjin
