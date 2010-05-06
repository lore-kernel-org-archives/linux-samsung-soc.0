From: Ben Dooks <ben-linux@fluff.org>
Subject: S3C24XX GPIO updates
Date: Fri,  7 May 2010 08:15:22 +0900
Message-ID: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60600 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751315Ab0EFXPx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:15:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This is the series to remove the old style s3c2410_gpio calls and move
to using the central gpiolib based s3c_gpio calls.

Please test this branch on s3c24xx based systems as i've not got much
access to any of the older boards.
