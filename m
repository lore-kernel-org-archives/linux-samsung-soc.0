From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] Sort out S5P SoCs support in mainline
Date: Wed, 28 May 2014 13:04:02 +0200
Message-ID: <13875033.1X6R9lksgc@wuerfel>
References: <021f01cf7a61$69853e30$3c8fba90$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:65289 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751545AbaE1LEI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 07:04:08 -0400
In-Reply-To: <021f01cf7a61$69853e30$3c8fba90$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, tomasz.figa@gmail.com

On Wednesday 28 May 2014 19:41:41 Kukjin Kim wrote:
> Hi all,
> 
> I'm wondering who need to support following SoCs/boards in mainline.
> 
> * S5P64X0/SMDK6440 and SMDK6450
> * S5PC100/SMDKC100
> 
> If nobody is using them, how about to remove them from mainline?

I talked about this with Tomasz Figa before, he also thinks they can be removed.
I don't see any reason to keep them myself, and will apply a patch to remove
them. Of course, if later somebody comes around who does need them, we can
revert the patch to bring them back.

	Arnd
