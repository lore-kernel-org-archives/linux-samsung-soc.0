From: Ben Dooks <ben-linux@fluff.org>
Subject: Default machine include placements
Date: Mon, 25 Jan 2010 04:02:56 +0000
Message-ID: <20100125040255.GN26562@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:47099 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751800Ab0AYEDA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 23:03:00 -0500
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>

Currently in the s3c/s5p familt we're seeing quite a number of the
same things being repeated for items like entry-macro.S, hardware.h
and so on.

The first question is about adding include/mach directories to
eitehr plat-s5p or plat-samsung to mop up the files that keep
getting repeated (since the plat-* directories are processed after
the machine directory includes the mach-xxx are still free to overide
these as necessary)

The second question is whether some of these files should have defaults
in arch/arm/include? I think this might be less useful as build failures
for new ports ensure that at-least these files are thought about

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
