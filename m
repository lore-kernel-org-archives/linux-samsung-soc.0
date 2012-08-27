From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] gpio: samsung: add devicetree init for s3c24xx arches
Date: Mon, 27 Aug 2012 11:57:04 +0300
Message-ID: <CA+E=qVfV1DL1ikjVnLd7qTeCx9C8Z7dGvhh_9NSgxPYrOCJ=0g@mail.gmail.com>
References: <201208252353.59345.heiko@sntech.de> <CAJuYYwQBOP7-D0fepDsCr+43ASKQ3CmMBMH-M79QH7r=xS85Eg@mail.gmail.com>
 <201208271001.05026.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <201208271001.05026.heiko@sntech.de>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Landley <rob@landley.net>, Olof Johansson <olof@lixom.net>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, Aug 27, 2012 at 11:01 AM, Heiko St=C3=BCbner <heiko@sntech.de> =
wrote:
> Hi Thomas,
>
> thanks for your review:
>
> Hmmm, but the logic to drive the gpio controller is the same for all =
arches.
> The only difference is the number to use for the different pull up/do=
wn
> settings. So I think the "samsung,s3c24xx-gpio" is ok but the documen=
tation
> should simply reflect the different pull settings.
>

Also s3c2410 and s3c2440 has different count of GPIOs. And that could
be a problem on machines
with GPIO-expanders (h1940 machine)

>> It would be informative to add information about the 'mux function'
>> cell here as well. Specifically, on how to handle the banks that hav=
e
>> an extended GPxSEL register that allow additional pin function
>> selection.
>
> Will add a mux function description.
>
> Until now I've never realised the existence of the GPxSEL registers, =
so thanks
> for the pointer :-).
>
> But is this used in the driver at all? All the setcfg/getcfg function=
s in
> gpio-samsung.c only handle the GPxCON registers - I haven't found cod=
e to
> handle the GPxSEL registers at all. So my guess is that this was neve=
r
> implemented - or that I'm blind ;-) .

There're no GPxSEL registers on s3c2410/s3c2440/s3c2442. Is it
something s3c2412/sec2416 specific?

Regards
Vasily
