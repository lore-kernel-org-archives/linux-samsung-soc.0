From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 0/6] ARM: EXYNOS: Add secure firmware support
Date: Wed, 10 Oct 2012 09:11:36 -0700
Message-ID: <20121010161136.GD582@quad.lixom.net>
References: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
 <1647638.5fBfDOzz0u@amdc1227>
 <CAH9JG2V56eLCCX+9id1EWhKfZ-6qW-3O0j0mVpzOjz5S8QGQ7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:63995 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751717Ab2JJQLS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 12:11:18 -0400
Received: by mail-pa0-f46.google.com with SMTP id hz1so760591pad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 09:11:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAH9JG2V56eLCCX+9id1EWhKfZ-6qW-3O0j0mVpzOjz5S8QGQ7g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, m.szyprowski@samsung.com

Hi,

On Thu, Oct 11, 2012 at 12:35:54AM +0900, Kyungmin Park wrote:
> Hi Arnd or Olof,
> 
> Can you pick up for v3.7?
> 
> To Tomasz,
> Can you rebase it on the latest arm-soc tree?

This code should have been in arm-soc by the beginning of the merge window
(and in linux-next) to be merged for 3.7, but we will be happy to queue
it up for 3.8 once 3.7-rc1 is out. I have one outstanding comment on
the DT binding but the rest looks OK to me.

Tomasz, please rebase and send this to Kukjin so he can queue it up with other
Samsung code.


Thanks!

-Olof
