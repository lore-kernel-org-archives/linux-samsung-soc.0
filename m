From: Ben Dooks <ben-linux@fluff.org>
Subject: next-samsung: acer n30/n35 updates
Date: Fri, 7 May 2010 01:50:50 +0100
Message-ID: <20100507005050.GY2589@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:37835 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751329Ab0EGAuw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 20:50:52 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jiri.Pinkava@vscht.cz, linux-samsung-soc@vger.kernel.org

Acer n35 support has been provisonally merged into the following branch:

  git://git.fluff.org/bjdooks/linux.git for-2635/acer-n35

If there are any objections, then let me know, otherwise this will be
merged into next-samsug this weekend ready to go in the next merge window.

Jiri, please confirm that you've read Section 12 'Sign your work' of
Documentation/SubmittingPatches and that you agree to the part on
"Developer's Certificate of Origin 1.1"

The following commits are in:

Pinkava J (7):
      ARM: n30: Enable Acer n35 if Acer n30 is selected
      ARM: n30: fix: suspended wrong USB port on Acer n35
      ARM: n30: Add RTC platform device for Acer n30 / Acer n35
      ARM: n35: Add support for LEDs on Acer n35
      ARM: n35: Enable wake-up by Power button on Acer n35
      ARM: n30: Add support for MMC card reader on Acer n30 / Acer n35
      ARM: n30: Add support for power on/off on Acer n30 / Acer n35 MMC card reader

 arch/arm/mach-s3c2410/Kconfig    |    7 ++++
 arch/arm/mach-s3c2410/mach-n30.c |   65 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+), 1 deletions(-)


-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
