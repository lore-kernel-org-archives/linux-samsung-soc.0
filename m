From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Sun, 21 Apr 2013 12:35:20 +0200
Message-ID: <2021753.aZ0KODlsRB@flatron>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org> <CAAQKjZMoXj-YFYQhkQOwL-VJgKP0hgMxQ-vqiBCfuinBSCgmHg@mail.gmail.com> <CAKohpon6_w=ANHTrJYNAJP_c=-prqUhcOfzBajpMgi3Yy5zcwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:56656 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753078Ab3DUKf0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Apr 2013 06:35:26 -0400
Received: by mail-wi0-f176.google.com with SMTP id hj19so2849140wib.15
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Apr 2013 03:35:24 -0700 (PDT)
In-Reply-To: <CAKohpon6_w=ANHTrJYNAJP_c=-prqUhcOfzBajpMgi3Yy5zcwQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Inki Dae <inki.dae@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>

On Sunday 21 of April 2013 13:23:10 Viresh Kumar wrote:
> On 20 April 2013 20:56, Inki Dae <inki.dae@samsung.com> wrote:
> > Sorry for being late. I think clk_prepare/unprepare are nothing to do
> > yet in case of Exynos but those might be used for in the future so
> > your patch looks good to me as is.
> > 
> > Applied. :)
> 

Hmm. Now, after searching for this thread in dri-devel archives, I'm 
wondering why I haven't received some of messages from this thread through 
linux-samsung-soc mailing list...

I believe linux-samsung-soc list exists to collect all threads related to 
Samsung SoCs for people that don't want to subscribe to lists like dri-
devel, on which there is a lot of threads irrelevant to them, with the 
risk of missing the important ones.

Please always make sure that any discussion about Samsung SoCs (patches in 
particular) is going through linux-samsung-soc as well.

Thanks in advance.

Best regards,
Tomasz
