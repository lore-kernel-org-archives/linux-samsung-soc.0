From: Ben Dooks <ben-linux@fluff.org>
Subject: S3C24XX device updates and machine fixes
Date: Tue, 10 Nov 2009 23:21:52 +0000
Message-ID: <1257895316-9156-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:51204 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758655AbZKJXV5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2009 18:21:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Initial work for the machine device updates, go through and fix some
problems with currently merged code either using bad names, sorting
out platform-data registering calls and other misc problems.
