From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: pm_domain: Fix power domain name initialization
Date: Sat, 08 Sep 2012 10:24:33 +0200
Message-ID: <3430339.QiHB9nIcXj@flatron>
References: <1346924286-9584-1-git-send-email-t.figa@samsung.com> <1346924286-9584-3-git-send-email-t.figa@samsung.com> <CAJuYYwQWEN3FiNwQdugeKRV53cA65WdW79trcmP2kqqOPbz+sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:40886 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751478Ab2IHIYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Sep 2012 04:24:39 -0400
Received: by wibhr14 with SMTP id hr14so301545wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Sep 2012 01:24:38 -0700 (PDT)
In-Reply-To: <CAJuYYwQWEN3FiNwQdugeKRV53cA65WdW79trcmP2kqqOPbz+sg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, rjw@sisk.pl

Hi Thomas,

On Saturday 08 of September 2012 13:37:59 Thomas Abraham wrote:
> > -               pd->name = np->name;
> > +               pd->pd.name = kstrdup(np->name, GFP_KERNEL);
> > +               pd->name = pd->pd.name;
> 
> Since device tree blob is always resident, why not just use np->name
> instead of copying it to a new place?

The problem is that np->name is const, while pd->pd.name is not.

--
Best regards,
Tomasz Figa
