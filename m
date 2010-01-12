From: Ben Dooks <ben@trinity.fluff.org>
Subject: S5PC1XX clocki fixes
Date: Tue, 12 Jan 2010 04:20:09 +0000
Message-ID: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40847 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753470Ab0ALEUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 23:20:22 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUYEr-0006Zu-AM
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 04:20:17 +0000
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Initial set of S5PC1XX clock fixes, two temporary patches in this series
to allow it to build which will go away once the parent patches are fixed.

Currently only build tested.
