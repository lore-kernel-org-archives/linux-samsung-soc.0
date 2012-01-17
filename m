From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 0/8] S3C24XX: remove global plat/s3c24??.h
	SoC-headers
Date: Tue, 17 Jan 2012 21:58:09 +0000
Message-ID: <20120117215809.GZ1068@n2100.arm.linux.org.uk>
References: <201201172210.51953.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:35933 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755118Ab2AQV6U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 16:58:20 -0500
Content-Disposition: inline
In-Reply-To: <201201172210.51953.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

On Tue, Jan 17, 2012 at 10:10:51PM +0100, Heiko St=FCbner wrote:
>  53 files changed, 485 insertions(+), 509 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c2410/common.h
>  create mode 100644 arch/arm/mach-s3c2410/s3c2410.h

Given the amount of pain we've recently been through creating common.h
in this merge window, I'm going to say no to getting rid of it this
early.  Hell, this merge window hasn't even closed and the file which
was created during it is already being deleted?

No, this isn't right.  Especially as you're having to change all the
#include statements in each mach-* file from common.h to s3c2410.h.
