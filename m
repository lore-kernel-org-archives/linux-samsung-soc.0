From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Sun, 21 Apr 2013 16:15:09 +0200
Message-ID: <13400811.6r9KW3KpPk@flatron>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org> <2021753.aZ0KODlsRB@flatron> <CAAQKjZN78+WTO+Q3eWDAS2iF3zPxo7tjysAd3nwbGEKXmz8zUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:41163 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753538Ab3DUOPP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Apr 2013 10:15:15 -0400
Received: by mail-wi0-f181.google.com with SMTP id c10so3002683wiw.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Apr 2013 07:15:14 -0700 (PDT)
In-Reply-To: <CAAQKjZN78+WTO+Q3eWDAS2iF3zPxo7tjysAd3nwbGEKXmz8zUQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <daeinki@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>

Hi Inki,

On Sunday 21 of April 2013 23:05:45 Inki Dae wrote:
> 2013/4/21 Tomasz Figa <tomasz.figa@gmail.com>
> 
> > On Sunday 21 of April 2013 13:23:10 Viresh Kumar wrote:
> > > On 20 April 2013 20:56, Inki Dae <inki.dae@samsung.com> wrote:
> > > > Sorry for being late. I think clk_prepare/unprepare are nothing to
> > > > do
> > > > yet in case of Exynos but those might be used for in the future so
> > > > your patch looks good to me as is.
> > > > 
> > > > Applied. :)
> > 
> > Hmm. Now, after searching for this thread in dri-devel archives, I'm
> > wondering why I haven't received some of messages from this thread
> > through linux-samsung-soc mailing list...
> > 
> > I believe linux-samsung-soc list exists to collect all threads related
> > to Samsung SoCs for people that don't want to subscribe to lists like
> > dri- devel, on which there is a lot of threads irrelevant to them,
> > with the risk of missing the important ones.
> > 
> > Please always make sure that any discussion about Samsung SoCs
> > (patches in particular) is going through linux-samsung-soc as well.
> 
> Thanks for your advice. As you said, some people might not want to
> subscribe to some mainling lists they don't want. And I think that the
> main mailing list on this patch is dri-devel so you must receive this
> email thread if you subscribed to the dri-devel.

I agree that dri-devel is the target mailing list for DRM patches, but 
AFAIK all threads related to Samsung SoCs should be sent to linux-samsung-
soc as well.

For example, I don't subscribe dri-devel, but I do linux-samsung-soc, 
because all I want to follow is all the works related to Samsung SoCs.
Remaining threads on dri-devel are outside of my competencies.

> Anyway it would be
> best to share this all mailing lists included in this email thread but
> if so, I have no doubt to receive email bumb. :(

Hmm, you don't have to subscribe to a mailing list to post to it.

Actually I'm wondering if the fact that your previous messages did not get 
to the linux-samsung-soc list was not caused by presence of HTML part in 
your messages, which is strongly discouraged on all mailing lists and 
actually blocked on vger.kernel.org where linux-samsung-soc is hosted.

Best regards,
Tomasz
