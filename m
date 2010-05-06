From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: SAMSUNG How to handle changes in TSADC IP register bits
Date: Thu, 06 May 2010 12:28:16 +0200
Message-ID: <4BE299C0.6020600@gmail.com>
References: <29440984.535821273140916662.JavaMail.weblogic@epml02>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f220.google.com ([209.85.219.220]:63581 "EHLO
	mail-ew0-f220.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411Ab0EFK2T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 06:28:19 -0400
Received: by ewy20 with SMTP id 20so1621335ewy.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2010 03:28:17 -0700 (PDT)
In-Reply-To: <29440984.535821273140916662.JavaMail.weblogic@epml02>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ch.naveen@samsung.com
Cc: Ben Dooks <ben-linux@fluff.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Naveen,

Op 06-05-10 12:15, NAVEEN KRISHNA CHATRADHI schreef:
> Hi Ben, Maurus,
>
> ------- Original Message -------
> Sender : Maurus Cuelenaere<mcuelenaere@gmail.com> 
> Date   : May 06, 2010 14:52 (GMT+05:00)
> Title  : Re: SAMSUNG How to handle changes in TSADC IP register bits
>
> Op 06-05-10 07:41, Ben Dooks schreef:
>   
>> On Thu, May 06, 2010 at 06:38:22AM +0100, Ben Dooks wrote:
>>   
>>     
>>> On Thu, May 06, 2010 at 04:08:20AM +0000, NAVEEN KRISHNA CHATRADHI wrote:
>>>     
>>>       
>>>> Hi Ben, 
>>>>  
>>>> I'm working on Touchscreen driver support for S5PC100, S5PV210, S3C6410 & S5P6440.
>>>> The TSADC registers bit fields are keep on varying between the different 
>>>> SoCs, though the IP as a whole remains same.
>>>>
>>>> For example: 
>>>> Some of the ADC CONTROL REGISTER bit fields in S3C6410 are made as seperate register 
>>>> ADC CHANNEL MUX REGISTER
>>>> How do we handle this in the driver which should be generic to all the SoCs.
>>>>       
>>>>         
>>> I've already merged the first changes for the s3c6410 (see Maurus' previous
>>> patches) ready for the next mainline merge.
>>>     
>>>       
>> Maurus, can you send the change to the core driver to support the extended
>> range please.
>>   
>>     
> I've seen this patch from Maurus a long ago.
> Maurus, Do you have any other patches other than, Cause i have already made patches for 
> touchscreen support for S3C6410/6440 S5Pv210/C110/C100 these boards.
>
> I'ill post it in a day or 2. 
>   

No, I only added support for the S3C6410 (as that's the only board I have).

-- 
Maurus Cuelenaere
