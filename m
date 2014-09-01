From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mfd: syscon: Decouple syscon interface from syscon devices
Date: Mon, 01 Sep 2014 16:18 +0200
Message-ID: <6929512.Xet4VLKWdC@wuerfel>
References: <1408694991-21615-1-git-send-email-pankaj.dubey@samsung.com> <4121644.3haxjiIdIo@wuerfel> <000c01cfc5d9$03866c30$0a934490$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:54217 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753398AbaIAOS0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Sep 2014 10:18:26 -0400
In-Reply-To: <000c01cfc5d9$03866c30$0a934490$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: 'Lee Jones' <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com, 'Tomasz Figa' <t.figa@samsung.com>, broonie@kernel.org

On Monday 01 September 2014 17:05:33 Pankaj Dubey wrote:
> 
> Please have a look at this thread [1], where we discussed the need of syscon
> as platform device.
> Looks like still there are users of syscon_regmap_lookup_by_pdevname
> (clps711x.c).
> So we can't make it completely independent of platform_device. 
> 
> [1]
> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35708.html

I think the clps711x platform will soon stop using it, we already
have patches for migrating to DT.

	Arnd
