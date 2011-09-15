From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung Fixes for v3.1-rc7
Date: Thu, 15 Sep 2011 17:32:59 +0200
Message-ID: <201109151732.59886.arnd@arndb.de>
References: <00b101cc738d$bcf46ce0$36dd46a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:50914 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934023Ab1IOPdQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Sep 2011 11:33:16 -0400
In-Reply-To: <00b101cc738d$bcf46ce0$36dd46a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

On Thursday 15 September 2011, Kukjin Kim wrote:
> This is Samsung fixes for v3.1
> 
> Please pull from:
>   git://github.com/kgene/linux-samsung.git samsung-fixes-2
> As you know, git.kernel.org/master.kernel.org has been down so I use
> temporary git repo. at github now.
> 
> These things are needed for v3.1 and if any problems, please let me know.
> 
> As a note, others for v3.2 will be sent in the next week...

Thanks, pulled.

Is it correct that you want none of these patches to be backported
into the stable or longterm releases? Some of these look like they
should be marked 'Cc: stable@kernel.org'.

	Arnd
