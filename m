From: Ben Dooks <ben-linux@fluff.org>
Subject: SDHCI ADMA clenaups
Date: Thu, 28 Jan 2010 05:29:55 +0000
Message-ID: <1264656597-19965-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:60511 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750759Ab0A1F37 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 00:29:59 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, pierre@ossman.eu, linux-mmc@vger.kernel.org, akpm@linux-foundation.org

ADMA code cleanps for SDHCI driver. Makes the code shorter and more efficient.
