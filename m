From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/4] ARM: S5PC110: add common FIMC setup code
Date: Mon, 6 Sep 2010 18:17:01 +0900
Message-ID: <AANLkTikakB1Y6N-UT2Hx+PHfdyticHxCFQzs=uc7KWNc@mail.gmail.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
	<1283745044-15514-4-git-send-email-m.szyprowski@samsung.com>
	<AANLkTinhbmKX5gs4TPZwVUX0WSEQ5RLN+_gHAqXsTj1b@mail.gmail.com>
	<4C84AA6D.10509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:56461 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752333Ab0IFJRD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Sep 2010 05:17:03 -0400
Received: by wwj40 with SMTP id 40so6232956wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Sep 2010 02:17:01 -0700 (PDT)
In-Reply-To: <4C84AA6D.10509@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Mon, Sep 6, 2010 at 5:46 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On 2010-09-06 13:52, Jassi Brar wrote:
>>
>> On Mon, Sep 6, 2010 at 12:50 PM, Marek Szyprowski
>> <m.szyprowski@samsung.com> =C2=A0wrote:
>> ....
>>>
>>> + =C2=A0 =C2=A0 =C2=A0 parent =3D clk_get(NULL, "mout_epll");
>>> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(parent))
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(p=
arent);
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; err =3D=3D 0&& =C2=A0i< =C2=A0=
ARRAY_SIZE(fimc_devs); i++) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fimc_devs[i]=
) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 clk_fimc =3D clk_get(fimc_devs[i], "sclk_fimc");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (IS_ERR(clk_fimc)) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D PTR_ERR(clk_fimc);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 clk_set_parent(clk_fimc, parent);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 clk_put(clk_fimc);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>> + =C2=A0 =C2=A0 =C2=A0 }
>>
>> The sclk_fimc could source clock from a number of options out of a m=
ux.
>> mout_epll is just one of them. Different machines may want to source=
 the
>> clock differently.
>
> Right, I forgot about this case.
>
>> So, IMO the parent selection should not be done in platform code, bu=
t
>> rather
>> in machine init code.
>> Not the best, but a better solution can be found in
>> arch/arm/mach-s5pc100/dev-spi.c
>> Give it a thought.
>
> I'm thinking of making the parent clock an argument to the
> s5pv210_fimc_setup_clks().
Yes, that's better since the relevant clock is managed by the CMU

> I really don't like the idea of passing clock name through the platfo=
rm data
> and letting driver to mess with clock's parents.
In case of SPI the clock mux and scalar is present _within_ the SPI
controller and having to touch SPI regs from outside the driver isn't
what I prefer.

> Machine startup code is the
> last place where such things should be changed.
Until I am enlightened, I'd like to think otherwise.
I think the board designer would already have thought out the clock sou=
rcing
hierarchy. Setting appropriate parents once at boot-time and having dri=
vers
not worry about it, should be better.
