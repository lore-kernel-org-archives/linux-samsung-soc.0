From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] mmc: dt: Add 'broken-cd' DT binding
Date: Tue, 21 Aug 2012 16:44:49 +0530
Message-ID: <CAJuYYwSv+dum8RP9xy+AZCH9pTU0peDpwjt7TA5zn3MFsG1uWA@mail.gmail.com>
References: <1345547371-6784-1-git-send-email-thomas.abraham@linaro.org>
	<201208211101.21612.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <201208211101.21612.arnd@arndb.de>
Sender: linux-mmc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, patches@linaro.org, Chris Ball <cjb@laptop.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 21 August 2012 16:31, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tuesday 21 August 2012, Thomas Abraham wrote:
> > diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt
> > b/Documentation/devicetree/bindings/mmc/mmc.txt
> > index 8a6811f..1aa527a 100644
> > --- a/Documentation/devicetree/bindings/mmc/mmc.txt
> > +++ b/Documentation/devicetree/bindings/mmc/mmc.txt
> > @@ -16,6 +16,8 @@ Optional properties:
> >  - wp-inverted: when present, polarity on the wp gpio line is inverted
> >  - non-removable: non-removable slot (like eMMC)
> >  - max-frequency: maximum operating clock frequency
> > +- broken-cd: when present, indicates that the cd-gpios line is not
> > +       connected to the card-detect pad of the MMC host controller.
>
> What is the difference between listing the cd line as broken and
> listing no cd line at all?

I am trying to have a way to represent a gpio line as card detect line
that is not connected to the card-detect pad of the mmc controller but
instead used as a gpio interrupt line or polled gpio line.

'broken-cd' would imply that the card-detect pad of the mmc controller
is not connected to the card-detect pin at the slot. The 'cd-gpios'
property in that case would let the driver code to use the 'cd-gpios'
line as the external gpio interrupt or poll it.

Thanks,
Thomas.

>
>         Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
