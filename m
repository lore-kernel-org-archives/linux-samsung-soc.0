From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2 4/6] ARM: SAMSUNG: Restore Samsung PM Debug functionality
Date: Thu, 26 Jun 2014 10:24:23 +0100
Message-ID: <CAD8Lp46X_urw=ayVZNL8Af9pMUD4st7tAtuMvkrg+A6YsxpiMw@mail.gmail.com>
References: <1403618235-19353-5-git-send-email-t.figa@samsung.com>
	<1403696634-12779-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:44764 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753414AbaFZJY1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 05:24:27 -0400
Received: by mail-wi0-f181.google.com with SMTP id n3so643598wiv.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2014 02:24:24 -0700 (PDT)
In-Reply-To: <1403696634-12779-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

On Wed, Jun 25, 2014 at 12:43 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Due to recently merged patches and previous merge conflicts, the Samsung
> PM Debug functionality no longer can be enabled. This patch fixes
> incorrect dependency of SAMSUNG_PM_DEBUG on an integer symbol and adds
> missing header inclusion.

I replaced the original patch with this updated version and can
confirm that the option now appears in the menu again, and compile
succeeds when set to yes.

Thanks
Daniel
