From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: domain off
Date: Mon, 11 Jan 2016 08:27:19 +0900
Message-ID: <CAJKOXPeCyEYtUGf2skAbudOjGiSVn8Hyzk76B5aW8VJT7apoqA@mail.gmail.com>
References: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
	<CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
	<CAH9_wRN13+PKLsTL3kSonLUpzHo7zbQJZ658C4+fRZRxe=HeTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:35420 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757409AbcAJX1U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2016 18:27:20 -0500
Received: by mail-ig0-f172.google.com with SMTP id t15so84911063igr.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Jan 2016 15:27:19 -0800 (PST)
In-Reply-To: <CAH9_wRN13+PKLsTL3kSonLUpzHo7zbQJZ658C4+fRZRxe=HeTw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sriram V <vshrirama@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

2016-01-10 22:49 GMT+09:00 Sriram V <vshrirama@gmail.com>:
> Hi Krzysztof,
>
> I see that in pm_genpd_sumarry, the domains are off. However, i still
> see the clocks are on.
> For example; isp and cam is turned off in pm_genpd_summary, however
> cam clocks are still on.
>
> Should'nt the clocks be turned off first and then the domain.

No, the clocks in clock hierarchy are usually not disabled as a part
of domain power off. However respective drivers attached to a power
domain, when entering runtime suspend, should disable these clocks.

Best regards,
Krzysztof
