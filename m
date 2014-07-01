From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH 1/7] clk: exynos4: add support for MOUT_HDMI and MOUT_MIXER
 clocks
Date: Tue, 01 Jul 2014 19:44:26 +0200
Message-ID: <53B2F37A.30208@gmx.net>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com> <1404202211-15788-2-git-send-email-m.szyprowski@samsung.com> <53B27565.8090703@gmx.net> <53B277EE.1060704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:59517 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755607AbaGARom (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 13:44:42 -0400
In-Reply-To: <53B277EE.1060704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>

Hi,


Marek Szyprowski wrote:
> Hello,
> 
> On 2014-07-01 10:46, Tobias Jakobi wrote:
>> Hello Marek,
>>
>> I think this particular clock setup should already be handled by this
>> patch:
>> http://www.spinics.net/lists/arm-kernel/msg320013.html
>>
>> Or am I missing something here?
> 
> The patch you have pointed requires adding support for SET_PARENT_PARENT
> feature to clock core, which has not been accepted yet. Only then Exynod
> DRM drivers can be updated to correctly handle the changed clock tree.
I'm aware of this, but my point is: Wouldn't it be better to get the
SET_PARENT_PARENT upstream instead of applying a work-around (I am
assuming of course that SET_PARENT_PARENT is the correct way of handling
these clocks), which would be reverted later anyway?

Also this looks like similar to the work duplication issue that was
raised before here on the ml. Different groups working on the same
thing, but with no or little coordination between them. Might be just me
though...


> My approach is to introduce minimal changes and use the code which is
> already in the exynos drm/hdmi driver (it already manages 'mout_hdmi/mixer'
> clocks). If other solution is finally accepted, the code can be simplified
> and mout_hdmi/mixer clocks simply ignored. For now - my changes are needed
> to get HDMI output working and have least dependencies.
> 
> Best regards


With best wishes,
Tobias
