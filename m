From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C24XX: Fix restart on S3C2442
Date: Mon, 13 Feb 2012 13:58:23 +0100
Message-ID: <201202131358.23652.heiko@sntech.de>
References: <1329051929-8303-1-git-send-email-GNUtoo@no-log.org> <201202121957.10472.GNUtoo@no-log.org> <201202131329.37465.GNUtoo@no-log.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:56645 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752314Ab2BMM6i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 07:58:38 -0500
In-Reply-To: <201202131329.37465.GNUtoo@no-log.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Denis,

Am Montag, 13. Februar 2012, 13:29:37 schrieb Denis 'GNUtoo' Carikli:
> >Thanks a lot for the patch.
> >It compiles fine.
> >Now time for me to look at runtime boot issues for my gta02.
> 
> I've now tested at runtime, here's the boot log:

[snipped boot log]

> It is now waiting for the rootfs that isn't there(since /dev/mmcblk0p1
> depend on a driver that is not mainline and that I only applied the patch
> to test on top of the master branch of linux-next).
> 
> Tested-by: Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>

thanks for testing, and for still working on the Freerunner. At some point I'd 
probably like to revive mine :-)

Heiko
