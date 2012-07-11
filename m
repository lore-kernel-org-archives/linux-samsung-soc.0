From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v5 0/6] spi: s3c64xx: add support for device tree
Date: Wed, 11 Jul 2012 23:30:28 +0530
Message-ID: <CAJuYYwQA_x112xqOnQmwZjzoXoR-DAvT8YdB90Wm=78CH72uOg@mail.gmail.com>
References: <1342021265-11212-1-git-send-email-thomas.abraham@linaro.org>
	<20120711174908.GP3938@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:35976 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754599Ab2GKSA3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 14:00:29 -0400
Received: by weyx8 with SMTP id x8so1092161wey.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jul 2012 11:00:28 -0700 (PDT)
In-Reply-To: <20120711174908.GP3938@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jaswinder.singh@linaro.org

On 11 July 2012 23:19, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Jul 11, 2012 at 09:10:59PM +0530, Thomas Abraham wrote:
>> Changes since v4:
>> - Includes the missing gpio request for slave select line gpio as suggested
>>   by Mark Brown.
>
> These looked OK (and have had quite a bit of review already so we're
> probably at the stage where incremental fixes are better anyway) so I
> tried to apply them but git am was really unhappy.  I tried applying on
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git spi-next
>
> and -next.  Can you check what's going on here please?

These patches were based on Samsung maintainer's for-next branch with
Grant's spi/next branch merged. I will check with your spi-next
branch. Thanks.
