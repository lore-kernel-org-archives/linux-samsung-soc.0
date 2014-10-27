From: Kevin Hilman <khilman@kernel.org>
Subject: Re: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Mon, 27 Oct 2014 12:00:28 -0700
Message-ID: <7hwq7ll4mr.fsf@deeprootsystems.com>
References: <7133556.456161412823997169.JavaMail.weblogic@epml02>
	<7hzjd4lxc5.fsf@deeprootsystems.com>
	<loom.20141015T133306-266@post.gmane.org>
	<CAMAWPa8ANvzaC4EfvRbwCZSya6xt=u6qmvN5cF1jhAROTdW3Pg@mail.gmail.com>
	<54485433.2040008@samsung.com> <54485730.10803@samsung.com>
	<CAGc3s_cS4zYUtdB=+8bPh2sa4Exy5guzupu-TvgJ_KmuyGGBPg@mail.gmail.com>
	<54485B99.2000703@samsung.com>
	<CAGc3s_e86Lx+pF12osoKoROXq4rUNf_GQtfJ8xB9w-X4pGVOmQ@mail.gmail.com>
	<54485E99.9020004@samsung.com> <54485FDA.8070508@samsung.com>
	<CAG30XQJ29cM6=OFh=TTbR2rfWGt3AK1o2=PMqdoq6ejUJtUwGA@mail.gmail.com>
	<A804D1798D614199AFA7AEDC00248EA9@sisodomain.com>
	<7hfveeaifs.fsf@deeprootsystems.com>
	<CAM4voakn128LmppJeVbtibwJcwa-TQL8KWhsEDb_DXTZECs48Q@mail.gmail.com>
	<7hk33p8nkn.fsf@deeprootsystems.com>
	<CAGc3s_dEk6S82JgSbueML8_68-hdEKhLrY1G0k+kcg+YJ77JmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:64987 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892AbaJ0TAd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 15:00:33 -0400
Received: by mail-pd0-f170.google.com with SMTP id z10so6181032pdj.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Oct 2014 12:00:32 -0700 (PDT)
In-Reply-To: <CAGc3s_dEk6S82JgSbueML8_68-hdEKhLrY1G0k+kcg+YJ77JmQ@mail.gmail.com>
	(Mauro Ribeiro's message of "Sat, 25 Oct 2014 10:47:05 -0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mauro Ribeiro <mdrjr0@gmail.com>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Abhijeet Dev <abhijeet@abhijeet-dev.net>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chander Kashyap <k.chander@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Mauro Ribeiro <mdrjr0@gmail.com> writes:

> As I wrote you previously outside the list this is the commit "ARM:
> EXYNOS: SWRESET is needed to boot secondary CPU on exynos3250" that I
> was expecting it to fix XU3 as well and apparently it is..

I'm not sure about that, since I haven't been able to get that to work.

> Next week if everything goes as I plan I'll check if I can use the
> same code to enable the A7's on XU3 as well.
> If its possible to use the same code I'll try to upstream this next week.

Excellent.  I'd love to see a patch against mainline that using that
function that works on the XU3.  Note that mainline is using MCPM and
that patch solves the problem for the older platsmp method.

> It would be nice if Samsung could tell what in our u-boot (provided by
> LSI) is needed to be changed as I can just push any changes to our
> u-boot.

Yes, I completely agree.  This seems to me like a bootloader bug and the
best solution here would be to have a bootloader fix.

Kevin
