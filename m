From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Fri, 24 Oct 2014 20:03:23 +0530
Message-ID: <CAM4voakn128LmppJeVbtibwJcwa-TQL8KWhsEDb_DXTZECs48Q@mail.gmail.com>
References: <7133556.456161412823997169.JavaMail.weblogic@epml02>
	<7hzjd4lxc5.fsf@deeprootsystems.com>
	<loom.20141015T133306-266@post.gmane.org>
	<CAMAWPa8ANvzaC4EfvRbwCZSya6xt=u6qmvN5cF1jhAROTdW3Pg@mail.gmail.com>
	<54485433.2040008@samsung.com>
	<54485730.10803@samsung.com>
	<CAGc3s_cS4zYUtdB=+8bPh2sa4Exy5guzupu-TvgJ_KmuyGGBPg@mail.gmail.com>
	<54485B99.2000703@samsung.com>
	<CAGc3s_e86Lx+pF12osoKoROXq4rUNf_GQtfJ8xB9w-X4pGVOmQ@mail.gmail.com>
	<54485E99.9020004@samsung.com>
	<54485FDA.8070508@samsung.com>
	<CAG30XQJ29cM6=OFh=TTbR2rfWGt3AK1o2=PMqdoq6ejUJtUwGA@mail.gmail.com>
	<A804D1798D614199AFA7AEDC00248EA9@sisodomain.com>
	<7hfveeaifs.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f176.google.com ([209.85.216.176]:45749 "EHLO
	mail-qc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751729AbaJXOdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 10:33:23 -0400
Received: by mail-qc0-f176.google.com with SMTP id r5so806497qcx.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2014 07:33:23 -0700 (PDT)
In-Reply-To: <7hfveeaifs.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Abhijeet Dev <abhijeet@abhijeet-dev.net>, Joonyoung Shim <jy0922.shim@samsung.com>, Mauro Ribeiro <mdrjr0@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chander Kashyap <k.chander@samsung.com>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Kukjin Kim <kgene.kim@samsung.com>

Hello Kevin,

On Thu, Oct 23, 2014 at 9:26 PM, Kevin Hilman <khilman@kernel.org> wrote:
> Abhilash Kesavan <a.kesavan@samsung.com> writes:
>
>> The change was based on my reading of the platsmp file of the
>> Odroid-xu3 3.10 kernel and issues experienced previously. From what I
>> understand, the platsmp code in 3.10 kernel is trying to reset the A7s
>> and my change just bypasses the check (no magic here ). The change was
>> only suggested as a workaround to get 8 cores up using MCPM and not an
>> actual fix.  I had explained this in my mail to Kevin. So, if this
>> were to be mainlined we would probably need to use something like
>> exynos_core_restart in mcpm along with the workaround. But, this is
>> all guesswork on my part and someone with knowledge of the 3.10
>> kernel/bootloader needs to comment.
>
> Unfortunately, the harkernel tree git repo doesn't help understand where
> the change came from because an entire v3.10.y based Samsung BSP is
> checked into the tree on top of a v3.8.y kernel in a single commit !!!
>
> Abhilash, in the absence of the original author, could write up a patch
> with your change?
>
> Or, if you can help me with a detailed changelog, I can work on the patch.
> I don't have any exynos docs, so it would be good to have a description
> of what reading/writing to that register are actually doing.

I could post a patch with an explanation of how I think the workaround
works, but there are a few issues:
- I am not completely confident that this is the best/right change.
- We are adding code to the exynos mcpm back-end to work-around a
bootloader setting for Odroid-xu3. We would have to make it specific
to odroid somehow as we do not require it for 5420/5800 chromebooks.
- This might solve the 8 core boot-up issue but other scenarios might
still fail like the one Joonyoung has already reported.

>
> Also, can you explain what you meant by using exynos_core_restart?  I
> don't see that function in mainline.

It is present in linux-next and kgene's for-next branch as part of
this commit "ARM: EXYNOS: SWRESET is needed to boot secondary CPU on
exynos3250".


Regards,
Abhilash
