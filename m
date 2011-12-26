From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: Pull Requeset: Exynos4 Register Address Update for Devfreq Drivers.
Date: Mon, 26 Dec 2011 13:16:41 +0900
Message-ID: <CAJ0PZbSozVrr70c4s6-F-_dNETo7Of37RxGwQnrjt2mva9B_sA@mail.gmail.com>
References: <CAJ0PZbQ1=+BTs0Emi78kfOWD5d90+ND5Jc_SJ9T4BcGMXyny9A@mail.gmail.com>
	<088b01ccc1df$994d0090$cbe701b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:54253 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751020Ab1LZEQl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Dec 2011 23:16:41 -0500
Received: by iaeh11 with SMTP id h11so18291066iae.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Dec 2011 20:16:41 -0800 (PST)
In-Reply-To: <088b01ccc1df$994d0090$cbe701b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>

On Sat, Dec 24, 2011 at 10:58 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> As I commented, looks ok to me and will apply patches not pull and since I
> didn't get your answer to ask 'topic branch is required for this', I didn't
> yet.
>
> As a note, if there is no reason to create based on not -rc, just use -rc.
>
> Merry Christmas.
> Thanks.
>


Hello,

Having a topic branch for devfreq is fine and I don't care whether
there is one or not as long as the required registers are supported.

Because the registers added in the patches do not seem to be devfreq
specific, I don't think we should have another branch for this. Thus,
having the patches in your Exynos' branch is also fine.

I'll let future pull-requested branches be rebased on rcX anyway. Thanks.


Cheers! Happy new year!
- MyungJoo

-- 
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
