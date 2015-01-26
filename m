From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/2] exynos: Don't use DRM_EXYNOS_GEM_{MAP_OFFSET/MMAP} ioctls
Date: Mon, 26 Jan 2015 19:05:51 +0000
Message-ID: <CACvgo52r33R99JkOkWxHGEO+1zvAjfBb2nJfk6Kqt57M3iA5FA@mail.gmail.com>
References: <1421449054-2808-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1421449054-2808-2-git-send-email-tjakobi@math.uni-bielefeld.de>
	<20150126104238.65da492e@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:62414 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753947AbbAZTFw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Jan 2015 14:05:52 -0500
Received: by mail-yk0-f172.google.com with SMTP id 9so4603234ykp.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Jan 2015 11:05:51 -0800 (PST)
In-Reply-To: <20150126104238.65da492e@hwh-ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>

On 26 January 2015 at 01:42, Hyungwon Hwang <human.hwang@samsung.com> wrote:
> Dear Tobias,
>
> Thanks for fixing it.
>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
>
Hi Hyungwon Hwang

I'm a bit confused about the use of s-o-b here. I've assumed that
libdrm follows the kernel style [1] for those type of things ?
Would you have anything handy which I can read on the topic ?

Cheers,
Emil

[1] https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/Documentation/SubmittingPatches#n358

A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
