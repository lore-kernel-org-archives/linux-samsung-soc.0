From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: SAMSUNG How to handle changes in TSADC IP register bits
Date: Thu, 06 May 2010 12:47:35 +0200
Message-ID: <4BE29E47.10704@gmail.com>
References: <20385116.536981273142442574.JavaMail.weblogic@epml02>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.24]:50821 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754636Ab0EFKri (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 06:47:38 -0400
Received: by ey-out-2122.google.com with SMTP id d26so50843eyd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2010 03:47:37 -0700 (PDT)
In-Reply-To: <20385116.536981273142442574.JavaMail.weblogic@epml02>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ch.naveen@samsung.com
Cc: Ben Dooks <ben-linux@fluff.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Op 06-05-10 12:40, NAVEEN KRISHNA CHATRADHI schreef:
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
>   
>> Hi Ben, Maurus,
>>
>> ------- Original Message -------
>> Sender : Maurus Cuelenaere<mcuelenaere@gmail.com> 
>> Date   : May 06, 2010 14:52 (GMT+05:00)
>> Title  : Re: SAMSUNG How to handle changes in TSADC IP register bits
>>
>> Op 06-05-10 07:41, Ben Dooks schreef:
>>   
>>     
>>> On Thu, May 06, 2010 at 06:38:22AM +0100, Ben Dooks wrote:
>>>   
>>>     
>>>       
>>>> On Thu, May 06, 2010 at 04:08:20AM +0000, NAVEEN KRISHNA CHATRADHI wrote:
>>>>     
>>>>       
>>>>         
>>>>> Hi Ben, 
>>>>>  
>>>>> I'm working on Touchscreen driver support for S5PC100, S5PV210, S3C6410 & S5P6440.
>>>>> The TSADC registers bit fields are keep on varying between the different 
>>>>> SoCs, though the IP as a whole remains same.
>>>>>
>>>>> For example: 
>>>>> Some of the ADC CONTROL REGISTER bit fields in S3C6410 are made as seperate register 
>>>>> ADC CHANNEL MUX REGISTER
>>>>> How do we handle this in the driver which should be generic to all the SoCs.
>>>>>       
>>>>>         
>>>>>           
>>>> I've already merged the first changes for the s3c6410 (see Maurus' previous
>>>> patches) ready for the next mainline merge.
>>>>     
>>>>       
>>>>         
>>> Maurus, can you send the change to the core driver to support the extended
>>> range please.
>>>   
>>>     
>>>       
>> I've seen this patch from Maurus a long ago.
>> Maurus, Do you have any other patches other than, Cause i have already made patches for 
>> touchscreen support for S3C6410/6440 S5Pv210/C110/C100 these boards.
>>
>> I'ill post it in a day or 2. 
>>   
>>     
> No, I only added support for the S3C6410 (as that's the only board I have).
> I've seen your patch earlier and i made a patch set for TSADC on other boards too.
>
> This patch set would take care of the moving of ts.h from plat to mach,
> moving the GPIOs specific for S3C24XX to seperate file, 
> Adding generic GPIO configuration functions (based on I2C)
> and Also adds TSADC support for S3c6410, S5PV210,C110 and S5P6440.
>
> but, It might take a day or 2 to get them reviewed internally and post it on mainline.
>   

You probably want to state that too on the patch I sent to linux-input (
ARM: S3C64XX: Add s3c64xx support to touchscreen driver), as your
patches seem to supersede mine.

Keep in mind that "ARM: SAMSUNG: Move mach/ts.h to plat/ts.h" and "ARM:
S3C64XX: Add touchscreen platform device definition" have already been
merged though.

-- 
Maurus Cuelenaere
