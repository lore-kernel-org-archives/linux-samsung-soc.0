From: Ben Dooks <ben-linux@fluff.org>
Subject: S5PC100 squashing
Date: Tue, 26 Jan 2010 08:32:02 +0000
Message-ID: <20100126083201.GZ10014@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:57672 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751864Ab0AZIcD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 03:32:03 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>

Does anyone have any opinion on whether plat-s5pc1xx should stay? At the
moment it is only servicing mach-s5pc100 and thenew support for v210 and
s5pc110 seem to be using plat-s5p and not plat-s5pc1xx.

>From the looks of it, s5pc100-init.c could probably be pushed into
the arch/arm/mach-s5pc100/cpu.c file. The s5pc100-clock.c should be
moved into arch/arm/mach-s5pc100/ as well.

Not sure yet what to do with the rest.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
