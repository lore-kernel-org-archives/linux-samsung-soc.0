From: Ben Dooks <ben-linux@fluff.org>
Subject: S3C6410/S3C6400 platform squash
Date: Tue, 26 Jan 2010 07:02:51 +0000
Message-ID: <1264489385-13345-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:46306 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751537Ab0AZHDM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 02:03:12 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Attached is the series to squash mach-s3c6400 and mach-s3c6410 together
and then also place plat-sc64xx in there as well (mostly).

The only issue is we are left with two files in plat-s3c64xx which are
required from include/plat. Would adding an include/plat directory to
arch/arm/mach-s3c64xx be ok for these or do we need to find another
solution?
