From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung cleanup-2 for v3.2
Date: Fri, 7 Oct 2011 20:05:49 +0200
Message-ID: <201110072005.49967.arnd@arndb.de>
References: <019a01cc8298$823f7b20$86be7160$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:51169 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753724Ab1JGSGJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 14:06:09 -0400
In-Reply-To: <019a01cc8298$823f7b20$86be7160$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

On Tuesday 04 October 2011, Kukjin Kim wrote:
> This is second cleanup for Samsung stuff for v3.2 and includes cleanup
> header files in plat-s3c24xx and plat-s5p to merge into one plat-samsung
> directory.
> 
> Please pull from:
>   git://github.com/kgene/linux-samsung.git next-samsung-cleanup-2
> 
> And this is based on previous Samsung cleanup branch, next-samsung-cleanup
> which has been merged in arm-soc because of dependency.
> 
> If any problems, please let me know.
> 

Looks good to me. I think this should go into 3.2 very late during the merge
window since it moves around a lot of files that might be touched by other
patches, and I don't want to break a lot of that stuff, so I'm putting
it into a separate next/cleanup2 branch, ok?

	Arnd
