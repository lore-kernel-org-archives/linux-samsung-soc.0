From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V6 03/10] ARM: SAMSUNG: Make dma request compatible to
 generic dma bindings.
Date: Tue, 29 Jan 2013 15:00:25 +0530
Message-ID: <CAAgF-BfUfvhgSwQwx9-YyFi_KYZnmR97n7a734JUh4X9WaV1Gg@mail.gmail.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
	<1358509629-20471-4-git-send-email-padma.v@samsung.com>
	<20130129061958.GF6878@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f172.google.com ([209.85.210.172]:34576 "EHLO
	mail-ia0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753481Ab3A2Ja0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 04:30:26 -0500
Received: by mail-ia0-f172.google.com with SMTP id u8so288602iag.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 01:30:25 -0800 (PST)
In-Reply-To: <20130129061958.GF6878@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, tiwai@suse.de, ben-linux@fluff.org

On Tue, Jan 29, 2013 at 11:50 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Jan 18, 2013 at 05:17:02PM +0530, Padmavathi Venna wrote:
>> This patch make the dma dev request operation compatible for both
>> DT and non-DT cases. It takes the all the arguments required for
>> dma_request_slave_channel and dma_request_channel. If the driver
>> is initiated via DT or non-DT the corresponding call will be made.
>
> OK, so this is where the SPI change came from - the API has been changed
> incompatibly and SPI needs updating.  For bisection this API update
> ought to be done in a single commit, otherwise there will be steps in
> the bisection where nothing will work.
>
> Anyway, I'll go ahead and apply this, the SPI and the ASoC ones but this
> is something to bear in mind for the future.

OK. Thanks for applying the patch.

Regards
Padma
