From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: I80 interface on S3C and manual command mode
Date: Sun, 15 May 2011 21:26:22 +0200
Message-ID: <201105152126.22338.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:58887 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751278Ab1EOT0c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 May 2011 15:26:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org

Hi,

I'm working on porting a kernel to a device which has an epaper-controller 
connected to the I80 interface of an S3C2416 and uses its "manual command 
mode", via SIFCCON[0,1,2], as the datasheet calls it.

While digging around the mailinglists I found patches by Inki Dae that 
implement the I80 basics. (cpu_mode struct and probe_win).

As there are multiple versions available in the fbdev patchwork and the i80 
interface seems to have been dropped in the latest version from 2011-04 I'd 
like ask if there are "final" versions laying around somewhere.

Also, to not reinvent the wheel, does an implementation of the i80 interface 
[via SIFCCONx] for s3c-fb exist somewhere per chance?

Thanks
Heiko
