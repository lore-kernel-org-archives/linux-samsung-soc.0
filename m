From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung cleanup-2 for v3.6
Date: Tue, 17 Jul 2012 20:58:28 +0000
Message-ID: <201207172058.28993.arnd@arndb.de>
References: <142c01cd639c$2f081800$8d184800$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:55691 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756617Ab2GQU6c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jul 2012 16:58:32 -0400
In-Reply-To: <142c01cd639c$2f081800$8d184800$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

On Monday 16 July 2012, Kukjin Kim wrote:
> Here is second Samsung cleanup pull request for v3.6.
> Please pull from: 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/cleanup-samsung-2
> 
> It is related in using common GPIO API and removing unused GPIOs.
> 
> If any problems, please let me know.
> 

Very nice series, I've merged it into next/cleanup now.

Two general comments on your submissions:

1. Please put the branch name into the same line as the git url, that
makes it slightly faster for me to copy-and-paste the pull location.

2. If you can, please use signed tags for your pull requests rather
than branch names. A signed tag means that you can write the text
for the merge changeset yourself so I don't have to do the description.
Ideally the signing key should have signatures from other people in the
keyring so everybody can check the authenticity of the request, but
just having the changelog there also helps.

	Arnd
