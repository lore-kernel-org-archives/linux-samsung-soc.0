From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 6/7] Samsung cleanup fimd header for v3.7
Date: Thu, 20 Sep 2012 16:59:49 -0700
Message-ID: <20120920235949.GB13788@quad.lixom.net>
References: <099d01cd96bd$2f625050$8e26f0f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49971 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753964Ab2ITX7j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 19:59:39 -0400
Received: by pbbrr4 with SMTP id rr4so1299700pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Sep 2012 16:59:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <099d01cd96bd$2f625050$8e26f0f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Leela Krishna Amudala' <l.krishna@samsung.com>, 'Florian Tobias Schandinat' <FlorianSchandinat@gmx.de>

On Thu, Sep 20, 2012 at 08:19:15AM +0900, Kukjin Kim wrote:
> Hi Arnd, Olof.
> 
> This is for moving header file is related to fimd from platform to
> include/video.
> 
> Since this touches many Samsung stuff, it is included in samsung tree and I
> requested to pull into Florian's tree and he already agreed. So its name is
> 'v3.7-for-florian'.

Hi,

So, it seems like there's no need to pull this through arm-soc; there are no
conflicts with other patches as far as I can see, and it can just go in through
Florian's tree.

Florian, if you want, you can add:

Acked-by: Olof Johansson <olof@lixom.net>

on the merge you do.


-Olof
