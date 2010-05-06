From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: Re: SAMSUNG How to handle changes in TSADC IP register bits
Date: Thu, 6 May 2010 23:43:22 +0100
Message-ID: <20100506224321.GQ26401@trinity.fluff.org>
References: <20385116.536981273142442574.JavaMail.weblogic@epml02>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:42014 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753354Ab0EFWne (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 18:43:34 -0400
Content-Disposition: inline
In-Reply-To: <20385116.536981273142442574.JavaMail.weblogic@epml02>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: NAVEEN KRISHNA CHATRADHI <ch.naveen@samsung.com>
Cc: Maurus Cuelenaere <mcuelenaere@gmail.com>, Ben Dooks <ben-linux@fluff.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thu, May 06, 2010 at 10:40:42AM +0000, NAVEEN KRISHNA CHATRADHI wrote:
> Hi Maurus, 
> 
> ------ Original Message -------
> Sender : Maurus Cuelenaere<mcuelenaere@gmail.com> 
> Date   : May 06, 2010 15:28 (GMT+05:00)
> Title  : Re: SAMSUNG How to handle changes in TSADC IP register bits
> 
> Hi Naveen,
> 
> Op 06-05-10 12:15, NAVEEN KRISHNA CHATRADHI schreef:
> > Hi Ben, Maurus,
> >
> > ------- Original Message -------
> > Sender : Maurus Cuelenaere<mcuelenaere@gmail.com> 
> > Date   : May 06, 2010 14:52 (GMT+05:00)
> > Title  : Re: SAMSUNG How to handle changes in TSADC IP register bits
> >
> > Op 06-05-10 07:41, Ben Dooks schreef:
> >   
> >> On Thu, May 06, 2010 at 06:38:22AM +0100, Ben Dooks wrote:
> >>   
> >>     
> >>> On Thu, May 06, 2010 at 04:08:20AM +0000, NAVEEN KRISHNA CHATRADHI wrote:
> >>>     
> >>>       
> >>>> Hi Ben, 
> >>>>  
> >>>> I'm working on Touchscreen driver support for S5PC100, S5PV210, S3C6410 & S5P6440.
> >>>> The TSADC registers bit fields are keep on varying between the different 
> >>>> SoCs, though the IP as a whole remains same.
> >>>>
> >>>> For example: 
> >>>> Some of the ADC CONTROL REGISTER bit fields in S3C6410 are made as seperate register 
> >>>> ADC CHANNEL MUX REGISTER
> >>>> How do we handle this in the driver which should be generic to all the SoCs.
> >>>>       
> >>>>         
> >>> I've already merged the first changes for the s3c6410 (see Maurus' previous
> >>> patches) ready for the next mainline merge.
> >>>     
> >>>       
> >> Maurus, can you send the change to the core driver to support the extended
> >> range please.
> >>   
> >>     
> > I've seen this patch from Maurus a long ago.
> > Maurus, Do you have any other patches other than, Cause i have already made patches for 
> > touchscreen support for S3C6410/6440 S5Pv210/C110/C100 these boards.
> >
> > I'ill post it in a day or 2. 
> >   
> 
> No, I only added support for the S3C6410 (as that's the only board I have).
> I've seen your patch earlier and i made a patch set for TSADC on other boards too.
> 
> This patch set would take care of the moving of ts.h from plat to mach,
> moving the GPIOs specific for S3C24XX to seperate file, 
> Adding generic GPIO configuration functions (based on I2C)
> and Also adds TSADC support for S3c6410, S5PV210,C110 and S5P6440.

The ts.h file has already been moved, see the following branch:
http://git.fluff.org/gitweb?p=bjdooks/linux.git;a=shortlog;h=refs/heads/for-2635/s3c64xx-ts
 
> but, It might take a day or 2 to get them reviewed internally and post it on mainline.
> -- 
> Maurus Cuelenaere
> 
> Thanks & Best Regards,
> Naveen Krishna Ch
> SE @ SLG Div, DS LABs, Samsung, India.

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
