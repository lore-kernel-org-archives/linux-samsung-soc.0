From: Ben Dooks <ben-linux@fluff.org>
Subject: Eliminate plat-s3c
Date: Fri, 29 Jan 2010 09:02:11 +0000
Message-ID: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33726 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756670Ab0A2JCY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jan 2010 04:02:24 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This series eliminates plat-s3c from the build, as it can mostly
be moved into plat-samsung and plat-s3c24xx.

May end up squashing the series down a bit.
