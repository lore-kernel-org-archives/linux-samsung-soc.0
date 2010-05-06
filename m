From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: SAMSUNG How to handle changes in TSADC IP register bits
Date: Thu, 06 May 2010 11:52:10 +0200
Message-ID: <4BE2914A.5000003@gmail.com>
References: <27204838.519491273118900249.JavaMail.weblogic@epml07> <20100506053822.GJ26401@trinity.fluff.org> <20100506054158.GK26401@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:64574 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753302Ab0EFJwN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 05:52:13 -0400
Received: by ey-out-2122.google.com with SMTP id d26so48291eyd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2010 02:52:12 -0700 (PDT)
In-Reply-To: <20100506054158.GK26401@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: NAVEEN KRISHNA CHATRADHI <ch.naveen@samsung.com>, linux-samsung-soc@vger.kernel.org

Op 06-05-10 07:41, Ben Dooks schreef:
> On Thu, May 06, 2010 at 06:38:22AM +0100, Ben Dooks wrote:
>   
>> On Thu, May 06, 2010 at 04:08:20AM +0000, NAVEEN KRISHNA CHATRADHI wrote:
>>     
>>> Hi Ben, 
>>>  
>>> I'm working on Touchscreen driver support for S5PC100, S5PV210, S3C6410 & S5P6440.
>>> The TSADC registers bit fields are keep on varying between the different 
>>> SoCs, though the IP as a whole remains same.
>>>
>>> For example: 
>>> Some of the ADC CONTROL REGISTER bit fields in S3C6410 are made as seperate register 
>>> ADC CHANNEL MUX REGISTER
>>> How do we handle this in the driver which should be generic to all the SoCs.
>>>       
>> I've already merged the first changes for the s3c6410 (see Maurus' previous
>> patches) ready for the next mainline merge.
>>     
> Maurus, can you send the change to the core driver to support the extended
> range please.
>   

Done.


-- 
Maurus Cuelenaere
