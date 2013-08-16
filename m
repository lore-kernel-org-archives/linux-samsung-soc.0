From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: Broken device trees for exynos in linux-next
Date: Fri, 16 Aug 2013 09:04:01 +0530
Message-ID: <CAAgF-BcwfSGo0odosVS=zYHQ5-6rGpuxLRRMRSBOp1=GGNqiuQ@mail.gmail.com>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
	<13b101ce9a14$2cebd700$86c38500$@org>
	<20130816003557.GJ30073@sirena.org.uk>
	<20130816004202.GA28985@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:38466 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753008Ab3HPDeD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Aug 2013 23:34:03 -0400
Received: by mail-oa0-f46.google.com with SMTP id l10so1741931oag.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Aug 2013 20:34:01 -0700 (PDT)
In-Reply-To: <20130816004202.GA28985@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi,

On Fri, Aug 16, 2013 at 6:12 AM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Aug 16, 2013 at 01:35:57AM +0100, Mark Brown wrote:
>> On Fri, Aug 16, 2013 at 09:04:28AM +0900, Kukjin Kim wrote:
>
>> > NO, the build breakage is due to commit 6187288f15bc ("ARM: dts: exynos5250:
>> > move common i2s properties to exynos5 dtsi" which is in Mark Brown's tree.
>
>> > Mark, pleaser revert it in your tree...
>
>> I'll do that but I don't know if that's then going to break anything
>> else.  This sort of bisection/cross tree issue does come up a lot with
>> the Samsung SoCs - it'd be good if you could remind the people working
>> on them about the need to make sure that when there are dependencies
>> they're handled when things are merged.
>
> I also had to revert "ARM: dts: Change i2s compatible string on
> exynos5250" from my tree since it depended on the above commit.  I
> suspect this may leave the driver broken and we'll need a new version
> before the merge window...

I apologize for this bisection. Soon I will post a new patch for this.

Thanks
Padma
