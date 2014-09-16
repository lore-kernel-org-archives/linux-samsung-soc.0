From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] mfd: syscon: Decouple syscon interface from platform devices
Date: Tue, 16 Sep 2014 16:52:15 +0200
Message-ID: <201409161652.15333.arnd@arndb.de>
References: <1409668935-10667-1-git-send-email-pankaj.dubey@samsung.com> <20140905101409.68b14cc3@bbrezillon> <000b01cfd1a4$f5ae0d20$e10a2760$@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:59161 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753787AbaIPPvf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 11:51:35 -0400
In-Reply-To: <000b01cfd1a4$f5ae0d20$e10a2760$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: lee.jones@linaro.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, 'Alexander Shiyan' <shc_work@mail.ru>, naushad@samsung.com, 'Tomasz Figa' <t.figa@samsung.com>, linux-kernel@vger.kernel.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, tomasz.figa@gmail.com, vikas.sajjan@samsung.com, chow.kim@samsung.com, 'Michal Simek' <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, 'Mark Brown' <broonie@kernel.org>, 'Boris BREZILLON' <boris.brezillon@free-electrons.com>, PRASHANTH GODREHAL <prashanth.g@samsung.com>

On Tuesday 16 September 2014, Pankaj Dubey wrote:
> Hi Arnd,  Lee Jones,
> > On Thu, 04 Sep 2014 10:15:27 +0530
> > Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> 
> Any update on this patch. As already it has been tested on two DT based
> platforms.
> 
> If you think that we can go ahead and break clps711x till it gets migrated
> over DT,
> then please ack this patch, or else if you have opinion to keep support for
> non-DT
> based drivers (clps711x) then I can post another patch keeping platform
> driver support
> for non-DT based platform. 

The rule is that we don't intentionally break things, so please post a
patch that keeps the existing platform driver there. Ideally we get a DT-only
clps711x for the merge window as well, and if that happens we can add another
patch on top to remove that syscon-pdev support again but then we will
have a bisectable kernel that works for every point inbetween.


	Arnd
