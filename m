From: Pawel Osciak <p.osciak@samsung.com>
Subject: RE: [PATCH v3 08/12] s3c-fb: Add SHADOWCON shadow register locking
 support	for S5PV210
Date: Fri, 02 Jul 2010 16:45:03 +0200
Message-ID: <004401cb19f5$27b9efd0$772dcf70$%osciak@samsung.com>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>
 <1277712538-23188-9-git-send-email-p.osciak@samsung.com>
 <4C2DE587.6000306@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49103 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754421Ab0GBOqO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 10:46:14 -0400
In-reply-to: <4C2DE587.6000306@simtec.co.uk>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@simtec.co.uk>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>

>Ben Dooks <ben@simtec.co.uk> wrote:
>On 28/06/10 09:08, Pawel Osciak wrote:
>> @@ -218,6 +218,9 @@
>>  #define WINCON1_BPPMODE_25BPP_A1888		(0xd << 2)
>>  #define WINCON1_BPPMODE_28BPP_A4888		(0xd << 2)
>>
>> +/* S5PV210 */
>> +#define SHADOWCON				(0x34)
>> +#define SHADOWCON_WINx_PROTECT(_win)		(1 << (10 + _win))
>
>you should have () around the _win arg.
>

Good catch, thanks.

>>
>>  #define VIDOSDxA_TOPLEFT_X_MASK			(0x7ff << 11)
>>  #define VIDOSDxA_TOPLEFT_X_SHIFT		(11)
>> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
>> index 0a93fca..94423c5 100644
>> --- a/drivers/video/s3c-fb.c
>> +++ b/drivers/video/s3c-fb.c
>> @@ -79,6 +79,7 @@ struct s3c_fb;
>>   * @osd: The base for the OSD registers.
>>   * @palette: Address of palette memory, or 0 if none.
>>   * @has_prtcon: Set if has PRTCON register.
>> + * @has_shadowcon: Set if has SHADOWCON register.
>>   */
>>  struct s3c_fb_variant {
>>  	unsigned int	is_2443:1;
>> @@ -95,6 +96,7 @@ struct s3c_fb_variant {
>>  	unsigned short	palette[S3C_FB_MAX_WIN];
>>
>>  	unsigned int	has_prtcon:1;
>> +	unsigned int	has_shadowcon:1;
>>  };
>>
>>  /**
>> @@ -363,6 +365,36 @@ static int s3c_fb_align_word(unsigned int bpp,
>unsigned int pix)
>>  }
>>
>>  /**
>> + * shadow_protect_win() - disable updating values from shadow registers at
>vsync
>> + *
>> + * @win: window to protect registers for
>> + * @protect: 1 to protect (disable updates)
>> + */
>> +static void shadow_protect_win(struct s3c_fb_win *win, int protect)
>
>technically, protect should be of type 'bool'

Well... ok, I guess it's the "new" trend ;)


Best regards
--
Pawel Osciak
Linux Platform Group
Samsung Poland R&D Center
