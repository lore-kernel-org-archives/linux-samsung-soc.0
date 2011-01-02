From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: s3c-sdhci s3c-sdhci.1: failed to get io clock on a s3c2416
Date: Sun, 2 Jan 2011 21:25:36 +0100
Message-ID: <201101022125.37327.heiko@sntech.de>
References: <201101021842.55281.mmind@debian.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:48596 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753724Ab1ABUdf convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Jan 2011 15:33:35 -0500
In-Reply-To: <201101021842.55281.mmind@debian.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexander Neumann <fd0@lochraster.org>

[please keep the Cc, thanks]

Am Sonntag 02 Januar 2011, 18:42:55 schrieb Heiko St=FCbner:
> mmc0: SDHCI controller on samsung-hsmmc [s3c-sdhci.0] using ADMA
> s3c-sdhci s3c-sdhci.1: failed to get io clock
> mmc0: mmc_rescan: trying to init card at 400000 Hz
> s3c-sdhci: probe of s3c-sdhci.1 failed with error -2
some findings by Alexander:

the smdk2416 uses arch/arm/plat-s3c24xx/s3c2443-clock.c . The clock def=
initions=20
there don't include one for hsmmc and the needed id=3D1. So the second =
hsmmc=20
channel doesn't have a clock.

Current (unsucessful)  attempts following in patch form.

Heiko
