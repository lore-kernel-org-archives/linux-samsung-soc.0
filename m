From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-2 for v3.10
Date: Mon, 20 May 2013 23:40:34 -0700
Message-ID: <20130521064034.GE20453@quad.lixom.net>
References: <519A5933.3040005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:51040 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753979Ab3EUGki (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 02:40:38 -0400
Received: by mail-pa0-f45.google.com with SMTP id lj1so381455pab.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 May 2013 23:40:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <519A5933.3040005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tue, May 21, 2013 at 02:11:15AM +0900, Kukjin Kim wrote:
> The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:
> 
>   Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-fixes-2

What happened to the 4210 rev0 regression fixes from Tomasz? I would
have expected them in this batch?

Might as well hold off this one until that is reviewed and ready, since
it's silly to keep pulling one-patch branches. At least if that's happening
this week.


-Olof
