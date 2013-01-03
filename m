From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 15/19] ARM: samsung: remove unused tick.h
Date: Thu, 3 Jan 2013 22:25:27 +0000
Message-ID: <201301032225.27620.arnd@arndb.de>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com> <201301032151.32337.arnd@arndb.de> <50E603EE.9030504@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:54080 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753808Ab3ACWZm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 17:25:42 -0500
In-Reply-To: <50E603EE.9030504@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, thomas.petazzoni@free-electrons.com, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thursday 03 January 2013, Rob Herring wrote:
> The first half is relevant in that it eliminates an occurrence of VIC
> defines, but could be applied separately. I'm not sure what happened
> with mach-s5p64x0/include/mach/tick.h as that should be removed too.

Ok, I see.

	Arnd
