From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Use more descriptive names for Exynos5420 PDs
Date: Tue, 10 Feb 2015 14:14:32 +0100
Message-ID: <1423574072.6241.8.camel@AMDC1943>
References: <1423244258-24314-1-git-send-email-javier.martinez@collabora.co.uk>
 <54D51170.10903@cogentembedded.com> <54D52905.6040100@collabora.co.uk>
 <CAJKOXPepTJYYs6gR6NLQzsJndeRLgF+KHRpH9qt9noUgRBs2Dw@mail.gmail.com>
 <54D9F1A4.1000908@cogentembedded.com> <1423570670.6241.2.camel@AMDC1943>
 <54D9F7B1.3030106@cogentembedded.com> <1423571438.6241.4.camel@AMDC1943>
 <54D9FD94.9000102@collabora.co.uk> <54DA0107.2020909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:37562 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755192AbbBJNOg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Feb 2015 08:14:36 -0500
In-reply-to: <54DA0107.2020909@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Kukjin Kim <kgene@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On wto, 2015-02-10 at 14:00 +0100, Sylwester Nawrocki wrote:
> On 10/02/15 13:46, Javier Martinez Canillas wrote:
> >>>> This debugfs code iterates over list of generic_pm_domains (gpd_list). I
> >>>> >> > cannot find function for translating from genpd to its platform device
> >>>> >> > so only genpd->name can be printed.
> >>> >> 
> >>> >>     Then why power domains aren't just named with the platform device names?
> >> > 
> >> > Right, the mach-exynos/pm_domains.c set the name equal to OF node name.
> >> > I'll send a patch extending the name.
> >> >
> > IIRC the OF core uses the device node unit address and node name to create
> > the platform device names so you will have something like 10044000.power-domain.
> > 
> > Same if using the node full_name since it will /power-domain@10044000. In both
> > cases the DTS should have to be checked to know which power domain really is
> > unless someone knows by heart the power domains addresses.

For the kernel developer that would be descriptive enough to find the
real domain but... as you said each time one would have to grep through
manual or DTS which is slower. However for end-user that still won't be
descriptive enough.

> > 
> > But if using generic names for the power domains as suggested by ePAPR is so
> > important then we should change all the other Exynos DTS files which don't do.
> 
> Perhaps we could assign OF aliases to the power domain device nodes in DT
> and then in the power domains driver map those aliases to more descriptive
> names when creating the power domains?

That would required additional alias in DT but it could be the most
descriptive for a user.

Best regards,
Krzysztof
