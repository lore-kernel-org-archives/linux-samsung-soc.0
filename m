From: Ben Dooks <ben-linux@fluff.org>
Subject: GPIO update to allow code to get at gpio_chip
Date: Fri,  8 Jan 2010 06:32:27 +0000
Message-ID: <1262932348-2888-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:53916 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750788Ab0AHGcd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jan 2010 01:32:33 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Allowing gpiolib implementations to get at the gpio_chip from the
gpio number is useful to allow gpiolib gpio numbering to be used
for other gpio purposes such as changing pin configuration.

The following patch exports this information. A patch showing the
reason for my wanting this can be supplied on request.
