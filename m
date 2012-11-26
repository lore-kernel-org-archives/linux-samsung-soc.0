From: Alexander Varnin <fenixk19@mail.ru>
Subject: Re: [PATCH 2/2] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Mon, 26 Nov 2012 13:23:17 +0400
Message-ID: <50B33505.5070509@mail.ru>
References: <1353919481-26074-1-git-send-email-fenixk19@mail.ru> <1353919481-26074-2-git-send-email-fenixk19@mail.ru> <201211261012.58938.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp44.i.mail.ru ([94.100.177.104]:54713 "EHLO smtp44.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754086Ab2KZJXW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 04:23:22 -0500
In-Reply-To: <201211261012.58938.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org

Is it ok, to send only one last patch after changes, without the one,=20
who make macro?

26.11.2012 13:12, Heiko St=C3=BCbner =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Alexander,
>
> I think this patch needs a bit more love :-) .
>
> Please run scripts/checkpatch.pl on it and fix all the reported probl=
ems.
>
> And I'd change the comment to something like:
>
> /*
>   * S3C2443 CPU has a problem with EXTINTn registers.
>   * Essentially register-reads return transformed data, but the write
>   * is done according to the datasheet.
>   *
>   * Fix this by transforming the read data to the correct format.
>   *
>   * For details refer to the document "S3C2443 GUIDE TO EXTRA GPIO"
>   */
>
> Especially the mail address does not need to be in the code - the git=
 history
> preserves the committer identity quite well.
>
>
> Heiko
>
> Am Montag, 26. November 2012, 09:44:41 schrieb Alexander Varnin:
>> S3C2443 CPU has a problem with incorrect reading from EXTINTn
>> registers. So s3c_irqext_type function wrongly modifies them.
>> So add special check to s3c_irqext_type, to handle this case.
>>
>> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
>> ---
>>   arch/arm/plat-s3c24xx/irq.c |   26 ++++++++++++++++++++++++++
>>   1 files changed, 26 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq=
=2Ec
>> index fe57bbb..ed19996 100644
>> --- a/arch/arm/plat-s3c24xx/irq.c
>> +++ b/arch/arm/plat-s3c24xx/irq.c
>> @@ -219,6 +219,32 @@ s3c_irqext_type(struct irq_data *data, unsigned=
 int
>> type) }
>>
>>   	value =3D __raw_readl(extint_reg);
>> +
>> +	/*
>> +	* S3C2443 CPU has a problem with EXTINTn registers.
>> +	* Essentially register-reads returned transformed data, but the wr=
ite
>> +	* is done according to the datasheet.
>> +	*
>> +	* There is hack introduced for 2443 error workaround.
>> +	*
>> +	* For detais refer to the document "S3C2443 GUIDE TO EXTRA GPIO" f=
ound on
>> the web. +	*
>> +	* A. Varnin <fenixk19@mail.ru>
>> +	*/
>> +	if(soc_is_s3c2443())
>> +	{
>> +	    	int i;
>> +		int fixed =3D 0;
>> +		if(extint_reg =3D=3D S3C24XX_EXTINT1 || extint_reg =3D=3D S3C24XX=
_EXTINT2)
>> +			for(i=3D0; i<7;i++)
>> +		    		fixed |=3D (((value >> ((7-i)*4+1)) & 7) | ((value >> ((7-
> i)*4-3)) &
>> 8)) << i*4; +		else
>> +			for(i=3D0; i<7;i++)
>> +		    		fixed |=3D ( (value >> (7-i)*4) & 0xf )  << i*4;
>> +		fixed |=3D (((value>>1) & 7) | ((value<<3) & 8)) << 27;
>> +		value =3D fixed;
>> +	}
>> +
>>   	value =3D (value & ~(7 << extint_offset)) | (newvalue << extint_o=
ffset);
>>   	__raw_writel(value, extint_reg);
