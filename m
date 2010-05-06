From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: SAMSUNG How to handle changes in TSADC IP register bits
Date: Thu, 6 May 2010 06:41:58 +0100
Message-ID: <20100506054158.GK26401@trinity.fluff.org>
References: <27204838.519491273118900249.JavaMail.weblogic@epml07> <20100506053822.GJ26401@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:55782 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751950Ab0EFFl7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 01:41:59 -0400
Content-Disposition: inline
In-Reply-To: <20100506053822.GJ26401@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: NAVEEN KRISHNA CHATRADHI <ch.naveen@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thu, May 06, 2010 at 06:38:22AM +0100, Ben Dooks wrote:
> On Thu, May 06, 2010 at 04:08:20AM +0000, NAVEEN KRISHNA CHATRADHI wrote:
> > Hi Ben, 
> >  
> > I'm working on Touchscreen driver support for S5PC100, S5PV210, S3C6410 & S5P6440.
> > The TSADC registers bit fields are keep on varying between the different 
> > SoCs, though the IP as a whole remains same.
> > 
> > For example: 
> > Some of the ADC CONTROL REGISTER bit fields in S3C6410 are made as seperate register 
> > ADC CHANNEL MUX REGISTER
> > How do we handle this in the driver which should be generic to all the SoCs.
> 
> I've already merged the first changes for the s3c6410 (see Maurus' previous
> patches) ready for the next mainline merge.

Maurus, can you send the change to the core driver to support the extended
range please.
 
> http://git.fluff.org/gitweb?p=bjdooks/linux.git;a=shortlog;h=refs/heads/for-2635/s3c64xx-ts
> 
> -- 
> Ben
> 
> Q:      What's a light-year?
> A:      One-third less calories than a regular year.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
