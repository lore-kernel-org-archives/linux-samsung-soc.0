From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 0/6] Samsung stuff for v3.11
Date: Wed, 12 Jun 2013 16:54:55 -0700
Message-ID: <20130612235455.GD9067@quad.lixom.net>
References: <51B791C3.7050702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:35538 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756927Ab3FLXyu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 19:54:50 -0400
Received: by mail-pa0-f49.google.com with SMTP id ld11so4487688pab.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 16:54:50 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51B791C3.7050702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, Jun 12, 2013 at 06:08:19AM +0900, Kukjin Kim wrote:
> Hi Arnd, Olof
> 
> Please pull Samsung stuff for v3.11.
> 
> If any problems, please kindly let me know.

Hi,

I've pulled 1, 2, 4 and 6. Please fix the comments on 3 and 5 and send fresh
requests.

Also, I see you've based a bunch of branches on -rc5. While this is
fine, it is more convenient for us to review your branch submission if it
doesn't also pull in a newer upstream -rc.

Main reason to use the most-recent -rc would be if new code conflicts
with fixes in the previous -rc version, but if they don't then feel free
to start your branches on an older version instead.


-Olof
