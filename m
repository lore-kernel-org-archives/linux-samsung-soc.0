From: Ben Dooks <ben-linux@fluff.org>
Subject: s3c-hsotg driver updates / fixes
Date: Tue, 25 May 2010 05:36:47 +0100
Message-ID: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:32860 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751752Ab0EYEg6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 00:36:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org

This series includes the usb-xtal rate addition/fix from Marus which
has been submitted (so please ignore if merge is already pending) and
fixes for some of the problems that have been seen.

This is not the full set of fixes, as there are still some more complicated
issues to sort out with things such as stall handling on non-ep0 endpoints
which are being investiagted.

Thanks to Thomas Abraham and Kukjin Kim at Samsung for providing help and
further information to help track down these problems.
