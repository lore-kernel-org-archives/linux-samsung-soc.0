From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V4 0/2] Add DT support for i2s
Date: Sat, 8 Dec 2012 10:07:54 +0530
Message-ID: <CAAgF-BenOdFJK2LMot73_B=wHOFgD2sq8x-Ou=1CvpkiJpmeQQ@mail.gmail.com>
References: <1354099669-1735-1-git-send-email-padma.v@samsung.com>
	<CAAgF-Bc4t6WL4vswP6CFeSQrPZBmOuYfVt6_JoB1Za9TBX7mvA@mail.gmail.com>
	<20121206041141.GA10867@opensource.wolfsonmicro.com>
	<20121207135131.A53643E0B87@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:57342 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932999Ab2LHEh4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Dec 2012 23:37:56 -0500
Received: by mail-lb0-f174.google.com with SMTP id gi11so889270lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Dec 2012 20:37:55 -0800 (PST)
In-Reply-To: <20121207135131.A53643E0B87@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org

Hi,

On Fri, Dec 7, 2012 at 7:21 PM, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Thu, 6 Dec 2012 13:11:42 +0900, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
>> On Thu, Dec 06, 2012 at 09:31:40AM +0530, Padma Venkat wrote:
>> > On Wed, Nov 28, 2012 at 4:17 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
>>
>> > > Padmavathi Venna (2):
>> > >   ASoC: Samsung: Get I2S src_clk from clock alias id.
>> > >   ASoC: SAMSUNG: Add DT support for i2s
>>
>> > Any comments on DT support for i2s patch?  If not when this patch can be pulled?
>>
>> Don't send contentless pings.
>>
>> I still don't really like what's going on with aliases here, I need to
>> understand why things are structured the way they are to say something
>> about that.
>
> Right. On a brief look, it appears that the binding is using aliases as
> a way to encode implementation specific details of the driver.

Samsung i2s driver registers the platform device twice one for the
samsung-i2s.0,1 or 2 and two for samsung-i2s.4(which actually doesn't
represent any H/W peripheral). The max number of I2S blocks on any
Samsung SoC are 3, the secondary device registration starts with
device number 4.The second time registration is for the secondary fifo
interface of a CPU dai if any exists.

With DT support the device number in the driver is always -1, I used
alias id for the above purpose.

>
> g.
>
Thanks
Padma
